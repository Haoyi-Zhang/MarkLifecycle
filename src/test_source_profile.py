#!/usr/bin/env python3
"""Text-only source-profile and same-information checks; no C programs run.

The cache comparison below is a source-module test harness, not an incremental
certificate verifier. All external-process creation is forbidden during tests.
"""
from __future__ import annotations

from contextlib import ExitStack
import copy
import importlib.util
import itertools
import json
from pathlib import Path
import subprocess
import sys
import unittest
from unittest.mock import patch


ROOT = Path(__file__).resolve().parents[2]


def load_module(name, relative):
    spec = importlib.util.spec_from_file_location(name, ROOT / relative)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


FINITE_PRIMARY = load_module("profile_finite_primary", "artifact/src/tracecert.py")
FINITE_CHECKER = load_module("profile_finite_checker", "artifact/src/independent_recheck.py")
PROJECT_PRIMARY = load_module("profile_project_primary", "artifact/commit-replay/src/run_commit_replay.py")
PROJECT_CHECKER = load_module("profile_project_checker", "artifact/commit-replay/src/independent_recheck.py")
MODULES = (FINITE_PRIMARY, FINITE_CHECKER, PROJECT_PRIMARY, PROJECT_CHECKER)


def read_json(path):
    return json.loads(path.read_text(encoding="utf-8"))


def fixture(layer, subject, version):
    if layer == "finite":
        directory = ROOT / "artifact/benchmark/generated" / subject / version
        return directory / "kernel.c", directory / "watermark_manifest.json"
    directory = ROOT / "artifact/commit-replay"
    return (directory / "sources" / subject / f"{version}.c",
            directory / "manifests" / subject / f"{version}.json")


def baseline_inputs():
    for layer, subject, version in (("finite", "fnv_step", "baseline"),
                                    ("finite", "fnv_step", "extract"),
                                    ("finite", "fnv_step", "dependency_upgrade"),
                                    ("project", "A", "before"),
                                    ("project", "A", "after")):
        source, manifest = fixture(layer, subject, version)
        yield layer, source.read_text(encoding="utf-8"), read_json(manifest)


def admissions(layer, source, manifest):
    if layer == "finite":
        return (FINITE_PRIMARY.validate_locked_helper_definitions(source),
                FINITE_CHECKER.validate_locked_helper_definitions(source))
    return (PROJECT_PRIMARY.analyze_project_source(source, manifest)["errors"],
            PROJECT_CHECKER.inspect_source(source, manifest)["errors"])


