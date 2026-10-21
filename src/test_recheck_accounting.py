"""Bounded receipt accounting with process doubles; no compiler/subject runs."""
from contextlib import ExitStack
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch

import independent_recheck as checker
from test_reconstruction_inventory import missing_entrypoint_case

ROOT = Path(__file__).resolve().parents[2]


def observation(mode='success'):
    cert = json.loads((ROOT / 'artifact/certificates/fnv_step/baseline.json').read_text())
    manifest = json.loads((ROOT / 'artifact/benchmark/generated/fnv_step/baseline/watermark_manifest.json').read_text())
    environment = json.loads((ROOT / 'artifact/environment.json').read_text())
    reference = (ROOT / 'artifact/benchmark/reference/fnv_step.bin').read_bytes()
    counts = checker.new_work_counts() if hasattr(checker, 'new_work_counts') else {}
    sink = {}
    compile_calls, execute_calls = [], []
    real_hash = checker.sha_file
    with tempfile.TemporaryDirectory(prefix='owned-recheck-accounting-') as directory:
        replay = Path(directory)

        def process(argv, **kwargs):
            if len(argv) == 1:
                execute_calls.append(argv)
                if mode == 'partial' and len(execute_calls) == 1:
                    raise subprocess.TimeoutExpired(argv, 1)
                value = reference[:17] if mode == 'partial' else reference
                return subprocess.CompletedProcess(argv, 2 if mode == 'partial' else 0, value, b'')
            compile_calls.append(argv)
            if mode == 'partial' and len(compile_calls) == 1:
                raise OSError('owned unavailable compiler')
            if mode == 'partial' and len(compile_calls) == 2:
                return subprocess.CompletedProcess(argv, 1, b'', b'owned compile failure')
            output = Path(argv[-1])
            if not output.resolve().is_relative_to(replay.resolve()):
                raise AssertionError('test output escaped owned directory')
            compiler, optimization = argv[0], argv[argv.index('-Werror') + 1]
            tag = f'{compiler}_{optimization[1:].lower()}'
            # Inert retained bytes, never executed by this harness.
            output.write_bytes((ROOT / f'artifact/results/raw/fnv_step/baseline/{tag}').read_bytes())
            return subprocess.CompletedProcess(argv, 0, b'', b'')

        def hash_file(path):
            if mode == 'hash-error' and path.name == 'watermark_manifest.json':
                raise OSError('owned hash read failure')
            return real_hash(path)

        with ExitStack() as stack:
            stack.enter_context(patch.object(checker.subprocess, 'run', side_effect=process))
            forbidden = stack.enter_context(patch.object(checker.subprocess, 'Popen', side_effect=AssertionError('external process forbidden')))
            stack.enter_context(patch.object(checker, 'sha_file', side_effect=hash_file))
            error = None
            try:
                checker.validate_certificate(ROOT, cert, {('fnv_step', 'baseline'): cert},
                    {('fnv_step', 'baseline'): manifest}, {'fnv_step': reference}, environment,
                    replay_root=replay, reconstruction_sink=sink,
                    **({'work_counts': counts} if hasattr(checker, 'new_work_counts') else {}))
            except OSError as exc:
                error = exc
            forbidden.assert_not_called()
    return counts, sink, error, compile_calls, execute_calls, cert


