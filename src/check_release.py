#!/usr/bin/env python3
"""Reconstruct one finite release and its parents without reissuing certificates."""
from __future__ import annotations

import argparse
import json
from pathlib import Path
import tempfile

import independent_recheck as checker


def invalid_report(message: str) -> dict:
    values = {name: None for name in checker.RELATION_NAMES}
    values["integrity"] = False
    return {"verdict": "REJECT", "valid": False, "errors": [message],
            "unavailable": [], "relations": {
                name: {"passed": value, "state": checker.relation_state(value)}
                for name, value in values.items()}}


def check_release(root: Path, kernel: str, variant: str) -> dict:
    """Read the mandatory closed inventory, then reconstruct in parent order.

    Missing/malformed retained objects reject. An unavailable *fresh* locked
    compiler or unresolved fresh parent may hold. No stored decision is trusted
    as current acceptance, and no historical receipt is modified.
    """
    if kernel not in checker.KERNELS or variant not in checker.VARIANT_PARENTS:
        return invalid_report("unknown finite release")
    closure: set[str] = set()

    def include(name):
        for parent in checker.VARIANT_PARENTS[name]:
            include(parent)
        closure.add(name)

    include(variant)
    order = [name for name in checker.VARIANT_PARENTS if name in closure]
    certs, manifests, findings = {}, {}, {}
    try:
        environment = json.loads((root / "artifact/environment.json").read_text(encoding="utf-8"))
        if not isinstance(environment, dict):
            return invalid_report("environment is not an object")
        for name in order:
            cert = json.loads((root / f"artifact/certificates/{kernel}/{name}.json").read_text(encoding="utf-8"))
            manifest = json.loads((root / f"artifact/benchmark/generated/{kernel}/{name}/watermark_manifest.json").read_text(encoding="utf-8"))
            if not isinstance(cert, dict) or not isinstance(manifest, dict):
                return invalid_report("certificate or manifest is not an object")
            if cert.get("kernel") != kernel or cert.get("variant") != name:
                return invalid_report("named certificate identity mismatch")
            certs[kernel, name], manifests[kernel, name] = cert, manifest
        references = {kernel: checker.reference_table(kernel)}
        with tempfile.TemporaryDirectory(prefix="marklifecycle-release-") as directory:
            for name in order:
                sink = {}
                checker.validate_certificate(
                    root, certs[kernel, name], certs, manifests, references,
                    environment, replay_root=Path(directory),
                    parent_validations={parent: findings[parent] for parent in checker.VARIANT_PARENTS[name]},
                    reconstruction_sink=sink, availability_aware=True)
                findings[name] = sink
    except (OSError, ValueError, KeyError, TypeError, AttributeError, IndexError):
        # These exceptions describe unreadable/malformed closed records, not an
        # unavailable compiler. Do not silently turn a corrupt package into HOLD.
        return invalid_report("mandatory retained record unreadable or malformed")
    return {**findings[variant], "kernel": kernel, "variant": variant,
            "reconstructed_releases": order, "parents": {
                name: {"verdict": result["verdict"], "valid": result["valid"]}
                for name, result in findings.items() if name != variant}}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, required=True,
                        help="workspace containing artifact/")
    parser.add_argument("--kernel", required=True, choices=checker.KERNELS)
    parser.add_argument("--variant", required=True, choices=list(checker.VARIANT_PARENTS))
    args = parser.parse_args()
    report = check_release(args.root.resolve(), args.kernel, args.variant)
    print(json.dumps(report, indent=2, sort_keys=True))
    return {"PASS": 0, "REJECT": 1, "HOLD": 2}[report["verdict"]]


if __name__ == "__main__":
    raise SystemExit(main())
