#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import hashlib
import json
import os
import shutil
import struct
import subprocess
from pathlib import Path
from typing import Any

EXPECTED_BLOBS = {
    "sources/jsmn/before/jsmn.h": "5a5200ee2fb8a7ce6dac7e4864b34eaadb9a917b",
    "sources/jsmn/before/jsmn.c": "853c3f17ad7a923dc40d61bf435d943547c0ea63",
    "sources/jsmn/after/jsmn.h": "b95368a2061ed52e817f8dbd885d3a1f477efccc",
}
VERSIONS = ("before", "after")
TOOLCHAINS = (("gcc", "-O0"), ("gcc", "-O2"), ("clang", "-O0"), ("clang", "-O2"))
CONFIGS = {
    "default": (),
    "strict": ("-DJSMN_STRICT=1",),
    "parent_links": ("-DJSMN_PARENT_LINKS=1",),
    "strict_parent_links": ("-DJSMN_STRICT=1", "-DJSMN_PARENT_LINKS=1"),
}
CASE_COUNT = 24


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def git_blob_sha1(path: Path) -> str:
    data = path.read_bytes()
    return hashlib.sha1(f"blob {len(data)}\0".encode("ascii") + data).hexdigest()


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def canonical_command(parts: list[str], root: Path) -> list[str]:
    prefix = str(root.resolve())
    return [part.replace(prefix, "<ROOT>") for part in parts]


def parse_output(data: bytes) -> list[dict[str, Any]]:
    offset = 0
    cases: list[dict[str, Any]] = []
    while offset < len(data):
        if offset + 24 > len(data):
            raise ValueError("truncated upstream probe header")
        case_id, result, pos, toknext, toksuper, count = struct.unpack_from("<6i", data, offset)
        offset += 24
        tokens = []
        if count < 0 or count > 64:
            raise ValueError(f"invalid token count {count}")
        for _ in range(count):
            if offset + 20 > len(data):
                raise ValueError("truncated upstream token record")
            token_type, start, end, size, parent = struct.unpack_from("<5i", data, offset)
            offset += 20
            tokens.append({"type": token_type, "start": start, "end": end, "size": size, "parent": parent})
        cases.append({
            "case_id": case_id,
            "result": result,
            "parser_pos": pos,
            "token_next": toknext,
            "token_super": toksuper,
            "tokens": tokens,
        })
    if len(cases) != CASE_COUNT or [row["case_id"] for row in cases] != list(range(CASE_COUNT)):
        raise ValueError(f"unexpected case inventory: {len(cases)}")
    return cases


