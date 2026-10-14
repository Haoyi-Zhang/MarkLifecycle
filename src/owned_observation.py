"""Benign process-observation fixture, not a compiler or software-release subject."""
import argparse
from pathlib import Path
import sys

parser = argparse.ArgumentParser()
parser.add_argument('--corpus', required=True, type=Path)
parser.add_argument('--mode', choices=('clean', 'exit', 'diagnostic', 'output'), required=True)
args = parser.parse_args()
data = args.corpus.read_bytes()
if args.mode == 'output':
    data = bytes([data[0] ^ 1]) + data[1:] if data else b'owned difference'
sys.stdout.buffer.write(data)
sys.stdout.buffer.flush()
if args.mode == 'diagnostic':
    sys.stderr.buffer.write(b'owned diagnostic\n')
    sys.stderr.buffer.flush()
raise SystemExit(2 if args.mode == 'exit' else 0)
