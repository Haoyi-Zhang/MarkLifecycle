# Proof record for TSE-01

The manuscript contains the theorem statements and human-readable proofs. This
record expands the assumptions and connects each result to executable evidence.
No result is claimed as mechanically proved.

## Unique completion-stable lift

For a partial evidence vector, sound acceptance requires every Boolean
completion to satisfy the seven-way conjunction, which happens only when every
coordinate is true. Sound rejection requires every completion to violate the
conjunction, which happens exactly when at least one coordinate is false. All
remaining vectors have no false coordinate and at least one unknown, so both an
accepting and a rejecting completion exist; hold is therefore forced. Any more
decisive sound completion-stable rule would have to decide one of these mixed
completion sets and would be unsound.

## Complete partition and refinement stability

The seven-relation state space has 3^7=2,187 vectors. Exactly one is all true.
There are 2^7-1=127 vectors containing only true and unknown coordinates with at
least one unknown; these are holds. The remaining 2,059 contain a false
coordinate and are rejects. Refining unknown coordinates cannot remove an
already false relation or change the all-true vector, and a held vector can
resolve only to pass, hold, or reject according to the same rule.

## Unique bounded recovery

For two codewords at distance at least d, an observation with e wrong known
symbols and s erased symbols cannot place a competitor at least as close as the
transmitted word when 2e+s<d. On known coordinates their mutual distance is at
least d-s. The competitor's distance to the observation is therefore at least
d-s-e, strictly greater than the transmitted word's distance e. This is unique
nearest recovery, not literal agreement with every observed symbol when e>0.
Both artifact decoders enumerate all sixteen
Hamming codewords independently and require a unique minimizer plus this bound.

## Block locality

Two erasures split across two distance-three blocks satisfy the bound in each
block. One error plus one erasure in one block reaches 2e+s=3 and permits a tie.
The two states can expose the same global number of carriers. Therefore recovery
must retain the block partition.

## Ancestry lower bound

At an accepted edge at most n-q predecessor identities disappear. Under stable
identity and no resurrection, the worst case removes previously surviving
origin identities at every edge. After k edges no more than k(n-q) origin
identities have disappeared, giving max(0,n-k(n-q)).

## No retroactive strengthening

The policy digest is part of canonical certificate bytes and the predecessor
check. Changing policy changes the object. Reusing the old predecessor breaks
the link; replacing history creates new certificates. A bridge exposes rather
than hides the change.

## Finite ancestry-subgraph validity

For every named parent, the checker resolves the exact canonical digest and
requires an accepted parent with a compatible policy or explicit bridge. During
depth-first reconstruction, a digest repeated on the active path is a cycle; a
digest completed on another branch is memoized and may be reused. Thus a diamond
merge with one shared ancestor is accepted, whereas cycles, missing or rejected
parents, and unbridged policy mismatches reject. Reachable-closure topological
sorting independently checks the same six graph fixtures.

## Sound shared-ancestor reuse

Reconstruction of one certificate under one bound policy is deterministic and
bound to canonical certificate and policy digests. Once that result has been
completed, a second incoming edge to the same digest may reuse it without
changing the reconstructed relation vector. The second edge must still verify
its own named digest, policy compatibility, and bridge conditions. A digest
encountered again before completion remains on the active path and therefore
rejects as a cycle.

## Accepted-parent admissibility

A parent digest authenticates only the named certificate bytes. Lineage also
reconstructs the parent decision under its bound policy. If a parent holds, a
required premise for the successor remains unresolved; if it rejects, a named
lineage premise is false. Requiring every parent to pass, match its digest, and
satisfy the edge policy preserves the induction used by the finite ancestry
subgraph theorem. The rejected-parent graft substitutions exercise this rule in
both software strata.

## Conditional finite-contract soundness

Under collision resistance, faithful deterministic tool execution, correct
checker execution, honest issuance, and the declared finite scope, the verifier
rebuilds every compiler cell and compares fresh executable bytes, fresh and
retained outputs, and independently reconstructed references. It also reparses
carriers, enumerates decoder candidates, recomputes parent-relative identity
intersections, rehashes all evidence, and follows every canonical parent digest.
These are the seven conjuncts. The conclusion is complete only for the declared
cases and compiler cells.

## Minimal relation basis

For each relation r, the frozen control corpus contains a vector whose only
false coordinate is r. Any subset gate omitting r accepts that vector. Hence
every proper subset has a false accept, while the full conjunction rejects all
seven isolating controls. Enumeration of all 128 subsets independently checks
this argument.

## Contract strengthening

Adding cases, compiler cells, bindings, or predecessor obligations adds
conjuncts while release bytes remain fixed and every original obligation and
its interpretation is retained. The strengthened gate is A'=A AND Q, so false
A cannot become true A'. Changing a reference, the expected inventory, or a
parent interpretation is a policy replacement rather than pure strengthening;
fixed release bytes alone do not establish this premise.

## Module substitution

A conservative replacement supplies the same semantic premise for its one
relation and reports undecided outcomes as unknown. Binding its identity and
assumptions yields a new policy object, so the conditional soundness proof
continues for new certificates without reinterpreting old ones.

## Sound incremental reuse

A relation module is deterministic on its complete declared input tuple. If a
prior result is bound to that tuple and the dependency closure, module identity,
and policy digest are byte-identical, re-evaluation returns the same coordinate.
Every coordinate whose closure changed is reconstructed by the full rule. The
incremental and full vectors therefore agree pointwise and induce the same typed
decision. Reusing a top-level verdict or an incompletely bound dependency set
does not satisfy the premise.
