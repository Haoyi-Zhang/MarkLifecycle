#!/usr/bin/env python3
"""Stress and fault-test atomic executable publication.

This is a reproducibility test, not a scientific sample.  It exercises the
primary and independently implemented compiler paths under concurrent replace
and execute activity, then verifies the narrow ETXTBSY retry contract.
"""
from __future__ import annotations

import argparse
import concurrent.futures
import errno
import importlib.util
import json
import os
import tempfile
from pathlib import Path
from types import SimpleNamespace
from typing import Any

SCHEMA = "tse01.executable-publication-test.v1"


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def write_source(path: Path, token: str) -> None:
    path.write_text(
        "#include <stdio.h>\n"
        "int main(void) { puts(\"" + token + "\"); return 0; }\n",
        encoding="utf-8",
    )


def run_primary_stress(module: Any, tmp: Path) -> tuple[int, int, list[str]]:
    source_a = tmp / "primary_a.c"
    source_b = tmp / "primary_b.c"
    output = tmp / "primary_shared"
    write_source(source_a, "PRIMARY-A")
    write_source(source_b, "PRIMARY-B")
    module.compile_program(source_a, output, "gcc", "-O0")

    invalid: list[str] = []
    publish_count = 8
    execution_count = 96

    def publish(index: int) -> None:
        source = source_a if index % 2 == 0 else source_b
        module.compile_program(source, output, "gcc", "-O0")

    def execute(_: int) -> None:
        stdout, stderr, returncode, _elapsed = module.execute_program(output)
        if returncode != 0 or stderr != b"" or stdout not in {b"PRIMARY-A\n", b"PRIMARY-B\n"}:
            invalid.append(f"primary:{returncode}:{stdout!r}:{stderr!r}")

    with concurrent.futures.ThreadPoolExecutor(max_workers=12) as pool:
        futures = [pool.submit(publish, i) for i in range(publish_count)]
        futures += [pool.submit(execute, i) for i in range(execution_count)]
        for future in futures:
            future.result()
    return publish_count, execution_count, invalid


def run_independent_stress(module: Any, tmp: Path) -> tuple[int, int, list[str]]:
    source_a = tmp / "independent_a.c"
    source_b = tmp / "independent_b.c"
    output = tmp / "independent_shared"
    write_source(source_a, "INDEPENDENT-A")
    write_source(source_b, "INDEPENDENT-B")
    module.compile_fresh(source_a, output, "gcc", "-O0")

    invalid: list[str] = []
    publish_count = 8
    execution_count = 96

    def publish(index: int) -> None:
        source = source_a if index % 2 == 0 else source_b
        module.compile_fresh(source, output, "gcc", "-O0")

    def execute(_: int) -> None:
        returncode, stdout, stderr = module.execute(output)
        if returncode != 0 or stderr != b"" or stdout not in {b"INDEPENDENT-A\n", b"INDEPENDENT-B\n"}:
            invalid.append(f"independent:{returncode}:{stdout!r}:{stderr!r}")

    with concurrent.futures.ThreadPoolExecutor(max_workers=12) as pool:
        futures = [pool.submit(publish, i) for i in range(publish_count)]
        futures += [pool.submit(execute, i) for i in range(execution_count)]
        for future in futures:
            future.result()
    return publish_count, execution_count, invalid


def exercise_retry(module: Any, *, primary: bool) -> dict[str, bool]:
    original = module.subprocess.run
    executable = Path("/nonexistent/fixture")
    transient_calls = 0

    def transient(*_args, **_kwargs):
        nonlocal transient_calls
        transient_calls += 1
        if transient_calls <= 3:
            raise OSError(errno.ETXTBSY, "text file busy")
        return SimpleNamespace(returncode=0, stdout=b"OK\n", stderr=b"")

    module.subprocess.run = transient
    try:
        if primary:
            stdout, stderr, code, _elapsed = module.execute_program(executable)
        else:
            code, stdout, stderr = module.execute(executable)
        transient_ok = transient_calls == 4 and code == 0 and stdout == b"OK\n" and stderr == b""
    finally:
        module.subprocess.run = original

    permanent_calls = 0

    def permanent(*_args, **_kwargs):
        nonlocal permanent_calls
        permanent_calls += 1
        raise OSError(errno.ETXTBSY, "text file busy")

    module.subprocess.run = permanent
    try:
        try:
            if primary:
                module.execute_program(executable)
            else:
                module.execute(executable)
            permanent_ok = False
        except OSError as exc:
            permanent_ok = exc.errno == errno.ETXTBSY and permanent_calls == 8
    finally:
        module.subprocess.run = original

    nonbusy_calls = 0

    def nonbusy(*_args, **_kwargs):
        nonlocal nonbusy_calls
        nonbusy_calls += 1
        raise OSError(errno.EACCES, "permission denied")

    module.subprocess.run = nonbusy
    try:
        try:
            if primary:
                module.execute_program(executable)
            else:
                module.execute(executable)
            nonbusy_ok = False
        except OSError as exc:
            nonbusy_ok = exc.errno == errno.EACCES and nonbusy_calls == 1
    finally:
        module.subprocess.run = original

    return {
        "transient_busy_retry_pass": transient_ok,
        "permanent_busy_failure_pass": permanent_ok,
        "non_busy_error_propagation_pass": nonbusy_ok,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[3])
    args = parser.parse_args()
    root = args.root.resolve()
    primary = load_module("tse01_primary_publication", root / "artifact/commit-replay/src/run_commit_replay.py")
    independent = load_module("tse01_independent_publication", root / "artifact/commit-replay/src/independent_recheck.py")

    with tempfile.TemporaryDirectory(prefix="tse01-publication-protocol-") as temporary:
        tmp = Path(temporary)
        p_pub, p_exec, p_invalid = run_primary_stress(primary, tmp)
        i_pub, i_exec, i_invalid = run_independent_stress(independent, tmp)

    p_retry = exercise_retry(primary, primary=True)
    i_retry = exercise_retry(independent, primary=False)
    invalid = p_invalid + i_invalid
    receipt = {
        "schema": SCHEMA,
        "verdict": "PASS" if not invalid and all(p_retry.values()) and all(i_retry.values()) else "FAIL",
        "atomic_publish_operations": p_pub + i_pub,
        "concurrent_execution_attempts": p_exec + i_exec,
        "observed_partial_or_invalid_outputs": len(invalid),
        "invalid_output_examples": invalid[:10],
        "transient_busy_retry_pass": p_retry["transient_busy_retry_pass"] and i_retry["transient_busy_retry_pass"],
        "permanent_busy_failure_pass": p_retry["permanent_busy_failure_pass"] and i_retry["permanent_busy_failure_pass"],
        "non_busy_error_propagation_pass": p_retry["non_busy_error_propagation_pass"] and i_retry["non_busy_error_propagation_pass"],
        "primary_and_independent_paths_tested": True,
        "scientific_case_accounting": "excluded; reproducibility stress only",
    }
    out = root / "artifact/commit-replay/results/publication_protocol_test.json"
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(receipt, indent=2, sort_keys=True))
    return 0 if receipt["verdict"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
