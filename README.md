# Reproducibility artifact

Run the complete pipeline from a project root containing sibling `artifact/`
and `paper/` directories:

```sh
./artifact/run_all.sh --root "$PWD" --scope all
```

Scoped runs are available for `models`, `finite`, `project`, `paper`,
`verify`, and `smoke`. The smoke scope copies the public entrypoint into an
unrelated clean directory whose path contains spaces and checks that root
resolution does not depend on a parent-directory layout:

```sh
./artifact/run_all.sh --root "$PWD" --scope smoke
```

## Evidence surfaces

1. The gate model exhausts all three-valued vectors, Boolean completions,
   relation subsets, and nonempty failure sets. Its mutation suite has five
   aggregate mutations.
2. The finite-contract layer evaluates twelve deterministic C subjects,
   including twelve executed two-parent merges. It uses admitted source syntax
   and unique issued-key bindings for source conformance; missing or flipped
   carrier symbols remain observations for recovery and continuity.
3. The commit-derived layer replays seven immutable public maintenance changes
   through bounded routine adapters and independent parsers.
4. One exact-source jsmn check tests transfer from the adapter contract to the
   upstream core history. It is not a seven-repository whole-build study.

## Delivery evidence

The complete release contains 576 retained scientific standard-output files.
Each is exactly 65,536 bytes and is bound by its certificate and
`results_manifest.csv`. `verify_retained_outputs.py` checks those bytes before
any experiment rebuild; `restore_retained_outputs.py` can restore only the
missing paths from the supplied original archive after hash and size checks. It
does not regenerate experiments or rewrite certificates.

The independent checkers also retain:

- a sixteen-codeword Hamming boundary enumeration;
- typed relation-vector and evidence-availability projections, not end-to-end
  unavailable-tool/source/parent execution coverage;
- a nonrelease threshold-26 to threshold-25 continuity-sensitivity projection;
  integrity and lineage are not reconstructed under its target policy;
- source-parser adversarial fixtures;
- a byte-exact Parson comparison for all sixty-five cases;
- concurrent executable-publication tests.

`results_manifest.csv` binds commands, environments, inputs, outputs, and
rechecks. `claim_evidence_ledger.csv` maps manuscript claims to evidence.
`correctness_correspondence.csv` maps formal statements to executable checks.
`external_resources.csv` records toolchains, public commits, licenses, and the
exact-source snapshot. `local_execution_gaps.json` states the remaining
whole-repository boundary.

## Decision accounting

The gate-model checker rejects five aggregate mutations. The finite checker
has eleven refreshed-outer-binding checks and three direct source-interpretation
probes; the commit-derived checker has ten refreshed-binding checks. Together
these are 24 checks, not 24 fully rebound-package tests. Retained software runs
have 129 passes, zero unresolved holds, and 43 diagnostic or adverse rejections.
Separate relation-vector fixtures exercise abstract hold behavior, not the real
reconstruction entrypoints with unavailable tools or files. In the model a false
relation dominates an unrelated unknown. The JSON-only gate-record regression
now rejects 19 individually inconsistent model records while accepting a fresh
valid model. This bounded check does not rerun the historical compiler campaigns
or replace their receipts. See `gate-model/README.md` for the standalone command.

## Bounded repository checks

`.github/workflows/scientific-checks.yml` is designed for this artifact directory
as a flat repository root. On pushes to `main` or a manual dispatch, it generates
and independently reconstructs the finite gate model, runs the record regressions,
and passively checks the 576 retained finite stdout bindings. It does not run
the compiler-locked release campaigns, upstream programs, or paper builds.
The job has a six-minute wall limit and explicit per-process limits, fails on
check errors, and uploads raw outputs even after failure. Preparing this workflow
does not establish a hosted run result.
