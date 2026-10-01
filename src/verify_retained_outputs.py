#!/usr/bin/env python3
"""Verify the closed set of retained finite-contract stdout evidence.

The 576 ``.out`` files are scientific observations, not LaTeX auxiliary files.
This checker never executes an experiment or rewrites a certificate.  It
requires the files already present in the delivery tree to match both the
results manifest and all certificate bindings byte-for-byte.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import json
from pathlib import Path
from typing import Any

EXPECTED_COUNT = 576
EXPECTED_BYTES = 65_536
RAW_PREFIX = "artifact/results/raw/"


def sha_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def manifest_bindings(root: Path) -> dict[str, str]:
    path = root / "artifact/results_manifest.csv"
    rows = list(csv.DictReader(path.open(newline="", encoding="utf-8")))
    bindings: dict[str, str] = {}
    for row in rows:
        rel = row.get("raw_output", "")
        digest = row.get("raw_output_sha256", "")
        if rel.startswith(RAW_PREFIX) and rel.endswith(".out"):
            if rel in bindings and bindings[rel] != digest:
                raise ValueError(f"conflicting results-manifest binding: {rel}")
            bindings[rel] = digest
    return bindings


def certificate_bindings(root: Path) -> dict[str, str]:
    bindings: dict[str, str] = {}
    for path in sorted((root / "artifact/certificates").glob("*/*.json")):
        cert = json.loads(path.read_text(encoding="utf-8"))
        for cell in cert.get("behavior", {}).get("toolchains", []):
            rel = cell.get("output_path", "")
            digest = cell.get("output_sha256", "")
            if isinstance(rel, str) and rel.startswith(RAW_PREFIX) and rel.endswith(".out"):
                if rel in bindings and bindings[rel] != digest:
                    raise ValueError(f"conflicting certificate binding: {rel}")
                bindings[rel] = digest
    return bindings


def verify(root: Path) -> dict[str, Any]:
    manifest = manifest_bindings(root)
    certificates = certificate_bindings(root)
    actual_paths = {
        path.relative_to(root).as_posix(): path
        for path in sorted((root / "artifact/results/raw").rglob("*.out"))
        if path.is_file()
    }
    errors: list[str] = []
    if len(manifest) != EXPECTED_COUNT:
        errors.append(f"results manifest binds {len(manifest)} outputs, expected {EXPECTED_COUNT}")
    if len(certificates) != EXPECTED_COUNT:
        errors.append(f"certificates bind {len(certificates)} outputs, expected {EXPECTED_COUNT}")
    if manifest != certificates:
        errors.append("results manifest and certificates disagree")
    expected = set(manifest)
    actual = set(actual_paths)
    if actual != expected:
        missing = sorted(expected - actual)
        extra = sorted(actual - expected)
        errors.append(f"retained output set mismatch; missing={missing[:8]} extra={extra[:8]}")
    bad_size: list[str] = []
    bad_hash: list[str] = []
    inventory_rows: list[dict[str, Any]] = []
    for rel in sorted(expected & actual):
        path = actual_paths[rel]
        size = path.stat().st_size
        digest = sha_file(path)
        if size != EXPECTED_BYTES:
            bad_size.append(rel)
        if digest != manifest[rel]:
            bad_hash.append(rel)
        inventory_rows.append({"path": rel, "bytes": size, "sha256": digest})
    if bad_size:
        errors.append(f"retained output size mismatch: {bad_size[:8]}")
    if bad_hash:
        errors.append(f"retained output hash mismatch: {bad_hash[:8]}")
    content = "\n".join(
        f"{row['path']}\t{row['bytes']}\t{row['sha256']}" for row in inventory_rows
    ).encode("utf-8")
    return {
        "schema": "tse01.retained-output-closure.v1",
        "verification_kind": "delivery-integrity-check-not-experiment-rerun",
        "expected_count": EXPECTED_COUNT,
        "verified_count": len(inventory_rows),
        "bytes_per_output": EXPECTED_BYTES,
        "results_manifest_and_certificates_agree": manifest == certificates,
        "scientific_outputs_present": actual == expected,
        "content_set_sha256": hashlib.sha256(content).hexdigest(),
        "experiment_rerun": False,
        "certificate_rewrite": False,
        "errors": errors,
        "verdict": "PASS" if not errors else "FAIL",
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    report = verify(root)
    if args.report:
        target = args.report if args.report.is_absolute() else root / args.report
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(report, sort_keys=True))
    return 0 if report["verdict"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
