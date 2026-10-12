"""Benign metadata regressions; never run the research subjects or compilers."""
from __future__ import annotations

import copy
import importlib.util
import contextlib
import io
import shutil
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

import packaging_contract as contract
import verify_release as verifier
import build_review_manifest

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location("packaging_reference_refresh", ROOT / "paper/refresh_reference_lock.py")
reference = importlib.util.module_from_spec(spec)
spec.loader.exec_module(reference)


class PackagingContractTests(unittest.TestCase):
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
        with tempfile.TemporaryDirectory(prefix=".packaging-test-", dir=ROOT) as directory:
            temporary = Path(directory).resolve()
            self.assertTrue(temporary.is_relative_to(ROOT))
            bundle = temporary / "arbitrary project extraction with spaces"
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
