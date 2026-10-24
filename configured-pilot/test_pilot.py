import importlib.util
import json
from pathlib import Path
import shutil
import tempfile
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("configured_release_pilot", HERE / "run.py")
pilot = importlib.util.module_from_spec(spec)
spec.loader.exec_module(pilot)
legacy_spec = importlib.util.spec_from_file_location("measured_pilot_source", HERE / "measured-source.py")
legacy = importlib.util.module_from_spec(legacy_spec)
legacy_spec.loader.exec_module(legacy)


class PilotTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.out = Path(self.temp.name) / "evidence"
        shutil.copytree(HERE / "results", self.out)
        self.plan = json.loads((HERE / "plan.json").read_bytes())

    def check_all_reject(self, result):
        for name in ("decision", "composed_decision", "closure_complete_composition"):
            self.assertEqual(result[name], "REJECT")

    def refresh_parent_links(self):
        for release in self.plan["releases"]:
            path = self.out / release["id"] / "certificate.json"
            cert = json.loads(path.read_bytes())
            cert["parents"] = {name: pilot.digest((self.out / name / "certificate.json").read_bytes())
                               for name in release["parents"]}
            pilot.write_json(path, cert)

    def issue_reissue_history(self):
        plan = pilot.reissue_plan(self.plan)
        root = Path(self.temp.name) / "reissue-history"
        root.mkdir()
        for release in plan["releases"]:
            namespace = "replacement" if release["id"] in {"reissued", "successor", "continuation"} else "original"
            pilot.issue(root, plan, release, release["parents"], namespace)
        return root, plan

    def test_wrong_certificate_target_rejects_and_preserves_old_counterexample(self):
        path = self.out / "merge/certificate.json"
        cert = json.loads(path.read_bytes())
        cert["id"] = "not-merge"
        pilot.write_json(path, cert)
        current = pilot.reconstruct(self.out, self.plan, "merge")["target"]
        self.check_all_reject(current)
        self.assertFalse(current["relations"]["integrity"])
        self.assertEqual(current["certificate_identity"],
                         {"expected": "merge", "observed": "not-merge", "satisfied": False})
        self.assertEqual(legacy.reconstruct(self.out, self.plan, "merge")["target"]["decision"], "PASS")

    def test_missing_certificate_target_rejects_and_preserves_old_counterexample(self):
        path = self.out / "merge/certificate.json"
        cert = json.loads(path.read_bytes())
        del cert["id"]
        pilot.write_json(path, cert)
        current = pilot.reconstruct(self.out, self.plan, "merge")["target"]
        self.check_all_reject(current)
        self.assertFalse(current["certificate_identity"]["satisfied"])
        self.assertIsNone(current["certificate_identity"]["observed"])
        self.assertEqual(legacy.reconstruct(self.out, self.plan, "merge")["target"]["decision"], "PASS")

    def test_rebound_parent_with_wrong_identity_rejects_every_recursive_workflow(self):
        path = self.out / "base/certificate.json"
        cert = json.loads(path.read_bytes())
        cert["id"] = "not-base"
        pilot.write_json(path, cert)
        self.refresh_parent_links()
        result = pilot.reconstruct(self.out, self.plan, "merge")["target"]
        self.check_all_reject(result)
        self.assertTrue(result["relations"]["integrity"])
        self.assertTrue(result["parent_links_match"])
        self.assertFalse(result["relations"]["lineage"])
        self.assertFalse(result["composed_lineage"])
        self.assertFalse(result["closure_complete_lineage"])

    def test_component_composition_recurses_its_own_parent_decisions(self):
        root, plan = self.issue_reissue_history()
        parent = pilot.reconstruct(root, plan, "reissued")["target"]
        self.assertEqual(parent["composed_decision"], "PASS")
        self.assertEqual(parent["decision"], "REJECT")
        for name, predecessor in (("successor", "reissued"), ("continuation", "successor")):
            with self.subTest(name=name):
                result = pilot.reconstruct(root, plan, name)["target"]
                self.assertEqual(result["mapped_per_parent"], {predecessor: 28})
                self.assertTrue(result["parent_links_match"])
                self.assertTrue(result["relations"]["continuity"])
                self.assertFalse(result["relations"]["lineage"])
                self.assertTrue(result["composed_lineage"])
                self.assertFalse(result["closure_complete_lineage"])
                self.assertEqual(result["composed_decision"], "PASS")
                self.assertEqual(result["decision"], "REJECT")
                self.assertEqual(result["closure_complete_composition"], "REJECT")
                # Historical negative remains executable, not a rewritten label.
                self.assertEqual(legacy.reconstruct(root, plan, name)["target"]["composed_decision"], "REJECT")

    def test_complete_composition_does_not_consume_protocol_verdict_double(self):
        root, plan = self.issue_reissue_history()
        # Explicit unit isolation double, not scientific acceptance evidence:
        # changing protocol verdict production must not change composition.
        with patch.object(pilot.receiver, "typed_decision", return_value="PASS"):
            result = pilot.reconstruct(root, plan, "continuation")["target"]
        self.assertEqual(result["decision"], "PASS")
        self.assertEqual(result["composed_decision"], "PASS")
        self.assertEqual(result["closure_complete_composition"], "REJECT")
        self.assertFalse(result["closure_complete_lineage"])

    def test_noncontinuity_parent_failure_still_rejects_component_composition(self):
        path = self.out / "branch/module.code"
        path.write_bytes(pilot.build("pass"))
        cert_path = self.out / "branch/certificate.json"
        cert = json.loads(cert_path.read_bytes())
        cert["bindings"]["module.code"] = pilot.digest(path.read_bytes())
        pilot.write_json(cert_path, cert)
        self.refresh_parent_links()
        result = pilot.reconstruct(self.out, self.plan, "merge")["target"]
        self.check_all_reject(result)
        self.assertTrue(result["relations"]["executable_reproduction"])
        self.assertFalse(result["composed_lineage"])

    def test_historical_samples_are_bound_to_exact_measured_preimage(self):
        binding = pilot.historical_measurement()
        raw = json.loads((HERE / "results/report.json").read_bytes())
        self.assertEqual(binding["median_full_merge_recheck_ms"], raw["median_full_merge_recheck_ms"])
        self.assertEqual(binding["sample_count"], len(raw["full_merge_recheck_ms"]))
        self.assertEqual(binding["retained_four_node_evidence_bytes"], raw["retained_four_node_evidence_bytes"])
        self.assertNotEqual(pilot.digest((HERE / "run.py").read_bytes()),
                            pilot.digest((HERE / "measured-source.py").read_bytes()))

    @unittest.skipUnless((HERE / "current-results/report.json").is_file(), "Fresh generated pilot evidence not retained")
    def test_current_evidence_binds_current_sources_and_replays(self):
        root = HERE / "current-results"
        record = json.loads((root / "report.json").read_bytes())
        self.assertEqual(record["verifier_sources"], pilot.verifier_sources())
        self.assertEqual(record["historical_measurement"], pilot.historical_measurement())
        for name in ("base", "upgrade", "branch", "merge"):
            self.assertEqual(json.loads(pilot.canonical(pilot.reconstruct(root, self.plan, name))),
                             record["intended"][name])
        control_plan = json.loads((root / "coherent-reissue/plan.json").read_bytes())
        for name in ("successor", "continuation"):
            self.assertEqual(json.loads(pilot.canonical(
                                 pilot.reconstruct(root / "coherent-reissue", control_plan, name))),
                             record["reissue_descendants"][name])
        self.assertEqual(json.loads(pilot.canonical(
                             pilot.reconstruct(root / "coherent-reissue", control_plan, "reissued"))),
                         record["coherent_reissue"])
        repair_plan = json.loads((root / "repair/plan.json").read_bytes())
        self.assertEqual(json.loads(pilot.canonical(
                             pilot.reconstruct(root / "repair", repair_plan, "repaired"))), record["repair"])
        for case, control in record["identity_controls"].items():
            with self.subTest(identity_control=case):
                cert = json.loads((root / control["candidate_certificate"]).read_bytes())
                pilot.write_json(self.out / "merge/certificate.json", cert)
                self.assertEqual(json.loads(pilot.canonical(
                                     pilot.reconstruct(self.out, self.plan, control["requested_target"]))),
                                 control["result"])

    def test_full_module_merge_and_complete_composition_agree(self):
        result = pilot.reconstruct(self.out, self.plan, "merge")
        self.assertEqual(result["target"]["decision"], "PASS")
        self.assertEqual(result["target"]["closure_complete_composition"], "PASS")
        self.assertEqual(result["target"]["mapped_per_parent"], {"upgrade": 26, "branch": 26})
        self.assertEqual(len(result["reconstructed_nodes"]), 4)

    def test_refreshed_missing_parent_link_rejects(self):
        path = self.out / "merge/certificate.json"
        cert = json.loads(path.read_bytes())
        del cert["parents"]["branch"]
        pilot.write_json(path, cert)
        result = pilot.reconstruct(self.out, self.plan, "merge")["target"]
        self.assertFalse(result["relations"]["lineage"])
        self.assertEqual(result["decision"], "REJECT")

    def test_rebound_wrong_bytecode_is_not_reproducible(self):
        path = self.out / "merge/module.code"
        path.write_bytes(pilot.build("pass"))
        cert_path = self.out / "merge/certificate.json"
        cert = json.loads(cert_path.read_bytes())
        cert["bindings"]["module.code"] = pilot.digest(path.read_bytes())
        pilot.write_json(cert_path, cert)
        result = pilot.reconstruct(self.out, self.plan, "merge")["target"]
        self.assertFalse(result["relations"]["executable_reproduction"])
        self.assertEqual(result["decision"], "REJECT")

    def test_reissue_and_repair_are_reconstructed_not_labels(self):
        report = json.loads((self.out / "report.json").read_bytes())
        self.assertEqual(report["coherent_reissue"]["target"]["mapped_per_parent"],
                         {"upgrade": 0, "branch": 0})
        self.assertEqual(report["coherent_reissue"]["target"]["closure_complete_composition"], "REJECT")
        self.assertEqual(report["repair"]["target"]["decision"], "PASS")
        for node in ("base", "upgrade", "branch", "merge"):
            self.assertNotIn("expected_decision", json.loads((self.out / node / "certificate.json").read_bytes()))


if __name__ == "__main__":
    unittest.main()
