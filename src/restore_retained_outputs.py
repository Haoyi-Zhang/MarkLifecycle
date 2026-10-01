#!/usr/bin/env python3
"""Restore and verify retained finite-contract stdout files from an original release archive.

This is a byte-for-byte evidence recovery utility, not an experiment runner.  It
copies only the 576 ``artifact/results/raw/**/*.out`` members whose paths,
sizes, and SHA-256 values are already bound by ``results_manifest.csv`` and the
finite certificates.  It never rewrites certificates or result claims.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import json
import zipfile
from pathlib import Path
from typing import Any

EXPECTED_COUNT = 576
EXPECTED_BYTES = 65_536
PREFIX = "TSE-01/artifact/results/raw/"


def sha_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def load_expected(root: Path) -> dict[str, str]:
    rows = list(csv.DictReader((root / "artifact/results_manifest.csv").open(newline="", encoding="utf-8")))
    expected: dict[str, str] = {}
    for row in rows:
        rel = row.get("raw_output", "")
        if rel.startswith("artifact/results/raw/") and rel.endswith(".out"):
            digest = row.get("raw_output_sha256", "")
            if rel in expected and expected[rel] != digest:
                raise SystemExit(f"conflicting result-manifest digest: {rel}")
            expected[rel] = digest
    if len(expected) != EXPECTED_COUNT:
        raise SystemExit(f"expected {EXPECTED_COUNT} retained outputs, manifest binds {len(expected)}")
    return expected


def certificate_outputs(root: Path) -> dict[str, str]:
    bound: dict[str, str] = {}
    for path in sorted((root / "artifact/certificates").glob("*/*.json")):
        cert = json.loads(path.read_text(encoding="utf-8"))
        for cell in cert.get("behavior", {}).get("toolchains", []):
            rel = cell.get("output_path")
            digest = cell.get("output_sha256")
            if isinstance(rel, str) and rel.endswith(".out"):
                if rel in bound and bound[rel] != digest:
                    raise SystemExit(f"conflicting certificate digest: {rel}")
                bound[rel] = digest
    if len(bound) != EXPECTED_COUNT:
        raise SystemExit(f"expected {EXPECTED_COUNT} certificate-bound outputs, found {len(bound)}")
    return bound


def restore(root: Path, archive: Path, *, verify_only: bool) -> dict[str, Any]:
    expected = load_expected(root)
    cert_bound = certificate_outputs(root)
    if expected != cert_bound:
        raise SystemExit("results manifest and certificates disagree on retained outputs")
    restored = 0
    already_present = 0
    rows: list[dict[str, Any]] = []
    with zipfile.ZipFile(archive) as zf:
        members = {
            name[len("TSE-01/"):]: name
            for name in zf.namelist()
            if name.startswith(PREFIX) and name.endswith(".out")
        }
        if set(members) != set(expected):
            missing = sorted(set(expected) - set(members))
            extra = sorted(set(members) - set(expected))
            raise SystemExit(f"archive output set mismatch; missing={missing[:8]} extra={extra[:8]}")
        for rel in sorted(expected):
            data = zf.read(members[rel])
            if len(data) != EXPECTED_BYTES:
                raise SystemExit(f"archive output size mismatch: {rel}={len(data)}")
            digest = sha_bytes(data)
            if digest != expected[rel]:
                raise SystemExit(f"archive output digest mismatch: {rel}")
            target = root / rel
            action = "verified-existing"
            if target.is_file() and target.stat().st_size == EXPECTED_BYTES and sha_file(target) == digest:
                already_present += 1
            elif verify_only:
                raise SystemExit(f"retained output missing or changed: {rel}")
            else:
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes(data)
                restored += 1
                action = "restored-from-archive"
            rows.append({"path": rel, "bytes": len(data), "sha256": digest, "action": action})
    content = "\n".join(f"{row['path']}\t{row['bytes']}\t{row['sha256']}" for row in rows).encode()
    return {
        "schema": "tse01.retained-output-restoration.v1",
        "archive_sha256": sha_file(archive),
        "expected_count": EXPECTED_COUNT,
        "verified_count": len(rows),
        "restored_count": restored,
        "already_present_count": already_present,
        "bytes_per_output": EXPECTED_BYTES,
        "content_set_sha256": sha_bytes(content),
        "results_manifest_and_certificates_agree": True,
        "experiment_rerun": False,
        "certificate_rewrite": False,
        "rows": rows,
        "verdict": "PASS",
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--archive", type=Path, required=True)
    parser.add_argument("--verify-only", action="store_true")
    parser.add_argument("--receipt", type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    archive = args.archive.resolve()
    result = restore(root, archive, verify_only=args.verify_only)
    if args.receipt:
        args.receipt.parent.mkdir(parents=True, exist_ok=True)
        args.receipt.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({key: result[key] for key in (
        "verified_count", "restored_count", "already_present_count", "experiment_rerun", "verdict"
    )}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
