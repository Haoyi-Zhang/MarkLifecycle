#!/usr/bin/env python3
"""Adversarial source-parser and refreshed-binding regression tests.

The tests exercise both separately implemented project source parsers.  One
controlled copy also recompiles and executes after all carrier calls have been
commented out, refreshes every outer binding represented in the test
certificate, and demonstrates the decision difference between the former raw
text matcher and the current lexical parser.
"""
from __future__ import annotations

import argparse
import copy
import hashlib
import importlib.util
import json
import re
import subprocess
import tempfile
from pathlib import Path
from typing import Any


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical_hash(value: Any) -> str:
    return sha_bytes(json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode("ascii"))


def raw_observation(source: str, manifest: dict[str, Any]) -> list[int | None]:
    pattern = re.compile(r"wm_state\s*=\s*wm_(add|xor)_v[12]\s*\(\s*wm_state\s*,\s*0x([0-9a-fA-F]{8})u\s*\)\s*;")
    issued = {int(row["constant"]): int(row["position"]) for row in manifest["carriers"]}
    observed: list[int | None] = [None] * 28
    for match in pattern.finditer(source):
        constant = int(match.group(2), 16)
        if constant in issued and observed[issued[constant]] is None:
            observed[issued[constant]] = 0 if match.group(1) == "add" else 1
    return observed


