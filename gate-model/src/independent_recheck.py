#!/usr/bin/env python3
"""Independent arithmetic and graph recheck of the TSE-01 gate model."""
from __future__ import annotations

import argparse
import copy
import itertools
import json
from collections import defaultdict, deque
from pathlib import Path
from typing import Any

N = 7
RELATIONS = ["behavior", "recovery", "continuity", "source_conformance", "executable_reproduction", "integrity", "lineage"]


def read(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def forced_decision(digits: tuple[int, ...]) -> str:
    if min(digits) < 0:
        return "reject"
    if 0 in digits:
        return "hold"
    return "pass"


def graph_fixtures() -> list[dict[str, Any]]:
    # Reconstructed independently rather than importing the primary checker.
    return [
        {"name": "diamond_shared_ancestor", "root": "merge", "expected": "pass", "nodes": {
            "genesis": {"policy": "p", "decision": "pass", "parents": []},
            "left": {"policy": "p", "decision": "pass", "parents": [{"id": "genesis", "bridge": False}]},
            "right": {"policy": "p", "decision": "pass", "parents": [{"id": "genesis", "bridge": False}]},
            "merge": {"policy": "p", "decision": "pass", "parents": [{"id": "left", "bridge": False}, {"id": "right", "bridge": False}]},
        }},
        {"name": "explicit_policy_bridge", "root": "new", "expected": "pass", "nodes": {
            "old": {"policy": "p", "decision": "pass", "parents": []},
            "new": {"policy": "q", "decision": "pass", "parents": [{"id": "old", "bridge": True}]},
        }},
        {"name": "cycle", "root": "a", "expected": "reject", "nodes": {
            "a": {"policy": "p", "decision": "pass", "parents": [{"id": "b", "bridge": False}]},
            "b": {"policy": "p", "decision": "pass", "parents": [{"id": "a", "bridge": False}]},
        }},
        {"name": "missing_parent", "root": "child", "expected": "reject", "nodes": {
            "child": {"policy": "p", "decision": "pass", "parents": [{"id": "absent", "bridge": False}]},
        }},
        {"name": "rejected_parent", "root": "child", "expected": "reject", "nodes": {
            "bad": {"policy": "p", "decision": "reject", "parents": []},
            "child": {"policy": "p", "decision": "pass", "parents": [{"id": "bad", "bridge": False}]},
        }},
        {"name": "unbridged_policy_mismatch", "root": "new", "expected": "reject", "nodes": {
            "old": {"policy": "p", "decision": "pass", "parents": []},
            "new": {"policy": "q", "decision": "pass", "parents": [{"id": "old", "bridge": False}]},
        }},
    ]


def validate_topologically(fixture: dict[str, Any]) -> tuple[str, list[str]]:
    """Independent algorithm: reachable closure followed by Kahn topological sort."""
    nodes = fixture["nodes"]
    root = fixture["root"]
    errors: list[str] = []
    reachable: set[str] = set()
    stack = [root]
    while stack:
        node_id = stack.pop()
        if node_id in reachable:
            continue
        node = nodes.get(node_id)
        if node is None:
            errors.append(f"missing node: {node_id}")
            continue
        reachable.add(node_id)
        for edge in node.get("parents", []):
            parent_id = edge["id"]
            if parent_id not in nodes:
                errors.append(f"missing parent: {parent_id}")
            else:
                stack.append(parent_id)
    if errors:
        return "reject", sorted(set(errors))

    indegree = {node_id: 0 for node_id in reachable}
    children: dict[str, list[str]] = defaultdict(list)
    for child_id in reachable:
        child = nodes[child_id]
        if child.get("decision") != "pass":
            errors.append(f"non-passing node: {child_id}")
        for edge in child.get("parents", []):
            parent_id = edge["id"]
            if parent_id not in reachable:
                continue
            indegree[child_id] += 1
            children[parent_id].append(child_id)
            parent = nodes[parent_id]
            if parent.get("policy") != child.get("policy") and edge.get("bridge") is not True:
                errors.append(f"policy mismatch: {parent_id}->{child_id}")

    queue = deque(sorted(node_id for node_id, degree in indegree.items() if degree == 0))
    visited = 0
    while queue:
        node_id = queue.popleft()
        visited += 1
        for child_id in sorted(children[node_id]):
            indegree[child_id] -= 1
            if indegree[child_id] == 0:
                queue.append(child_id)
    if visited != len(reachable):
        errors.append("cycle in reachable closure")
    return ("pass" if not errors else "reject"), sorted(set(errors))


def global_seen_mutant(fixture: dict[str, Any]) -> str:
    """Deliberately wrong: treats a shared completed ancestor as a cycle."""
    nodes = fixture["nodes"]
    seen: set[str] = set()

    def visit(node_id: str) -> bool:
        if node_id in seen or node_id not in nodes:
            return False
        seen.add(node_id)
        return all(visit(edge["id"]) for edge in nodes[node_id].get("parents", []))

    return "pass" if visit(fixture["root"]) else "reject"


def validate(root: Path) -> dict[str, Any]:
    results = root / "artifact" / "gate-model" / "results"
    summary = read(results / "summary.json")
    vectors = read(results / "vectors.json")
    subsets = read(results / "subset_gates.json")
    failures = read(results / "failure_sets.json")
    controls = read(results / "isolating_controls.json")
    stored_graphs = {row["name"]: row for row in read(results / "ancestry_graphs.json")}
    errors: list[str] = []

    expected_counts = {"pass": 1, "hold": 2**N - 1, "reject": 3**N - 2**N}
    if len(vectors) != 3**N:
        errors.append("vector count")
    if sum(2 ** sum(value == 0 for value in digits) for digits in itertools.product((-1, 0, 1), repeat=N)) != 4**N:
        errors.append("completion identity")
    actual_counts = {key: 0 for key in expected_counts}
    completion_total = 0
    labels = {-1: "false", 0: "unresolved", 1: "true"}
    for index, (digits, row) in enumerate(zip(itertools.product((-1, 0, 1), repeat=N), vectors)):
        verdict = forced_decision(digits)
        actual_counts[verdict] += 1
        count = 2 ** digits.count(0)
        completion_total += count
        # Reconstruct record meaning, not just decision labels and totals.
        outcomes = [0] if -1 in digits else [0, 1] if 0 in digits else [1]
        expected_row = {
            "vector": [labels[value] for value in digits],
            "completion_count": count,
            "boolean_completion_outcomes": outcomes,
            "decision": verdict,
            "closed_form_decision": verdict,
            "boolean_faithful": True,
            "sound_pass": verdict != "pass" or outcomes == [1],
            "sound_reject": verdict != "reject" or outcomes == [0],
            "maximally_decisive": True,
            "stable_under_refinement": True,
        }
        for field, value in expected_row.items():
            if not isinstance(row, dict) or row.get(field) != value:
                errors.append(f"vector {index}: {field}")
    if actual_counts != expected_counts or summary.get("decision_counts") != expected_counts:
        errors.append("decision partition")
    if completion_total != 4**N:
        errors.append("record completion total")

    if len(subsets) != 2**N:
        errors.append("subset count")
    zero_rows = []
    for mask, row in enumerate(subsets):
        required = [relation for index, relation in enumerate(RELATIONS) if mask & (1 << index)]
        accepted = [relation for relation in RELATIONS if relation not in required]
        expected_false_accepts = len(accepted)
        expected_row = {
            "mask": mask,
            "required_relations": required,
            "relation_count": len(required),
            "false_accept_count": expected_false_accepts,
            "accepted_isolating_controls": accepted,
        }
        for field, value in expected_row.items():
            if not isinstance(row, dict) or row.get(field) != value:
                errors.append(f"subset {mask}: {field}")
        if expected_false_accepts == 0:
            zero_rows.append(row)
    if len(zero_rows) != 1 or not isinstance(zero_rows[0], dict) or zero_rows[0].get("required_relations") != RELATIONS:
        errors.append("unique full basis")
    if len(failures) != 2**N - 1 or len(controls) != N:
        errors.append("failure/control inventory")
    for mask, row in enumerate(failures, start=1):
        failed = [relation for index, relation in enumerate(RELATIONS) if mask & (1 << index)]
        expected_row = {
            "mask": mask,
            "failed_relations": failed,
            "full_gate_decision": "reject",
            "minimum_witness_count": len(failed),
        }
        for field, value in expected_row.items():
            if not isinstance(row, dict) or row.get(field) != value:
                errors.append(f"failure set {mask}: {field}")
    for index, row in enumerate(controls):
        vector = ["true"] * N
        if index < N:
            vector[index] = "false"
        expected_row = {"control": RELATIONS[index] if index < N else None, "vector": vector}
        for field, value in expected_row.items():
            if not isinstance(row, dict) or row.get(field) != value:
                errors.append(f"isolating control {index}: {field}")

    graph_rows = []
    for fixture in graph_fixtures():
        verdict, graph_errors = validate_topologically(fixture)
        stored = stored_graphs.get(fixture["name"], {})
        matches = verdict == fixture["expected"] and stored.get("primary_decision") == verdict and stored.get("matches_expected") is True
        if not matches:
            errors.append(f"graph fixture: {fixture['name']}")
        graph_rows.append({
            "name": fixture["name"],
            "expected": fixture["expected"],
            "independent_decision": verdict,
            "matches_primary_and_expected": matches,
            "errors": graph_errors,
        })

    diamond = next(f for f in graph_fixtures() if f["name"] == "diamond_shared_ancestor")
    mutant_decision = global_seen_mutant(diamond)
    global_seen_mutant_rejected = mutant_decision != diamond["expected"]
    if not global_seen_mutant_rejected:
        errors.append("global-seen graph mutant was not exposed")

    expected_summary = {
        "relation_count": N,
        "three_valued_vector_count": 3**N,
        "boolean_completion_count": 4**N,
        "relation_subset_gate_count": 2**N,
        "nonempty_failure_set_count": 2**N - 1,
        "isolating_control_count": N,
        "unique_zero_false_accept_subset": True,
        "unique_maximally_decisive_sound_completion_stable_lift": True,
        "full_relation_basis_minimal_under_isolating_controls": True,
        "ancestry_graph_fixture_count": 6,
        "ancestry_graph_valid_count": 2,
        "ancestry_graph_reject_count": 4,
        "diamond_merge_shared_ancestor_accepts": True,
        "explicit_policy_bridge_accepts": True,
        "cycle_rejected": True,
        "missing_parent_rejected": True,
        "rejected_parent_rejected": True,
        "unbridged_policy_mismatch_rejected": True,
        "active_path_cycle_detection_with_memoized_shared_ancestors": True,
        "verdict": "PASS",
    }
    for key, value in expected_summary.items():
        if summary.get(key) != value:
            errors.append(f"summary {key}")

    mutations = []
    for name, mutate in [
        ("vector count", lambda x: x.__setitem__("three_valued_vector_count", 2186)),
        ("completion count", lambda x: x.__setitem__("boolean_completion_count", 16383)),
        ("subset uniqueness", lambda x: x.__setitem__("unique_zero_false_accept_subset", False)),
        ("decision partition", lambda x: x.__setitem__("decision_counts", {"pass": 2, "hold": 126, "reject": 2059})),
    ]:
        mutant = copy.deepcopy(summary)
        mutate(mutant)
        rejected = any(mutant.get(key) != value for key, value in expected_summary.items()) or mutant.get("decision_counts") != expected_counts
        mutations.append({"name": name, "rejected": rejected})
        if not rejected:
            errors.append(f"mutation accepted: {name}")
    mutations.append({"name": "global seen rejects shared ancestor", "rejected": global_seen_mutant_rejected})

    report = {
        "schema": "tse01.gate-model.independent-recheck.v2",
        "all_valid": not errors,
        "errors": errors,
        "three_valued_vectors_rechecked": 3**N,
        "boolean_completions_recounted": 4**N,
        "relation_subset_gates_rechecked": 2**N,
        "nonempty_failure_sets_rechecked": 2**N - 1,
        "ancestry_graph_fixtures_rechecked": len(graph_rows),
        "ancestry_graph_results": graph_rows,
        "diamond_merge_shared_ancestor_rechecked": True,
        "global_seen_mutant_rejected": global_seen_mutant_rejected,
        "aggregate_mutation_test_count": len(mutations),
        "aggregate_mutation_tests": mutations,
        "checker_independence": "signed-ternary arithmetic, subset cardinality identities, and reachable-closure topological sorting; imports no primary implementation",
        "verdict": "PASS" if not errors else "FAIL",
    }
    (results / "independent_recheck.json").write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(report, sort_keys=True))
    if errors:
        raise SystemExit(1)
    return report


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", required=True, type=Path)
    args = parser.parse_args()
    validate(args.root.resolve())


if __name__ == "__main__":
    main()
