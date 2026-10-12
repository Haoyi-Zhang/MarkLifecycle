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

The extraction-folder name is cosmetic. Closed-file release validation accepts
the minimal sibling `paper/` and `artifact/` layout, with an optional root
overview. A review profile additionally requires its content-set manifest.
`python -B -m unittest discover -s artifact/src -p 'test_packaging_contract.py' -v`
from a complete project root runs bounded packaging regressions without launching
research programs. Current PDF audits use in-process PyMuPDF and Pillow; install
those Python dependencies in the packaging environment. No experiment receipt or
certificate is reissued by a packaging refresh. Inherited reference-review dates
are distinct from current local bindings, and truthful required disclosures and
licensed citations are not prohibited by the leakage guard.

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

Five additional in-memory regression methods exercise the finite checker's
closed source/manifest/reference inventory, unknown subjects, missing entry-point
records, environment read errors, and unavailable-compiler preflight. Run
`python -B -m unittest discover -s src -p 'test_reconstruction_inventory.py' -v`
from the artifact directory. They also run in the bounded scientific workflow.
No subjects or compilers execute: closed inventory fails with REJECT, missing
records have no reconstructed verdict, and environment read exceptions remain
exceptions. These tests do not establish end-to-end HOLD propagation or change
any retained release, tamper, or availability-projection denominator.

The text-only source-profile suite runs with
`python -B -m unittest discover -s src -p 'test_source_profile.py' -v` from this
directory. Its ten methods compare primary and independent source analysis on
all 172 current source/manifest pairs, test all 2,187 typed vectors and sixteen
availability projections, and check current same-policy and incompatible-parent
bindings. A single optional file-leading UTF-8 BOM is blanked in the lexical
view without shifting character offsets. Interior U+FEFF in active code is
rejected; comments and literals are not subject to a blanket Unicode ban. Raw
source bytes and their integrity bindings are unchanged.

A same-information source-module cache comparison makes 56 uncached versus 28
cached parser calls on two traversals of the 28 project inputs, with identical
records and invalidation on source, manifest, module, or policy changes. The
cache exists only in the test harness; this is neither a full-certificate
incremental verifier nor an executed policy migration or timing result. The
suite forbids external-process creation and adds no compiler cells or releases.

The metadata-only packaging regressions run with
`python -B -m unittest discover -s src -p 'test_packaging_contract.py' -v`.
Only the optional root `README.md` is outside exact manifest membership;
`paper/README.md`, `artifact/README.md`, and research files remain required and
byte-bound. The same rule applies to full releases and review manifests.

`.github/workflows/scientific-checks.yml` is designed for this artifact directory
as a flat repository root. On pushes to `main` or a manual dispatch, it generates
and independently reconstructs the finite gate model, runs the record regressions,
and passively checks the 576 retained finite stdout bindings. It does not run
the compiler-locked release campaigns, upstream programs, or paper builds.
The job has a six-minute wall limit and explicit per-process limits, fails on
check errors, and uploads raw outputs even after failure. The current Ubuntu
24.04 / Python 3.12 run passed the finite model and all 19 record regressions,
and confirmed the bindings of 576 retained outputs. Raw records are retained
in `results/current/`, with the larger finite-model JSON files losslessly
compressed as `.gz`. This is not a fresh compiler or subject-program run.
