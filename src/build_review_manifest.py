#!/usr/bin/env python3
"""Build the non-self-referential manifest for the author-visible review packet."""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

EXCLUDED_PATHS = {
    "REVIEW_PACKET_MANIFEST.json",
    "artifact/results/release_audit.json",
}


def sha_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for block in iter(lambda: f.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[2])
    args = parser.parse_args()
    root = args.root.resolve()
    if root.name != "TSE-01-REVIEW-PACKET":
        raise SystemExit(f"review root must be named TSE-01-REVIEW-PACKET, found {root.name}")
    rows = []
    for path in sorted(root.rglob("*")):
        if not path.is_file() or path.is_symlink():
            continue
        rel = path.relative_to(root).as_posix()
        if rel in EXCLUDED_PATHS or "__pycache__" in path.parts:
            continue
        rows.append({"path": rel, "bytes": path.stat().st_size, "sha256": sha_file(path)})
    canonical_rows = json.dumps(rows, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode("ascii")
    payload = {
        "schema": "tse01.review-packet-manifest.v2",
        "root_name": "TSE-01-REVIEW-PACKET",
        "excluded_paths": sorted(EXCLUDED_PATHS),
        "file_count": len(rows),
        "content_set_sha256": hashlib.sha256(canonical_rows).hexdigest(),
        "files": rows,
    }
    out = root / "REVIEW_PACKET_MANIFEST.json"
    out.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "file_count": len(rows),
        "content_set_sha256": payload["content_set_sha256"],
        "output": out.name,
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
