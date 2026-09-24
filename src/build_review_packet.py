#!/usr/bin/env python3
"""Create the author-visible single-anonymous review packet and execute its complete self-rebuilding pipeline."""
from __future__ import annotations

import argparse
import os
import shutil
import subprocess
from pathlib import Path

TRANSIENT_FILES = {
    "paper/main.aux", "paper/main.bbl", "paper/main.blg", "paper/main.log",
    "paper/main.out", "paper/main.fls", "paper/main.fdb_latexmk", "paper/main.synctex.gz",
}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[2])
    parser.add_argument("--destination", type=Path, required=True)
    args = parser.parse_args()
    source = args.root.resolve()
    destination = args.destination.resolve()
    if source.name != "TSE-01":
        raise SystemExit(f"full release root must be named TSE-01, found {source.name}")
    if destination.name != "TSE-01-REVIEW-PACKET":
        raise SystemExit(f"review destination must be named TSE-01-REVIEW-PACKET, found {destination.name}")
    if destination == source or source in destination.parents:
        raise SystemExit("review destination must be outside the full release root")
    if destination.exists():
        shutil.rmtree(destination)
    destination.mkdir(parents=True)
    shutil.copytree(source / "paper", destination / "paper")
    shutil.copytree(source / "artifact", destination / "artifact")
    for rel in TRANSIENT_FILES:
        (destination / rel).unlink(missing_ok=True)
    for cache in destination.rglob("__pycache__"):
        if cache.is_dir():
            shutil.rmtree(cache)
    env = os.environ.copy()
    env["PYTHONDONTWRITEBYTECODE"] = "1"
    env["TSE01_ROOT"] = str(destination)
    env["TSE01_PROFILE"] = "review"
    subprocess.run(["bash", "artifact/run_all.sh"], cwd=destination, env=env, check=True)
    print(destination)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
