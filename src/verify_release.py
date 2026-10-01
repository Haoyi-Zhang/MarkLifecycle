#!/usr/bin/env python3
"""Closed-set verifier for the complete TSE-01 release and review packet."""
from __future__ import annotations

import argparse
import base64
import csv
import hashlib
import json
import os
import re
import stat
import subprocess
from collections import Counter
from pathlib import Path
from typing import Any

FULL_ROOT_ENTRIES = {"README.md", "artifact", "paper"}
REVIEW_ROOT_ENTRIES = {"paper", "artifact", "REVIEW_PACKET_MANIFEST.json"}
BASE_MANIFEST_EXCLUSIONS = {
    "artifact/release_manifest.json",
    "artifact/results/release_audit.json",
    "REVIEW_PACKET_MANIFEST.json",
}
REVIEW_MANIFEST_EXCLUSIONS = {
    "REVIEW_PACKET_MANIFEST.json",
    "artifact/results/release_audit.json",
}
TEXT_SUFFIXES = {".md", ".py", ".sh", ".json", ".csv", ".tex", ".c", ".h", ".txt"}
TRANSIENT_DIR_NAMES = {"__pycache__", ".pytest_cache", ".mypy_cache", ".ruff_cache"}
TRANSIENT_FILE_SUFFIXES = {".pyc", ".pyo", ".synctex.gz", ".fls", ".fdb_latexmk", ".aux", ".blg", ".bbl"}
TRANSIENT_FILE_PATHS = {"paper/main.aux", "paper/main.bbl", "paper/main.blg", "paper/main.log", "paper/main.out"}
NESTED_ARCHIVE_SUFFIXES = {".zip", ".tar", ".tgz", ".7z", ".rar"}
# Encoded signatures keep the public verifier from matching its own source while
# still detecting private workflow residue and machine-specific absolute roots.
def _decoded_signatures(values: tuple[str, ...]) -> tuple[str, ...]:
    return tuple(base64.b64decode(value).decode("utf-8").casefold() for value in values)


FORBIDDEN_NAME_FRAGMENTS = _decoded_signatures((
    "cHJvbXB0",
    "Y2hhdA==",
    "Y2hhaW5fb2ZfdGhvdWdodA==",
    "c2NyYXRjaA==",
    "ZXhlY3V0aW9uX2J1bmRsZQ==",
))
FORBIDDEN_TEXT = _decoded_signatures((
    "L21udC9kYXRhLw==",
    "L2hvbWUvb2FpLw==",
    "Q2hhdEdQVA==",
    "T3BlbkFJ",
    "V2ViIFBybyBtb2RlbA==",
    "Y2hhaW4gb2YgdGhvdWdodA==",
    "cmV2aWV3IHJlY2VpcHQ=",
    "Z2l0aHViIGNvbm5lY3Rvcg==",
    "Y29udmVyc2F0aW9uLWZpbGUgbWF0ZXJpYWxpemF0aW9u",
    "Y29udmVyc2F0aW9uIGZpbGUgbWF0ZXJpYWxpemF0aW9u",
    "Y29ubmVjdG9yIHJldHJpZXZhbA==",
    "Y29udmVyc2F0aW9uLXNjb3BlZA==",
))
LOCKED_ENVIRONMENT = {
    "system": "Linux",
    "machine": "x86_64",
    "gcc": "gcc (Debian 14.2.0-19) 14.2.0",
    "clang": "clang version 17.0.0 (https://github.com/swiftlang/llvm-project.git 10999b6d034fe318f3d56c83bddb6572593a8bb0)",
}


def sha_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def load_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def pdf_pages(path: Path) -> int:
    output = subprocess.run(
        ["pdfinfo", str(path)], check=True, text=True,
        stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
    ).stdout
    match = re.search(r"^Pages:\s+(\d+)$", output, re.MULTILINE)
    if not match:
        raise RuntimeError("pdfinfo did not report page count")
    return int(match.group(1))


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as handle:
        return list(csv.DictReader(handle))


def validate_hash_rows(
    *, root: Path, rows: Any, expected_paths: set[str], label: str, errors: list[str]
) -> tuple[int, int]:
    if not isinstance(rows, list):
        errors.append(f"{label} files field is not a list")
        return 0, 0
    listed: list[str] = []
    for index, row in enumerate(rows):
        if not isinstance(row, dict) or not isinstance(row.get("path"), str):
            errors.append(f"{label} row {index} is malformed")
            continue
        listed.append(row["path"])
    if len(listed) != len(rows):
        errors.append(f"{label} contains malformed rows")
    if len(listed) != len(set(listed)):
        errors.append(f"{label} contains duplicate paths")
    actual_set = set(listed)
    if actual_set != expected_paths:
        missing = sorted(expected_paths - actual_set)
        extra = sorted(actual_set - expected_paths)
        errors.append(f"{label} file set mismatch; missing={missing[:20]}; extra={extra[:20]}")
    bad = 0
    for row in rows:
        if not isinstance(row, dict) or not isinstance(row.get("path"), str):
            bad += 1
            continue
        rel = row["path"]
        path = root / rel
        if not path.is_file():
            errors.append(f"{label} target missing: {rel}")
            bad += 1
            continue
        if row.get("bytes") != path.stat().st_size:
            errors.append(f"{label} size mismatch: {rel}")
            bad += 1
        if row.get("sha256") != sha_file(path):
            errors.append(f"{label} hash mismatch: {rel}")
            bad += 1
    return len(rows), bad


def expect_fields(data: dict[str, Any], expected: dict[str, Any], label: str, errors: list[str]) -> None:
    for field, value in expected.items():
        if data.get(field) != value:
            errors.append(f"{label} mismatch: {field}; expected={value!r} actual={data.get(field)!r}")


