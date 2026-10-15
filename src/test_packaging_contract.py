"""Benign metadata regressions; never run the research subjects or compilers."""
from __future__ import annotations

import copy
import importlib.util
import contextlib
import io
import json
import shutil
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

import packaging_contract as contract
import verify_release as verifier
import build_review_manifest
import make_release_materials as materials

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location("packaging_reference_refresh", ROOT / "paper/refresh_reference_lock.py")
reference = importlib.util.module_from_spec(spec)
spec.loader.exec_module(reference)


class PackagingContractTests(unittest.TestCase):
    def test_current_claim_ledger_includes_observation_contract(self):
        rows = [{"claim_id": f"C{i}"} for i in range(1, 12)]
        self.assertTrue(contract.claim_ledger_valid(rows))
        self.assertFalse(contract.claim_ledger_valid(rows[:-1]))
        self.assertFalse(contract.claim_ledger_valid(rows[:-1] + [rows[0]]))
        self.assertFalse(contract.claim_ledger_valid(rows + [{"claim_id": "C12"}]))

    def setUp(self):
        self.no_process = patch("subprocess.Popen", side_effect=AssertionError("metadata tests cannot launch programs"))
        self.no_process.start()
        self.addCleanup(self.no_process.stop)

    def test_minimal_and_overview_layouts_are_content_based(self):
        self.assertTrue(contract.root_entries_valid({"paper", "artifact"}, "full"))
        self.assertTrue(contract.root_entries_valid({"paper", "artifact", "README.md"}, "full"))
        self.assertFalse(contract.root_entries_valid({"paper"}, "full"))
        self.assertFalse(contract.root_entries_valid({"paper", "artifact", "extra"}, "full"))

    def test_review_manifest_is_required_by_content_profile(self):
        minimal = {"paper", "artifact"}
        self.assertFalse(contract.root_entries_valid(minimal, "review"))
        self.assertTrue(contract.root_entries_valid(minimal, "review", skip_manifest=True))
        self.assertTrue(contract.root_entries_valid(minimal | {"REVIEW_PACKET_MANIFEST.json"}, "review"))

    def test_complete_verifier_accepts_renamed_minimal_and_review_bundles(self):
        # Copy inert evidence only. No executable, compiler or archive entrypoint
        # is launched; setUp forbids all external process creation. The copied
        # snapshot needs current packaging hashes, just like a delivered ZIP.
        with tempfile.TemporaryDirectory(prefix="pkg-") as directory:
            temporary = Path(directory).resolve()
            self.assertFalse(temporary.is_relative_to(ROOT))
            bundle = temporary / "renamed bundle"
            bundle.mkdir()
            for name in ("paper", "artifact"):
                shutil.copytree(ROOT / name, bundle / name)
            output = io.StringIO()
            with contextlib.redirect_stdout(output), patch.object(sys, "argv", ["verify_release.py", "--root", str(bundle)]):
                self.assertEqual(verifier.main(), 0, output.getvalue())
            with contextlib.redirect_stdout(output), patch.object(sys, "argv", ["build_review_manifest.py", "--root", str(bundle)]):
                self.assertEqual(build_review_manifest.main(), 0, output.getvalue())
            with contextlib.redirect_stdout(output), patch.object(sys, "argv", ["verify_release.py", "--root", str(bundle)]):
                self.assertEqual(verifier.main(), 0, output.getvalue())

    def test_page_budget_is_a_maximum(self):
        for pages in (1, 12, 14, 15):
            self.assertTrue(contract.within_page_budget(pages))
        for pages in (0, 16, -1, True, "15"):
            self.assertFalse(contract.within_page_budget(pages))
        self.assertIn("NOT_OFFICIAL", contract.PAGE_BUDGET_KIND)

    def test_inventory_paths_stay_closed(self):
        self.assertEqual(contract.closed_path(ROOT, "paper/main.tex"), ROOT / "paper/main.tex")
        for rel in ("../other", "/absolute", "C:/other", "paper\\main.tex", "paper/../main.tex", "paper//main.tex", "./paper/main.tex"):
            with self.assertRaises(ValueError):
                contract.closed_path(ROOT, rel)

    def test_hash_validation_still_detects_current_byte_changes(self):
        rel = "paper/main.tex"
        path = ROOT / rel
        row = {"path": rel, "bytes": path.stat().st_size, "sha256": verifier.sha_file(path)}
        errors = []
        self.assertEqual(verifier.validate_hash_rows(root=ROOT, rows=[row], expected_paths={rel}, label="test", errors=errors), (1, 0))
        self.assertFalse(errors)
        row["sha256"] = "0" * 64
        self.assertEqual(verifier.validate_hash_rows(root=ROOT, rows=[row], expected_paths={rel}, label="test", errors=errors), (1, 1))
        self.assertTrue(errors)

    def owned_membership_fixture(self, root):
        for relative, content in {
            "paper/README.md": b"Owned paper overview.\n",
            "artifact/README.md": b"Owned artifact overview.\n",
            "paper/research.txt": b"Owned research record.\n",
            "artifact/records.json": b'{"owned": true}\n',
        }.items():
            target = root / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(content)
        with patch.object(materials, "ROOT", root), patch.object(materials, "ART", root / "artifact"):
            materials.make_release_manifest()
        return json.loads((root / "artifact/release_manifest.json").read_text(encoding="utf-8"))["files"]

    def membership_errors(self, root, rows):
        expected = {path.relative_to(root).as_posix() for path in root.rglob("*")
                    if path.is_file()} - verifier.BASE_MANIFEST_EXCLUSIONS
        errors = []
        verifier.validate_hash_rows(root=root, rows=rows, expected_paths=expected,
                                    label="owned membership", errors=errors)
        return errors

    def test_only_root_overview_is_optional_in_exact_membership(self):
        with tempfile.TemporaryDirectory(prefix="packaging-membership-") as directory:
            root = Path(directory)
            rows = self.owned_membership_fixture(root)
            self.assertFalse(self.membership_errors(root, rows))
            (root / "README.md").write_bytes(b"Owned optional overview.\n")
            self.assertFalse(self.membership_errors(root, rows))
            with patch.object(materials, "ROOT", root), patch.object(materials, "ART", root / "artifact"):
                materials.make_release_manifest()
            current = json.loads((root / "artifact/release_manifest.json").read_text(encoding="utf-8"))["files"]
            self.assertEqual(current, rows)
            self.assertNotIn("README.md", {row["path"] for row in current})
            self.assertEqual(verifier.REVIEW_MANIFEST_EXCLUSIONS, build_review_manifest.EXCLUDED_PATHS)
            with contextlib.redirect_stdout(io.StringIO()), patch.object(sys, "argv", ["build_review_manifest.py", "--root", str(root)]):
                self.assertEqual(build_review_manifest.main(), 0)
            review = json.loads((root / "REVIEW_PACKET_MANIFEST.json").read_text(encoding="utf-8"))
            self.assertNotIn("README.md", {row["path"] for row in review["files"]})
            self.assertIn("paper/README.md", {row["path"] for row in review["files"]})
            self.assertIn("artifact/README.md", {row["path"] for row in review["files"]})

    def test_nested_readmes_remain_required_and_byte_bound(self):
        for relative in ("paper/README.md", "artifact/README.md"):
            with self.subTest(relative=relative), tempfile.TemporaryDirectory(prefix="packaging-membership-") as directory:
                root = Path(directory)
                rows = self.owned_membership_fixture(root)
                target = root / relative
                target.write_bytes(b"Changed owned overview.\n")
                self.assertTrue(self.membership_errors(root, rows))
                target.unlink()
                self.assertTrue(self.membership_errors(root, rows))

    def test_research_files_remain_required_and_byte_bound(self):
        for relative in ("paper/research.txt", "artifact/records.json"):
            with self.subTest(relative=relative), tempfile.TemporaryDirectory(prefix="packaging-membership-") as directory:
                root = Path(directory)
                rows = self.owned_membership_fixture(root)
                target = root / relative
                target.write_bytes(b"Changed owned inert record.\n")
                self.assertTrue(self.membership_errors(root, rows))
                target.unlink()
                self.assertTrue(self.membership_errors(root, rows))

    def test_truthful_disclosures_and_licensed_citations_are_allowed(self):
        text = "Generated-content disclosure: ChatGPT (OpenAI) assisted drafting. The cited OpenAI chain of thought material is licensed."
        self.assertEqual(verifier.private_text_findings(text), 0)
        self.assertGreater(verifier.private_text_findings("D:" + "/CodexProjects/private/input"), 0)
        self.assertGreater(verifier.private_text_findings("api" + "_key=" + "a" * 32), 0)
        self.assertGreater(verifier.private_text_findings("BEGIN PRIVATE PROCESS " + "SCRATCH\ninternal notes"), 0)

    def fixture(self):
        source = "A bounded statement \\cite{r1}.\n\n"
        bib = "\\bibitem{r1} Author. Title. 2020.\n\\end{thebibliography}"
        entry = reference.parse_entries(bib)["r1"]
        sentence, line = reference.support_sentence(source, "r1")
        row = {"key": "r1", "entry": entry, "entry_sha256": reference.sha(entry.encode()),
               "support_sentence": sentence, "support_sentence_sha256": reference.sha(sentence.encode()),
               "manuscript_location": f"paper/main.tex:{line}", "verification_status": "inherited-only",
               "verification": {"date": "2020-01-01", "metadata_verdict": "HOLD", "local_support_verdict": "HOLD"}}
        return source, bib, {"reference_count": 1, "records": [row], "verification_date": "2020-01-01", "verification_verdict": "HOLD"}

    def test_rebinding_preserves_inherited_review_without_promotion(self):
        source, bib, old = self.fixture()
        before = copy.deepcopy(old)
        new = reference.refresh_bindings(old, "\n\n" + source, bib)
        self.assertEqual(old, before)
        self.assertEqual(new["records"][0]["verification"], before["records"][0]["verification"])
        self.assertEqual(new["verification_verdict"], "HOLD")
        self.assertEqual(new["verification_date"], "2020-01-01")
        self.assertEqual(new["fresh_primary_fulltext_review_count"], 0)
        self.assertNotEqual(new["records"][0]["manuscript_location"], old["records"][0]["manuscript_location"])

    def test_changed_sentence_or_entry_requires_separate_review(self):
        source, bib, old = self.fixture()
        for new_source, new_bib in ((source.replace("bounded", "universal"), bib), (source, bib.replace("Title", "Different"))):
            with self.assertRaises(ValueError):
                reference.refresh_bindings(old, new_source, new_bib)


if __name__ == "__main__":
    unittest.main()