def compile_cell(root: Path, layer: Path, version: str, compiler: str, opt: str, config: str) -> dict[str, Any]:
    source_dir = layer / "sources" / "jsmn" / version
    build = layer / "build" / version / f"{compiler}_{opt[1:]}" / config
    build.mkdir(parents=True, exist_ok=True)
    exe = build / "probe"
    stdout_path = build / "stdout.bin"
    stderr_path = build / "stderr.txt"
    rel_probe = (layer / "src" / "probe.c").relative_to(root).as_posix()
    rel_include = source_dir.relative_to(root).as_posix()
    rel_exe = exe.relative_to(root).as_posix()
    command = [
        compiler, "-std=c11", opt, "-Wall", "-Wextra", "-Wpedantic", "-fno-ident",
        f"-ffile-prefix-map={root}=.", f"-fdebug-prefix-map={root}=.",
        *CONFIGS[config], f"-I{rel_include}", rel_probe,
    ]
    if version == "before":
        command.append((source_dir / "jsmn.c").relative_to(root).as_posix())
    command += ["-o", rel_exe]
    environment = os.environ.copy()
    environment.update({"LC_ALL": "C", "TZ": "UTC", "SOURCE_DATE_EPOCH": "1784332800"})
    compiled = subprocess.run(command, cwd=root, env=environment, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=False)
    if compiled.returncode != 0:
        raise RuntimeError(f"compile failed for {version}/{compiler}/{opt}/{config}:\n{compiled.stderr.decode(errors='replace')}")
    run = subprocess.run([rel_exe], cwd=root, env=environment, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=False)
    stdout_path.write_bytes(run.stdout)
    stderr_path.write_bytes(run.stderr)
    if run.returncode != 0 or run.stderr:
        raise RuntimeError(f"probe failed for {version}/{compiler}/{opt}/{config}: rc={run.returncode} stderr={run.stderr!r}")
    parsed = parse_output(run.stdout)
    return {
        "version": version,
        "compiler": compiler,
        "optimization": opt,
        "configuration": config,
        "compile_command": canonical_command(command, root),
        "executable": rel_exe,
        "executable_sha256": sha256_file(exe),
        "stdout": stdout_path.relative_to(root).as_posix(),
        "stdout_sha256": sha256_bytes(run.stdout),
        "stderr": stderr_path.relative_to(root).as_posix(),
        "stderr_sha256": sha256_bytes(run.stderr),
        "returncode": run.returncode,
        "case_count": len(parsed),
        "cases": parsed,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", required=True, type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    layer = root / "artifact" / "upstream-validation"
    build = layer / "build"
    results = layer / "results"
    shutil.rmtree(build, ignore_errors=True)
    shutil.rmtree(results, ignore_errors=True)
    build.mkdir(parents=True)
    results.mkdir(parents=True)

    blob_records = []
    blob_ok = True
    for rel, expected in EXPECTED_BLOBS.items():
        path = layer / rel
        actual = git_blob_sha1(path)
        blob_records.append({
            "path": f"artifact/upstream-validation/{rel}",
            "bytes": path.stat().st_size,
            "sha256": sha256_file(path),
            "git_blob_sha1": actual,
            "expected_git_blob_sha1": expected,
            "match": actual == expected,
        })
        blob_ok &= actual == expected

    matrix = []
    for version in VERSIONS:
        for compiler, opt in TOOLCHAINS:
            for config in CONFIGS:
                matrix.append(compile_cell(root, layer, version, compiler, opt, config))

    by_key = {(row["version"], row["compiler"], row["optimization"], row["configuration"]): row for row in matrix}
    comparisons = []
    changed_union: set[int] = set()
    for compiler, opt in TOOLCHAINS:
        for config in CONFIGS:
            before = by_key[("before", compiler, opt, config)]
            after = by_key[("after", compiler, opt, config)]
            changed = [
                case_id for case_id in range(CASE_COUNT)
                if before["cases"][case_id] != after["cases"][case_id]
            ]
            changed_union.update(changed)
            comparisons.append({
                "compiler": compiler,
                "optimization": opt,
                "configuration": config,
                "equal": not changed,
                "changed_case_ids": changed,
                "changed_case_count": len(changed),
            })

    cross_tool_stable = True
    stability = []
    for version in VERSIONS:
        for config in CONFIGS:
            hashes = sorted({by_key[(version, compiler, opt, config)]["stdout_sha256"] for compiler, opt in TOOLCHAINS})
            stable = len(hashes) == 1
            stability.append({"version": version, "configuration": config, "unique_output_hashes": hashes, "stable": stable})
            cross_tool_stable &= stable

    adapter_matrix_path = root / "artifact" / "commit-replay" / "results" / "matrix.json"
    adapter_matrix = json.loads(adapter_matrix_path.read_text(encoding="utf-8"))
    adapter_rows = [row for row in adapter_matrix if row.get("project") == "A" and row.get("version") in {"before", "after"}]
    adapter_before = sorted({row["output_sha256"] for row in adapter_rows if row["version"] == "before"})
    adapter_after = sorted({row["output_sha256"] for row in adapter_rows if row["version"] == "after"})
    adapter_equal = len(adapter_before) == 1 and adapter_before == adapter_after and len(adapter_rows) == 8

    source_manifest = {
        "schema": "tse01.upstream-source-manifest",
        "repository": "zserge/jsmn",
        "commit": "fdcef3ebf886fa210d14956d3c068a653e76a24e",
        "parent": "18e9fe42cbfe21d65076f5c77ae2be379ad1270f",
        "license": "MIT",
        "source_files": blob_records,
        "driver": {
            "path": "artifact/upstream-validation/src/probe.c",
            "sha256": sha256_file(layer / "src" / "probe.c"),
            "case_count": CASE_COUNT,
            "configurations": list(CONFIGS),
        },
    }
    write_json(layer / "source_manifest.json", source_manifest)

    matrix_public = []
    for row in matrix:
        copy = dict(row)
        copy.pop("cases")
        matrix_public.append(copy)
    write_json(results / "matrix.json", matrix_public)
    write_json(results / "case_records.json", [
        {key: row[key] for key in ("version", "compiler", "optimization", "configuration")} | {"cases": row["cases"]}
        for row in matrix
    ])
    write_json(results / "comparisons.json", comparisons)

    default_equal = all(row["equal"] for row in comparisons if row["configuration"] in {"default", "parent_links"})
    strict_changes = sorted({case_id for row in comparisons if row["configuration"] in {"strict", "strict_parent_links"} for case_id in row["changed_case_ids"]})
    summary = {
        "schema": "tse01.upstream-validation-summary",
        "repository": "zserge/jsmn",
        "exact_source_blob_count": len(blob_records),
        "exact_source_blobs_match": blob_ok,
        "compiler_cell_count": len(matrix),
        "case_count_per_cell": CASE_COUNT,
        "case_evaluation_count": len(matrix) * CASE_COUNT,
        "cross_compiler_and_optimization_stable": cross_tool_stable,
        "default_and_parent_link_configs_equal": default_equal,
        "strict_changed_case_ids": strict_changes,
        "strict_changed_case_count": len(strict_changes),
        "changed_case_ids_any_configuration": sorted(changed_union),
        "adapter_before_after_compiler_cells": len(adapter_rows),
        "adapter_case_count_per_cell": 16,
        "adapter_before_after_outputs_equal": adapter_equal,
        "interpretation": "The adapter is equal on its declared sixteen-input contract, while the exact upstream parser exposes any configuration-specific behavior changes outside that contract.",
        "scope": "Exact jsmn core source comparison at one public maintenance commit; not a whole-repository or seven-project upstream build study.",
        "verdict": "PASS" if blob_ok and cross_tool_stable and default_equal and adapter_equal and bool(strict_changes) else "FAIL",
    }
    write_json(results / "summary.json", summary)
    print(json.dumps(summary, sort_keys=True))
    if summary["verdict"] != "PASS":
        raise SystemExit(1)


if __name__ == "__main__":
    main()
