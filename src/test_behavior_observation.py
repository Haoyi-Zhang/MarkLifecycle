"""Owned observation-unit guards through current reconstruction paths.

No C program or compiler executes. The project cell callback is captured before
the rest of recheck (including substitution fixtures) can run. Compilation is a
test double and retained bytes are read-only. Native observations are separate.
"""
from contextlib import ExitStack
import importlib.util
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[2]


def load(name, relative):
    spec = importlib.util.spec_from_file_location(name, ROOT / relative)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


FINITE = load('observation_finite_checker', 'artifact/src/independent_recheck.py')
PROJECT = load('observation_project_checker', 'artifact/commit-replay/src/independent_recheck.py')
ISSUER = load('observation_finite_issuer', 'artifact/src/run_experiments.py')


class CapturedCertificate(Exception):
    def __init__(self, value):
        self.value = value


def issuer_observation(stderr=''):
    # Exercise the real producer aggregate and certificate construction once,
    # stopping before any campaign summary/count assertion or further release.
    with tempfile.TemporaryDirectory(prefix='owned-issuer-observation-') as directory:
        root = Path(directory)
        original_write = ISSUER.write_json
        def bounded_write(path, value):
            if not path.resolve().is_relative_to(root.resolve()):
                raise RuntimeError('issuer test output escaped owned directory')
            if isinstance(value, dict) and value.get('schema') == ISSUER.SCHEMA:
                raise CapturedCertificate(value)
            return original_write(path, value)
        def compile_double(source, build, compiler, optimization):
            build.mkdir(parents=True, exist_ok=True)
            tag = f'{compiler}_{optimization[1:].lower()}'
            binary, output, assembly = build / tag, build / (tag + '.out'), build / (tag + '.s')
            binary.write_bytes(b'owned non-executable compilation double')
            output.write_bytes(ISSUER.reference_table(ISSUER.KERNELS[0]))
            assembly.write_text('', encoding='utf-8')
            return {'status': 'EXECUTED', 'compiler': compiler, 'optimization': optimization,
                'compiler_version': 'owned-test-double', 'compile_returncode': 0,
                'assembly_returncode': 0, 'run_returncode': 0, 'stderr': stderr,
                'compile_command': [], 'assembly_command': [], 'binary_path': str(binary),
                'binary_sha256': ISSUER.sha256_file(binary), 'output_path': str(output),
                'output_sha256': ISSUER.sha256_file(output), 'output_size': output.stat().st_size,
                'assembly_path': str(assembly), 'assembly_sha256': ISSUER.sha256_file(assembly)}
        with ExitStack() as stack:
            stack.enter_context(patch.object(ISSUER, 'KERNELS', ISSUER.KERNELS[:1]))
            stack.enter_context(patch.object(ISSUER, 'VARIANTS', ISSUER.VARIANTS[:1]))
            stack.enter_context(patch.object(ISSUER, 'collect_and_validate_environment',
                return_value={'system': 'owned-test-double', 'machine': 'owned-test-double',
                              'gcc': 'owned-test-double', 'clang': 'owned-test-double'}))
            stack.enter_context(patch.object(ISSUER, 'compile_run', side_effect=compile_double))
            stack.enter_context(patch.object(ISSUER, 'write_json', side_effect=bounded_write))
            stack.enter_context(patch.object(ISSUER.subprocess, 'Popen', side_effect=AssertionError('external process forbidden')))
            try:
                ISSUER.run(root)
            except CapturedCertificate as captured:
                return captured.value
        raise RuntimeError('issuer certificate was not captured')


def finite_observation(returncode=0, stderr=b'', stdout=None):
    cert = FINITE.json.loads((ROOT / 'artifact/certificates/fnv_step/baseline.json').read_text())
    manifest = FINITE.json.loads((ROOT / 'artifact/benchmark/generated/fnv_step/baseline/watermark_manifest.json').read_text())
    environment = FINITE.json.loads((ROOT / 'artifact/environment.json').read_text())
    reference = (ROOT / 'artifact/benchmark/reference/fnv_step.bin').read_bytes()
    value = reference if stdout is None else stdout
    sink = {}
    with tempfile.TemporaryDirectory(prefix='owned-observation-') as directory:
        replay = Path(directory)
        def observed_process(argv, **kwargs):
            if len(argv) == 1:
                return subprocess.CompletedProcess(argv, returncode, value, stderr)
            output = Path(argv[-1])
            if not output.resolve().is_relative_to(replay.resolve()):
                raise RuntimeError('test compiler output escaped owned directory')
            compiler, optimization = argv[0], argv[argv.index('-Werror') + 1]
            tag = f'{compiler}_{optimization[1:].lower()}'
            output.write_bytes((ROOT / f'artifact/results/raw/fnv_step/baseline/{tag}').read_bytes())
            return subprocess.CompletedProcess(argv, 0, b'', b'')
        with patch.object(FINITE.subprocess, 'run', side_effect=observed_process), \
             patch.object(FINITE.subprocess, 'Popen', side_effect=AssertionError('external process forbidden')):
            FINITE.validate_certificate(ROOT, cert, {('fnv_step', 'baseline'): cert},
                {('fnv_step', 'baseline'): manifest}, {'fnv_step': reference}, environment,
                replay_root=replay, reconstruction_sink=sink)
    return sink


