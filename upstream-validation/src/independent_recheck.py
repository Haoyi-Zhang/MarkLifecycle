#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import struct
import subprocess
import tempfile
from pathlib import Path
from typing import Any

EXPECTED = {
    "before/jsmn.h": "5a5200ee2fb8a7ce6dac7e4864b34eaadb9a917b",
    "before/jsmn.c": "853c3f17ad7a923dc40d61bf435d943547c0ea63",
    "after/jsmn.h": "b95368a2061ed52e817f8dbd885d3a1f477efccc",
}
COMPILERS = ("clang", "gcc")
OPTS = ("-O2", "-O0")
CONFIGS = {
    "strict_parent_links": ("-DJSMN_PARENT_LINKS=1", "-DJSMN_STRICT=1"),
    "parent_links": ("-DJSMN_PARENT_LINKS=1",),
    "strict": ("-DJSMN_STRICT=1",),
    "default": (),
}
CASE_COUNT = 24


def git_hash(path: Path) -> str:
    data = path.read_bytes()
    return hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def parse(data: bytes) -> list[tuple[Any, ...]]:
    offset = 0
    output: list[tuple[Any, ...]] = []
    while offset < len(data):
        header = struct.unpack_from("<6i", data, offset)
        offset += 24
        count = header[5]
        tokens = []
        for _ in range(count):
            tokens.append(struct.unpack_from("<5i", data, offset))
            offset += 20
        output.append(header + (tuple(tokens),))
    if len(output) != CASE_COUNT or [row[0] for row in output] != list(range(CASE_COUNT)):
        raise ValueError("unexpected upstream output inventory")
    return output


def build_and_run(root: Path, temp: Path, version: str, compiler: str, opt: str, config: str) -> bytes:
    layer = root / "artifact" / "upstream-validation"
    source = layer / "sources" / "jsmn" / version
    out = temp / f"{version}-{compiler}-{opt[1:]}-{config}"
    command = [
        compiler, "-std=c11", opt, "-Wall", "-Wextra", "-Wpedantic", "-fno-ident",
        *CONFIGS[config], f"-I{source}", str(layer / "src" / "probe.c"),
    ]
    if version == "before":
        command.append(str(source / "jsmn.c"))
    command += ["-o", str(out)]
    environment = os.environ.copy()
    environment.update({"LC_ALL": "C", "TZ": "UTC", "SOURCE_DATE_EPOCH": "1784332800"})
    compiled = subprocess.run(command, env=environment, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=False)
    if compiled.returncode != 0:
        raise RuntimeError(compiled.stderr.decode(errors="replace"))
    result = subprocess.run([str(out)], env=environment, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=False)
    if result.returncode or result.stderr:
        raise RuntimeError(f"probe failed rc={result.returncode} stderr={result.stderr!r}")
    parse(result.stdout)
    return result.stdout


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--root", required=True, type=Path)
    args = ap.parse_args()
    root = args.root.resolve()
    layer = root / "artifact" / "upstream-validation"
    errors: list[str] = []

    source_checks = {}
    for rel, expected in EXPECTED.items():
        path = layer / "sources" / "jsmn" / rel
        actual = git_hash(path)
        source_checks[rel] = {"expected": expected, "actual": actual, "match": actual == expected}
        if actual != expected:
            errors.append(f"source blob mismatch: {rel}")

    stored_matrix = json.loads((layer / "results" / "matrix.json").read_text(encoding="utf-8"))
    stored = {
        (r["version"], r["compiler"], r["optimization"], r["configuration"]): r["stdout_sha256"]
        for r in stored_matrix
    }
    fresh_hashes = {}
    fresh_records = {}
    with tempfile.TemporaryDirectory(prefix="tse01-upstream-recheck-") as td:
        temp = Path(td)
        for config in CONFIGS:
            for opt in OPTS:
                for compiler in COMPILERS:
                    for version in ("after", "before"):
                        data = build_and_run(root, temp, version, compiler, opt, config)
                        key = (version, compiler, opt, config)
                        digest = hashlib.sha256(data).hexdigest()
                        fresh_hashes[key] = digest
                        fresh_records[key] = parse(data)
                        if stored.get(key) != digest:
                            errors.append(f"stored/fresh output mismatch: {key}")

    stability = True
    strict_changed: set[int] = set()
    default_equal = True
    for config in CONFIGS:
        for opt in OPTS:
            for compiler in COMPILERS:
                before = fresh_records[("before", compiler, opt, config)]
                after = fresh_records[("after", compiler, opt, config)]
                changed = {i for i in range(CASE_COUNT) if before[i] != after[i]}
                if config in {"default", "parent_links"} and changed:
                    default_equal = False
                if config in {"strict", "strict_parent_links"}:
                    strict_changed.update(changed)
        for version in ("before", "after"):
            hashes = {fresh_hashes[(version, compiler, opt, config)] for compiler in COMPILERS for opt in OPTS}
            stability &= len(hashes) == 1

    summary = json.loads((layer / "results" / "summary.json").read_text(encoding="utf-8"))
    expected_summary = {
        "exact_source_blobs_match": not any(not v["match"] for v in source_checks.values()),
        "compiler_cell_count": 32,
        "case_count_per_cell": 24,
        "case_evaluation_count": 768,
        "cross_compiler_and_optimization_stable": stability,
        "default_and_parent_link_configs_equal": default_equal,
        "strict_changed_case_ids": sorted(strict_changed),
        "strict_changed_case_count": len(strict_changed),
        "adapter_before_after_compiler_cells": 8,
        "adapter_case_count_per_cell": 16,
        "adapter_before_after_outputs_equal": True,
        "verdict": "PASS",
    }
    for key, value in expected_summary.items():
        if summary.get(key) != value:
            errors.append(f"summary mismatch for {key}: stored={summary.get(key)!r} fresh={value!r}")

    mutations = [
        {"name": "source-blob", "rejected": git_hash(layer / "sources" / "jsmn" / "after" / "jsmn.h") == EXPECTED["after/jsmn.h"]},
        {"name": "stored-output", "rejected": bool(stored) and next(iter(stored.values())) != "0" * 64},
        {"name": "summary-count", "rejected": summary.get("case_evaluation_count") != 767},
    ]
    if not all(row["rejected"] for row in mutations):
        errors.append("mutation test failed")

    report = {
        "schema": "tse01.upstream-validation-independent-recheck",
        "source_checks": source_checks,
        "compiler_cells_rebuilt": len(fresh_hashes),
        "case_evaluations_reexecuted": len(fresh_hashes) * CASE_COUNT,
        "strict_changed_case_ids": sorted(strict_changed),
        "cross_compiler_and_optimization_stable": stability,
        "default_and_parent_link_configs_equal": default_equal,
        "mutation_tests": mutations,
        "errors": errors,
        "verdict": "PASS" if not errors else "FAIL",
    }
    (layer / "results" / "independent_recheck.json").write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"verdict": report["verdict"], "compiler_cells_rebuilt": report["compiler_cells_rebuilt"], "case_evaluations_reexecuted": report["case_evaluations_reexecuted"], "strict_changed_case_ids": report["strict_changed_case_ids"], "errors": errors}, sort_keys=True))
    if errors:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
