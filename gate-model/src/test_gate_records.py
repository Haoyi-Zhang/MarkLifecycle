#!/usr/bin/env python3
"""Bounded regressions for independently reconstructed finite model records.

All generated records and checker reports go to a fresh caller-owned --out
directory, never to retained scientific results. No C programs are executed.
"""
from __future__ import annotations

import argparse
import contextlib
import copy
import importlib.util
import io
import json
from pathlib import Path
import time


def load(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", required=True, type=Path)
    parser.add_argument("--checker", type=Path)
    args = parser.parse_args()
    source = Path(__file__).resolve().parent
    out = args.out.resolve()
    artifact = source.parents[1]
    if out == artifact or artifact in out.parents:
        parser.error("--out must be outside the artifact")
    if out.exists():
        parser.error("--out must be a fresh directory")
    out.mkdir(parents=True)
    primary = load("gate_records_primary", source / "run_gate_model.py")
    independent = load("gate_records_independent", args.checker or source / "independent_recheck.py")
    started = time.perf_counter()
    baseline = out / "valid"
    buffer = io.StringIO()
    with contextlib.redirect_stdout(buffer):
        primary.run(baseline)
        independent.validate(baseline)
    (out / "valid.stdout.txt").write_text(buffer.getvalue(), encoding="utf-8")
    results = baseline / "artifact/gate-model/results"
    originals = {p.name: json.loads(p.read_text(encoding="utf-8"))
                 for p in results.glob("*.json") if p.name != "independent_recheck.json"}
    # Each changed field describes an ordinary inconsistent finite-model record.
    # The aggregate inventory and decision counts remain unchanged.
    unknown = next(i for i, row in enumerate(originals["vectors.json"])
                   if row["vector"] == ["unresolved"] * 7)
    cases = [
        ("vector-label", "vectors.json", 0, "vector", ["true"] * 7),
        ("completion-count", "vectors.json", unknown, "completion_count", 1),
        ("completion-outcomes", "vectors.json", unknown, "boolean_completion_outcomes", [1]),
        ("closed-form", "vectors.json", unknown, "closed_form_decision", "pass"),
        ("sound-pass", "vectors.json", unknown, "sound_pass", False),
        ("sound-reject", "vectors.json", unknown, "sound_reject", False),
        ("maximality", "vectors.json", unknown, "maximally_decisive", False),
        ("faithfulness", "vectors.json", unknown, "boolean_faithful", False),
        ("refinement", "vectors.json", unknown, "stable_under_refinement", False),
        ("subset-mask", "subset_gates.json", 1, "mask", 0),
        ("subset-relations", "subset_gates.json", 1, "required_relations", []),
        ("subset-count", "subset_gates.json", 1, "relation_count", 0),
        ("subset-controls", "subset_gates.json", 1, "accepted_isolating_controls", []),
        ("failure-mask", "failure_sets.json", 0, "mask", 0),
        ("failure-relations", "failure_sets.json", 0, "failed_relations", []),
        ("failure-decision", "failure_sets.json", 0, "full_gate_decision", "pass"),
        ("failure-witness-count", "failure_sets.json", 0, "minimum_witness_count", 0),
        ("control-name", "isolating_controls.json", 0, "control", "lineage"),
        ("control-vector", "isolating_controls.json", 0, "vector", ["true"] * 7),
    ]
    rows = []
    for name, filename, index, field, value in cases:
        data = copy.deepcopy(originals)
        data[filename][index][field] = value
        directory = out / name
        target = directory / "artifact/gate-model/results"
        target.mkdir(parents=True)
        for member, contents in data.items():
            (target / member).write_text(json.dumps(contents, indent=2, sort_keys=True) + "\n",
                                        encoding="utf-8")
        buffer = io.StringIO()
        rejected = False
        with contextlib.redirect_stdout(buffer):
            try:
                independent.validate(directory)
            except SystemExit as exc:
                rejected = exc.code == 1
        (out / f"{name}.stdout.txt").write_text(buffer.getvalue(), encoding="utf-8")
        report = json.loads((target / "independent_recheck.json").read_text(encoding="utf-8"))
        rows.append({"name": name, "file": filename, "field": field,
                     "rejected": rejected, "errors": report["errors"]})
    report = {"valid_baseline_passed": True, "regressions": rows,
              "regression_count": len(rows),
              "rejected_count": sum(row["rejected"] for row in rows),
              "elapsed_seconds": time.perf_counter() - started,
              "checker": str((args.checker or source / "independent_recheck.py").resolve())}
    (out / "regressions.json").write_text(json.dumps(report, indent=2, sort_keys=True) + "\n",
                                          encoding="utf-8")
    print(json.dumps(report, sort_keys=True))
    return 0 if all(row["rejected"] for row in rows) else 1


if __name__ == "__main__":
    raise SystemExit(main())
