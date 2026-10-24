"""Configurable reviewed-module pilot; separate from the frozen C campaigns.

Executes only retained reviewed graphlib modules and our integer identity
carrier function, in a finite benign domain. No downloads or package installs.
"""
from __future__ import annotations
import argparse
import ast
from contextlib import redirect_stderr, redirect_stdout
import hashlib
import io
import itertools
import json
import marshal
from pathlib import Path
import platform
import statistics
import sys
import time

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "src"))
import tracecert as issuer
import independent_recheck as receiver


def require(ok, reason):
    if not ok:
        raise AssertionError(reason)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def write_json(path, value):
    path.write_bytes(canonical(value) + b"\n")


def build(source):
    return marshal.dumps(compile(source, "<bound-module>", "exec", dont_inherit=True, optimize=0))


def emit(prefix, plan, release, namespace="original"):
    bits = issuer.hamming74_encode_u16(plan["payload"])
    rows, lines = [], ["\ndef _wm(x):"]
    for i, bit in enumerate(bits):
        key = 1000 + i
        rows.append({"position": i, "key": key, "id": f"{namespace}:{i}", "bit": bit})
        if i not in release["erasures"]:
            op, undo = ("^", "^") if bit else ("+", "-")
            lines.append(f"    x = (x {op} {key}) {undo} {key}")
    lines.append("    return x")
    return prefix + "\n".join(lines) + "\n", rows


def extract(source, prefix, manifest):
    # The trusted profile is one exact reviewed prefix, not arbitrary Python.
    if not source.startswith(prefix):
        return [None] * 28, [], ["upstream prefix mismatch"]
    tree = ast.parse(source[len(prefix):])
    errors, observed, ids = [], [None] * 28, []
    if len(tree.body) != 1 or not isinstance(tree.body[0], ast.FunctionDef):
        return observed, ids, ["carrier function shape"]
    function = tree.body[0]
    if (function.name != "_wm" or function.decorator_list or function.returns
            or ast.dump(function.args) != ast.dump(ast.parse("def _wm(x): pass").body[0].args)
            or ast.dump(function.body[-1]) != ast.dump(ast.parse("def f(): return x").body[0].body[0])):
        errors.append("carrier function signature/return")
    seen = set()
    for statement in function.body[:-1]:
        matched = None
        for row in manifest:
            for bit, expr in ((0, f"x = (x + {row['key']}) - {row['key']}"),
                              (1, f"x = (x ^ {row['key']}) ^ {row['key']}")):
                if ast.dump(statement) == ast.dump(ast.parse(expr).body[0]):
                    matched = row, bit
        if matched is None:
            errors.append("unadmitted carrier statement")
            continue
        row, bit = matched
        if row["position"] in seen:
            errors.append("duplicate carrier position")
        seen.add(row["position"])
        observed[row["position"]] = bit
        ids.append(row["id"])
    if len(manifest) != 28 or {r["position"] for r in manifest} != set(range(28)):
        errors.append("manifest positions")
    if len({r["id"] for r in manifest}) != 28 or len({r["key"] for r in manifest}) != 28:
        errors.append("manifest identity/key collision")
    return observed, ids, errors


def oracle(graph):
    remaining, finished, batches = set(graph), set(), []
    while remaining:
        ready = sorted(n for n in remaining if set(graph[n]) <= finished)
        if not ready:
            return "cycle"
        batches.append(ready)
        finished.update(ready)
        remaining.difference_update(ready)
    return batches


def observe(bytecode):
    module, stdout, stderr = {}, io.StringIO(), io.StringIO()
    with redirect_stdout(stdout), redirect_stderr(stderr):
        exec(marshal.loads(bytecode), module)
        records = []
        edges = [(i, j) for i in range(3) for j in range(3) if i != j]
        for mask in range(64):
            graph = {i: [j for k, (n, j) in enumerate(edges) if n == i and mask & (1 << k)]
                     for i in range(3)}
            sorter = module["TopologicalSorter"](graph)
            try:
                sorter.prepare()
            except module["CycleError"] as error:
                cycle = error.args[1]
                require(cycle[0] == cycle[-1] and all(a in graph[b] for a, b in zip(cycle, cycle[1:])),
                        "invalid cycle witness")
                actual = "cycle"
            else:
                actual = []
                while sorter.is_active():
                    batch = sorted(sorter.get_ready())
                    actual.append(batch)
                    sorter.done(*batch)
            records.append({"mask": mask, "actual": actual, "expected": oracle(graph)})
        markers = [module["_wm"](x) for x in (0, 255)]
    return {"graphs": records, "marker_outputs": markers,
            "stdout": stdout.getvalue(), "stderr": stderr.getvalue()}


