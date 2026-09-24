# Reproducibility artifact

This artifact reconstructs the evidence reported in the manuscript. Run the
complete pipeline from the project root:

```sh
./artifact/run_all.sh
```

The pipeline executes four evidence surfaces:

1. exhaustive enumeration of the seven-relation three-valued decision model;
2. exhaustive finite-contract evaluation over twelve deterministic C subjects,
   including twelve two-parent merge releases;
3. replay of seven immutable public maintenance changes through bounded
   routine-level adapters and independent checkers; and
4. an exact-source transfer check for one jsmn commit and its direct parent.

The exact-source check retains the three Git blobs needed by the jsmn core,
rebuilds 32 compiler/configuration cells, and executes 768 observations. It
confirms equality on the adapter's declared sixteen-input contract and exposes
two strict-mode differences outside that contract. It is a transfer-validity
check for one core library history, not a seven-repository whole-build study.

`results_manifest.csv` binds commands, environments, inputs, outputs, and
rechecks. `claim_evidence_ledger.csv` maps manuscript claims to evidence.
`correctness_correspondence.csv` maps formal statements to executable checks.
`external_resources.csv` records toolchains, public commits, licences, and the
exact-source snapshot. `local_execution_gaps.json` states the remaining
whole-repository boundary.

The public artifact contains the current sources, evidence, audits, and results
needed to reconstruct the reported claims.

## Current decision accounting

The gate-model checker rejects five aggregate mutations. The finite independent
checker rejects fourteen semantic substitutions, and the commit-derived checker
rejects ten coherent substitutions. Across both software strata there are zero
unresolved holds, 43 diagnostic or adverse rejections, and twenty-four coherent
substitutions rejected by reconstruction.
