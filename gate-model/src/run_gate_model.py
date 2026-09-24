#!/usr/bin/env python3
"""Exhaustive model checking for the seven-relation three-valued release gate."""
from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path
from typing import Iterable, Any

RELATIONS = [
    "behavior", "recovery", "continuity", "source_conformance",
    "executable_reproduction", "integrity", "lineage",
]
VALUES = (-1, 0, 1)  # false, unresolved, true
LABEL = {-1: "false", 0: "unresolved", 1: "true"}


def write(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def completions(vector: tuple[int, ...]) -> Iterable[tuple[int, ...]]:
    positions = [i for i, value in enumerate(vector) if value == 0]
    for choices in itertools.product((-1, 1), repeat=len(positions)):
        out = list(vector)
        for index, choice in zip(positions, choices):
            out[index] = choice
        yield tuple(out)


def boolean_gate(vector: tuple[int, ...]) -> int:
    return int(all(value == 1 for value in vector))


def decision(vector: tuple[int, ...]) -> str:
    outcomes = {boolean_gate(value) for value in completions(vector)}
    if outcomes == {1}:
        return "pass"
    if outcomes == {0}:
        return "reject"
    return "hold"


def ancestry_fixtures() -> list[dict[str, Any]]:
    """Finite parent graphs. A bridge flag authorizes only its named edge."""
    return [
        {
            "name": "diamond_shared_ancestor",
            "root": "merge",
            "expected": "pass",
            "nodes": {
                "genesis": {"policy": "p", "decision": "pass", "parents": []},
                "left": {"policy": "p", "decision": "pass", "parents": [{"id": "genesis", "bridge": False}]},
                "right": {"policy": "p", "decision": "pass", "parents": [{"id": "genesis", "bridge": False}]},
                "merge": {"policy": "p", "decision": "pass", "parents": [{"id": "left", "bridge": False}, {"id": "right", "bridge": False}]},
            },
        },
        {
            "name": "explicit_policy_bridge",
            "root": "new",
            "expected": "pass",
            "nodes": {
                "old": {"policy": "p", "decision": "pass", "parents": []},
                "new": {"policy": "q", "decision": "pass", "parents": [{"id": "old", "bridge": True}]},
            },
        },
        {
            "name": "cycle",
            "root": "a",
            "expected": "reject",
            "nodes": {
                "a": {"policy": "p", "decision": "pass", "parents": [{"id": "b", "bridge": False}]},
                "b": {"policy": "p", "decision": "pass", "parents": [{"id": "a", "bridge": False}]},
            },
        },
        {
            "name": "missing_parent",
            "root": "child",
            "expected": "reject",
            "nodes": {
                "child": {"policy": "p", "decision": "pass", "parents": [{"id": "absent", "bridge": False}]},
            },
        },
        {
            "name": "rejected_parent",
            "root": "child",
            "expected": "reject",
            "nodes": {
                "bad": {"policy": "p", "decision": "reject", "parents": []},
                "child": {"policy": "p", "decision": "pass", "parents": [{"id": "bad", "bridge": False}]},
            },
        },
        {
            "name": "unbridged_policy_mismatch",
            "root": "new",
            "expected": "reject",
            "nodes": {
                "old": {"policy": "p", "decision": "pass", "parents": []},
                "new": {"policy": "q", "decision": "pass", "parents": [{"id": "old", "bridge": False}]},
            },
        },
    ]


def validate_active_path(fixture: dict[str, Any]) -> dict[str, Any]:
    """Primary graph check: active-path cycle detection plus completed-node reuse."""
    nodes = fixture["nodes"]
    state: dict[str, str] = {}  # active or done
    result: dict[str, bool] = {}
    errors: list[str] = []
    memo_reuse_count = 0

    def visit(node_id: str) -> bool:
        nonlocal memo_reuse_count
        if node_id not in nodes:
            errors.append(f"missing parent: {node_id}")
            return False
        if state.get(node_id) == "active":
            errors.append(f"cycle on active path: {node_id}")
            return False
        if state.get(node_id) == "done":
            memo_reuse_count += 1
            return result[node_id]
        state[node_id] = "active"
        node = nodes[node_id]
        ok = node.get("decision") == "pass"
        if not ok:
            errors.append(f"non-passing node: {node_id}")
        for edge in node.get("parents", []):
            parent_id = edge["id"]
            parent = nodes.get(parent_id)
            if parent is None:
                errors.append(f"missing parent: {parent_id}")
                ok = False
                continue
            compatible = parent.get("policy") == node.get("policy") or edge.get("bridge") is True
            if not compatible:
                errors.append(f"policy mismatch: {parent_id}->{node_id}")
                ok = False
            if not visit(parent_id):
                ok = False
        state[node_id] = "done"
        result[node_id] = ok
        return ok

    valid = visit(fixture["root"])
    return {
        "name": fixture["name"],
        "expected": fixture["expected"],
        "primary_decision": "pass" if valid else "reject",
        "matches_expected": ("pass" if valid else "reject") == fixture["expected"],
        "memo_reuse_count": memo_reuse_count,
        "errors": sorted(set(errors)),
    }


def run(root: Path) -> dict[str, object]:
    results = root / "artifact" / "gate-model" / "results"
    vectors = []
    completion_total = 0
    counts = {"pass": 0, "hold": 0, "reject": 0}
    all_properties = True
    for vector in itertools.product(VALUES, repeat=len(RELATIONS)):
        cs = list(completions(vector))
        completion_total += len(cs)
        outcomes = sorted({boolean_gate(value) for value in cs})
        verdict = decision(vector)
        counts[verdict] += 1
        closed_form = "reject" if -1 in vector else "pass" if 0 not in vector else "hold"
        sound_pass = verdict != "pass" or outcomes == [1]
        sound_reject = verdict != "reject" or outcomes == [0]
        maximal = (outcomes == [1] and verdict == "pass") or (outcomes == [0] and verdict == "reject") or (outcomes == [0, 1] and verdict == "hold")
        faithful = 0 in vector or verdict == ("pass" if boolean_gate(vector) else "reject")
        stable = verdict not in ("pass", "reject") or all(decision(refinement) == verdict for refinement in cs)
        row = {
            "vector": [LABEL[value] for value in vector],
            "completion_count": len(cs),
            "boolean_completion_outcomes": outcomes,
            "decision": verdict,
            "closed_form_decision": closed_form,
            "boolean_faithful": faithful,
            "sound_pass": sound_pass,
            "sound_reject": sound_reject,
            "maximally_decisive": maximal,
            "stable_under_refinement": stable,
        }
        all_properties &= all((faithful, sound_pass, sound_reject, maximal, stable, verdict == closed_form))
        vectors.append(row)

    isolating_controls = []
    for false_index, relation in enumerate(RELATIONS):
        vector = [1] * len(RELATIONS)
        vector[false_index] = -1
        isolating_controls.append({"control": relation, "vector": [LABEL[v] for v in vector]})

    subset_rows = []
    for mask in range(1 << len(RELATIONS)):
        required = [relation for index, relation in enumerate(RELATIONS) if mask & (1 << index)]
        accepted = [relation for relation in RELATIONS if relation not in required]
        subset_rows.append({
            "mask": mask,
            "required_relations": required,
            "relation_count": len(required),
            "false_accept_count": len(accepted),
            "accepted_isolating_controls": accepted,
        })

    failure_rows = []
    for mask in range(1, 1 << len(RELATIONS)):
        failed = [relation for index, relation in enumerate(RELATIONS) if mask & (1 << index)]
        failure_rows.append({
            "mask": mask,
            "failed_relations": failed,
            "full_gate_decision": "reject",
            "minimum_witness_count": len(failed),
        })

    graph_rows = [validate_active_path(fixture) for fixture in ancestry_fixtures()]
    graph_ok = all(row["matches_expected"] for row in graph_rows)
    graph_by_name = {row["name"]: row for row in graph_rows}
    zero_false_accept = [row for row in subset_rows if row["false_accept_count"] == 0]
    summary = {
        "schema": "tse01.gate-model.summary.v2",
        "relation_count": len(RELATIONS),
        "relations": RELATIONS,
        "three_valued_vector_count": len(vectors),
        "boolean_completion_count": completion_total,
        "decision_counts": counts,
        "relation_subset_gate_count": len(subset_rows),
        "nonempty_failure_set_count": len(failure_rows),
        "isolating_control_count": len(isolating_controls),
        "unique_zero_false_accept_subset": len(zero_false_accept) == 1 and zero_false_accept[0]["required_relations"] == RELATIONS,
        "unique_maximally_decisive_sound_completion_stable_lift": all_properties,
        "full_relation_basis_minimal_under_isolating_controls": all(row["false_accept_count"] > 0 for row in subset_rows[:-1]),
        "ancestry_graph_fixture_count": len(graph_rows),
        "ancestry_graph_valid_count": sum(row["primary_decision"] == "pass" for row in graph_rows),
        "ancestry_graph_reject_count": sum(row["primary_decision"] == "reject" for row in graph_rows),
        "diamond_merge_shared_ancestor_accepts": graph_by_name["diamond_shared_ancestor"]["primary_decision"] == "pass" and graph_by_name["diamond_shared_ancestor"]["memo_reuse_count"] > 0,
        "explicit_policy_bridge_accepts": graph_by_name["explicit_policy_bridge"]["primary_decision"] == "pass",
        "cycle_rejected": graph_by_name["cycle"]["primary_decision"] == "reject",
        "missing_parent_rejected": graph_by_name["missing_parent"]["primary_decision"] == "reject",
        "rejected_parent_rejected": graph_by_name["rejected_parent"]["primary_decision"] == "reject",
        "unbridged_policy_mismatch_rejected": graph_by_name["unbridged_policy_mismatch"]["primary_decision"] == "reject",
        "active_path_cycle_detection_with_memoized_shared_ancestors": graph_ok,
        "verdict": "PASS" if all_properties and len(zero_false_accept) == 1 and graph_ok else "FAIL",
    }
    write(results / "vectors.json", vectors)
    write(results / "subset_gates.json", subset_rows)
    write(results / "failure_sets.json", failure_rows)
    write(results / "isolating_controls.json", isolating_controls)
    write(results / "ancestry_graphs.json", graph_rows)
    write(results / "summary.json", summary)
    print(json.dumps(summary, sort_keys=True))
    if summary["verdict"] != "PASS":
        raise SystemExit(1)
    return summary


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", required=True, type=Path)
    args = parser.parse_args()
    run(args.root.resolve())


if __name__ == "__main__":
    main()
