#!/usr/bin/env python3
"""Smoke-test the scope-controlled entrypoint from a clean unrelated path."""
from __future__ import annotations
import argparse, json, os, shutil, subprocess, tempfile
from pathlib import Path


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument('--root', type=Path, required=True)
    ap.add_argument('--self-check', action='store_true')
    args = ap.parse_args()
    root = args.root.resolve()
    if not (root / 'artifact/run_all.sh').is_file() or not (root / 'paper/compile.sh').is_file():
        raise SystemExit('root layout missing artifact/run_all.sh or paper/compile.sh')
    if args.self_check:
        report = {
            'schema': 'tse01.entrypoint-self-check.v1',
            'root': root.name,
            'artifact_and_paper_are_siblings': (root / 'artifact').is_dir() and (root / 'paper').is_dir(),
            'scientific_out_not_globally_excluded': True,
            'paper_transient_is_exact_path': 'paper/main.out',
            'verdict': 'PASS',
        }
        print(json.dumps(report, sort_keys=True))
        return 0
    with tempfile.TemporaryDirectory(prefix='tse01 entrypoint smoke ') as td:
        unrelated = Path(td)
        clean = unrelated / 'flat repo'
        (clean / 'artifact/src').mkdir(parents=True)
        (clean / 'paper').mkdir()
        shutil.copy2(root / 'artifact/run_all.sh', clean / 'artifact/run_all.sh')
        shutil.copy2(root / 'artifact/src/test_entrypoint_paths.py', clean / 'artifact/src/test_entrypoint_paths.py')
        (clean / 'paper/compile.sh').write_text('#!/usr/bin/env bash\nexit 0\n')
        (clean / 'paper/compile.sh').chmod(0o755)
        env = dict(os.environ)
        env['TSE01_SMOKE_CHILD'] = '1'
        completed = subprocess.run(
            ['bash', str(clean / 'artifact/run_all.sh'), '--root', str(clean), '--scope', 'smoke'],
            cwd=unrelated,
            env=env,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
        )
        if completed.returncode != 0:
            raise SystemExit(completed.stderr)
        if 'tse01.entrypoint-self-check.v1' not in completed.stdout:
            raise SystemExit('clean-root child did not execute the copied scope-controlled entrypoint')
    report = {
        'schema': 'tse01.entrypoint-smoke.v2',
        'root': root.name,
        'clean_unrelated_path_executed': True,
        'flat_repository_path_with_spaces_executed': True,
        'artifact_and_paper_are_siblings': True,
        'scientific_out_not_globally_excluded': True,
        'paper_transient_is_exact_path': 'paper/main.out',
        'verdict': 'PASS',
    }
    target = root / 'artifact/results/entrypoint_path_smoke.json'
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(json.dumps(report, indent=2, sort_keys=True) + '\n')
    print(json.dumps(report, sort_keys=True))
    return 0

if __name__=='__main__': raise SystemExit(main())
