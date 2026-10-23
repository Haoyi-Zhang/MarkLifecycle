# Reproducibility artifact

## Standalone artifact checkout

The public code repository is this directory flattened to the repository root;
it does not supply a sibling `paper/`. For bounded checks, use Python 3.12
(the scientific CI version); these commands use only the standard library and
do not require a C compiler or third-party Python packages. From the directory
containing `src/`, `gate-model/`, and `results_manifest.csv`:

```sh
export PYTHONDONTWRITEBYTECODE=1
python3 -B -S -m unittest discover -s src -p 'test_reconstruction_inventory.py' -v
python3 -B -S -m unittest discover -s src -p 'test_commit_release_binding.py' -v
MODEL_ROOT=/absolute/fresh/gate-check
python3 -B -S gate-model/src/run_gate_model.py --root "$MODEL_ROOT"
python3 -B -S gate-model/src/independent_recheck.py --root "$MODEL_ROOT"
```

Choose a new `MODEL_ROOT` outside the checkout: the model scripts write JSON
under `$MODEL_ROOT/artifact/gate-model/results/`. They enumerate finite records,
not compiled releases. The two unit suites above use owned in-memory fixtures.
No package installation is needed for these checks.

Other bounded checks expect an enclosing `artifact/` directory even when no
paper is used. Match the layout used in scientific CI by copying the standalone
checkout into a fresh disposable workspace (POSIX shell):

```sh
WORK=/absolute/fresh/retained-check
mkdir -p "$WORK/artifact"
cp -a . "$WORK/artifact/"
python3 -B -S "$WORK/artifact/src/verify_retained_outputs.py" \
  --root "$WORK" --report "$WORK/retained-output-closure.json"
python3 -B -S -m unittest discover -s "$WORK/artifact/src" -p 'test_source_profile.py' -v
```

The retained-output check reads the result manifest, certificates and 576
stored `.out` files, and writes only the explicitly selected report. The
source-profile suite reads retained source/manifest pairs and forbids external
processes. Neither command rebuilds subjects. The packaging suite is different:
it requires the actual sibling paper sources and packaging dependencies.

## Complete project bundle

### Named finite-release decision

From a workspace containing `artifact/`, reconstruct one finite release and its
ancestor closure without reissuing any certificate:

```sh
python3 -B artifact/src/check_release.py --root "$PWD" --kernel fnv_step --variant merge_tolerable
```

The command writes a JSON report to standard output. Exit codes are 0 for PASS,
1 for REJECT and 2 for HOLD. An unavailable locked host/compiler or timed-out
fresh build leaves its dependent relations unresolved. A completed failed build,
known recovery/continuity failure, corrupt retained binding, or missing mandatory
retained source/parent record still rejects. Fresh parent HOLD propagates to
lineage; a rejected parent never becomes HOLD. Stored issued claims are checked
separately from current unknowns. The command uses disposable build directories
and does not modify retained inputs. It is a finite-release operation, not a new
availability-aware interface for the commit-derived or whole-campaign checker.

`python3 -B -m unittest discover -s artifact/src -p 'test_release_availability.py' -v`
runs eleven owned regression methods. They use retained source and object bytes;
restoration/build-failure controls use explicit compiler/executable doubles.
The CLI control actually invokes the command and checks unchanged inputs.
These tests add no native C compiler cells or releases to the historical counts.

The complete pipeline requires a project root containing sibling `artifact/`
and `paper/` directories. Use a disposable copy: the pipeline regenerates model
and compiler outputs, certificates, reports and packaging bindings, and removes
paper build auxiliaries (including `main.bbl`) before scoped runs. It is not a
read-only verifier of the retained package.

Full finite/project reconstruction requires the locked Linux x86_64 toolchains
recorded in `environment.json` and `commit-replay/environment.json`, not merely
any compiler on PATH. Shell entrypoints require Bash. Paper/package checks also
need the paper's TeX toolchain and PyMuPDF/Pillow as described below. From the
disposable complete project root:

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

New finite recheck receipts distinguish planned certificate/cell/case slots from
`operation_counts` attempted and completed work in the primary inventory pass.
Validation completion includes diagnostic rejection; cell completion means its
retained output checks were reached, not acceptance. Compilation completion
means a subprocess returned (even nonzero); `compiler_outputs` additionally
requires zero exit and a produced file. Execution completion means a subprocess
returned, not necessarily successfully. Case attempts count reference-domain
slots requested when an actual output read or replay invocation starts; they do
not infer internal program progress. Completed cases are observed one-byte outputs
capped at the reference-domain size, not a claim that every comparison ran after
the first mismatch. Truncated stdout contributes only its received bytes;
timeouts without a returned result contribute none. Hash completion requires an
actual digest return. Auxiliary fixtures and compiler-version preflight are
excluded from these primary-pass counters. Propagating I/O errors remain errors,
not synthetic receipts or HOLDs. Full successful passes retain the existing
totals; historical executed receipts are not rewritten by this accounting change.

