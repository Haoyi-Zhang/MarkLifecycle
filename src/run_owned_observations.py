"""Actual owned Python observations checked through both reconstruction paths.

Only the emitter subprocess is real. C compilation/ELF execution are test
doubles in the imported unit harness; this is not a compiler-campaign rerun.
"""
import argparse
from hashlib import sha256
import json
import os
from pathlib import Path
import platform
import subprocess
import sys
import time

from test_behavior_observation import ROOT, finite_observation, project_observation

parser = argparse.ArgumentParser()
parser.add_argument('--output', required=True, type=Path)
args = parser.parse_args()
out = args.output.resolve()
if out.exists() or out == ROOT or out in ROOT.parents:
    raise ValueError('output must be a fresh owned result directory')
out.mkdir(parents=True, exist_ok=False)
environment = {**os.environ, 'PYTHONDONTWRITEBYTECODE': '1'}
inputs = {'finite': ROOT / 'artifact/benchmark/reference/fnv_step.bin',
          'project': ROOT / 'artifact/commit-replay/reference/project-A.bin'}
emitter = Path(__file__).with_name('owned_observation.py')
records = []
for layer, corpus in inputs.items():
    for mode in ('clean', 'exit', 'diagnostic', 'output'):
        argv = [sys.executable, '-B', str(emitter), '--corpus', str(corpus), '--mode', mode]
        started = time.perf_counter()
        actual = subprocess.run(argv, env=environment, capture_output=True, timeout=10)
        native_seconds = time.perf_counter() - started
        stdout_path, stderr_path = out / f'{layer}-{mode}.stdout.bin', out / f'{layer}-{mode}.stderr.bin'
        stdout_path.write_bytes(actual.stdout)
        stderr_path.write_bytes(actual.stderr)
        values = {'returncode': actual.returncode, 'stdout': actual.stdout, 'stderr': actual.stderr}
        evaluated = finite_observation(**values) if layer == 'finite' else project_observation(**values)
        passed = (evaluated['relations']['behavior']['passed'] if layer == 'finite'
                  else evaluated['behavior_pass'])
        records.append({'layer': layer, 'mode': mode, 'argv': argv,
            'returncode': actual.returncode, 'native_wall_seconds': native_seconds,
            'stdout': stdout_path.name, 'stdout_sha256': sha256(actual.stdout).hexdigest(),
            'stdout_bytes': len(actual.stdout), 'stderr': stderr_path.name,
            'stderr_sha256': sha256(actual.stderr).hexdigest(), 'stderr_bytes': len(actual.stderr),
            'expected_behavior_pass': mode == 'clean', 'reconstructed_behavior_pass': passed,
            'scope': 'actual owned Python emitter; C compilation and ELF execution are doubles in reconstruction-path harness'})
sources = ['artifact/src/owned_observation.py', 'artifact/src/run_owned_observations.py',
           'artifact/src/test_behavior_observation.py', 'artifact/src/independent_recheck.py',
           'artifact/commit-replay/src/independent_recheck.py', 'artifact/src/run_experiments.py']
bindings = {name: sha256((ROOT / name).read_bytes()).hexdigest() for name in sources}
bindings.update({path.relative_to(ROOT).as_posix(): sha256(path.read_bytes()).hexdigest() for path in inputs.values()})
report = {'schema': 'tracecert.owned-observation-controls.v1', 'actual_python_subprocesses': len(records),
          'c_compiler_cells_executed': 0, 'new_release_certificates': 0,
          'checks_passed': all(row['reconstructed_behavior_pass'] is row['expected_behavior_pass'] for row in records),
          'records': records, 'source_input_sha256': bindings,
          'environment': {'python': sys.version, 'platform': platform.platform(),
                          'PYTHONDONTWRITEBYTECODE': environment['PYTHONDONTWRITEBYTECODE']},
          'cost_scope': 'native_wall_seconds measures emitter startup/I/O/exit only; not full certificate costs or C compilation; no speedup claim'}
with (out / 'observations.json').open('x', encoding='utf-8') as handle:
    json.dump(report, handle, indent=2, sort_keys=True)
print(json.dumps({key: report[key] for key in ('actual_python_subprocesses', 'c_compiler_cells_executed',
                                             'new_release_certificates', 'checks_passed')}))
raise SystemExit(0 if report['checks_passed'] else 1)
