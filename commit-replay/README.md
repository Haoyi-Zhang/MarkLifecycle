# Commit-derived replay layer

This layer replays seven immutable public maintenance changes through bounded,
routine-level C adapters. It does not claim to build or verify the complete
upstream repositories. Each subject has four versions: before, after, a
successor with two tolerated carrier erasures, and one adverse release that
isolates exactly one certificate relation. Every release binds a canonical
policy object; normal lineage requires parent and child policy identity.

Run `python3 src/run_commit_replay.py --root ../..` to rebuild all sources,
manifests, policies, 112 compiler cells, outputs, assembly files, certificates,
baselines, ablations, threshold scans, and leave-one-project-out results. Run
`python3 src/independent_recheck.py --root ../..` for an implementation-
independent reconstruction, including a silent policy-change substitution.