From a disposable complete project root, the owned process-double regression is
`python3 -B -S -m unittest discover -s artifact/src -p 'test_recheck_accounting.py' -v`.
It checks missing entries, partial failures, ordinary success and hash read errors
without a compiler or subject execution. The JSON-only plot-consumer suite is
`python3 -B -m unittest discover -s paper/figures -p 'test_sensitivity_data.py' -v`;
it requires ReportLab and the sibling paper, but invokes no font or experiment
process. `paper/compile.sh` now redraws that plot from retained sweep rows before
TeX. These checks do not add compiler cells, cases, timings or model results.

The gate-model checker rejects five aggregate mutations. The finite checker
has eleven refreshed-outer-binding checks and three direct source-interpretation
probes; the commit-derived checker has ten refreshed-binding checks. Together
these are 24 checks, not 24 fully rebound-package tests. Retained software runs
have 129 passes, zero unresolved holds, and 43 diagnostic or adverse rejections.
Separate relation-vector fixtures exercise abstract hold behavior. The named
finite-release command additionally handles unavailable fresh compilers and
parent HOLDs; missing mandatory retained files still reject. A false
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
directory. Its eleven methods compare primary and independent source analysis on
all 172 current source/manifest pairs, test all 2,187 typed vectors and sixteen
availability projections, and check current same-policy and incompatible-parent
bindings. A single optional file-leading UTF-8 BOM is blanked in the lexical
view without shifting character offsets. Interior U+FEFF in active code is
rejected; comments and literals are not subject to a blanket Unicode ban. Raw
source bytes and their integrity bindings are unchanged.

## Complete behavior observations

Behavior requires matching output, zero exit status and no unexpected diagnostic.
The current finite and project reconstruction paths now retain that distinction
instead of labelling an output-matching failed execution behavior-true. Eight
owned unit guards first exposed three failures in normal and optimized Python;
all eight now pass. Two additional issuer-path controls check the real aggregate
before any campaign-count publication. The 31-method source/observation/inventory/binding selection
also passes in both modes. A harmless extra directive with or without a leading
BOM remains rejected: that admission path was already correct and is not a new
source-parser repair. [Method and result scope](observation-contract.md) explains
the raw evidence and remaining compiler/HOLD/bridge/incremental gaps.

From this artifact directory, reviewed benign entry points are:

```sh
PYTHONDONTWRITEBYTECODE=1 python -B -m unittest discover -s src -p 'test_behavior_observation.py' -v
PYTHONDONTWRITEBYTECODE=1 python -B -O -m unittest discover -s src -p 'test_behavior_observation.py' -v
PYTHONDONTWRITEBYTECODE=1 python -B src/run_owned_observations.py --output /absolute/fresh/owned-observations
```

The last command actually runs eight owned Python emitters; C compilation and
ELF execution are test doubles in the reconstruction-path harness. It does not
add releases or compiler cells. Current receipts and raw observations are under
`results/observation-contract/`; earlier native compiler, public CI, timings,
certificates and negative upstream records remain unchanged. The current host
has no GCC/Clang on PATH or installed WSL; the locked Linux campaigns are not
freshly validated here. Old package/reference audit hashes remain historical;
they do not certify the updated source revision.

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
check errors, and uploads raw outputs even after failure. The retained Ubuntu
24.04 / Python 3.12 run passed the finite model and all 19 record regressions,
and confirmed the bindings of 576 retained outputs. Raw records are retained
in `results/current/`, with the larger finite-model JSON files losslessly
compressed as `.gz`. This is not a fresh compiler or subject-program run.

## Portable path notation

Published execution records use `<PYTHON_ROOT>`, `<NODE_ROOT>` and `<RUNTIME_ROOT>` for local tool installations, `<DEPENDENCIES_ROOT>` for local dependencies, and `<PROJECTS_ROOT>`, `<ARTIFACT_ROOT>`, `<SOURCE_ROOT>` and `<WORK_ROOT>` for the workspace, artifact checkout, source checkout and temporary work directory of the recorded run. These are path aliases, not literal directories or claims that historical temporary files are included in this bundle. Substitute the corresponding local roots when replaying a command. Recorded tool versions, source/input identities, measurements, outcomes and failures are unchanged. Current file inventories bind the portable published bytes; any `recorded_` identity denotes pre-normalization bytes.