class SourceProfileTests(unittest.TestCase):
    def setUp(self):
        stack = ExitStack()
        self.addCleanup(stack.close)
        stack.enter_context(patch.object(subprocess, "Popen",
                                         side_effect=AssertionError("external process forbidden")))

    def test_optional_file_leading_bom_keeps_admission_and_carriers(self):
        for layer, source, manifest in baseline_inputs():
            with self.subTest(layer=layer, profile=manifest.get("source_profile")):
                self.assertEqual(admissions(layer, source, manifest), ([], []))
                with_bom = "\ufeff" + source
                self.assertEqual(admissions(layer, with_bom, manifest), ([], []))
                if layer == "finite":
                    before, _ = FINITE_CHECKER.source_observation(source, manifest)
                    after, errors = FINITE_CHECKER.source_observation(with_bom, manifest)
                    self.assertEqual(errors, [])
                    self.assertEqual(before, after)
                    extracted = FINITE_PRIMARY.extract_source_carriers(source)
                    shifted = FINITE_PRIMARY.extract_source_carriers(with_bom)
                    self.assertEqual(shifted, [dict(row, offset=row["offset"] + 1)
                                               for row in extracted])
                else:
                    for parser in (PROJECT_PRIMARY.analyze_project_source,
                                   PROJECT_CHECKER.inspect_source):
                        self.assertEqual(parser(source, manifest), parser(with_bom, manifest))

    def test_interior_feff_is_diagnosed_in_active_text(self):
        # Only existing harmless include text and an isolated non-token marker
        # are varied. No macro rebinding or executable bypass is constructed.
        for layer, source, manifest in baseline_inputs():
            offset = source.index("#include <stdio.h>")
            cases = (source[:offset] + "\ufeff" + source[offset:],
                     source + "\n\ufeff\n", " \ufeff" + source,
                     "\ufeff\ufeff" + source)
            for case in cases:
                with self.subTest(layer=layer, case=cases.index(case)):
                    for errors in admissions(layer, case, manifest):
                        self.assertTrue(any("interior U+FEFF" in error for error in errors))

    def test_noncode_unicode_is_not_blanket_rejected(self):
        suffix = '\n/* café 中文 \ufeff */\n// \ufeff\nconst char *note = "中文 \ufeff";\n'
        for layer, source, manifest in baseline_inputs():
            with self.subTest(layer=layer):
                self.assertEqual(admissions(layer, source + suffix, manifest), ([], []))

    def test_lexical_view_preserves_character_offsets_and_newlines(self):
        source = '\ufeff/* \ufeff */\n"\ufeff";\n\ufeff\n'
        expected = ' ' * 8 + '\n' + ' ' * 3 + ';\n\ufeff\n'
        for lexer in (FINITE_PRIMARY.strip_c_noncode, FINITE_CHECKER.strip_c_noncode,
                      PROJECT_PRIMARY.strip_c_noncode, PROJECT_CHECKER.erase_noncode):
            with self.subTest(lexer=lexer.__module__):
                self.assertEqual(lexer(source), expected)
                self.assertEqual(len(lexer(source)), len(source))

    def test_same_information_all_current_source_manifest_pairs(self):
        finite_count = project_count = source_rejects = 0
        for subject in FINITE_CHECKER.KERNELS:
            for version in FINITE_CHECKER.VARIANT_PARENTS:
                path, manifest_path = fixture("finite", subject, version)
                manifest = read_json(manifest_path)
                primary = FINITE_PRIMARY.observe_against_manifest(path, manifest)
                independent, errors = FINITE_CHECKER.source_observation(
                    path.read_text(encoding="utf-8"), manifest)
                self.assertEqual(errors, [])
                for field in ("observed_symbols", "carriers", "extracted_count"):
                    self.assertEqual(primary[field], independent[field], (subject, version, field))
                conformance = dict(primary["source_conformance"])
                conformance.pop("errors")
                self.assertEqual(conformance, independent["source_conformance"])
                self.assertTrue(conformance["passed"])
                finite_count += 1
        for subject in PROJECT_CHECKER.PROJECTS:
            for version in PROJECT_CHECKER.VERSIONS:
                path, manifest_path = fixture("project", subject, version)
                source = path.read_text(encoding="utf-8")
                manifest = read_json(manifest_path)
                primary = PROJECT_PRIMARY.analyze_project_source(source, manifest)
                independent = PROJECT_CHECKER.inspect_source(source, manifest)
                for field in ("passed", "observed", "grammar_valid", "issuance_keys_unique",
                              "occurrence_binding_valid", "observed_count", "erasure_count",
                              "symbol_error_count"):
                    self.assertEqual(primary[field], independent[field], (subject, version, field))
                expected = not (subject == "A" and version == "adverse")
                self.assertEqual(independent["passed"], expected)
                source_rejects += not independent["passed"]
                project_count += 1
        self.assertEqual((finite_count, project_count, source_rejects), (144, 28, 1))
        print(json.dumps({"source_pairs_compared": 172, "finite": finite_count,
                          "project": project_count, "source_conformance_rejects": source_rejects}))

    def test_all_typed_vectors_use_identical_information(self):
        counts = {"PASS": 0, "HOLD": 0, "REJECT": 0}
        for values in itertools.product((True, False, None), repeat=7):
            expected = "REJECT" if False in values else "PASS" if all(v is True for v in values) else "HOLD"
            self.assertEqual([module.typed_decision(values) for module in MODULES], [expected] * 4)
            counts[expected] += 1
        self.assertEqual(counts, {"PASS": 1, "HOLD": 127, "REJECT": 2059})

    def test_availability_projections_agree_but_are_not_entrypoint_holds(self):
        for mask in range(8):
            unavailable = [kind for bit, kind in enumerate(("source", "parent", "compiler"))
                           if mask & (1 << bit)]
            for false_relation in (None, "recovery"):
                base = {name: True for name in FINITE_CHECKER.RELATION_NAMES}
                if false_relation:
                    base[false_relation] = False
                finite = FINITE_CHECKER.project_availability(base, set(unavailable))
                project = PROJECT_CHECKER.availability_projection(
                    unavailable, [] if false_relation is None else [false_relation])
                self.assertEqual(finite["relations"], project["relations"])
                self.assertEqual(finite["verdict"], project["decision"])

    def test_current_policy_binding_accepts_same_policy_not_migration(self):
        layer = ROOT / "artifact/commit-replay"
        environment = read_json(layer / "environment.json")
        child = read_json(layer / "certificates/A/after.json")
        parent = read_json(layer / "certificates/A/before.json")
        self.assertEqual(PROJECT_CHECKER.validate_policy_binding(
            ROOT, child, "A", environment, parent), (True, []))
        changed_parent = copy.deepcopy(parent)
        changed_policy = PROJECT_CHECKER.expected_project_policy("A", environment, 25)
        changed_parent["policy"]["canonical_sha256"] = PROJECT_CHECKER.canonical_hash(changed_policy)
        compatible, errors = PROJECT_CHECKER.validate_policy_binding(
            ROOT, child, "A", environment, changed_parent)
        self.assertFalse(compatible)
        self.assertIn("parent policy digest mismatch", errors)
        self.assertIn("stored policy compatibility mismatch", errors)

    def test_same_information_source_module_cache_and_invalidation(self):
        # Within this fixed Python process, the four-object byte tuple keys
        # source analysis only. Full certificates also need build/parent inputs.
        module_bytes = Path(PROJECT_CHECKER.__file__).read_bytes()
        requests = []
        for subject in PROJECT_CHECKER.PROJECTS:
            policy = (ROOT / "artifact/commit-replay/policies" / f"{subject}.json").read_bytes()
            for version in PROJECT_CHECKER.VERSIONS:
                source, manifest = fixture("project", subject, version)
                requests.append((source.read_bytes(), manifest.read_bytes(), module_bytes, policy))
        cache = {}
        full_calls = cached_calls = 0
        def reconstruct(request):
            return PROJECT_CHECKER.inspect_source(request[0].decode("utf-8"),
                                                  json.loads(request[1].decode("utf-8")))
        for request in requests * 2:
            full = reconstruct(request)
            full_calls += 1
            if request not in cache:
                cache[request] = reconstruct(request)
                cached_calls += 1
            self.assertEqual(cache[request], full)
        self.assertEqual((full_calls, cached_calls), (56, 28))
        original = requests[0]
        for field in range(4):
            changed = list(original)
            if field == 3:
                policy = json.loads(changed[field])
                policy["continuity"]["required_count"] = 25
                changed[field] = json.dumps(policy).encode("utf-8")
            else:
                changed[field] += b"\n"
            changed = tuple(changed)
            self.assertNotIn(changed, cache)
            cache[changed] = reconstruct(changed)
            self.assertEqual(cache[changed], reconstruct(changed))
        self.assertEqual(len(cache), 32)
        print(json.dumps({"source_module_full_calls": full_calls,
                          "source_module_cached_calls": cached_calls,
                          "binding_changes_invalidated": 4,
                          "scope": "test-harness-source-module-only; no timing or release reuse"}))


if __name__ == "__main__":
    unittest.main()
