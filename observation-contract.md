# Behavior observations and release diagnosis

The behavior relation compares the complete declared process observation:
stdout matches the reference, exit status is zero and diagnostics are empty.
Byte equality alone cannot discharge a normal-termination or diagnostic
obligation. This is an ordinary explicit test oracle, not a new equivalence
algorithm; the response/observation distinction is discussed in
[Barr et al., Section 2](https://philmcminn.com/publications/barr2015.pdf).

The project independent checker formerly tested only stdout for behavior.
The finite checker and finite issuer also omitted empty diagnostics in their
behavior aggregate. Other checks could reject such runs, but the behavior
coordinate itself could remain true, losing the right failure witness. The
correction preserves independent implementations and leaves reproduction,
integrity and lineage obligations intact.

## Current controlled results

`results/observation-contract/commands/` retains the actual ordinary and optimized
red/green receipts. Eight reconstruction-path controls first give three failures:
finite diagnostic, project diagnostic and project nonzero exit. After repair,
all eight pass in each mode. Two additional issuer-path controls exercise the
real aggregate and certificate construction with explicit compilation doubles,
stopping before campaign summaries. The same two issuer controls against the
byte-verified original issuer produce one diagnostic failure in each mode; the
clean control passes. The larger reviewed selection has 31 passing methods in
ordinary and `python -O` modes, including all 172 current source/
manifest pairs, typed evidence vectors, availability projections, parent-policy
and source-module-cache checks. These are unit/module checks, not native C
release replays or evidence that HOLD is uniformly propagated by entrypoints.

`results/observation-contract/native/observations.json` and its exact stdout/stderr
files retain eight actual owned Python subprocess outcomes: clean, wrong output,
nonzero exit and diagnostic
for each of two retained reference byte corpora. Each observation is passed
through the real checker code using the unit harness's compilation and ELF
execution doubles. Thus native execution means the Python emitter only; zero
C compiler cells or new release certificates are counted. The recorded wall
time measures emitter startup, I/O and exit, not full lifecycle cost. No speedup
or independent second implementation of the whole runtime is inferred.

`results/observation-contract/historical-observation-recount.json` reopens all 688
retained finite/project outputs, their recorded return/diagnostic evidence, and
Python reference bytes.
All retained observations are quiet zero-exit runs, so corrected behavior
classification and the stored certificate tally of 129 pass / 43 reject are
unchanged; the other relations and full lineage were not freshly reconstructed.
It also parses
32 historical upstream output records (768 observations), preserving strict-mode
differences for cases 22/23. This is a byte/record recount, not upstream execution.
The 576 finite stdout bindings separately pass the existing passive closure check.
All original raw results, certificates, compiler timings and CI receipts remain.

## Already current source boundary

All four source-admission paths scan preprocessor directives in the lexical view
after a single leading BOM is blanked. A new benign guard checks an unused
object-like directive with and without BOM; both remain outside the issued
profile. No helper rebinding, compiled bypass, malicious payload or exploit is
constructed. Interior active-code U+FEFF remains rejected, Unicode comments/
literals remain admitted, and raw byte hashes are not normalized. This confirms
the existing repair rather than claiming a new macro-admission defect.

## Lifecycle and measurement boundaries

The current reconstruction entrypoints still may reject or raise on unavailable
inputs; relation-vector availability projections are not end-to-end HOLD runs.
The threshold-26-to-25 record recomputes continuity only, not all target-policy
relations, and is not an accepted dual-policy release. Source-module exact-input
memoization (56/28 calls) remains a test harness, not full-certificate incremental
verification or a speed result. Original trust, issuance, hash, parent and finite
contract assumptions are preserved. No new release count or native fulltext/
production/novelty/acceptance claim is made.

The current environment is Windows / Python 3.12.14, with no GCC/Clang on PATH
and no installed WSL. The retained compiler policy instead locks Linux x86_64,
GCC Debian 14.2.0-19 and Clang 17.0.0. No tool was installed and no locked C
campaign or fresh public CI was performed.
`results/observation-contract/bindings.json` binds the current
source/input bytes, environment and scope; broad command source snapshots are
not function coverage.