class RecheckAccountingTests(unittest.TestCase):
    def test_missing_entries_have_plans_but_zero_validation_and_cell_work(self):
        for missing in ({'certificate'}, {'manifest'}, {'certificate', 'manifest'}):
            with self.subTest(missing=missing):
                status, receipt = missing_entrypoint_case(checker, missing)
                self.assertEqual(status, 1)
                self.assertFalse(receipt['all_valid'])
                self.assertIsNone(receipt['findings'][0]['verdict'])
                self.assertEqual(receipt['compiler_cells_recompiled'], 0)
                self.assertEqual(receipt['certificate_slots_planned'], 1)
                self.assertEqual(receipt['compiler_cells_planned'], 4)
                self.assertEqual(receipt['input_evaluations_planned'], 262144)
                self.assertEqual(receipt['certificate_count'], 0)
                for name in ('validations', 'compilations', 'executions', 'hashes',
                             'retained_cases', 'replay_cases', 'cells'):
                    self.assertEqual(receipt['operation_counts'][name], {'attempted': 0, 'completed': 0})
                for name in ('compiler_cells_rechecked', 'compiler_cells_recompiled',
                             'executables_reexecuted', 'input_evaluations_rechecked',
                             'input_evaluations_reexecuted', 'manifest_files_rehashed',
                             'executables_rehashed', 'assembly_files_rehashed_and_rescanned',
                             'policy_files_reconstructed'):
                    self.assertEqual(receipt[name], 0, name)

    def test_ordinary_success_retains_relations_and_full_cell_totals(self):
        counts, sink, error, compiles, executions, cert = observation()
        self.assertIsNone(error)
        self.assertTrue(sink['valid'], sink['errors'])
        self.assertEqual(sink['verdict'], cert['verdict'])
        self.assertEqual(sink['relations'], cert['relations'])
        self.assertEqual(len(compiles), 4)
        self.assertEqual(len(executions), 4)
        for name in ('cells', 'compilations', 'compiler_outputs', 'executions', 'retained_binary_hashes', 'assembly_scans'):
            self.assertEqual(counts[name], {'attempted': 4, 'completed': 4}, name)
        for name in ('retained_cases', 'replay_cases'):
            self.assertEqual(counts[name], {'attempted': 262144, 'completed': 262144})
        fields = checker.work_receipt_fields(counts)
        self.assertEqual([fields[n] for n in ('certificate_count', 'compiler_cells_rechecked',
            'compiler_cells_recompiled', 'executables_reexecuted', 'input_evaluations_rechecked',
            'input_evaluations_reexecuted', 'manifest_files_rehashed')], [1, 4, 4, 4, 262144, 262144, 1])

    def test_partial_failures_count_only_attempted_returned_and_produced_work(self):
        counts, sink, error, compiles, executions, _ = observation('partial')
        self.assertIsNone(error)
        self.assertFalse(sink['valid'])
        self.assertEqual(sink['verdict'], 'REJECT')
        self.assertEqual((len(compiles), len(executions)), (4, 2))
        self.assertEqual(counts['validations'], {'attempted': 1, 'completed': 1})
        self.assertEqual(counts['compilations'], {'attempted': 4, 'completed': 3})
        self.assertEqual(counts['compiler_outputs'], {'attempted': 4, 'completed': 2})
        self.assertEqual(counts['executions'], {'attempted': 2, 'completed': 1})
        self.assertEqual(counts['replay_cases'], {'attempted': 131072, 'completed': 17})
        fields = checker.work_receipt_fields(counts)
        self.assertEqual((fields['compiler_cells_recompiled'], fields['executables_reexecuted'],
                          fields['input_evaluations_reexecuted']), (2, 1, 17))

    def test_hash_read_exception_still_propagates_and_does_not_complete_hash(self):
        counts, sink, error, compiles, executions, _ = observation('hash-error')
        self.assertIsInstance(error, OSError)
        self.assertEqual(str(error), 'owned hash read failure')
        self.assertEqual(sink, {})
        self.assertEqual(counts['validations'], {'attempted': 1, 'completed': 0})
        self.assertEqual(counts['hashes']['attempted'], counts['hashes']['completed'] + 1)
        self.assertEqual(counts['manifest_file_hashes'], {'attempted': 1, 'completed': 0})
        self.assertEqual((compiles, executions), ([], []))

    def test_digest_counter_matches_actual_primary_validation_hash_calls(self):
        with patch.object(checker.hashlib, 'sha256', wraps=checker.hashlib.sha256) as digest:
            counts, sink, error, _, _, _ = observation()
        self.assertIsNone(error)
        self.assertTrue(sink['valid'])
        self.assertEqual(counts['hashes']['attempted'], digest.call_count)
        self.assertEqual(counts['hashes']['completed'], digest.call_count)


if __name__ == '__main__':
    unittest.main()