class CapturedCell(Exception):
    def __init__(self, result):
        self.result = result


def project_observation(returncode=0, stderr=b'', stdout=None):
    environment = PROJECT.read_json(ROOT / 'artifact/commit-replay/environment.json')
    reference = (ROOT / 'artifact/commit-replay/reference/project-A.bin').read_bytes()
    value = reference if stdout is None else stdout
    class CellCapture:
        def __enter__(self):
            return self
        def __exit__(self, *args):
            return False
        def map(self, function, tasks):
            task = tasks[0]
            if task[:2] != ('A', 'before'):
                raise RuntimeError('unexpected selected owned cell')
            raise CapturedCell(function(task))
    def compile_double(source, output, compiler, optimization):
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_bytes((ROOT / f'artifact/commit-replay/build/A/before/{compiler}_{optimization[1:]}/adapter').read_bytes())
    def execute_double(path):
        if path.resolve().is_relative_to(ROOT):
            # Only the unmodified retained baseline observation, not a program.
            return 0, reference, b''
        return returncode, value, stderr
    with ExitStack() as stack:
        stack.enter_context(patch.object(PROJECT, 'compiler_version', lambda name: environment[name]))
        stack.enter_context(patch.object(PROJECT.platform, 'system', return_value=environment['system']))
        stack.enter_context(patch.object(PROJECT.platform, 'machine', return_value=environment['machine']))
        stack.enter_context(patch.object(PROJECT, 'compile_fresh', side_effect=compile_double))
        stack.enter_context(patch.object(PROJECT, 'execute', side_effect=execute_double))
        stack.enter_context(patch.object(PROJECT.concurrent.futures, 'ThreadPoolExecutor', lambda **kwargs: CellCapture()))
        stack.enter_context(patch.object(PROJECT.subprocess, 'Popen', side_effect=AssertionError('external process forbidden')))
        try:
            PROJECT.recheck(ROOT)
        except CapturedCell as captured:
            return captured.result
    raise RuntimeError('owned cell was not captured before full campaign')


class BehaviorObservationTests(unittest.TestCase):
    def test_issuer_clean_observation_passes(self):
        self.assertIs(issuer_observation()['relations']['behavior']['passed'], True)

    def test_issuer_unexpected_diagnostic_fails_behavior(self):
        result = issuer_observation('owned diagnostic\n')
        self.assertIs(result['relations']['behavior']['passed'], False)
        self.assertEqual(result['verdict'], 'REJECT')

    def test_finite_clean_observation_passes(self):
        self.assertIs(finite_observation()['relations']['behavior']['passed'], True)

    def test_finite_unexpected_diagnostic_fails_behavior(self):
        self.assertIs(finite_observation(stderr=b'owned diagnostic\n')['relations']['behavior']['passed'], False)

    def test_finite_nonzero_exit_fails_behavior(self):
        self.assertIs(finite_observation(returncode=2)['relations']['behavior']['passed'], False)

    def test_finite_wrong_stdout_fails_behavior(self):
        self.assertIs(finite_observation(stdout=b'owned different output')['relations']['behavior']['passed'], False)

    def test_project_clean_observation_passes(self):
        self.assertIs(project_observation()['behavior_pass'], True)

    def test_project_unexpected_diagnostic_fails_behavior(self):
        self.assertIs(project_observation(stderr=b'owned diagnostic\n')['behavior_pass'], False)

    def test_project_nonzero_exit_fails_behavior(self):
        self.assertIs(project_observation(returncode=2)['behavior_pass'], False)

    def test_project_wrong_stdout_fails_behavior(self):
        self.assertIs(project_observation(stdout=b'owned different output')['behavior_pass'], False)


if __name__ == '__main__':
    unittest.main()
