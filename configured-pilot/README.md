# Declarative full-module pilot

From the artifact root:

```
python -B configured-pilot/run.py --output /fresh/pilot --tex /fresh/pilot-cost.tex
```

The output directory must not exist. The TeX paragraph is consumed by the paper
as `paper/configured-pilot-cost.tex`; current evidence is in `current-results/`.
The unchanged `results/` directory is the historical first-version record, not
a measurement of the current verifier. Nine
actual same-process full four-node reconstructions are measured with
`perf_counter`; source/bytecode/manifest/output/certificate files determine the
reported retained-byte total. No data from the old C campaigns are rewritten.

The current report binds the verifier, codec implementations, plan and upstream
sources. `historical-measurement.json` separately identifies the original nine
timings (median 124.96 ms) and their exact pre-followup entrypoint,
`measured-source.py`. That preimage is consumed by regression tests which
reproduce the old missing/wrong-ID acceptance and baseline-parent coupling;
it is not a recommended verifier. The historical binding was added in this
followup from the inherited work tree; it is not a retroactively recorded
measurement-harness receipt. Fresh reports and the paper use new samples.

The `plan.json` fields are issuer decisions, not automatically discovered
truth: source snapshot/hash, parent graph, payload, threshold and profile.
The verifier reconstructs behavior, source grammar, recovery, bytecode bytes,
retained bindings, mapped identities and parent decisions. Issuer Hamming
encoding and receiver decoding use the existing separate implementations.
The pilot's Python source profile and execution harness are new and reviewed;
this is not a general sandbox for arbitrary third-party code.
The certificate ID must equal the plan-selected node; absence or mismatch
falsifies integrity, and every workflow rejects it.

## Upstream and modifications

The two complete `Lib/graphlib.py` snapshots are from official CPython tags
v3.9.0 and v3.11.0. Both complete modules were read before execution; their
top level defines graph classes and the latter imports `types.GenericAlias`.
No package is installed. Retrieved text is normalized to LF and one terminal
newline, with local SHA-256 identities in the plan; no exact Git-blob claim is
made. PSF copyright and full upstream LICENSE are retained in `upstream/LICENSE`.

The real upstream evolution includes doc fixes and adding generic-alias
support. Our instrumentation appends `_wm`, an integer identity function with
28 carrier statements. The branch, merge, erasures, complete reissue and repair
are controlled owned operations, not retrieved CPython maintenance events.
The two source versions are executed by the current interpreter. Only the
declared topological-sort domain, not generic-alias API equivalence, is checked.

## Fair comparison and use

All workflows read the same files, source profile, oracle and trusted plan.
The component composition reconstructs detection, regression, source conformance,
reproducible bytecode, inventory and parent digest lineage. It does not implement
signatures. The seven-relation protocol additionally requires carrier continuity
on every parent. Its reissue rejection locates 0/28 mapped identities on each
edge. A composition augmented with that obligation agrees exactly. No automatic
advantage over an equally complete composition is claimed.

Parent digest equality is checked in every workflow, but parent acceptability
is reconstructed separately. The component composition requires its own
six-obligation parent decisions, the protocol requires protocol decisions,
and closure-complete composition recursively requires all seven of its own
conditions. In the new successor and continuation, 28/28 replacement identities
map locally: component composition passes, while protocol and complete
composition reject because their rejected ancestor cannot anchor lineage.
Neither composition consumes the protocol verdict as a premise.

`current-results/identity-controls/` retains exact wrong/missing-ID candidate
certificates; their rejection results are in `current-results/report.json`.
The coherent-reissue and repair subdirectories retain their own trusted plans.
The same regression cases run with assertions enabled or optimized away:

```
python -B -S -m unittest discover -s configured-pilot -p test_pilot.py -v
python -B -O -S -m unittest discover -s configured-pilot -p test_pilot.py -v
```

The repair restores original identity assignments and performs a fresh issuance
of the closure under its explicit candidate plan; it does not secretly modify
past certificates. Plans for the normal, adverse and repaired candidate graphs
are distinct trusted inputs. The producer issues records from these operations;
the verifier never branches on adverse labels or expected verdicts.

The integration work is inspectable: two reviewed snapshots, one new Python
profile, one independent graph oracle, and four release declarations. No
independent-adopter time or human-review outcome was measured. This is a
portable module pilot, not an independent external adoption or whole-CPython
build. `module.code` is deterministic marshalled current-interpreter bytecode,
not a native executable or a cross-version portable cache format.
