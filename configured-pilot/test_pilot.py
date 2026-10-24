import importlib.util
import json
from pathlib import Path
import shutil
import tempfile
import unittest

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("configured_release_pilot", HERE / "run.py")
pilot = importlib.util.module_from_spec(spec)
spec.loader.exec_module(pilot)


class PilotTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.out = Path(self.temp.name) / "evidence"
        shutil.copytree(HERE / "results", self.out)
        self.plan = json.loads((HERE / "plan.json").read_bytes())

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
