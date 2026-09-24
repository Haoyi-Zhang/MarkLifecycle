# Upstream source validation

This layer compiles the exact jsmn source bytes from commit
`fdcef3ebf886fa210d14956d3c068a653e76a24e` and its first parent
`18e9fe42cbfe21d65076f5c77ae2be379ad1270f`. The retained Git blob hashes
are checked before compilation. A shared driver evaluates 24 fixed JSON inputs
under default, strict, parent-link, and strict-parent configurations with GCC
and Clang at `-O0` and `-O2`.

The purpose is to test whether the routine-level adapter used in the public
maintenance stratum transfers to one exact upstream implementation. This is a
source-grounding check, not a whole-repository build and not a claim that all
seven public subjects have been validated at repository scale.

Run from the project root:

```sh
python3 artifact/upstream-validation/src/run_validation.py --root .
python3 artifact/upstream-validation/src/independent_recheck.py --root .
```