def issue(out, plan, release, parents, namespace="original"):
    prefix = (HERE / plan["upstream"][release["upstream"]]["file"]).read_text(encoding="utf-8")
    source, manifest = emit(prefix, plan, release, namespace)
    folder = out / release["id"]
    folder.mkdir()
    (folder / "module.py").write_text(source, encoding="utf-8", newline="\n")
    (folder / "module.code").write_bytes(build(source))
    write_json(folder / "manifest.json", manifest)
    write_json(folder / "observations.json", observe((folder / "module.code").read_bytes()))
    cert = {"id": release["id"], "plan_sha256": digest(canonical(plan)),
            "parents": {name: digest((out / name / "certificate.json").read_bytes()) for name in parents},
            "bindings": {name: digest((folder / name).read_bytes()) for name in
                         ("module.py", "module.code", "manifest.json", "observations.json")}}
    write_json(folder / "certificate.json", cert)


def reconstruct(out, plan, target):
    completed, active = {}, set()
    releases = {r["id"]: r for r in plan["releases"]}
    def visit(name):
        if name in completed:
            return completed[name]
        require(name not in active, "cyclic trusted plan")
        active.add(name)
        release = releases[name]
        parents = {n: visit(n) for n in release["parents"]}
        folder = out / name
        cert = json.loads((folder / "certificate.json").read_bytes())
        retained = {n: (folder / n).read_bytes() for n in
                    ("module.py", "module.code", "manifest.json", "observations.json")}
        integrity = cert["plan_sha256"] == digest(canonical(plan)) and cert["bindings"] == {
            n: digest(data) for n, data in retained.items()}
        upstream = plan["upstream"][release["upstream"]]
        prefix_bytes = (HERE / upstream["file"]).read_bytes()
        integrity = integrity and digest(prefix_bytes) == upstream["sha256"]
        manifest = json.loads(retained["manifest.json"])
        source = retained["module.py"].decode("utf-8")
        symbols, ids, errors = extract(source, prefix_bytes.decode("utf-8"), manifest)
        expected = receiver.encode_u16(plan["payload"])
        source_ok = not errors and all(r["bit"] == expected[r["position"]] for r in manifest)
        decoded = receiver.decode_u16(symbols)
        recovery = decoded["status"] == "CERTIFIED_UNIQUE" and decoded["payload_hex"] == f"{plan['payload']:04x}"
        fresh_code = build(source)
        reproduction = fresh_code == retained["module.code"]
        # Execute fresh reconstruction, never substitute the retained output.
        fresh = observe(fresh_code) if source_ok else None
        behavior = (fresh is not None and all(r["actual"] == r["expected"] for r in fresh["graphs"])
                    and fresh["marker_outputs"] == [0, 255] and not fresh["stdout"] and not fresh["stderr"])
        integrity = integrity and fresh == json.loads(retained["observations.json"])
        continuity = {n: len(set(p["manifest_ids"]) & set(ids)) for n, p in parents.items()}
        lineage = (cert["parents"] == {n: digest((out / n / "certificate.json").read_bytes()) for n in parents}
                   and all(p["decision"] == "PASS" for p in parents.values()))
        vector = {"behavior": behavior, "recovery": recovery,
                  "continuity": all(n >= plan["minimum_parent_carriers"] for n in continuity.values()),
                  "source_conformance": source_ok, "executable_reproduction": reproduction,
                  "integrity": integrity, "lineage": lineage}
        # Strong same-information composition uses actual reconstructed objects.
        # Its digest lineage is not a signature/authentication implementation.
        composed = all(vector[n] for n in ("behavior", "recovery", "source_conformance",
                                           "executable_reproduction", "integrity", "lineage"))
        result = {"relations": vector, "decision": receiver.typed_decision(vector.values()),
                  "composed_decision": "PASS" if composed else "REJECT",
                  "closure_complete_composition": "PASS" if composed and vector["continuity"] else "REJECT",
                  "mapped_per_parent": continuity, "manifest_ids": [r["id"] for r in manifest],
                  "source_errors": errors, "decode": decoded}
        active.remove(name)
        completed[name] = result
        return result
    result = visit(target)
    return {"target": result, "reconstructed_nodes": list(completed)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--tex", required=True, type=Path)
    args = parser.parse_args()
    out = args.output.resolve()
    require(not out.exists(), "output must be new")
    out.mkdir(parents=True)
    plan = json.loads((HERE / "plan.json").read_bytes())
    write_json(out / "plan.json", plan)
    for r in plan["releases"]:
        issue(out, plan, r, r["parents"])
    results = {}
    for name in ("base", "upgrade", "branch", "merge"):
        results[name] = reconstruct(out, plan, name)
        require(results[name]["target"]["decision"] == "PASS", "intended release rejected")
    # Coherent owned complete-reissue operation on the new merge, not a label
    # interpreted by either gate. Refreshes all source, code, outputs and hashes.
    control = {**plan["releases"][-1], "id": "reissued", "erasures": []}
    changed_plan = {**plan, "releases": plan["releases"] + [control]}
    # Same frozen policy/plan: add the release candidate before issuing bindings.
    # Reissue records are a separate run rooted in their own complete graph.
    controls = out / "coherent-reissue"
    controls.mkdir()
    for r in changed_plan["releases"]:
        issue(controls, changed_plan, r, r["parents"], "replacement" if r["id"] == "reissued" else "original")
    bad = reconstruct(controls, changed_plan, "reissued")
    require(bad["target"]["composed_decision"] == "PASS" and bad["target"]["decision"] == "REJECT",
            "reissue must differ at continuity")
    require([n for n, v in bad["target"]["relations"].items() if not v] == ["continuity"], "wrong rejection witness")
    repair = {**control, "id": "repaired"}
    repair_plan = {**plan, "releases": plan["releases"] + [repair]}
    repaired = out / "repair"
    repaired.mkdir()
    for r in repair_plan["releases"]:
        issue(repaired, repair_plan, r, r["parents"])
    fixed = reconstruct(repaired, repair_plan, "repaired")
    require(fixed["target"]["decision"] == "PASS", "repair did not pass")
    samples = []
    for _ in range(9):
        start = time.perf_counter()
        reconstruct(out, plan, "merge")
        samples.append(1000 * (time.perf_counter() - start))
    evidence_bytes = sum(p.stat().st_size for p in out.iterdir() if p.is_file()) + sum(
        p.stat().st_size for r in plan["releases"] for p in (out / r["id"]).iterdir())
    report = {"status": "PASS", "scope": "Reviewed full graphlib modules; controlled instrumentation/branch/reissue, not observed CPython release practice",
              "environment": {"python": sys.version, "platform": platform.platform()},
              "intended": results, "coherent_reissue": bad, "repair": fixed,
              "full_merge_recheck_ms": samples, "median_full_merge_recheck_ms": statistics.median(samples),
              "retained_four_node_evidence_bytes": evidence_bytes,
              "integration_work": {"trusted_plan_records": len(plan["releases"]),
                  "new_profile_implementations": 1, "new_oracles": 1,
                  "independent_user_minutes": None, "actual_work": "review two upstream modules; configure four nodes/parents, payload, threshold and profile; implement Python carrier grammar, bytecode profile and topological oracle"}}
    write_json(out / "report.json", report)
    text = (f"The four-node merge closure retains {evidence_bytes:,} bytes. Nine fresh full-closure checks "
            f"take a median {statistics.median(samples):.2f} ms on {platform.python_implementation()} {platform.python_version()} "
            "on Windows; each reopens and recompiles four modules and checks 64 graphs per module. "
            "These are same-process measurements, not C-toolchain timings or incremental speedups.\n")
    args.tex.write_text(text, encoding="utf-8", newline="\n")
    print(json.dumps({"status": "PASS", "median_ms": statistics.median(samples), "bytes": evidence_bytes,
                      "reissue_composed": bad["target"]["composed_decision"], "reissue_protocol": bad["target"]["decision"],
                      "repair": fixed["target"]["decision"]}))


if __name__ == "__main__":
    main()
