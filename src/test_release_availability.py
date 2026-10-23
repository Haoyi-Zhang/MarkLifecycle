"""Owned release-path controls; compiler/executable doubles are explicit."""
import contextlib
import copy
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

import check_release
import independent_recheck as checker

ARTIFACT = Path(__file__).resolve().parents[1]


class ReleaseAvailabilityTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        # A single real retained history, not a synthetic relation vector.
        names = list(checker.VARIANT_PARENTS)
        paths = ["environment.json", "policies/finite/fnv_step.json",
                 "benchmark/reference/fnv_step.bin"]
        for name in names:
            paths += [f"certificates/fnv_step/{name}.json",
                      f"benchmark/generated/fnv_step/{name}/kernel.c",
                      f"benchmark/generated/fnv_step/{name}/watermark_manifest.json"]
            for compiler, optimization in checker.EXPECTED_TOOLCHAINS:
                tag = f"{compiler}_{optimization[1:].lower()}"
                paths += [f"results/raw/fnv_step/{name}/{tag}{suffix}"
                          for suffix in ("", ".out", ".s")]
        for relative in paths:
            target = self.root / "artifact" / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(ARTIFACT / relative, target)

    def check(self, variant="baseline"):
        return check_release.check_release(self.root, "fnv_step", variant)

    def test_unavailable_compilers_preserve_static_checks_and_hold(self):
        with patch.object(checker, "command_version", side_effect=FileNotFoundError()), patch.object(checker.platform, "system", return_value="Linux"), patch.object(checker.platform, "machine", return_value="x86_64"), patch.object(checker.subprocess, "run", side_effect=AssertionError("no compiler or subject may run")):
            report = self.check()
        self.assertEqual((report["verdict"], report["valid"], report["errors"]), ("HOLD", True, []))
        self.assertIsNone(report["relations"]["behavior"]["passed"])
        self.assertIsNone(report["relations"]["executable_reproduction"]["passed"])
        self.assertTrue(report["relations"]["integrity"]["passed"])
        self.assertEqual(len(report["unavailable"]), 4)

    def test_parent_hold_propagates_through_actual_two_parent_history(self):
        with patch.object(checker.platform, "system", return_value="owned-unavailable-host"):
            report = self.check("merge_tolerable")
        self.assertEqual((report["verdict"], report["valid"]), ("HOLD", True))
        self.assertIsNone(report["relations"]["lineage"]["passed"])
        self.assertTrue(report["relations"]["continuity"]["passed"])
        self.assertEqual(len(report["parents"]), 7)
        self.assertTrue(all(value["verdict"] == "HOLD" for value in report["parents"].values()))

    def test_known_recovery_and_continuity_failure_dominate_unknown_compilers(self):
        for variant, relation in (("recovery_break", "recovery"), ("reseed", "continuity")):
            with self.subTest(variant=variant), patch.object(checker.platform, "system", return_value="owned-unavailable-host"):
                report = self.check(variant)
            self.assertEqual(report["verdict"], "REJECT")
            self.assertIs(report["relations"][relation]["passed"], False)
            self.assertIsNone(report["relations"]["behavior"]["passed"])

    def test_closed_missing_source_stays_reject(self):
        (self.root / "artifact/benchmark/generated/fnv_step/baseline/kernel.c").unlink()
        report = self.check()
        self.assertEqual(report["verdict"], "REJECT")
        self.assertFalse(report["relations"]["integrity"]["passed"])

    def test_missing_parent_record_and_malformed_environment_reject(self):
        path = self.root / "artifact/certificates/fnv_step/baseline.json"
        original = path.read_bytes()
        path.unlink()
        self.assertEqual(self.check("rename")["verdict"], "REJECT")
        path.write_bytes(original)
        (self.root / "artifact/environment.json").write_text("[]", encoding="utf-8")
        self.assertEqual(self.check()["verdict"], "REJECT")

    def test_retained_binary_corruption_is_not_hidden_by_unavailability(self):
        (self.root / "artifact/results/raw/fnv_step/baseline/gcc_o0").write_bytes(b"owned corruption")
        with patch.object(checker.platform, "system", return_value="owned-unavailable-host"):
            report = self.check()
        self.assertEqual(report["verdict"], "REJECT")
        self.assertFalse(report["relations"]["integrity"]["passed"])

    def test_rebound_schema_and_verdict_corruption_still_reject(self):
        path = self.root / "artifact/certificates/fnv_step/baseline.json"
        original = json.loads(path.read_text(encoding="utf-8"))
        for field, value in (("schema", "unknown"), ("verdict", "HOLD")):
            cert = copy.deepcopy(original)
            cert[field] = value
            path.write_text(json.dumps(checker.add_self_hash(cert)), encoding="utf-8")
            with self.subTest(field=field), patch.object(checker.platform, "system", return_value="owned-unavailable-host"):
                report = self.check()
            self.assertEqual(report["verdict"], "REJECT")
            self.assertFalse(report["relations"]["integrity"]["passed"])

    def test_current_parent_reject_is_never_weakened_to_hold(self):
        original = checker.validate_certificate
        def validate(*args, **kwargs):
            result = original(*args, **kwargs)
            if args[1]["variant"] == "baseline":
                # Explicit current-parent counterexample fixture.
                kwargs["reconstruction_sink"].update(verdict="REJECT", valid=True)
            return result
        with patch.object(checker, "validate_certificate", side_effect=validate), patch.object(checker.platform, "system", return_value="owned-unavailable-host"):
            report = self.check("rename")
        self.assertEqual(report["verdict"], "REJECT")
        self.assertIs(report["relations"]["lineage"]["passed"], False)

    @contextlib.contextmanager
    def restored_process_doubles(self, *, compile_status=0, timeout=False):
        # Return the retained compiler realization and output deliberately;
        # these unit controls do not claim an actual C build or execution.
        def run(command, **kwargs):
            if timeout:
                raise subprocess.TimeoutExpired(command, 1)
            if command[0] in checker.LOCKED_COMPILER_VERSIONS:
                if compile_status:
                    return subprocess.CompletedProcess(command, compile_status, b"", b"owned build failure")
                output = Path(command[-1])
                variant = Path(command[-3]).parent.name
                shutil.copyfile(self.root / f"artifact/results/raw/fnv_step/{variant}/{output.name}", output)
                return subprocess.CompletedProcess(command, 0, b"", b"")
            binary = Path(command[0])
            raw = self.root / f"artifact/results/raw/fnv_step/{binary.parent.parent.name}/{binary.name}.out"
            return subprocess.CompletedProcess(command, 0, raw.read_bytes(), b"")
        with patch.object(checker.platform, "system", return_value="Linux"), patch.object(checker.platform, "machine", return_value="x86_64"), patch.object(checker, "command_version", side_effect=lambda name: checker.LOCKED_COMPILER_VERSIONS[name]), patch.object(checker.subprocess, "run", side_effect=run):
            yield

    def test_retry_after_restoration_refines_hold_to_pass_with_doubles(self):
        with patch.object(checker.platform, "system", return_value="owned-unavailable-host"):
            before = self.check("rename")
        with self.restored_process_doubles():
            after = self.check("rename")
        self.assertEqual((before["verdict"], after["verdict"], after["valid"]), ("HOLD", "PASS", True))
        self.assertEqual(after["errors"], [])

    def test_completed_build_failure_rejects_but_timeout_holds(self):
        with self.restored_process_doubles(compile_status=1):
            failed = self.check()
        with self.restored_process_doubles(timeout=True):
            timed_out = self.check()
        self.assertEqual((failed["verdict"], timed_out["verdict"]), ("REJECT", "HOLD"))
        self.assertIs(failed["relations"]["executable_reproduction"]["passed"], False)

    def test_cli_reports_hold_and_reject_without_mutating_inputs(self):
        before = {p.relative_to(self.root): p.read_bytes() for p in self.root.rglob("*") if p.is_file()}
        env = {**os.environ, "PATH": "", "PYTHONDONTWRITEBYTECODE": "1"}
        command = [sys.executable, "-B", str(ARTIFACT / "src/check_release.py"),
                   "--root", str(self.root), "--kernel", "fnv_step", "--variant", "baseline"]
        process = subprocess.run(command, env=env, capture_output=True, text=True, timeout=15)
        self.assertEqual(process.returncode, 2, process.stderr)
        self.assertEqual(json.loads(process.stdout)["verdict"], "HOLD")
        self.assertEqual(before, {p.relative_to(self.root): p.read_bytes() for p in self.root.rglob("*") if p.is_file()})
        (self.root / "artifact/benchmark/reference/fnv_step.bin").unlink()
        process = subprocess.run(command, env=env, capture_output=True, text=True, timeout=15)
        self.assertEqual(process.returncode, 1, process.stderr)
        self.assertEqual(json.loads(process.stdout)["verdict"], "REJECT")


if __name__ == "__main__":
    unittest.main()
