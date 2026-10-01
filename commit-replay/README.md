# Commit-derived replay layer

This layer replays seven immutable public maintenance changes through bounded,
routine-level C adapters. It does not claim complete upstream-repository builds
or whole-program equivalence. Each subject has four releases: before, after, a
successor with two tolerated carrier erasures, and one adverse release that
isolates one certificate relation. Every release binds a canonical policy;
normal lineage requires a fully reconstructed passing parent under a compatible
policy.

Run from any project root that contains sibling `artifact/` and `paper/`
directories:

```sh
./artifact/run_all.sh --root "$PWD" --scope project
```

Equivalent direct commands are:

```sh
python3 artifact/commit-replay/src/run_commit_replay.py --root "$PWD"
python3 artifact/commit-replay/src/independent_recheck.py --root "$PWD"
python3 artifact/commit-replay/src/test_source_parser_security.py --root "$PWD"
python3 artifact/commit-replay/src/test_publication_protocol.py --root "$PWD"
```

The primary and independent source parsers strip comments and string literals
before recognizing issued helpers and carrier occurrences. The security test
covers an all-carriers-commented copy, a fake helper in a comment, a string
literal decoy, a helper rebinding, and an end-to-end controlled copy whose
source, executable, output, and certificate bindings are refreshed. The latter
is an executed parser counterexample: raw-text matching would pass it, whereas
the lexical parser reconstructs no live carriers and rejects it through
recovery and continuity.

Project D (Parson) retains all sixty-five output byte strings. Every compiler
cell compares the complete 2,145-byte output with the reference; the FNV-style
summary remains diagnostic only and is not used as the behavior oracle.
