# Exhaustive gate-space and finite-parent model check

This layer evaluates the seven-relation release rule independently of any
software subject. The primary checker enumerates all 2,187 ternary evidence
vectors, their 16,384 Boolean completions, all 128 relation-subset conjunctions,
all seven isolating controls, and all 127 nonempty failure sets.

It also checks six finite-parent graphs. Active-path depth-first traversal with
memoized completed nodes accepts a diamond merge with one shared ancestor and an
explicit policy bridge; it rejects a cycle, a missing parent, a rejected parent,
and an unbridged policy mismatch. A repeated node is a cycle only while that node
is active on the current path. Reuse of an already validated ancestor from a
completed branch is legal DAG structure.

The independent checker imports neither implementation. It uses signed ternary
arithmetic and subset cardinality identities for the gate, then reconstructs the
reachable parent closure and applies Kahn topological sorting. It additionally
executes a deliberately wrong global-seen validator; that mutant rejects the
valid diamond and is therefore exposed by the fixture.

The independent checker reconstructs each recorded vector, its completion
count and outcomes, all subset memberships, each failure-set record, and every
isolating control rather than accepting their aggregate counts alone. A bounded
record-consistency regression creates one valid model and 19 individually
inconsistent records in a fresh directory outside the artifact:

```sh
python3 -B gate-model/src/test_gate_records.py --out /tmp/gate-record-check
```

These JSON-only cases do not rebuild software releases or change the five
historical aggregate model mutations. The graph bridge fixture models edge
authorization as an input; it is not a reconstruction of a dual-policy software
bridge certificate.
