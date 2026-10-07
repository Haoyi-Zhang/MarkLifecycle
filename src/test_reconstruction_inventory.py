#!/usr/bin/env python3
"""Owned in-memory reconstruction boundaries; no subjects or compilers run."""
from __future__ import annotations

from contextlib import ExitStack, nullcontext, redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import subprocess
import sys
import unittest
from unittest.mock import patch

import independent_recheck as checker


RELATIONS = ("behavior", "recovery", "continuity", "source_conformance",
             "executable_reproduction", "integrity", "lineage")


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(",", ":"),
                                     ensure_ascii=True).encode("ascii")).hexdigest()


def inventory_case(module, missing):
    root = Path("owned-inventory").resolve()
    environment = {"gcc": "owned-gcc", "clang": "owned-clang"}
    policy = module.expected_finite_policy("fnv_step", environment)
    policy_path = "artifact/policies/finite/fnv_step.json"
    source = "artifact/benchmark/generated/fnv_step/baseline/kernel.c"
    manifest = "artifact/benchmark/generated/fnv_step/baseline/watermark_manifest.json"
    reference = "artifact/benchmark/reference/fnv_step.bin"
    files = {root / policy_path: json.dumps(policy).encode("ascii"),
             root / source: b"owned source", root / manifest: b"{}",
             root / reference: b"owned reference"}
    for name in missing:
        files.pop(root / {"source": source, "manifest": manifest,
                          "reference": reference}[name])
    cert = {"schema": "tracecert.release.v5", "kernel": "fnv_step",
            "variant": "baseline", "parent_variants": [], "parent_variant": None,
            "policy": {"path": policy_path, "policy_id": policy["policy_id"],
                       "canonical_sha256": digest(policy),
                       "file_sha256": hashlib.sha256(files[root / policy_path]).hexdigest()},
            "source": {"path": source}, "manifest": {"path": manifest},
            "behavior": {"reference_table_path": reference}}
    cert["certificate_sha256"] = digest(cert)
    sink = {"stale": True}
    with ExitStack() as stack:
        stack.enter_context(patch.object(Path, "is_file", lambda path: path in files))
        stack.enter_context(patch.object(Path, "read_text", lambda path, **kw: files[path].decode("ascii")))
        stack.enter_context(patch.object(Path, "open", lambda path, *a, **kw: io.BytesIO(files[path])))
        forbidden = stack.enter_context(patch.object(module.subprocess, "run", side_effect=AssertionError("process forbidden")))
        errors = module.validate_certificate(root, cert, {}, {}, {}, environment,
                                             replay_root=root / "replay",
                                             reconstruction_sink=sink)
        forbidden.assert_not_called()
    return errors, sink


def missing_entrypoint_case(module, missing):
    root = Path("owned-entrypoint").resolve()
    cert_path = root / "artifact/certificates/fnv_step/baseline.json"
    manifest_path = root / "artifact/benchmark/generated/fnv_step/baseline/watermark_manifest.json"
    files = {root / "artifact/environment.json": "{}",
             cert_path: "{}", manifest_path: "{}"}
    for name in missing:
        files.pop({"certificate": cert_path, "manifest": manifest_path}[name])
    written = {}
    class Sequential:
        def map(self, function, values):
            return map(function, values)
    with ExitStack() as stack:
        stack.enter_context(patch.object(module, "KERNELS", ("fnv_step",)))
        stack.enter_context(patch.object(module, "VARIANT_PARENTS", {"baseline": ()}))
        stack.enter_context(patch.object(sys, "argv", ["checker", "--root", str(root)]))
        stack.enter_context(patch.object(Path, "is_file", lambda path: path in files))
        stack.enter_context(patch.object(Path, "glob", lambda path, pattern: [cert_path] if cert_path in files else []))
        stack.enter_context(patch.object(Path, "read_text", lambda path, **kw: files[path]))
        stack.enter_context(patch.object(Path, "write_text", lambda path, text, **kw: written.update({path: text})))
        stack.enter_context(patch.object(module.tempfile, "TemporaryDirectory", lambda **kw: nullcontext(str(root / "replay"))))
        stack.enter_context(patch.object(module.concurrent.futures, "ThreadPoolExecutor", lambda **kw: nullcontext(Sequential())))
        stack.enter_context(patch.object(module, "validate_locked_environment", return_value=[]))
        stack.enter_context(patch.object(module, "reference_table", return_value=b"owned"))
        validator = stack.enter_context(patch.object(module, "validate_certificate", side_effect=AssertionError("must not reconstruct missing record")))
        stack.enter_context(patch.object(module, "run_semantic_tamper_tests", return_value=[]))
        stack.enter_context(patch.object(module, "run_relation_decision_boundary_tests", return_value={"verdict": "PASS", "relation_first_cases": [], "availability_cases": []}))
        stack.enter_context(patch.object(module, "verify_hamming_edge_cases", return_value=[]))
        stack.enter_context(patch.object(module, "validate_policy_bridge", return_value=[]))
        process = stack.enter_context(patch.object(module.subprocess, "run", side_effect=AssertionError("process forbidden")))
        with redirect_stdout(io.StringIO()):
            status = module.main()
        validator.assert_not_called()
        process.assert_not_called()
    return status, json.loads(written[root / "artifact/results/independent_recheck.json"])