def check_pass_audit(root: Path, rel: str, schema: str, errors: list[str]) -> dict[str, Any]:
    path = root / rel
    if not path.is_file():
        errors.append(f"missing audit: {rel}")
        return {}
    data = load_json(path)
    if data.get("schema") != schema:
        errors.append(f"audit schema mismatch: {rel}")
    if data.get("verdict") != "PASS":
        errors.append(f"audit did not pass: {rel}")
    return data


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[2])
    parser.add_argument("--profile", choices=("auto", "full", "review"), default="auto")
    parser.add_argument("--skip-review-manifest", action="store_true")
    args = parser.parse_args()
    root = args.root.resolve()
    profile = args.profile
    if profile == "auto":
        profile = "review" if root.name == "TSE-01-REVIEW-PACKET" or (root / "REVIEW_PACKET_MANIFEST.json").is_file() else "full"
    if args.skip_review_manifest and profile != "review":
        parser.error("--skip-review-manifest is valid only for review profile")

    errors: list[str] = []
    expected_name = "TSE-01" if profile == "full" else "TSE-01-REVIEW-PACKET"
    expected_entries = FULL_ROOT_ENTRIES if profile == "full" else ({"paper", "artifact"} if args.skip_review_manifest else REVIEW_ROOT_ENTRIES)
    if root.name != expected_name:
        errors.append(f"{profile} root directory must be named {expected_name}, found {root.name}")
    if not root.is_dir():
        errors.append("release root is not a directory")
        actual_root_entries: set[str] = set()
    else:
        actual_root_entries = {path.name for path in root.iterdir()}
        if actual_root_entries != expected_entries:
            errors.append(f"root entries mismatch: expected={sorted(expected_entries)} actual={sorted(actual_root_entries)}")

    regular_files: set[str] = set()
    inode_paths: dict[tuple[int, int], list[str]] = {}
    symlink_count = 0
    forbidden_text_count = 0
    for path in root.rglob("*") if root.is_dir() else []:
        rel = path.relative_to(root).as_posix()
        mode = path.lstat().st_mode
        if path.is_dir():
            if path.name in TRANSIENT_DIR_NAMES:
                errors.append(f"transient cache directory forbidden: {rel}")
            continue
        if stat.S_ISLNK(mode):
            symlink_count += 1
            errors.append(f"symbolic link forbidden: {rel}")
            continue
        if not stat.S_ISREG(mode):
            errors.append(f"non-regular filesystem object forbidden: {rel}")
            continue
        regular_files.add(rel)
        lower_name = path.name.lower()
        if any(fragment in lower_name for fragment in FORBIDDEN_NAME_FRAGMENTS):
            errors.append(f"private/transient filename forbidden: {rel}")
        if rel in TRANSIENT_FILE_PATHS or any(rel.endswith(suffix) for suffix in TRANSIENT_FILE_SUFFIXES):
            errors.append(f"transient build/cache file forbidden: {rel}")
        if path.suffix.lower() in NESTED_ARCHIVE_SUFFIXES:
            errors.append(f"nested archive forbidden: {rel}")
        key = (path.stat().st_dev, path.stat().st_ino)
        inode_paths.setdefault(key, []).append(rel)
        if (
            rel != "artifact/results/release_audit.json"
            and path.suffix.lower() in TEXT_SUFFIXES
            and path.stat().st_size <= 8_000_000
        ):
            text = path.read_text(encoding="utf-8", errors="replace").casefold()
            for needle in FORBIDDEN_TEXT:
                if needle in text:
                    forbidden_text_count += 1
                    errors.append(f"private or machine-specific text signature: {rel}")
    hardlink_groups = 0
    for paths in inode_paths.values():
        if len(paths) > 1:
            hardlink_groups += 1
            errors.append(f"hard-linked files forbidden: {sorted(paths)}")

    # Required executable entry points.
    for rel in ("artifact/run_all.sh", "paper/compile.sh"):
        path = root / rel
        if not path.is_file() or not os.access(path, os.X_OK):
            errors.append(f"required executable script missing permission: {rel}")

    # Release manifest.
    release_manifest_path = root / "artifact/release_manifest.json"
    release_manifest = load_json(release_manifest_path) if release_manifest_path.is_file() else {"files": []}
    if not release_manifest_path.is_file():
        errors.append("artifact/release_manifest.json missing")
    if release_manifest.get("schema") != "tse01.release-manifest.v2":
        errors.append("release manifest schema mismatch")
    release_count, release_bad = validate_hash_rows(
        root=root,
        rows=release_manifest.get("files", []),
        expected_paths=regular_files - BASE_MANIFEST_EXCLUSIONS,
        label="release manifest",
        errors=errors,
    )

    # Review packet manifest.
    review_count = 0
    review_bad = 0
    review_manifest_path = root / "REVIEW_PACKET_MANIFEST.json"
    if profile == "review" and not args.skip_review_manifest:
        if not review_manifest_path.is_file():
            errors.append("REVIEW_PACKET_MANIFEST.json missing")
        else:
            review_manifest = load_json(review_manifest_path)
            expect_fields(review_manifest, {
                "schema": "tse01.review-packet-manifest.v2",
                "root_name": "TSE-01-REVIEW-PACKET",
            }, "review packet manifest", errors)
            if set(review_manifest.get("excluded_paths", [])) != REVIEW_MANIFEST_EXCLUSIONS:
                errors.append("review packet manifest exclusion set mismatch")
            review_count, review_bad = validate_hash_rows(
                root=root,
                rows=review_manifest.get("files", []),
                expected_paths=regular_files - REVIEW_MANIFEST_EXCLUSIONS,
                label="review packet manifest",
                errors=errors,
            )

    # Results manifest and exact row taxonomy.
    results_manifest_path = root / "artifact/results_manifest.csv"
    result_rows: list[dict[str, str]] = []
    results_bad = 0
    if not results_manifest_path.is_file():
        errors.append("artifact/results_manifest.csv missing")
    else:
        result_rows = read_csv(results_manifest_path)
        ids = [row.get("result_id", "") for row in result_rows]
        if len(ids) != len(set(ids)):
            errors.append("results manifest contains duplicate result identifiers")
        type_counts = Counter(row.get("result_type", "") for row in result_rows)
        if type_counts["FINITE_EXHAUSTIVE_COMPILER_CELL"] != 576:
            errors.append("results manifest finite compiler-cell count mismatch")
        if type_counts["COMMIT_DERIVED_COMPILER_CELL"] != 112:
            errors.append("results manifest project compiler-cell count mismatch")
        if type_counts["UPSTREAM_VALIDATION_COMPILER_CELL"] != 32:
            errors.append("results manifest upstream-validation compiler-cell count mismatch")
        if type_counts["GATE_MODEL_AGGREGATE"] != 1 or type_counts["GATE_MODEL_INDEPENDENT_RECHECK"] != 1 or type_counts["GATE_MODEL_GRAPH_FIXTURES"] != 1:
            errors.append("results manifest gate-model aggregate count mismatch")
        if len(result_rows) != 750:
            errors.append(f"results manifest row count mismatch: {len(result_rows)}")
        for row in result_rows:
            for path_key, hash_key in (("raw_output", "raw_output_sha256"), ("derived_output", "derived_output_sha256")):
                rel = row.get(path_key, "")
                expected_hash = row.get(hash_key, "")
                if not rel or not expected_hash:
                    continue
                target = root / rel
                if not target.is_file():
                    errors.append(f"results manifest target missing: {row.get('result_id')} -> {rel}")
                    results_bad += 1
                elif sha_file(target) != expected_hash:
                    errors.append(f"results manifest hash mismatch: {row.get('result_id')} -> {rel}")
                    results_bad += 1

    # Retained finite-contract stdout is scientific evidence, not a paper
    # auxiliary.  Require the exact 576-file closed set before accepting the
    # delivery, independently of any prior experiment PASS.
    finite_output_rows = {
        row.get("raw_output", ""): row.get("raw_output_sha256", "")
        for row in result_rows
        if row.get("raw_output", "").startswith("artifact/results/raw/")
        and row.get("raw_output", "").endswith(".out")
    }
    finite_certificate_outputs: dict[str, str] = {}
    for cert_path in sorted((root / "artifact/certificates").glob("*/*.json")):
        cert = load_json(cert_path)
        for cell in cert.get("behavior", {}).get("toolchains", []):
            rel = cell.get("output_path", "")
            digest = cell.get("output_sha256", "")
            if isinstance(rel, str) and rel.startswith("artifact/results/raw/") and rel.endswith(".out"):
                if rel in finite_certificate_outputs and finite_certificate_outputs[rel] != digest:
                    errors.append(f"conflicting finite output certificate binding: {rel}")
                finite_certificate_outputs[rel] = digest
    actual_finite_outputs = {
        path.relative_to(root).as_posix(): path
        for path in sorted((root / "artifact/results/raw").rglob("*.out"))
        if path.is_file()
    }
    if len(finite_output_rows) != 576 or len(finite_certificate_outputs) != 576 or len(actual_finite_outputs) != 576:
        errors.append(
            "retained finite stdout count mismatch: "
            f"manifest={len(finite_output_rows)} certificates={len(finite_certificate_outputs)} files={len(actual_finite_outputs)}"
        )
    if finite_output_rows != finite_certificate_outputs:
        errors.append("retained finite stdout manifest/certificate binding mismatch")
    if set(actual_finite_outputs) != set(finite_output_rows):
        errors.append("retained finite stdout closed-set mismatch")
    for rel, expected in finite_output_rows.items():
        path = actual_finite_outputs.get(rel)
        if path is None:
            continue
        if path.stat().st_size != 65_536:
            errors.append(f"retained finite stdout size mismatch: {rel}")
        if sha_file(path) != expected:
            errors.append(f"retained finite stdout hash mismatch: {rel}")
    closure_path = root / "artifact/results/retained_output_closure.json"
    closure = load_json(closure_path) if closure_path.is_file() else {}
    expect_fields(closure, {
        "schema": "tse01.retained-output-closure.v1",
        "verification_kind": "delivery-integrity-check-not-experiment-rerun",
        "expected_count": 576,
        "verified_count": 576,
        "bytes_per_output": 65_536,
        "results_manifest_and_certificates_agree": True,
        "scientific_outputs_present": True,
        "experiment_rerun": False,
        "certificate_rewrite": False,
        "verdict": "PASS",
    }, "retained output closure", errors)
    if closure.get("errors") != []:
        errors.append("retained output closure contains errors")
    smoke_path = root / "artifact/results/entrypoint_path_smoke.json"
    smoke = load_json(smoke_path) if smoke_path.is_file() else {}
    expect_fields(smoke, {
        "schema": "tse01.entrypoint-smoke.v2",
        "clean_unrelated_path_executed": True,
        "flat_repository_path_with_spaces_executed": True,
        "artifact_and_paper_are_siblings": True,
        "paper_transient_is_exact_path": "paper/main.out",
        "scientific_out_not_globally_excluded": True,
        "verdict": "PASS",
    }, "entrypoint path smoke", errors)

    # Exhaustive three-valued gate-model evidence.
    gate_path = root / "artifact/gate-model/results/independent_recheck.json"
    gate = load_json(gate_path) if gate_path.is_file() else {}
    expect_fields(gate, {
        "schema": "tse01.gate-model.independent-recheck.v2",
        "verdict": "PASS",
        "all_valid": True,
        "three_valued_vectors_rechecked": 2_187,
        "boolean_completions_recounted": 16_384,
        "relation_subset_gates_rechecked": 128,
        "nonempty_failure_sets_rechecked": 127,
        "ancestry_graph_fixtures_rechecked": 6,
        "diamond_merge_shared_ancestor_rechecked": True,
        "global_seen_mutant_rejected": True,
        "aggregate_mutation_test_count": 5,
    }, "gate-model independent recheck", errors)
    if any(test.get("rejected") is not True for test in gate.get("aggregate_mutation_tests", [])):
        errors.append("gate-model mutation suite contains a non-rejection")
    gate_summary_path = root / "artifact/gate-model/results/summary.json"
    gate_summary = load_json(gate_summary_path) if gate_summary_path.is_file() else {}
    expect_fields(gate_summary, {
        "schema": "tse01.gate-model.summary.v2",
        "verdict": "PASS",
        "relation_count": 7,
        "three_valued_vector_count": 2_187,
        "boolean_completion_count": 16_384,
        "relation_subset_gate_count": 128,
        "nonempty_failure_set_count": 127,
        "isolating_control_count": 7,
        "unique_zero_false_accept_subset": True,
        "full_relation_basis_minimal_under_isolating_controls": True,
        "unique_maximally_decisive_sound_completion_stable_lift": True,
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
    }, "gate-model summary", errors)
    if gate_summary.get("decision_counts") != {"pass": 1, "hold": 127, "reject": 2059}:
        errors.append("gate-model decision partition mismatch")

    # Finite-domain independent evidence.
    finite_path = root / "artifact/results/independent_recheck.json"
    finite = load_json(finite_path) if finite_path.is_file() else {}
    expect_fields(finite, {
        "schema": "tracecert.independent-recheck.v12",
        "all_valid": True,
        "tamper_rejected": True,
        "semantic_tamper_tests_pass": True,
        "locked_environment_rechecked": True,
        "certificate_count": 144,
        "compiler_cells_rechecked": 576,
        "input_evaluations_rechecked": 37_748_736,
        "compiler_cells_recompiled": 576,
        "executables_reexecuted": 576,
        "input_evaluations_reexecuted": 37_748_736,
        "reference_tables_recomputed": 12,
        "provenance_mappings_recomputed": 144,
        "parent_decisions_independently_reconstructed": 144,
        "manifest_files_rehashed": 144,
        "manifest_canonical_forms_rehashed": 144,
        "executables_rehashed": 576,
        "assembly_files_rehashed_and_rescanned": 576,
        "semantic_tamper_test_count": 14,
        "refreshed_binding_test_count": 11,
        "direct_source_interpretation_test_count": 3,
        "policy_files_reconstructed": 12,
        "policy_bridge_fixture_pass": True,
        "hamming_edge_cases_pass": True,
        "availability_fixture_count": 5,
        "relation_decision_boundary_test_count": 4,
        "relation_decision_boundary_tests_pass": True,
        "multi_parent_releases_rechecked": 12,
        "pass_count": 108,
        "hold_count": 0,
        "reject_count": 36,
        "decision_fixtures_pass": True,
    }, "finite independent recheck", errors)
    finite_tamper_rows = finite.get("semantic_tamper_tests", [])
    if any(test.get("rejected") is not True for test in finite_tamper_rows):
        errors.append("finite semantic tamper suite contains a non-rejection")
    if sum(row.get("binding_mode") == "refreshed_certificate_or_file" and row.get("outer_self_hash_valid") is True for row in finite_tamper_rows) != 11:
        errors.append("finite refreshed-binding tamper inventory mismatch")
    if sum(row.get("binding_mode") == "direct_source_interpretation" and row.get("outer_self_hash_valid") is None for row in finite_tamper_rows) != 3:
        errors.append("finite direct-source tamper inventory mismatch")
    if not any(row.get("name") == "merge_second_parent_omission_with_fresh_hashes" and row.get("rejected") is True for row in finite_tamper_rows):
        errors.append("finite multi-parent omission probe missing or not rejected")
    integrity_binding_names = {
        "locked_toolchain_omission",
        "forged_assembly_hash_with_fresh_self_hash",
        "forged_binary_hash_with_fresh_self_hash",
        "forged_manifest_file_hash_with_fresh_self_hash",
    }
    integrity_binding_rows = {
        row.get("name"): row for row in finite_tamper_rows
        if row.get("name") in integrity_binding_names
    }
    if set(integrity_binding_rows) != integrity_binding_names:
        errors.append("finite integrity-binding regression inventory mismatch")
    for name in sorted(integrity_binding_names):
        row = integrity_binding_rows.get(name, {})
        if row.get("reconstructed_integrity") is not False or row.get("reconstructed_verdict") != "REJECT":
            errors.append(f"finite integrity-binding mutant bypasses typed integrity relation: {name}")

    finite_summary_path = root / "artifact/results/summary.json"
    finite_summary = load_json(finite_summary_path) if finite_summary_path.is_file() else {}
    expect_fields(finite_summary, {
        "schema": "tse01.finite-summary.v4",
        "policy_file_count": 12,
        "policy_bridge_fixture_count": 1,
        "kernel_count": 12,
        "variant_count": 12,
        "toolchain_count": 4,
        "rows": 576,
        "pass_count": 108,
        "hold_count": 0,
        "reject_count": 36,
        "multi_parent_release_count": 12,
        "parent_edge_count": 144,
    }, "finite summary", errors)
    if [row.get("decision") for row in finite_summary.get("decision_fixtures", [])] != ["PASS", "HOLD", "REJECT"]:
        errors.append("finite typed decision fixtures mismatch")
    if finite_summary.get("tamper_test", {}).get("rejected") is not True:
        errors.append("finite primary tamper test not rejected")
    for field, expected in LOCKED_ENVIRONMENT.items():
        if finite_summary.get("environment", {}).get(field) != expected:
            errors.append(f"finite locked environment mismatch: {field}")

    # Repair-specific finite-domain receipts are release-gated rather than
    # described only in prose.
    hamming_path = root / "artifact/results/hamming_edge_cases.json"
    hamming = load_json(hamming_path) if hamming_path.is_file() else {}
    expect_fields(hamming, {
        "schema": "tse01.hamming-edge-cases.v1",
        "candidate_codewords_enumerated_per_block": 16,
        "verdict": "PASS",
    }, "finite Hamming edge cases", errors)
    hamming_cases = {row.get("name"): row for row in hamming.get("cases", [])}
    if set(hamming_cases) != {
        "distributed_same_total_e1_s1",
        "concentrated_same_total_e1_s1",
        "two_erasures_one_transmitted_error_unique_wrong_payload",
    }:
        errors.append("finite Hamming edge-case inventory mismatch")
    else:
        distributed = hamming_cases["distributed_same_total_e1_s1"]
        concentrated = hamming_cases["concentrated_same_total_e1_s1"]
        wrong_payload = hamming_cases["two_erasures_one_transmitted_error_unique_wrong_payload"]
        if distributed.get("global_errors_relative_to_transmitted") != 1 or distributed.get("global_erasures") != 1 or distributed.get("recovery_pass") is not True:
            errors.append("distributed Hamming e=1,s=1 fixture mismatch")
        if concentrated.get("global_errors_relative_to_transmitted") != 1 or concentrated.get("global_erasures") != 1 or concentrated.get("explicit_tie") is not True or concentrated.get("recovery_pass") is not False:
            errors.append("concentrated Hamming e=1,s=1 fixture mismatch")
        if wrong_payload.get("unique_nearest_codeword") is not True or wrong_payload.get("decoded_nibble_hex") != "8" or wrong_payload.get("recovery_pass") is not False:
            errors.append("unique wrong-payload Hamming fixture mismatch")

    finite_boundary_path = root / "artifact/results/relation_decision_boundaries.json"
    finite_boundary = load_json(finite_boundary_path) if finite_boundary_path.is_file() else {}
    expect_fields(finite_boundary, {
        "schema": "tracecert.relation-decision-boundaries.v1",
        "verdict": "PASS",
        "expected_availability_decisions": ["HOLD", "HOLD", "HOLD", "REJECT", "REJECT"],
    }, "finite relation decision boundaries", errors)
    if [row.get("reconstructed_verdict", row.get("child_reconstructed_verdict")) for row in finite_boundary.get("relation_first_cases", [])] != ["REJECT"] * 4:
        errors.append("finite relation-first boundary decisions mismatch")
    if [row.get("verdict") for row in finite_boundary.get("availability_cases", [])] != ["HOLD", "HOLD", "HOLD", "REJECT", "REJECT"]:
        errors.append("finite availability boundary decisions mismatch")

    bridge_path = root / "artifact/policies/bridge/fnv_step-threshold-25-bridge.json"
    bridge = load_json(bridge_path) if bridge_path.is_file() else {}
    expect_fields(bridge, {
        "schema": "tracecert.policy-bridge.v1",
        "mode": "static-dual-policy-projection-from-reconstructed-evidence",
        "counted_as_release": False,
        "authorization": "explicit-static-dual-policy-projection",
        "from_decision": "PASS",
        "to_decision": "PASS",
    }, "static dual-policy projection", errors)
    witness = bridge.get("minimal_threshold_witness", {})
    if witness.get("preserved") != 25 or witness.get("from_decision") != "REJECT" or witness.get("to_decision") != "PASS":
        errors.append("static dual-policy minimal witness mismatch")

    # Source conformance is a syntax-and-issuance-key relation, not a
    # completeness predicate over all twenty-eight observable symbols.  The
    # tolerated loss/error controls must therefore retain S=true while R/T
    # receive symbol erasures and errors.  This guards the repaired formal
    # definition against a return to manifest-equality semantics.
    finite_certificate_root = root / "artifact/certificates"
    finite_kernels = sorted(path.name for path in finite_certificate_root.iterdir() if path.is_dir()) if finite_certificate_root.is_dir() else []
    if len(finite_kernels) != 12:
        errors.append(f"finite source-semantics kernel inventory mismatch: {len(finite_kernels)}")
    expected_source_boundaries = {
        "erase_tolerable": {
            "observed_count": 26, "erasure_count": 2, "symbol_error_count": 0,
            "source_pass": True, "recovery_pass": True, "continuity_pass": True,
            "verdict": "PASS",
        },
        "flip_tolerable": {
            "observed_count": 26, "erasure_count": 2, "symbol_error_count": 2,
            "source_pass": True, "recovery_pass": True, "continuity_pass": True,
            "verdict": "PASS",
        },
        "recovery_break": {
            "observed_count": 27, "erasure_count": 1, "symbol_error_count": 1,
            "source_pass": True, "recovery_pass": False, "continuity_pass": True,
            "verdict": "REJECT",
        },
    }
    for kernel in finite_kernels:
        policy_path = root / f"artifact/policies/finite/{kernel}.json"
        policy = load_json(policy_path) if policy_path.is_file() else {}
        source_profile = policy.get("source_profiles", {})
        if source_profile.get("inventory_rule") != "admitted-syntax-and-unique-issued-key-attribution":
            errors.append(f"finite source policy inventory rule mismatch: {kernel}")
        if source_profile.get("observation_scope") != "missing-or-flipped-issued-symbols-are-evaluated-by-recovery-and-continuity":
            errors.append(f"finite source policy observation scope mismatch: {kernel}")
        for variant, expected in expected_source_boundaries.items():
            cert_path = finite_certificate_root / kernel / f"{variant}.json"
            cert = load_json(cert_path) if cert_path.is_file() else {}
            source = cert.get("relations", {}).get("source_conformance", {})
            recovery = cert.get("relations", {}).get("recovery", {})
            continuity = cert.get("relations", {}).get("continuity", {})
            actual = {
                "observed_count": source.get("observed_count"),
                "erasure_count": source.get("erasure_count"),
                "symbol_error_count": source.get("symbol_error_count"),
                "source_pass": source.get("passed"),
                "recovery_pass": recovery.get("passed"),
                "continuity_pass": continuity.get("passed"),
                "verdict": cert.get("verdict"),
            }
            if actual != expected:
                errors.append(f"finite source/recovery/continuity boundary mismatch: {kernel}/{variant}: {actual}")
            if source.get("grammar_valid") is not True or source.get("issuance_keys_unique") is not True or source.get("occurrence_binding_valid") is not True:
                errors.append(f"finite admitted-source binding mismatch: {kernel}/{variant}")
            if source.get("symbol_loss_and_flip_scope") != "recovery-and-continuity":
                errors.append(f"finite symbol-loss scope mismatch: {kernel}/{variant}")

    # Public finite-variant summary must reflect reconstructed typed decisions,
    # not a legacy control label from the pre-REJECT implementation.
    variant_summary_path = root / "artifact/results/variant_summary.csv"
    variant_rows = read_csv(variant_summary_path) if variant_summary_path.is_file() else []
    expected_variant_order = [
        "baseline", "rename", "reorder", "extract", "dependency_upgrade", "format",
        "erase_tolerable", "merge_tolerable", "flip_tolerable", "recovery_break", "reseed", "behavior_drift",
    ]
    if [row.get("variant") for row in variant_rows] != expected_variant_order:
        errors.append("finite variant summary order or inventory mismatch")
    if [row.get("verdict_class") for row in variant_rows] != ["PASS"] * 9 + ["REJECT"] * 3:
        errors.append("finite variant summary typed verdicts mismatch")
    finite_variant_records = {row.get("variant"): row for row in finite_summary.get("variants", [])}
    for index, row in enumerate(variant_rows, start=1):
        name = row.get("variant")
        source = finite_variant_records.get(name)
        if source is None:
            continue
        try:
            expected_values = {
                "order": str(index),
                "behavior_rate": str(source["behavior_pass_kernels"] / 12),
                "payload_rate": str(source["payload_pass_kernels"] / 12),
                "traceability": str(source["median_traceability"]),
                "erasures": str(source["median_erasures"]),
                "errors": str(source["median_errors"]),
                "verdict_class": str(source["verdict_class"]),
            }
        except KeyError as exc:
            errors.append(f"finite variant record missing field: {name}: {exc}")
            continue
        for field, expected in expected_values.items():
            if row.get(field) != expected:
                errors.append(f"finite variant summary mismatch: {name}.{field}")

    # The compact public control table must agree with the reconstructed typed
    # verdicts.  Established violations are REJECT, never HOLD; the stale label
    # previously survived because this redundant table was outside the release
    # gate even though certificates and variant_summary.csv were correct.
    control_summary_path = root / "artifact/results/control_summary.csv"
    control_rows = read_csv(control_summary_path) if control_summary_path.is_file() else []
    expected_control_rows = [
        {
            "control": "recovery_break", "behavior": "PASS",
            "payload": "NOT_CERTIFIED", "traceability": "27/28",
            "certificate": "REJECT",
            "interpretation": "Behavior and accepted continuity do not imply recoverability.",
        },
        {
            "control": "reseed", "behavior": "PASS",
            "payload": "CERTIFIED_UNIQUE", "traceability": "0/28",
            "certificate": "REJECT",
            "interpretation": "Correct payload recovery does not prove release continuity.",
        },
        {
            "control": "behavior_drift", "behavior": "FAIL",
            "payload": "CERTIFIED_UNIQUE", "traceability": "28/28",
            "certificate": "REJECT",
            "interpretation": "Watermark continuity does not imply behavior preservation.",
        },
        {
            "control": "tampered_certificate", "behavior": "N/A",
            "payload": "N/A", "traceability": "N/A",
            "certificate": "REJECT",
            "interpretation": "Self-hash mismatch prevents silent certificate alteration.",
        },
    ]
    if control_rows != expected_control_rows:
        errors.append("finite public control summary typed verdicts or values mismatch")
    if any(row.get("certificate") in {"HOLD", "CONTROL_HOLD", "REJECTED"} for row in control_rows):
        errors.append("finite public control summary contains a legacy decision label")
    for row in control_rows[:3]:
        source = finite_variant_records.get(row.get("control"))
        if source is not None and row.get("certificate") != source.get("verdict_class"):
            errors.append(f"finite public control summary disagrees with reconstructed certificate: {row.get('control')}")
    if control_rows and not finite_summary.get("tamper_test", {}).get("rejected"):
        errors.append("finite public control summary claims tamper rejection without executed rejection")

    artifact_readme_path = root / "artifact/README.md"
    artifact_readme = artifact_readme_path.read_text(encoding="utf-8") if artifact_readme_path.is_file() else ""
    artifact_readme_normalized = re.sub(r"\s+", " ", artifact_readme).strip()
    stale_documentation_phrases = [
        "four aggregate mutations",
        "runs ten semantic substitutions",
        "rejects eight coherent substitutions",
        "43 diagnostic or adverse holds",
        "CONTROL_HOLD",
        "executed dual-policy bridge fixture",
        "dual-sum",
        "coupled sums",
        "byte-exact FNV",
    ]
    for phrase in stale_documentation_phrases:
        if phrase in artifact_readme_normalized:
            errors.append(f"stale public artifact decision documentation: {phrase}")
    required_documentation_phrases = [
        "five aggregate mutations",
        "rejects fourteen semantic substitutions",
        "rejects ten coherent substitutions",
        "zero unresolved holds",
        "43 diagnostic or adverse rejections",
        "twenty-four coherent substitutions",
    ]
    for phrase in required_documentation_phrases:
        if phrase not in artifact_readme_normalized:
            errors.append(f"public artifact README missing current decision accounting: {phrase}")

    # Deterministic retained-evidence surface. Wall-clock durations are host
    # diagnostics and may not enter canonical certificates, matrices, or
    # summaries. Otherwise two faithful replays can agree scientifically while
    # producing different predecessor hashes and review-visible bytes.
    forbidden_timing_keys = {
        "compile_seconds", "run_seconds", "execute_seconds",
        "median_compile_seconds", "median_execute_seconds",
        "median_compile_plus_run_seconds",
    }

    def find_forbidden_keys(value: Any, location: str) -> list[str]:
        findings: list[str] = []
        if isinstance(value, dict):
            for key, child in value.items():
                child_location = f"{location}.{key}" if location else str(key)
                if key in forbidden_timing_keys:
                    findings.append(child_location)
                findings.extend(find_forbidden_keys(child, child_location))
        elif isinstance(value, list):
            for index, child in enumerate(value):
                findings.extend(find_forbidden_keys(child, f"{location}[{index}]"))
        return findings

    finite_certificate_paths = sorted((root / "artifact/certificates").glob("*/*.json"))
    if len(finite_certificate_paths) != 144:
        errors.append(f"finite deterministic certificate inventory mismatch: {len(finite_certificate_paths)}")
    for certificate_path in finite_certificate_paths:
        findings = find_forbidden_keys(load_json(certificate_path), certificate_path.relative_to(root).as_posix())
        if findings:
            errors.append(f"non-deterministic timing retained in finite certificate: {findings[:4]}")

    finite_matrix_path = root / "artifact/results/matrix.csv"
    if finite_matrix_path.is_file():
        with finite_matrix_path.open(newline="", encoding="utf-8") as handle:
            header = next(csv.reader(handle), [])
        retained = sorted(set(header) & forbidden_timing_keys)
        if retained:
            errors.append(f"non-deterministic timing columns retained in finite matrix: {retained}")
    else:
        errors.append("finite matrix missing for deterministic-surface audit")
    retained = sorted(set(finite_summary) & forbidden_timing_keys)
    if retained:
        errors.append(f"non-deterministic timing fields retained in finite summary: {retained}")

    # Commit-derived independent evidence and sensitivity analysis.
    project_path = root / "artifact/commit-replay/results/independent_recheck.json"
    project = load_json(project_path) if project_path.is_file() else {}
    expect_fields(project, {
        "schema": "tse01.commit-replay.independent-recheck.v4",
        "verdict": "PASS",
        "all_valid": True,
        "semantic_tamper_tests_pass": True,
        "projects_rechecked": 7,
        "policy_files_reconstructed": 7,
        "certificates_rechecked": 28,
        "compiler_cells_recompiled": 112,
        "stored_executables_reexecuted": 112,
        "fresh_executables_reexecuted": 112,
        "assembly_files_rehashed": 112,
        "declared_case_evaluations_reexecuted": 3_215_120,
        "fresh_case_evaluations_reexecuted": 3_215_120,
        "pass_count": 21,
        "hold_count": 0,
        "reject_count": 7,
        "decision_fixtures_pass": True,
        "semantic_tamper_test_count": 10,
        "refreshed_binding_test_count": 10,
        "availability_test_count": 5,
        "availability_tests_pass": True,
        "relation_decision_boundary_test_count": 4,
        "relation_decision_boundary_tests_pass": True,
    }, "project independent recheck", errors)
    if any(test.get("rejected") is not True or test.get("outer_self_hash_valid") is not True for test in project.get("semantic_tamper_tests", [])):
        errors.append("project semantic tamper suite contains an invalid or non-rejected fixture")

    project_boundary_path = root / "artifact/commit-replay/results/relation_decision_boundaries.json"
    project_boundary = load_json(project_boundary_path) if project_boundary_path.is_file() else {}
    expect_fields(project_boundary, {
        "schema": "tse01.commit-replay.relation-decision-boundaries.v1",
        "verdict": "PASS",
        "availability_tests_pass": True,
        "boundary_tests_pass": True,
    }, "project relation decision boundaries", errors)
    if [row.get("decision") for row in project_boundary.get("availability_tests", [])] != ["HOLD", "HOLD", "HOLD", "REJECT", "REJECT"]:
        errors.append("project availability boundary decisions mismatch")
    boundary_rows = project_boundary.get("boundary_tests", [])
    boundary_decisions = [row.get("decision", row.get("child_decision")) for row in boundary_rows]
    if boundary_decisions != ["REJECT"] * 4 or any(row.get("passed") is not True for row in boundary_rows):
        errors.append("project relation-first boundary decisions mismatch")

    parser_path = root / "artifact/commit-replay/results/source_parser_security.json"
    parser_security = load_json(parser_path) if parser_path.is_file() else {}
    expect_fields(parser_security, {
        "schema": "tse01.commit-replay.source-parser-security.v1",
        "verdict": "PASS",
    }, "project source parser security", errors)
    parser_rows = parser_security.get("primary_and_independent_parser_tests", [])
    expected_parser_names = ["commented_all_carriers", "commented_fake_helper", "string_literal_decoy", "preprocessor_rebinding"]
    if [row.get("name") for row in parser_rows] != expected_parser_names:
        errors.append("project source parser micro-test inventory mismatch")
    if not all(row.get("primary_source_pass") == row.get("independent_source_pass") for row in parser_rows):
        errors.append("project source parser implementations disagree")
    replay = parser_security.get("controlled_refreshed_binding_replay", {})
    if replay.get("former_raw_parser_decision") != "PASS" or replay.get("lexical_parser_decision") != "REJECT" or replay.get("outer_self_hash_valid") is not True:
        errors.append("project controlled refreshed-binding parser replay mismatch")

    project_summary_path = root / "artifact/commit-replay/results/summary.json"
    project_summary = load_json(project_summary_path) if project_summary_path.is_file() else {}
    expect_fields(project_summary, {
        "schema": "tse01.commit-replay.summary.v3",
        "policy_file_count": 7,
        "verdict": "PASS",
        "project_count": 7,
        "version_count": 28,
        "compiler_cell_count": 112,
        "case_evaluations": 3_215_120,
        "intended_pass": 21,
        "adverse_reject": 7,
        "pass_count": 21,
        "hold_count": 0,
        "reject_count": 7,
    }, "project summary", errors)

    project_matrix_path = root / "artifact/commit-replay/results/matrix.json"
    project_matrix = load_json(project_matrix_path) if project_matrix_path.is_file() else []
    # Project D (Parson) declares byte-exact behavior over all sixty-five
    # retained cases.  Every compiler cell must therefore bind the actual
    # 2,145-byte output, not merely a non-injective 32-bit summary.
    parson_reference_path = root / "artifact/commit-replay/reference/project-D.bin"
    parson_reference = parson_reference_path.read_bytes() if parson_reference_path.is_file() else b""
    parson_rows = [row for row in project_matrix if row.get("project") == "D"] if isinstance(project_matrix, list) else []
    if len(parson_rows) != 16 or len(parson_reference) != 2145:
        errors.append(f"Parson byte-exact inventory mismatch: rows={len(parson_rows)}, reference_bytes={len(parson_reference)}")
    for row in parson_rows:
        output_rel = row.get("output")
        output_path = root / output_rel if isinstance(output_rel, str) else None
        if row.get("case_count") != 65:
            errors.append(f"Parson case-count mismatch: {row.get('version')}/{row.get('compiler')}/{row.get('optimization')}")
        if output_path is None or not output_path.is_file():
            errors.append(f"Parson output missing: {output_rel}")
            continue
        output_bytes = output_path.read_bytes()
        if len(output_bytes) != 2145 or output_bytes != parson_reference:
            errors.append(f"Parson byte-exact output mismatch: {output_rel}")
        output_digest = hashlib.sha256(output_bytes).hexdigest()
        if row.get("output_sha256") != output_digest or row.get("reference_sha256") != output_digest:
            errors.append(f"Parson byte-exact hash binding mismatch: {output_rel}")
        if row.get("behavior_match") is not True or row.get("reproduced_behavior_match") is not True or row.get("reproduced_output_matches_stored") is not True:
            errors.append(f"Parson byte-exact decision flags mismatch: {output_rel}")

    if not isinstance(project_matrix, list) or len(project_matrix) != 112:
        errors.append("project deterministic matrix inventory mismatch")
    else:
        findings = find_forbidden_keys(project_matrix, "artifact/commit-replay/results/matrix.json")
        if findings:
            errors.append(f"non-deterministic timing retained in project matrix: {findings[:8]}")
    retained = sorted(set(project_summary) & forbidden_timing_keys)
    if retained:
        errors.append(f"non-deterministic timing fields retained in project summary: {retained}")

    project_certificate_paths = sorted((root / "artifact/commit-replay/certificates").glob("*/*.json"))
    if len(project_certificate_paths) != 28:
        errors.append(f"project deterministic certificate inventory mismatch: {len(project_certificate_paths)}")
    for certificate_path in project_certificate_paths:
        findings = find_forbidden_keys(load_json(certificate_path), certificate_path.relative_to(root).as_posix())
        if findings:
            errors.append(f"non-deterministic timing retained in project certificate: {findings[:4]}")

    project_assembly_paths = sorted((root / "artifact/commit-replay/build").glob("*/*/*/adapter.s"))
    if len(project_assembly_paths) != 112:
        errors.append(f"project assembly inventory mismatch for deterministic-path audit: {len(project_assembly_paths)}")
    absolute_header = re.compile(r"(?m)^(?:/|[A-Za-z]:[\\/]).*:\s+file format\s+")
    for assembly_path in project_assembly_paths:
        assembly_text = assembly_path.read_text(encoding="utf-8", errors="replace")
        if absolute_header.search(assembly_text) or str(root) in assembly_text:
            errors.append(f"absolute extraction path retained in project disassembly: {assembly_path.relative_to(root)}")
    baseline_expected = {
        "stored_bindings_only": 7,
        "behavior_only": 6,
        "recovery_only": 6,
        "continuity_only": 6,
        "source_conformance_only": 6,
        "executable_reproduction_only": 6,
        "integrity_only": 6,
        "lineage_only": 6,
        "complete_gate": 0,
    }
    baseline_actual = {row.get("gate"): row.get("false_accepts") for row in project_summary.get("baseline_results", [])}
    if baseline_actual != baseline_expected:
        errors.append(f"project baseline results mismatch: {baseline_actual}")
    subset_rows = project_summary.get("relation_subset_results", [])
    if len(subset_rows) != 128 or {row.get("mask") for row in subset_rows} != set(range(128)):
        errors.append("project relation-subset sweep is incomplete")
    else:
        zero_false = [row for row in subset_rows if row.get("false_accepts") == 0]
        if len(zero_false) != 1 or zero_false[0].get("mask") != 127:
            errors.append("full relation set is not the unique zero-false-accept subset")
    ablation_expected = {
        "behavior": "C", "recovery": "D", "continuity": "B",
        "source_conformance": "A", "executable_reproduction": "E",
        "integrity": "F", "lineage": "G",
    }
    ablation_actual: dict[str, str] = {}
    for row in project_summary.get("ablation_results", []):
        accepted = row.get("accepted_projects", [])
        if row.get("false_accepts") == 1 and len(accepted) == 1:
            ablation_actual[str(row.get("removed_relation"))] = str(accepted[0])
    if ablation_actual != ablation_expected:
        errors.append(f"project ablation results mismatch: {ablation_actual}")
    thresholds = project_summary.get("threshold_results", [])
    if len(thresholds) != 29 or [row.get("threshold") for row in thresholds] != list(range(29)):
        errors.append("project threshold sweep is incomplete")
    else:
        if thresholds[0].get("continuity_control_false_accept") != 1:
            errors.append("threshold zero control result mismatch")
        for row in thresholds[1:27]:
            if row.get("intended_pass") != 21 or row.get("continuity_control_false_accept") != 0:
                errors.append(f"threshold plateau mismatch at {row.get('threshold')}")
        for row in thresholds[27:29]:
            if row.get("intended_pass") != 14 or row.get("continuity_control_false_accept") != 0:
                errors.append(f"high-threshold result mismatch at {row.get('threshold')}")
    loo = project_summary.get("leave_one_project_out", [])
    if len(loo) != 7 or {row.get("held_out") for row in loo} != set("ABCDEFG"):
        errors.append("leave-one-project-out set mismatch")
    for row in loo:
        if (row.get("intended_pass"), row.get("intended_total"), row.get("adverse_reject"), row.get("adverse_total"), row.get("false_accepts")) != (18, 18, 6, 6, 0):
            errors.append(f"leave-one-project-out result mismatch for {row.get('held_out')}")

    publication_path = root / "artifact/commit-replay/results/publication_protocol_test.json"
    publication = load_json(publication_path) if publication_path.is_file() else {}
    expect_fields(publication, {
        "schema": "tse01.executable-publication-test.v1",
        "verdict": "PASS",
        "atomic_publish_operations": 16,
        "concurrent_execution_attempts": 192,
        "observed_partial_or_invalid_outputs": 0,
        "transient_busy_retry_pass": True,
        "permanent_busy_failure_pass": True,
        "non_busy_error_propagation_pass": True,
        "primary_and_independent_paths_tested": True,
    }, "executable publication protocol", errors)

    # Combined scientific accounting.
    combined_path = root / "artifact/results/combined_summary.json"
    combined = load_json(combined_path) if combined_path.is_file() else {}
    expect_fields(combined, {"schema": "tse01.combined-summary.v4", "verdict": "PASS"}, "combined summary", errors)
    expect_fields(combined.get("combined", {}), {
        "release_count": 172,
        "compiler_cells": 688,
        "executed_contract_cases": 40_963_856,
        "pass_count": 129,
        "hold_count": 0,
        "reject_count": 43,
        "semantic_tamper_tests": 24,
    }, "combined counts", errors)
    expect_fields(combined.get("gate_model_layer", {}), {
        "three_valued_vectors": 2_187,
        "boolean_completions": 16_384,
        "relation_subset_gates": 128,
        "nonempty_failure_sets": 127,
        "aggregate_mutation_tests": 5,
        "ancestry_graph_fixtures": 6,
        "diamond_merge_shared_ancestor_accepts": True,
        "invalid_ancestry_fixtures_rejected": 4,
        "decision_counts": {"pass": 1, "hold": 127, "reject": 2059},
        "independent_recheck": True,
    }, "combined gate-model layer", errors)
    expect_fields(combined.get("upstream_source_validation", {}), {
        "repository": "zserge/jsmn",
        "exact_source_blob_count": 3,
        "compiler_cells": 32,
        "case_evaluations": 768,
        "adapter_compiler_cells_compared": 8,
        "adapter_cases_per_cell": 16,
        "adapter_outputs_equal": True,
        "default_and_parent_link_configs_equal": True,
        "strict_changed_case_ids": [22, 23],
        "independent_recheck": True,
    }, "combined upstream validation layer", errors)
    expect_fields(combined.get("total_execution_burden", {}), {
        "compiler_cells": 720,
        "case_evaluations": 40_964_624,
        "release_certificates": 172,
    }, "total execution burden", errors)
    upstream_summary_path = root / "artifact/upstream-validation/results/summary.json"
    upstream_summary = load_json(upstream_summary_path) if upstream_summary_path.is_file() else {}
    expect_fields(upstream_summary, {
        "schema": "tse01.upstream-validation-summary",
        "repository": "zserge/jsmn",
        "exact_source_blob_count": 3,
        "exact_source_blobs_match": True,
        "compiler_cell_count": 32,
        "case_count_per_cell": 24,
        "case_evaluation_count": 768,
        "cross_compiler_and_optimization_stable": True,
        "default_and_parent_link_configs_equal": True,
        "strict_changed_case_ids": [22, 23],
        "strict_changed_case_count": 2,
        "adapter_before_after_compiler_cells": 8,
        "adapter_case_count_per_cell": 16,
        "adapter_before_after_outputs_equal": True,
        "verdict": "PASS",
    }, "upstream source validation", errors)
    upstream_recheck_path = root / "artifact/upstream-validation/results/independent_recheck.json"
    upstream_recheck = load_json(upstream_recheck_path) if upstream_recheck_path.is_file() else {}
    expect_fields(upstream_recheck, {
        "schema": "tse01.upstream-validation-independent-recheck",
        "compiler_cells_rebuilt": 32,
        "case_evaluations_reexecuted": 768,
        "strict_changed_case_ids": [22, 23],
        "cross_compiler_and_optimization_stable": True,
        "default_and_parent_link_configs_equal": True,
        "errors": [],
        "verdict": "PASS",
    }, "upstream source independent recheck", errors)
    source_manifest_path = root / "artifact/upstream-validation/source_manifest.json"
    source_manifest = load_json(source_manifest_path) if source_manifest_path.is_file() else {}
    expect_fields(source_manifest, {
        "schema": "tse01.upstream-source-manifest",
        "repository": "zserge/jsmn",
        "commit": "fdcef3ebf886fa210d14956d3c068a653e76a24e",
        "parent": "18e9fe42cbfe21d65076f5c77ae2be379ad1270f",
        "license": "MIT",
    }, "upstream source manifest", errors)
    if len(source_manifest.get("source_files", [])) != 3 or not all(row.get("match") for row in source_manifest.get("source_files", [])):
        errors.append("upstream exact source manifest is incomplete or contains a blob mismatch")

    # Paper, reference, lexical, and visual audits.
    compile_audit = check_pass_audit(root, "paper/compile_audit.json", "tse01.compile-audit.v2", errors)
    template_audit = check_pass_audit(root, "paper/submission_template_audit.json", "tse01.submission-template-audit.v1", errors)
    typography_audit = check_pass_audit(root, "paper/typography_audit.json", "tse01.typography-audit.v1", errors)
    citation_audit = check_pass_audit(root, "paper/citation_shape_audit.json", "tse01.citation-shape-audit.v2", errors)
    consistency_audit = check_pass_audit(root, "paper/manuscript_consistency_audit.json", "tse01.manuscript-consistency-audit.v1", errors)
    lexical_audit = check_pass_audit(root, "paper/lexical_audit.json", "tse01.lexical-audit.v5", errors)
    author_audit = check_pass_audit(root, "paper/author_metadata_audit.json", "tse01.author-metadata-audit", errors)
    page_fit = check_pass_audit(root, "paper/page_fit_audit.json", "tse01.page-fit-audit.v2", errors)
    reference_audit = check_pass_audit(root, "paper/reference_lock_audit.json", "tse01.reference-lock-audit.v1", errors)
    visual_audit = check_pass_audit(root, "paper/visual_inspection.json", "tse01.visual-inspection.v1", errors)

    paper_pdf = root / "paper/main.pdf"
    paper_tex = root / "paper/main.tex"
    references_tex = root / "paper/references.tex"
    if not paper_pdf.is_file() or not paper_tex.is_file() or not references_tex.is_file():
        errors.append("paper source, PDF, or bibliography missing")
        paper_hash = None
    else:
        paper_hash = sha_file(paper_pdf)
        if pdf_pages(paper_pdf) != 14:
            errors.append("formatted manuscript is not exactly 14 pages")
        if (
            compile_audit.get("pdf_sha256") != paper_hash
            or template_audit.get("pdf_sha256") != paper_hash
            or typography_audit.get("pdf_sha256") != paper_hash
            or page_fit.get("pdf_sha256") != paper_hash
            or lexical_audit.get("pdf_sha256") != paper_hash
            or author_audit.get("pdf_sha256") != paper_hash
            or visual_audit.get("pdf_sha256") != paper_hash
        ):
            errors.append("paper audit hashes do not all bind the current PDF")
        if author_audit.get("main_tex_sha256") != sha_file(paper_tex):
            errors.append("author metadata audit does not bind the current source")
        if template_audit.get("manuscript_sha256") != sha_file(paper_tex):
            errors.append("submission-template audit does not bind the current source")
        if consistency_audit.get("manuscript_sha256") != sha_file(paper_tex):
            errors.append("manuscript consistency audit does not bind the current source")
        expect_fields(consistency_audit, {
            "relation_count": 7,
            "top_level_section_sequence": [
                "Introduction",
                "From Watermark Detection to Release Assurance",
                "Lifecycle-Assurance Model",
                "Implementation and Study Design",
                "Results",
                "Engineering Implications and Validity",
                "Conclusion",
            ],
            "abstract_within_official_100_200_word_range": True,
            "mechanical_phrase_hits": [],
            "finite_multi_parent_release_count": 12,
            "finite_parent_edge_count": 144,
            "project_parent_mode": "singleton",
            "floats_flushed_before_conclusion": True,
            "novelty_calibration_present": True,
            "named_engineering_baselines_present": {
                "behavior plus recovery falsely accepts five controls": True,
                "recovery plus integrity and lineage": True,
                "behavior plus executable reproduction and integrity": True,
            },
            "combined_counts": {
                "release_count": 172,
                "compiler_cells": 688,
                "executed_contract_cases": 40_963_856,
                "pass_count": 129,
                "hold_count": 0,
                "reject_count": 43,
                "semantic_tamper_tests": 24,
            },
            "stale_parent_scope_phrases_found": [],
            "errors": [],
        }, "manuscript consistency audit", errors)
        expected_relation_terms = {
            "behavior", "recovery", "continuity", "source conformance",
            "executable reproduction", "integrity", "lineage",
        }
        if set(consistency_audit.get("abstract_relation_terms_present", [])) != expected_relation_terms:
            errors.append("abstract does not enumerate the seven-relation basis")
        if set(consistency_audit.get("conclusion_relation_terms_present", [])) != expected_relation_terms:
            errors.append("conclusion does not enumerate the seven-relation basis")
        if not all(consistency_audit.get("parent_scope_statements", {}).values()):
            errors.append("manuscript parent-set scope statements are incomplete")
        if not all(consistency_audit.get("combined_count_strings_present", {}).values()):
            errors.append("manuscript does not expose all current combined evidence counts")
        expect_fields(compile_audit, {
            "pages": 14,
            "overfull_boxes": 0,
            "unresolved_references_or_controls": 0,
            "all_fonts_embedded": True,
        }, "compile audit", errors)
        expect_fields(template_audit, {
            "venue": "IEEE Transactions on Software Engineering",
            "article_type": "Regular research article",
            "manuscript_stage": "initial peer-review submission",
            "documentclass": "IEEEtran",
            "documentclass_options": ["letterpaper", "journal"],
            "supplied_class_sha256": "c972aca108fda004c3514d63658e02816da2e54d9a1451e870b9bd970e003f55",
            "current_class_sha256": "c972aca108fda004c3514d63658e02816da2e54d9a1451e870b9bd970e003f55",
            "supplied_bibliography_style_sha256": "fca86cd4f041a5c5326295fa04dcce56eaf2c8a4bf3219549401235502f24c25",
            "current_bibliography_style_sha256": "fca86cd4f041a5c5326295fa04dcce56eaf2c8a4bf3219549401235502f24c25",
            "template_files_unmodified": True,
            "page_size_points": [612.0, 792.0],
            "us_letter": True,
            "journal_double_column_mode": True,
            "single_anonymous_author_surface": True,
            "authors_visible": True,
            "corresponding_author_in_first_footnote": True,
            "funding_status_in_first_footnote": True,
            "affiliation_groups": 3,
            "corresponding_author_email_present": True,
            "abstract_within_100_200_words": True,
            "abstract_has_citations_or_math": False,
            "keyword_count": 5,
            "production_only_elements_present": {
                "running_head": False,
                "publication_id": False,
                "publisher_issue_metadata": False,
                "author_biographies": False,
                "inline_appendix": False,
            },
            "received_revised_accepted_dates_authored": False,
            "author_biographies_present": False,
            "biographies_required_for_initial_submission": False,
            "template_is_author_submission_format_not_ieee_final_layout": True,
            "ieee_production_staff_formats_published_version": True,
            "official_mopc_threshold_pages": 12,
            "official_initial_submission_hard_cap_verified": False,
            "project_internal_total_page_contract": 14,
            "submission_policy_status": "SUBMISSION_POLICY_HOLD",
            "errors": [],
        }, "submission template audit", errors)
        expect_fields(typography_audit, {
            "math_package": "newtxmath",
            "math_package_version": "1.754",
            "text_family": "Times-compatible IEEEtran serif",
            "legacy_computer_modern_math_fonts": [],
            "sans_serif_math_occurrences": 0,
            "word_form_accept_operator_occurrences": 0,
            "release_gate_notation": r"\mathcal{A}",
            "all_fonts_embedded": True,
            "predicate_definitions_present": {
                "behavior": True,
                "recovery": True,
                "continuity": True,
                "source": True,
                "executable": True,
                "integrity": True,
                "lineage": True,
                "release_gate": True,
            },
            "errors": [],
        }, "typography audit", errors)
        if not typography_audit.get("times_compatible_math_fonts"):
            errors.append("typography audit reports no Times-compatible mathematics fonts")
        if typography_audit.get("manuscript_sha256") != sha_file(paper_tex):
            errors.append("typography audit does not bind the current manuscript source")
        font_instances = compile_audit.get("font_instances")
        embedded_instances = compile_audit.get("embedded_font_instances")
        if not isinstance(font_instances, int) or font_instances <= 0 or embedded_instances != font_instances:
            errors.append("current PDF font inventory is empty or not fully embedded")
        expect_fields(page_fit, {
            "LIMIT_KIND": "TOTAL_PAGES",
            "project_contract_total_pages": 14,
            "total_pages": 14,
            "inline_scientific_appendix": False,
            "separate_supplement_used": False,
            "manual_visual_inspection_current": True,
        }, "page fit", errors)
        if page_fit.get("page14_column_baseline_difference_pixels", 10**9) > page_fit.get("ordinary_line_tolerance_pixels", 25):
            errors.append("page 14 does not end within one ordinary line across columns")
        expect_fields(citation_audit, {
            "citation_command_count": 79,
            "unique_citation_key_count": 79,
            "bibliography_entry_count": 79,
            "single_key_commands": True,
            "each_reference_used_exactly_once": True,
            "bibliography_order_matches_first_appearance": True,
            "adjacent_piles": 0,
            "multi_citation_sentences": 0,
            "numeric_ranges": 0,
            "frozen_reference_floor": 78,
            "reference_floor_satisfied": True,
        }, "citation audit", errors)
        expected_authors = ["Haoyi Zhang", "Huaijin Ran", "Xunzhu Tang"]
        expect_fields(lexical_audit, {
            "planned_author_count": 6,
            "named_author_count": 3,
            "reserved_author_slots": [4, 5, 6],
            "author_order": expected_authors,
            "all_author_names_present": True,
            "author_placeholders_found": [],
            "affiliation_count": 3,
            "affiliations_present": {"xjtlu": True, "ntu": True, "uni_lu": True},
            "all_affiliations_present": True,
            "corresponding_author_present": True,
            "public_subject_names_present": {
                "jsmn": True, "cJSON": True, "rxi logging library": True,
                "Parson": True, "zlib": True, "inih": True, "uthash": True,
            },
            "all_public_subject_names_present": True,
            "author_metadata_audit_verdict": "PASS",
            "findings": [],
        }, "lexical audit", errors)
        expect_fields(author_audit, {
            "schema": "tse01.author-metadata-audit",
            "planned_author_count": 6,
            "named_author_count": 3,
            "reserved_author_slots": [4, 5, 6],
            "author_order": expected_authors,
            "pdf_metadata_author": "Haoyi Zhang; Huaijin Ran; Xunzhu Tang",
            "affiliation_count": 3,
            "affiliations_present": {"xjtlu": True, "ntu": True, "uni_lu": True},
            "all_affiliations_present": True,
            "corresponding_author": "Huaijin Ran",
            "corresponding_author_present": True,
            "funding_statement_present": True,
            "missing_named_author_orcids": ["Xunzhu Tang"],
            "submission_metadata_complete": False,
            "placeholder_tokens": [],
            "errors": [],
        }, "author metadata audit", errors)
        author_lock_path = root / "paper/author_metadata_lock.json"
        if not author_lock_path.is_file():
            errors.append("author metadata lock missing")
        else:
            author_lock = load_json(author_lock_path)
            expect_fields(author_lock, {
                "schema": "tse01.author-metadata-lock",
                "planned_author_count": 6,
                "named_author_count": 3,
                "reserved_author_slots": [4, 5, 6],
                "author_order_status": "PARTIAL_BY_DESIGN",
                "corresponding_author": "Huaijin Ran",
            }, "author metadata lock", errors)
            expected_orcids = {
                "Haoyi Zhang": "0009-0009-3693-786X",
                "Huaijin Ran": "0009-0009-2482-2344",
                "Xunzhu Tang": None,
            }
            actual_orcids = {row.get("name"): row.get("orcid") for row in author_lock.get("authors", [])}
            if actual_orcids != expected_orcids:
                errors.append(f"author ORCID lock mismatch: {actual_orcids}")
            expected_affiliations = {
                "xjtlu": {"institution": "Xi'an Jiaotong-Liverpool University", "city": "Suzhou", "postal_code": "215123", "country": "China", "author_names": ["Haoyi Zhang"]},
                "ntu": {"institution": "Nanyang Technological University", "city": "Singapore", "postal_code": "639798", "country": "Singapore", "author_names": ["Huaijin Ran"]},
                "uni_lu": {"institution": "University of Luxembourg", "city": "Luxembourg", "postal_code": "L-1359", "country": "Luxembourg", "author_names": ["Xunzhu Tang"]},
            }
            actual_affiliations = {
                row.get("id"): {key: row.get(key) for key in ("institution", "city", "postal_code", "country", "author_names")}
                for row in author_lock.get("affiliations", [])
            }
            if actual_affiliations != expected_affiliations:
                errors.append(f"author affiliation lock mismatch: {actual_affiliations}")
            expected_emails = {
                "Haoyi Zhang": "hyeliozhang@gmail.com",
                "Huaijin Ran": "huaijin003@e.ntu.edu.sg",
                "Xunzhu Tang": "realdanieltang@gmail.com",
            }
            actual_emails = {row.get("name"): row.get("primary_email") for row in author_lock.get("authors", [])}
            if actual_emails != expected_emails:
                errors.append(f"author primary-email lock mismatch: {actual_emails}")
            if author_audit.get("lock_sha256") != sha_file(author_lock_path):
                errors.append("author metadata audit does not bind the current lock")
        if visual_audit.get("pages_checked") != list(range(1, 15)) or visual_audit.get("findings") != []:
            errors.append("visual inspection does not cover all pages without findings")
        tex = paper_tex.read_text(encoding="utf-8")
        refs = references_tex.read_text(encoding="utf-8")
        class_lines = re.findall(r"^\\documentclass(?:\[[^]]*\])?\{IEEEtran\}$", tex, flags=re.MULTILINE)
        if class_lines != [r"\documentclass[letterpaper,journal]{IEEEtran}"]:
            errors.append("manuscript does not use the supplied initial journal submission class line")
        if r"\IEEEtriggeratref" in tex:
            errors.append("manual reference-number column trigger forbidden")
        if sha_file(root / "paper/IEEEtran.cls") != "c972aca108fda004c3514d63658e02816da2e54d9a1451e870b9bd970e003f55":
            errors.append("supplied IEEEtran class bytes changed")
        if sha_file(root / "paper/IEEEtranS.bst") != "fca86cd4f041a5c5326295fa04dcce56eaf2c8a4bf3219549401235502f24c25":
            errors.append("supplied IEEE bibliography style bytes changed")
        if re.search(r"\\appendix|\\section\*?\{Appendix", tex, re.IGNORECASE):
            errors.append("inline scientific appendix forbidden")
        if re.search(r"\\includegraphics|\\resizebox|\\scalebox|\\enlargethispage|\\vspace\s*\{\s*-", tex):
            errors.append("unsafe figure or page-fit manipulation found in manuscript")
        if re.search(r"https?://|\\url\{|\\href\{", refs):
            errors.append("web or repository locator found in bibliography")
        if len(re.findall(r"\\begin\{tikzpicture\}", tex)) != 4:
            errors.append("expected three LaTeX-native figures implemented by four TikZ pictures")
        if len(re.findall(r"\\begin\{figure\*?\}", tex)) != 3:
            errors.append("expected exactly three figure environments")
        if len(re.findall(r"\\begin\{table\*?\}", tex)) != 10:
            errors.append("expected exactly ten table environments")
        if (root / "paper/references.bib").exists():
            errors.append("stale references.bib forbidden")
        if any(path.name.lower().startswith("supplement") for path in (root / "paper").glob("*")):
            errors.append("separate manuscript supplement unexpectedly present")

    # Reference calibration and frozen sentence bindings.
    target_path = root / "paper/reference_target_lock.json"
    lock_path = root / "paper/reference_verification_lock.json"
    target = load_json(target_path) if target_path.is_file() else {}
    lock = load_json(lock_path) if lock_path.is_file() else {}
    expect_fields(target, {
        "sample_size": 12,
        "median_reference_count": 77.5,
        "p75_reference_count_linear": 104.25,
        "frozen_reference_floor": 78,
        "current_reference_count": 79,
        "current_citation_count": 79,
    }, "reference target lock", errors)
    if target.get("counts_sorted") != [29, 55, 60, 62, 69, 76, 79, 81, 103, 108, 112, 113]:
        errors.append("reference calibration count vector mismatch")
    expect_fields(lock, {
        "schema": "tse01.reference-verification-lock.v2",
        "reference_count": 79,
    }, "reference verification lock", errors)
    records = lock.get("records", [])
    if len(records) != 79:
        errors.append("reference verification record count mismatch")
    for row in records:
        if row.get("verification_status") != "MANUALLY_VERIFIED_EXACT_METADATA_AND_LOCAL_SUPPORT":
            errors.append(f"unverified reference record: {row.get('key')}")
        identifier = str(row.get("scholarly_identifier", ""))
        locator = str(row.get("source_locator", ""))
        if not (identifier.startswith("DBLP:") or identifier.startswith("DOI:") or identifier.startswith("10.")):
            errors.append(f"nonpersistent scholarly identifier: {row.get('key')}")
        if not (locator.startswith("https://dblp.org/rec/") or locator.startswith("https://doi.org/")):
            errors.append(f"non-scholarly source locator: {row.get('key')}")
    if reference_audit.get("reference_count") != 79 or reference_audit.get("citation_command_count") != 79:
        errors.append("reference lock audit counts mismatch")

    # Record-by-record metadata and local-support review.
    audit_table_path = root / "paper/reference_audit.csv"
    fresh_rows = read_csv(audit_table_path) if audit_table_path.is_file() else []
    if len(fresh_rows) != 79:
        errors.append("reference audit row count mismatch")
    expected_keys = lock.get("citation_order", [])
    if [row.get("citation_key") for row in fresh_rows] != expected_keys:
        errors.append("reference audit order differs from manuscript citation order")
    if [row.get("ordinal") for row in fresh_rows] != [str(i) for i in range(1, 80)]:
        errors.append("reference audit ordinals are incomplete or unordered")
    for row in fresh_rows:
        key = row.get("citation_key")
        if row.get("metadata_verdict") != "PASS" or row.get("local_support_verdict") != "PASS":
            errors.append(f"reference audit did not pass: {key}")
        if row.get("checked_date") != "2026-09-24":
            errors.append(f"reference audit date mismatch: {key}")
        locator = str(row.get("source_locator", ""))
        identifier = str(row.get("scholarly_identifier", ""))
        if not (locator.startswith("https://dblp.org/rec/") or locator.startswith("https://doi.org/")):
            errors.append(f"reference audit uses a non-scholarly locator: {key}")
        if not (identifier.startswith("DBLP:") or identifier.startswith("DOI:") or identifier.startswith("10.")):
            errors.append(f"reference audit uses a nonpersistent identifier: {key}")
    if lock.get("verification_date") != "2026-09-24" or lock.get("verification_verdict") != "PASS":
        errors.append("reference verification lock lacks the current audit binding")
    second_path = root / "paper/reference_audit.json"
    second = load_json(second_path) if second_path.is_file() else {}
    expect_fields(second, {
        "schema": "tse01.reference-audit",
        "checked_date": "2026-09-24",
        "reference_count": 79,
        "metadata_pass_count": 79,
        "local_support_pass_count": 79,
        "unresolved_metadata_discrepancies": 0,
        "unresolved_support_discrepancies": 0,
        "verdict": "PASS",
    }, "reference audit audit", errors)
    if second.get("support_scope_reviewed_count") != 79:
        errors.append("reference audit support-scope count mismatch")
    if second.get("bibliography_sha256") != sha_file(root / "paper/references.tex"):
        errors.append("reference audit bibliography binding mismatch")
    if second.get("manuscript_sha256") != sha_file(root / "paper/main.tex"):
        errors.append("reference audit manuscript binding mismatch")
    if second.get("reference_lock_sha256") != sha_file(root / "paper/reference_verification_lock.json"):
        errors.append("reference audit lock binding mismatch")
    if second.get("audit_csv_sha256") != sha_file(root / "paper/reference_audit.csv"):
        errors.append("reference audit CSV binding mismatch")
    cross_path = root / "paper/reference_crosscheck.json"
    cross = load_json(cross_path) if cross_path.is_file() else {}
    expect_fields(cross, {
        "schema": "tse01.reference-crosscheck",
        "checked_date": "2026-09-24",
        "reference_count": 79,
        "unique_keys": 79,
        "unique_titles": 79,
        "unique_identifiers": 79,
        "unique_locators": 79,
        "verdict": "PASS",
    }, "reference crosscheck", errors)
    if cross.get("errors") != [] or len(cross.get("rows", [])) != 79:
        errors.append("reference crosscheck contains failures or incomplete rows")
    if cross.get("lock_sha256") != sha_file(root / "paper/reference_verification_lock.json"):
        errors.append("reference crosscheck lock binding mismatch")
    if cross.get("bibliography_sha256") != sha_file(root / "paper/references.tex"):
        errors.append("reference crosscheck bibliography binding mismatch")
    if cross.get("manuscript_sha256") != sha_file(root / "paper/main.tex"):
        errors.append("reference crosscheck manuscript binding mismatch")
    for row in records:
        fresh = row.get("verification", {})
        if fresh.get("date") != "2026-09-24" or fresh.get("metadata_verdict") != "PASS" or fresh.get("local_support_verdict") != "PASS":
            errors.append(f"reference record lacks a passing verification: {row.get('key')}")

    # Public ledgers and local execution gaps.
    ledger_expectations = {
        "artifact/citation_support.csv": 79,
        "artifact/claim_evidence_ledger.csv": 10,
        "artifact/correctness_correspondence.csv": 15,
        "artifact/external_resources.csv": 11,
    }
    for rel, count in ledger_expectations.items():
        path = root / rel
        if not path.is_file():
            errors.append(f"missing ledger: {rel}")
        elif len(read_csv(path)) != count:
            errors.append(f"ledger row count mismatch: {rel}")
    gaps_path = root / "artifact/local_execution_gaps.json"
    gaps = load_json(gaps_path) if gaps_path.is_file() else {}
    if gaps.get("schema") != "tse01.local-execution-gaps.v1":
        errors.append("local execution gaps schema mismatch")
    if gaps.get("delegated_tasks") != []:
        errors.append("unexpected delegated task remains")
    for item in gaps.get("objectively_unavailable", []):
        if not item.get("attempts") or not item.get("observed_blocker") or item.get("delegation") != "none":
            errors.append("local execution gap lacks concrete attempts or has an improper delegation")

    audit = {
        "schema": "tse01.release-audit.v3",
        "profile": profile,
        "root_name": root.name,
        "root_entries": sorted(actual_root_entries),
        "regular_file_count": len(regular_files),
        "release_manifest_entries": release_count,
        "release_manifest_sha256": sha_file(release_manifest_path) if release_manifest_path.is_file() else None,
        "release_manifest_bad_entries": release_bad,
        "review_manifest_entries": review_count,
        "review_manifest_bad_entries": review_bad,
        "review_manifest_check_skipped": bool(args.skip_review_manifest),
        "results_manifest_rows": len(result_rows),
        "results_manifest_bad_references": results_bad,
        "gate_vectors_rechecked": gate.get("three_valued_vectors_rechecked"),
        "finite_certificates_rechecked": finite.get("certificate_count"),
        "project_certificates_rechecked": project.get("certificates_rechecked"),
        "combined_release_count": combined.get("combined", {}).get("release_count"),
        "combined_compiler_cells": combined.get("combined", {}).get("compiler_cells"),
        "combined_contract_cases": combined.get("combined", {}).get("executed_contract_cases"),
        "paper_pdf_sha256": paper_hash,
        "paper_pages": compile_audit.get("pages"),
        "reference_count": citation_audit.get("bibliography_entry_count"),
        "symlink_count": symlink_count,
        "hardlink_group_count": hardlink_groups,
        "forbidden_text_finding_count": forbidden_text_count,
        "errors": errors,
        "verdict": "PASS" if not errors else "FAIL",
    }
    out = root / "artifact/results/release_audit.json"
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(audit, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({key: audit[key] for key in (
        "verdict", "profile", "regular_file_count", "release_manifest_entries",
        "release_manifest_bad_entries", "review_manifest_entries", "review_manifest_bad_entries",
        "results_manifest_rows", "results_manifest_bad_references", "combined_release_count",
        "combined_compiler_cells", "combined_contract_cases", "paper_pages", "reference_count",
    )}, indent=2, sort_keys=True))
    if errors:
        for error in errors[:100]:
            print(f"ERROR: {error}")
        if len(errors) > 100:
            print(f"ERROR: ... {len(errors) - 100} additional errors")
    return 0 if not errors else 1


if __name__ == "__main__":
    raise SystemExit(main())