def comment_all_carrier_calls(source: str, pattern: re.Pattern[str]) -> str:
    return pattern.sub(lambda match: f"/* {match.group(0)} */", source)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    args = parser.parse_args()
    root = args.root.resolve()
    layer = root / "artifact/commit-replay"
    primary = load_module("tse01_project_primary_parser", layer / "src/run_commit_replay.py")
    independent = load_module("tse01_project_independent_parser", layer / "src/independent_recheck.py")

    source_path = layer / "sources/A/after.c"
    parent_path = layer / "sources/A/before.c"
    manifest_path = layer / "manifests/A/after.json"
    parent_manifest_path = layer / "manifests/A/before.json"
    cert_path = layer / "certificates/A/after.json"
    reference_path = layer / "reference/project-A.bin"
    for path in (source_path, parent_path, manifest_path, parent_manifest_path, cert_path, reference_path):
        if not path.is_file():
            raise SystemExit(f"required generated input missing: {path}")
    source = source_path.read_text(encoding="utf-8")
    parent_source = parent_path.read_text(encoding="utf-8")
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    parent_manifest = json.loads(parent_manifest_path.read_text(encoding="utf-8"))
    cert = json.loads(cert_path.read_text(encoding="utf-8"))
    reference = reference_path.read_bytes()

    def inspect_all(text: str) -> tuple[dict[str, Any], dict[str, Any]]:
        return primary.analyze_project_source(text, manifest), independent.inspect_source(text, manifest)

    baseline_primary, baseline_independent = inspect_all(source)
    if not baseline_primary["passed"] or not baseline_independent["passed"]:
        raise AssertionError("baseline source does not pass both parsers")
    if baseline_primary["observed"] != baseline_independent["observed"]:
        raise AssertionError("baseline parser observations disagree")

    commented = comment_all_carrier_calls(source, primary.PROJECT_CARRIER_CALL)
    comment_primary, comment_independent = inspect_all(commented)
    comment_recovery = independent.decode_payload(comment_independent["observed"])
    parent_ids = independent.visible_ids(parent_source, parent_manifest)
    comment_ids = {
        manifest["carriers"][i]["carrier_id"]
        for i, value in enumerate(comment_independent["observed"]) if value is not None
    }
    comment_preserved = len(parent_ids & comment_ids)
    comment_verdict = independent.typed_decision([
        True,
        comment_recovery["status"] == "CERTIFIED_UNIQUE" and comment_recovery["payload_hex"] == manifest["payload_hex"],
        comment_preserved >= independent.TRACE_THRESHOLD,
        bool(comment_independent["passed"]),
        True, True, True,
    ])

    expected_helper = "static __attribute__((noinline)) uint32_t wm_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }"
    corrupt_helper = "static __attribute__((noinline)) uint32_t wm_add_v2(uint32_t v, uint32_t k) { return (v + k) - k; }"
    helper_decoy = source.replace(expected_helper, corrupt_helper, 1) + f"\n/* {expected_helper} */\n"
    helper_primary, helper_independent = inspect_all(helper_decoy)

    first = next(primary.PROJECT_CARRIER_CALL.finditer(source))
    decoy = first.group(0).replace("0x", "0xdeadbeef"[:2])
    # A valid string literal containing a syntactically complete carrier call.
    escaped = first.group(0).replace("\\", "\\\\").replace('"', '\\"')
    string_decoy = source + f'\nstatic const char *const parser_decoy = "{escaped}";\n'
    string_primary, string_independent = inspect_all(string_decoy)

    rebinding = source.replace("#include <stdlib.h>", "#include <stdlib.h>\n#define wm_add_v2 wm_xor_v2", 1)
    rebinding_primary, rebinding_independent = inspect_all(rebinding)

    # Controlled end-to-end replay.  All carrier calls are now comments; the
    # compiled program still satisfies the bounded routine contract because the
    # watermark statements are semantics-preserving identity operations.
    with tempfile.TemporaryDirectory(prefix="tse01-parser-security-") as tmp:
        tmp_root = Path(tmp)
        attack_source = tmp_root / "attack.c"
        attack_binary = tmp_root / "attack"
        attack_output = tmp_root / "attack.out"
        attack_source.write_text(commented, encoding="utf-8")
        compile_cmd = ["gcc", *primary.COMPILE_FLAGS, "-O0", str(attack_source), "-o", str(attack_binary)]
        compiled = subprocess.run(compile_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        if compiled.returncode != 0:
            raise AssertionError(f"controlled source did not compile: {compiled.stderr}")
        executed = subprocess.run([str(attack_binary)], stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=30)
        attack_output.write_bytes(executed.stdout)
        if executed.returncode != 0 or executed.stderr != b"" or executed.stdout != reference:
            raise AssertionError("controlled copy no longer satisfies the bounded behavior contract")

        attack_cert = copy.deepcopy(cert)
        source_digest = sha_bytes(attack_source.read_bytes())
        binary_digest = sha_bytes(attack_binary.read_bytes())
        output_digest = sha_bytes(attack_output.read_bytes())
        attack_cert["source"] = "controlled/attack.c"
        attack_cert["source_sha256"] = source_digest
        for cell in attack_cert["compiler_cells"]:
            cell["source_sha256"] = source_digest
            cell["executable"] = "controlled/attack"
            cell["executable_sha256"] = binary_digest
            cell["output"] = "controlled/attack.out"
            cell["output_sha256"] = output_digest
        attack_cert["verdict"] = "PASS"
        attack_cert.pop("certificate_sha256", None)
        attack_cert["certificate_sha256"] = canonical_hash(attack_cert)

        old_observed = raw_observation(commented, manifest)
        old_recovery = independent.decode_payload(old_observed)
        old_ids = {
            manifest["carriers"][i]["carrier_id"]
            for i, value in enumerate(old_observed) if value is not None
        }
        old_preserved = len(parent_ids & old_ids)
        old_vector = [
            True,
            old_recovery["status"] == "CERTIFIED_UNIQUE" and old_recovery["payload_hex"] == manifest["payload_hex"],
            old_preserved >= independent.TRACE_THRESHOLD,
            True,
            True,
            True,
            True,
        ]
        new_vector = [
            True,
            comment_recovery["status"] == "CERTIFIED_UNIQUE" and comment_recovery["payload_hex"] == manifest["payload_hex"],
            comment_preserved >= independent.TRACE_THRESHOLD,
            bool(comment_independent["passed"]),
            True,
            True,
            True,
        ]
        end_to_end = {
            "compile_returncode": compiled.returncode,
            "execution_returncode": executed.returncode,
            "behavior_matches_reference": executed.stdout == reference,
            "outer_self_hash_valid": independent.certificate_self_hash_valid(attack_cert),
            "refreshed_source_sha256": source_digest,
            "refreshed_executable_sha256": binary_digest,
            "refreshed_output_sha256": output_digest,
            "former_raw_parser_observed_count": sum(value is not None for value in old_observed),
            "former_raw_parser_decision": independent.typed_decision(old_vector),
            "lexical_parser_observed_count": comment_independent["observed_count"],
            "lexical_parser_recovery": comment_recovery["status"],
            "lexical_parser_continuity_preserved": comment_preserved,
            "lexical_parser_decision": independent.typed_decision(new_vector),
        }

    tests = [
        {
            "name": "commented_all_carriers",
            "primary_source_pass": comment_primary["passed"],
            "independent_source_pass": comment_independent["passed"],
            "observed_count": comment_independent["observed_count"],
            "recovery_status": comment_recovery["status"],
            "continuity_preserved": comment_preserved,
            "decision": comment_verdict,
            "expected": {"source_pass": True, "observed_count": 0, "decision": "REJECT"},
        },
        {
            "name": "commented_fake_helper",
            "primary_source_pass": helper_primary["passed"],
            "independent_source_pass": helper_independent["passed"],
            "expected_source_pass": False,
        },
        {
            "name": "string_literal_decoy",
            "primary_source_pass": string_primary["passed"],
            "independent_source_pass": string_independent["passed"],
            "observations_equal_baseline": string_independent["observed"] == baseline_independent["observed"],
            "expected_source_pass": True,
        },
        {
            "name": "preprocessor_rebinding",
            "primary_source_pass": rebinding_primary["passed"],
            "independent_source_pass": rebinding_independent["passed"],
            "expected_source_pass": False,
        },
    ]
    passed = (
        tests[0]["primary_source_pass"] is True
        and tests[0]["independent_source_pass"] is True
        and tests[0]["observed_count"] == 0
        and tests[0]["decision"] == "REJECT"
        and tests[1]["primary_source_pass"] is False
        and tests[1]["independent_source_pass"] is False
        and tests[2]["primary_source_pass"] is True
        and tests[2]["independent_source_pass"] is True
        and tests[2]["observations_equal_baseline"] is True
        and tests[3]["primary_source_pass"] is False
        and tests[3]["independent_source_pass"] is False
        and end_to_end["outer_self_hash_valid"] is True
        and end_to_end["former_raw_parser_decision"] == "PASS"
        and end_to_end["lexical_parser_decision"] == "REJECT"
    )
    report = {
        "schema": "tse01.commit-replay.source-parser-security.v1",
        "scope": "controlled-copy regression; not an additional public project or release-count increment",
        "primary_and_independent_parser_tests": tests,
        "controlled_refreshed_binding_replay": end_to_end,
        "verdict": "PASS" if passed else "FAIL",
    }
    out = layer / "results/source_parser_security.json"
    out.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0 if passed else 1


if __name__ == "__main__":
    raise SystemExit(main())
