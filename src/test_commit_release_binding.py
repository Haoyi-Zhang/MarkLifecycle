"""Named-release bindings using owned in-memory files; no programs execute."""
from contextlib import ExitStack
import copy
import importlib.util
import json
from pathlib import Path
import unittest
from unittest.mock import patch

SPEC = importlib.util.spec_from_file_location(
    "commit_release_checker", Path(__file__).resolve().parents[1] / "commit-replay/src/independent_recheck.py")
checker = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(checker)


def fixture():
    root = Path("owned-release").resolve()
    source = b"owned in-memory source\n"
    manifest = json.dumps({"owned": True}).encode("utf-8")
    cert = {"project": "A", "version": "before",
            "source": "artifact/commit-replay/sources/A/before.c",
            "manifest": "artifact/commit-replay/manifests/A/before.json",
            "reference": "artifact/commit-replay/reference/project-A.bin",
            "integrity_object": "artifact/commit-replay/integrity-objects/A/before.bin",
            "source_sha256": checker.sha_bytes(source),
            "manifest_sha256": checker.sha_bytes(manifest), "compiler_cells": []}
    for compiler, optimization in checker.TOOLCHAINS:
        prefix = f"artifact/commit-replay/build/A/before/{compiler}_{optimization[1:]}"
        cert["compiler_cells"].append({"compiler": compiler, "optimization": optimization,
            "source_sha256": cert["source_sha256"], "executable": prefix + "/adapter",
            "output": prefix + "/stdout.bin", "assembly": prefix + "/adapter.s"})
    return root, cert, {root / cert["source"]: source, root / cert["manifest"]: manifest}


class ReleaseBindingTests(unittest.TestCase):
    def check(self, cert, files, root):
        with ExitStack() as stack:
            stack.enter_context(patch.object(Path, "read_bytes", lambda path: files[path]))
            process = stack.enter_context(patch.object(checker.subprocess, "run", side_effect=AssertionError("process forbidden")))
            compile_call = stack.enter_context(patch.object(checker, "compile_fresh", side_effect=AssertionError("compiler forbidden")))
            result = checker.bind_release_inputs(root, "A", "before", cert)
            process.assert_not_called()
            compile_call.assert_not_called()
            return result

    def test_matching_identity_uses_one_snapshot(self):
        root, cert, files = fixture()
        snapshot = self.check(cert, files, root)
        self.assertEqual(snapshot["source_bytes"], files[root / cert["source"]])
        self.assertEqual(snapshot["source_text"], "owned in-memory source\n")
        self.assertEqual(snapshot["manifest"], {"owned": True})

    def test_wrong_named_release_is_rejected_without_reading(self):
        root, cert, files = fixture()
        for field in ("project", "version", "source", "manifest", "reference", "integrity_object"):
            changed = copy.deepcopy(cert)
            changed[field] = "owned-mismatch"
            with self.subTest(field=field), self.assertRaisesRegex(ValueError, "identity mismatch"):
                self.check(changed, {}, root)

    def test_cell_bindings_close_before_reading(self):
        root, cert, files = fixture()
        for field in ("source_sha256", "executable", "output", "assembly", "compiler", "optimization"):
            changed = copy.deepcopy(cert)
            changed["compiler_cells"][0][field] = "owned-mismatch"
            with self.subTest(field=field), self.assertRaises(ValueError):
                self.check(changed, {}, root)

    def test_duplicate_or_incomplete_cells_are_rejected(self):
        root, cert, files = fixture()
        for cells in (cert["compiler_cells"][:-1], [cert["compiler_cells"][0]] * 4):
            changed = {**cert, "compiler_cells": cells}
            with self.subTest(count=len(cells)), self.assertRaises(ValueError):
                self.check(changed, {}, root)

    def test_snapshot_bytes_must_match_declared_bindings(self):
        root, cert, files = fixture()
        for name in ("source", "manifest"):
            changed_files = {**files, root / cert[name]: b"owned inconsistent bytes"}
            with self.subTest(name=name), self.assertRaisesRegex(ValueError, "snapshot binding mismatch"):
                self.check(cert, changed_files, root)


if __name__ == "__main__":
    unittest.main()