class ReconstructionInventoryTests(unittest.TestCase):
    def test_closed_inventory_is_reject_not_hold_in_file_order(self):
        for mask in range(1, 8):
            missing = {name for bit, name in enumerate(("source", "manifest", "reference")) if mask & (1 << bit)}
            reason = next(name for name in ("source", "manifest", "reference") if name in missing) + " file missing"
            with self.subTest(missing=missing):
                errors, sink = inventory_case(checker, missing)
                self.assertEqual(errors, [reason])
                expected = {name: {"passed": False if name == "integrity" else None,
                                   "state": "ESTABLISHED_FALSE" if name == "integrity" else "UNRESOLVED",
                                   "reason": reason} for name in RELATIONS}
                self.assertEqual(sink, {"errors": [reason], "relations": expected,
                                        "verdict": "REJECT", "valid": False})

    def test_unknown_subject_closes_before_any_file_or_process(self):
        for cert, reason in (({"kernel": "owned-unknown"}, "unknown kernel"),
                             ({"kernel": "fnv_step", "variant": "owned-unknown"}, "unknown variant")):
            cert["schema"] = "tracecert.release.v5"
            sink = {}
            with patch.object(Path, "is_file", side_effect=AssertionError("file forbidden")), patch.object(checker.subprocess, "run", side_effect=AssertionError("process forbidden")):
                self.assertEqual(checker.validate_certificate(Path("owned"), cert, {}, {}, {}, {},
                                                              replay_root=Path("owned-replay"), reconstruction_sink=sink), [reason])
            self.assertEqual(list(sink["relations"]), list(RELATIONS))
            self.assertEqual(sink["relations"]["integrity"]["passed"], False)
            self.assertEqual((sink["verdict"], sink["valid"]), ("REJECT", False))

    def test_missing_entrypoint_record_is_invalid_without_verdict(self):
        for missing in ({"certificate"}, {"manifest"}, {"certificate", "manifest"}):
            status, receipt = missing_entrypoint_case(checker, missing)
            self.assertEqual(status, 1)
            self.assertFalse(receipt["all_valid"])
            self.assertEqual(receipt["findings"], [{"kernel": "fnv_step", "variant": "baseline",
                             "valid": False, "verdict": None, "errors": ["certificate or manifest missing"]}])
            self.assertEqual([receipt[name] for name in ("pass_count", "hold_count", "reject_count")], [0, 0, 0])
            self.assertEqual(bool(receipt["structural_errors"]), "certificate" in missing)

    def test_environment_read_errors_propagate_without_synthetic_hold(self):
        for error in (FileNotFoundError("owned environment absent"), json.JSONDecodeError("owned invalid JSON", "!", 0)):
            with patch("sys.argv", ["checker", "--root", "owned"]), patch.object(Path, "read_text", side_effect=error), patch.object(checker.subprocess, "run", side_effect=AssertionError("process forbidden")):
                with self.assertRaises(type(error)):
                    checker.main()

    def test_unavailable_compiler_preflight_returns_ordered_errors(self):
        environment = {"system": checker.LOCKED_SYSTEM, "machine": checker.LOCKED_MACHINE,
                       **checker.LOCKED_COMPILER_VERSIONS}
        for error in (OSError("owned unavailable"), subprocess.SubprocessError("owned unavailable")):
            with patch.object(checker.platform, "system", return_value=checker.LOCKED_SYSTEM), patch.object(checker.platform, "machine", return_value=checker.LOCKED_MACHINE), patch.object(checker.subprocess, "run", side_effect=error) as process:
                errors = checker.validate_locked_environment(environment)
            self.assertEqual(errors, ["cannot query locked compiler gcc: owned unavailable",
                                      "cannot query locked compiler clang: owned unavailable"])
            self.assertEqual([call.args[0] for call in process.call_args_list], [["gcc", "--version"], ["clang", "--version"]])


if __name__ == "__main__":
    unittest.main()
