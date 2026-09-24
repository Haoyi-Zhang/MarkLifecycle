#!/usr/bin/env python3
"""Independent reconstruction of the TSE-01 commit-derived replay layer.

This checker deliberately imports neither the primary replay generator nor any
of its helper functions.  It independently rebuilds the seven reference
contracts, parses carrier observations, decodes recovery blocks, reconstructs
predecessor identity, recompiles all 112 compiler cells, reexecutes retained
and rebuilt executables, verifies certificate links and hashes, and rejects
semantic certificate substitutions after their outer self-hashes are refreshed.
"""
from __future__ import annotations

import argparse
import concurrent.futures
import copy
import errno
import hashlib
import json
import platform
import re
import os
import subprocess
import tempfile
import time
from pathlib import Path
from typing import Any, Sequence

CERT_SCHEMA = "tse01.commit-replay.certificate.v3"
TOOLCHAINS = [("gcc", "-O0"), ("gcc", "-O2"), ("clang", "-O0"), ("clang", "-O2")]
PROJECTS = {
    "A": {"cases": 16, "control": "source_conformance"},
    "B": {"cases": 65536, "control": "continuity"},
    "C": {"cases": 144, "control": "behavior"},
    "D": {"cases": 65, "control": "recovery"},
    "E": {"cases": 4112, "control": "executable_reproduction"},
    "F": {"cases": 65536, "control": "integrity"},
    "G": {"cases": 65536, "control": "lineage"},
}
VERSIONS = ["before", "after", "tolerated", "adverse"]
TRACE_THRESHOLD = 26
POLICY_SCHEMA = "tracecert.policy.v1"
POLICY_CANONICALIZATION = "sorted-key-ascii-json-v1"
COMPILE_FLAGS = ["-std=gnu11", "-fno-ident", "-fno-asynchronous-unwind-tables", "-fno-unwind-tables", "-Wl,--build-id=none"]
HEX64 = re.compile(r"^[0-9a-f]{64}$")
A_CASES = [
    "{}", "[]", "{\"a\":1}", "[1,2,3]", "{\"a\":[true,false,null]}",
    "{\"s\":\"x\\\\y\"}", " [ { } ] ", "{\"n\":-12}",
    "{", "]", "{\"a\":", "\"unterminated", "[1,", "{\"a\" 1}", "", "null",
]
RELATION_NAMES = (
    "behavior", "recovery", "continuity", "source_conformance",
    "executable_reproduction", "integrity", "lineage",
)
TRUE_STATE = "ESTABLISHED_TRUE"
FALSE_STATE = "ESTABLISHED_FALSE"
UNKNOWN_STATE = "UNRESOLVED"


def relation_state(passed: bool | None) -> str:
    if passed is True:
        return TRUE_STATE
    if passed is False:
        return FALSE_STATE
    return UNKNOWN_STATE


def typed_decision(values: Sequence[bool | None]) -> str:
    if any(value is False for value in values):
        return "REJECT"
    if all(value is True for value in values):
        return "PASS"
    return "HOLD"


def sha_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for block in iter(lambda: f.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def canonical_hash(value: Any) -> str:
    return sha_bytes(json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode("ascii"))


def add_self_hash(cert: dict[str, Any]) -> dict[str, Any]:
    out = copy.deepcopy(cert)
    out.pop("certificate_sha256", None)
    out["certificate_sha256"] = canonical_hash(out)
    return out


def expected_project_policy(alias: str, environment: dict[str, Any], required_count: int = TRACE_THRESHOLD, *, policy_id: str | None = None) -> dict[str, Any]:
    return {
        "schema": POLICY_SCHEMA,
        "policy_id": policy_id or f"project:{alias}:v1",
        "layer": "commit-derived-routine-replay",
        "behavior": {
            "contract_id": f"project-{alias}-bounded-adapter-v1",
            "case_count": PROJECTS[alias]["cases"],
            "reference_semantics": "independent-deterministic-enumeration-v1",
        },
        "compiler_cells": [
            {
                "compiler": compiler,
                "version": environment[compiler],
                "optimization": optimization,
                "compile_flags": COMPILE_FLAGS,
                "assembly_method": "objdump-d-w",
            }
            for compiler, optimization in TOOLCHAINS
        ],
        "watermark": {
            "payload_bits": 16,
            "code": "four-independent-Hamming-7-4-blocks",
            "minimum_distance": 3,
            "unique_recovery_condition": "2e+s<3-per-block",
        },
        "source_profiles": {
            "accepted": ["wm-helper-v1", "wm-helper-v2"],
            "inventory_rule": "exact-issued-carrier-accounting",
        },
        "continuity": {
            "baseline_count": 28,
            "required_count": required_count,
            "scope": "immediate-predecessor-issued-identities",
        },
        "evidence_inventory": list(RELATION_NAMES),
        "decision": {
            "rule": "false-dominates-unresolved-conjunction-v1",
            "pass": "all-relations-established-true",
            "reject": "any-relation-established-false",
            "hold": "no-false-and-at-least-one-unresolved",
        },
        "canonicalization": {
            "policy": POLICY_CANONICALIZATION,
            "certificate": POLICY_CANONICALIZATION,
        },
    }


def validate_policy_binding(root: Path, cert: dict[str, Any], alias: str, environment: dict[str, Any], parent_cert: dict[str, Any] | None) -> tuple[bool, list[str]]:
    errors: list[str] = []
    expected_rel = f"artifact/commit-replay/policies/{alias}.json"
    expected_policy = expected_project_policy(alias, environment)
    expected_hash = canonical_hash(expected_policy)
    binding = cert.get("policy", {})
    if not isinstance(binding, dict) or set(binding) != {"path", "policy_id", "file_sha256", "canonical_sha256"}:
        errors.append("policy binding fields mismatch")
        binding = {}
    if binding.get("path") != expected_rel:
        errors.append("policy path mismatch")
    if binding.get("policy_id") != expected_policy["policy_id"]:
        errors.append("policy identifier mismatch")
    policy_path = root / expected_rel
    actual_policy = None
    if not policy_path.is_file():
        errors.append("policy file missing")
    else:
        try:
            actual_policy = read_json(policy_path)
        except (OSError, json.JSONDecodeError):
            errors.append("policy file is not valid JSON")
        if binding.get("file_sha256") != sha_file(policy_path):
            errors.append("policy file hash mismatch")
        if actual_policy is not None and binding.get("canonical_sha256") != canonical_hash(actual_policy):
            errors.append("policy canonical hash mismatch")
        if actual_policy != expected_policy:
            errors.append("policy content mismatch")
    if binding.get("canonical_sha256") != expected_hash:
        errors.append("policy expected digest mismatch")
    expected_parent_policy = None if parent_cert is None else parent_cert.get("policy", {}).get("canonical_sha256")
    if cert.get("parent_policy_canonical_sha256") != expected_parent_policy:
        errors.append("parent policy digest mismatch")
    compatible = parent_cert is None or binding.get("canonical_sha256") == expected_parent_policy
    if cert.get("policy_compatible") is not compatible:
        errors.append("stored policy compatibility mismatch")
    return compatible, errors


def read_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def hamming_word(bits: Sequence[int]) -> list[int]:
    d1, d2, d3, d4 = bits
    return [d1 ^ d2 ^ d4, d1 ^ d3 ^ d4, d1, d2 ^ d3 ^ d4, d2, d3, d4]


def decode_block(observed: Sequence[int | None]) -> dict[str, Any]:
    erasures = sum(value is None for value in observed)
    scored: list[tuple[int, tuple[int, ...]]] = []
    for value in range(16):
        bits = tuple((value >> shift) & 1 for shift in (3, 2, 1, 0))
        code = hamming_word(bits)
        errors = sum(actual is not None and actual != expected for actual, expected in zip(observed, code))
        scored.append((errors, bits))
    minimum = min(row[0] for row in scored)
    winners = [row for row in scored if row[0] == minimum]
    within = 2 * minimum + erasures < 3
    if len(winners) == 1 and within:
        return {"status": "CERTIFIED_UNIQUE", "bits": winners[0][1], "errors": minimum, "erasures": erasures, "candidate_count": 1, "condition_holds": True}
    if len(winners) == 1:
        return {"status": "UNIQUE_BUT_OUTSIDE_RADIUS", "bits": winners[0][1], "errors": minimum, "erasures": erasures, "candidate_count": 1, "condition_holds": False}
    return {"status": "AMBIGUOUS", "bits": None, "errors": minimum, "erasures": erasures, "candidate_count": len(winners), "condition_holds": False}


def decode_payload(observed: Sequence[int | None]) -> dict[str, Any]:
    blocks = [decode_block(observed[offset:offset + 7]) for offset in range(0, 28, 7)]
    if any(block["bits"] is None for block in blocks):
        return {"status": "NOT_CERTIFIED", "payload_hex": None, "blocks": blocks}
    value = 0
    for block in blocks:
        for bit in block["bits"]:
            value = (value << 1) | int(bit)
    status = "CERTIFIED_UNIQUE" if all(block["status"] == "CERTIFIED_UNIQUE" for block in blocks) else "NOT_CERTIFIED"
    return {"status": status, "payload_hex": f"{value:04x}", "blocks": blocks}


def parse_carriers(source: str, manifest: dict[str, Any]) -> tuple[list[int | None], list[str]]:
    pattern = re.compile(r"wm_state\s*=\s*wm_(add|xor)_v[12]\s*\(\s*wm_state\s*,\s*0x([0-9a-fA-F]{8})u\s*\)\s*;")
    issued = {int(row["constant"]): int(row["position"]) for row in manifest["carriers"]}
    observed: list[int | None] = [None] * 28
    errors: list[str] = []
    for match in pattern.finditer(source):
        constant = int(match.group(2), 16)
        if constant not in issued:
            errors.append("unissued constant")
            continue
        position = issued[constant]
        if observed[position] is not None:
            errors.append("duplicate constant")
            continue
        observed[position] = 0 if match.group(1) == "add" else 1
    return observed, errors


def source_relation(source: str, manifest: dict[str, Any]) -> tuple[bool, list[str]]:
    errors: list[str] = []
    directives = [line.strip() for line in source.splitlines() if line.lstrip().startswith("#")]
    expected_directives = ["#include <stdint.h>", "#include <stdio.h>", "#include <string.h>", "#include <stdlib.h>"]
    if directives != expected_directives:
        errors.append("preprocessor profile mismatch")
    normalized = re.sub(r"\s+", "", source)
    if manifest["source_profile"] == "wm-helper-v1":
        expected = [
            "uint32_twm_add_v1(uint32_tv,uint32_tk){return(v+k)-k;}",
            "uint32_twm_xor_v1(uint32_tv,uint32_tk){return(v^k)^k;}",
        ]
        other = 2
    else:
        expected = [
            "uint32_twm_add_v2(uint32_tv,uint32_tk){return(v-k)+k;}",
            "uint32_twm_xor_v2(uint32_tv,uint32_tk){returnv^(k^k);}",
        ]
        other = 1
    for body in expected:
        if body not in normalized:
            errors.append("locked helper body missing")
    if re.search(rf"\bwm_(?:add|xor)_v{other}\b", source):
        errors.append("mixed helper versions")
    observed, inventory_errors = parse_carriers(source, manifest)
    errors.extend(inventory_errors)
    if not any(value is not None for value in observed):
        errors.append("no issued carriers")
    return not errors, errors


def visible_ids(source: str, manifest: dict[str, Any]) -> set[str]:
    observed, _ = parse_carriers(source, manifest)
    return {manifest["carriers"][i]["carrier_id"] for i, value in enumerate(observed) if value is not None}


def reference_a() -> bytes:
    output = bytearray()
    for text in A_CASES:
        depth = tokens = checksum = length = 0
        in_string = escaped = primitive = False
        valid = True
        for char in text.encode("utf-8"):
            length += 1
            checksum = (checksum * 33 + char) & 0xFFFF
            if in_string:
                if escaped:
                    escaped = False
                elif char == 92:
                    escaped = True
                elif char == 34:
                    in_string = False
                continue
            if char == 34:
                in_string = True; tokens += 1; primitive = False
            elif char in (123, 91):
                depth += 1; tokens += 1; primitive = False
            elif char in (125, 93):
                if depth == 0: valid = False
                else: depth -= 1
                primitive = False
            elif char in (32, 9, 13, 10, 58, 44):
                primitive = False
            elif not primitive:
                tokens += 1; primitive = True
        if depth != 0 or in_string:
            valid = False
        word = (int(valid) << 31) | ((tokens & 127) << 24) | ((length & 255) << 16) | checksum
        output.extend(word.to_bytes(4, "little"))
    return bytes(output)


def reference_b() -> bytes:
    output = bytearray(65536)
    index = 0
    for before in range(256):
        for after in range(256):
            word = 0
            for key in range(4):
                left = (before >> (2 * key)) & 3
                right = (after >> (2 * key)) & 3
                operation = 0 if left == right else 1 if right == 0 else 2 if left == 0 else 3
                word |= operation << (2 * key)
            output[index] = word
            index += 1
    return bytes(output)


def reference_c() -> bytes:
    output = bytearray()
    for level in range(6):
        for threshold in range(6):
            for quiet in range(2):
                for sink in range(2):
                    word = 0 if quiet or level < threshold else (level + 1) | ((threshold + 1) << 4) | ((sink + 1) << 8) | (0x5A << 16)
                    output.extend(word.to_bytes(4, "little"))
    return bytes(output)


def hash32(data: bytes) -> int:
    value = 2166136261
    for byte in data:
        value ^= byte
        value = (value * 16777619) & 0xFFFFFFFF
    return value


def reference_d() -> bytes:
    source = bytes((i * 37 + 11) & 255 for i in range(64))
    output = bytearray()
    for length in range(65):
        output.extend(hash32(source[:length] + b"\x00").to_bytes(4, "little"))
    return bytes(output)


def adler32(seed: int, data: bytes) -> int:
    low = seed & 65535
    high = (seed >> 16) & 65535
    for byte in data:
        low = (low + byte) % 65521
        high = (high + low) % 65521
    return low | (high << 16)


def reference_e() -> bytes:
    seeds = [1, 0x00010001, 0x12345678, 0xFFFFFFFF]
    output = bytearray()
    for pattern in range(4):
        if pattern == 0:
            data = bytes(range(256))
        elif pattern == 1:
            data = bytes(255 - i for i in range(256))
        elif pattern == 2:
            data = bytes((17 * i + 31) & 255 for i in range(256))
        else:
            data = bytes(0xAA if i & 1 else 0x55 for i in range(256))
        for seed in seeds:
            for length in range(257):
                output.extend(adler32(seed, data[:length]).to_bytes(4, "little"))
    return bytes(output)


def reference_f() -> bytes:
    out = bytearray()
    for a in range(256):
        for b in range(256):
            visible = bytes((a, b)).split(b"\x00", 1)[0]
            left = 0
            while left < len(visible) and visible[left] in (32, 9):
                left += 1
            right = len(visible)
            while right > left and visible[right - 1] in (32, 9):
                right -= 1
            normalized = visible[left:right]
            word = len(normalized)
            if len(normalized) > 0:
                word |= normalized[0] << 8
            if len(normalized) > 1:
                word |= normalized[1] << 16
            out.extend(word.to_bytes(4, "little"))
    return bytes(out)


def reference_g() -> bytes:
    return bytes(1 if value % 2 == 0 else 0 for value in range(65536))


REFERENCE_FUNCTIONS = {"A": reference_a, "B": reference_b, "C": reference_c, "D": reference_d, "E": reference_e, "F": reference_f, "G": reference_g}


def compiler_version(executable: str) -> str:
    completed = subprocess.run([executable, "--version"], check=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    return completed.stdout.splitlines()[0].strip()


def _fsync_directory(path: Path) -> None:
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0)
    descriptor = os.open(path, flags)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def compile_fresh(source: Path, output: Path, compiler: str, optimization: str) -> None:
    output.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(prefix=f".{output.name}.", dir=output.parent)
    os.close(descriptor)
    temporary = Path(temporary_name)
    temporary.unlink(missing_ok=True)
    seed = sha_file(source)[:16]
    command = [compiler, *COMPILE_FLAGS, f"-frandom-seed={seed}", optimization, str(source), "-o", str(temporary)]
    try:
        completed = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=60)
        if completed.returncode != 0:
            raise RuntimeError(f"fresh compile failed: {' '.join(command)}\n{completed.stderr.decode(errors='replace')}")
        temporary.chmod(temporary.stat().st_mode | 0o111)
        with temporary.open("rb") as stream:
            os.fsync(stream.fileno())
        os.replace(temporary, output)
        _fsync_directory(output.parent)
    finally:
        temporary.unlink(missing_ok=True)


def execute(executable: Path) -> tuple[int, bytes, bytes]:
    for attempt in range(8):
        try:
            completed = subprocess.run([str(executable)], stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=30)
            return completed.returncode, completed.stdout, completed.stderr
        except OSError as exc:
            if exc.errno != errno.ETXTBSY or attempt == 7:
                raise
            time.sleep(0.01 * (2 ** attempt))
    raise AssertionError("unreachable executable retry state")


def certificate_self_hash_valid(cert: dict[str, Any]) -> bool:
    expected = cert.get("certificate_sha256")
    if not isinstance(expected, str) or not HEX64.fullmatch(expected):
        return False
    clone = copy.deepcopy(cert)
    clone.pop("certificate_sha256", None)
    return canonical_hash(clone) == expected


def relation_vector(reconstructed: dict[str, dict[str, Any]]) -> dict[str, bool | None]:
    return {name: value["passed"] for name, value in reconstructed.items()}


def verify_stored_claims(cert: dict[str, Any], reconstructed: dict[str, dict[str, Any]], verdict: str) -> list[str]:
    errors: list[str] = []
    if cert.get("schema") != CERT_SCHEMA:
        errors.append("certificate schema mismatch")
    stored_relations = cert.get("relations", {})
    if set(stored_relations) != set(RELATION_NAMES):
        errors.append("relation inventory mismatch")
    for name in RELATION_NAMES:
        actual = reconstructed[name]
        if name not in stored_relations:
            errors.append(f"missing stored relation {name}")
            continue
        if stored_relations[name].get("passed") is not actual["passed"]:
            errors.append(f"stored relation disagrees: {name}")
        if stored_relations[name].get("state") != relation_state(actual["passed"]):
            errors.append(f"stored relation state disagrees: {name}")
        if name == "continuity" and int(stored_relations[name].get("preserved", -1)) != int(actual["preserved"]):
            errors.append("stored continuity count disagrees")
        if name == "recovery" and stored_relations[name].get("status") != actual.get("status"):
            errors.append("stored recovery status disagrees")
    if cert.get("verdict") != verdict:
        errors.append("stored verdict disagrees")
    return errors


def recheck(root: Path) -> dict[str, Any]:
    layer = root / "artifact" / "commit-replay"
    environment = read_json(layer / "environment.json")
    errors: list[str] = []
    for compiler in ("gcc", "clang"):
        if environment.get(compiler) != compiler_version(compiler):
            errors.append(f"compiler version mismatch: {compiler}")
    if environment.get("system") != platform.system() or environment.get("machine") != platform.machine():
        errors.append("platform mismatch")

    references: dict[str, bytes] = {}
    for alias, builder in REFERENCE_FUNCTIONS.items():
        computed = builder()
        stored_path = layer / "reference" / f"project-{alias}.bin"
        if stored_path.read_bytes() != computed:
            errors.append(f"reference mismatch: {alias}")
        references[alias] = computed

    certs: dict[tuple[str, str], dict[str, Any]] = {}
    manifests: dict[tuple[str, str], dict[str, Any]] = {}
    sources: dict[tuple[str, str], str] = {}
    for alias in PROJECTS:
        for version in VERSIONS:
            cert_path = layer / "certificates" / alias / f"{version}.json"
            manifest_path = layer / "manifests" / alias / f"{version}.json"
            source_path = layer / "sources" / alias / f"{version}.c"
            if not cert_path.is_file() or not manifest_path.is_file() or not source_path.is_file():
                errors.append(f"missing release input: {alias}/{version}")
                continue
            cert = read_json(cert_path)
            if not certificate_self_hash_valid(cert):
                errors.append(f"invalid certificate self-hash: {alias}/{version}")
            certs[(alias, version)] = cert
            manifests[(alias, version)] = read_json(manifest_path)
            sources[(alias, version)] = source_path.read_text(encoding="utf-8")

    reconstructed_by_release: dict[tuple[str, str], dict[str, dict[str, Any]]] = {}
    pass_count = hold_count = reject_count = 0

    with tempfile.TemporaryDirectory(prefix="tse01-project-recheck-") as temporary:
        temp = Path(temporary)

        def check_cell(task: tuple[str, str, dict[str, Any]]) -> dict[str, Any]:
            alias, version, cell = task
            cert = certs[(alias, version)]
            compiler = cell["compiler"]
            optimization = cell["optimization"]
            executable = root / cell["executable"]
            output_path = root / cell["output"]
            assembly = root / cell["assembly"]
            cell_errors: list[str] = []
            for path, expected, label in [
                (executable, cell["executable_sha256"], "executable"),
                (output_path, cell["output_sha256"], "output"),
                (assembly, cell["assembly_sha256"], "assembly"),
            ]:
                if not path.is_file() or sha_file(path) != expected:
                    cell_errors.append(label)
            stored_rc, stored_stdout, stored_stderr = execute(executable)
            if stored_stdout != output_path.read_bytes() or stored_rc != 0 or stored_stderr != b"":
                cell_errors.append("stored execution mismatch")
            fresh = temp / alias / version / f"{compiler}_{optimization[1:]}"
            fresh.parent.mkdir(parents=True, exist_ok=True)
            compile_fresh(root / cert["source"], fresh, compiler, optimization)
            fresh_rc, fresh_stdout, fresh_stderr = execute(fresh)
            executable_pass = fresh.read_bytes() == executable.read_bytes() and fresh_stdout == stored_stdout and fresh_rc == stored_rc and fresh_stderr == stored_stderr
            behavior_pass = stored_stdout == references[alias]
            return {
                "project": alias, "version": version, "compiler": compiler, "optimization": optimization,
                "errors": cell_errors, "behavior_pass": behavior_pass, "executable_pass": executable_pass,
                "stored_case_count": PROJECTS[alias]["cases"], "fresh_case_count": PROJECTS[alias]["cases"],
            }

        cell_tasks = [(alias, version, cell) for alias in PROJECTS for version in VERSIONS for cell in certs[(alias, version)]["compiler_cells"]]
        workers = min(12, max(2, __import__("os").cpu_count() or 2))
        with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as executor:
            cell_results = list(executor.map(check_cell, cell_tasks))

        cells_by_release: dict[tuple[str, str], list[dict[str, Any]]] = {}
        for row in cell_results:
            cells_by_release.setdefault((row["project"], row["version"]), []).append(row)

        for alias in PROJECTS:
            for version in VERSIONS:
                cert = certs[(alias, version)]
                manifest = manifests[(alias, version)]
                source_text = sources[(alias, version)]
                source_path = root / cert["source"]
                manifest_path = root / cert["manifest"]
                reference_path = root / cert["reference"]
                integrity_object_path = root / cert["integrity_object"]
                integrity_errors: list[str] = []
                for path, expected, label in [
                    (source_path, cert["source_sha256"], "source"),
                    (manifest_path, cert["manifest_sha256"], "manifest"),
                    (reference_path, cert["reference_sha256"], "reference"),
                    (integrity_object_path, cert["integrity_object_sha256"], "integrity object"),
                ]:
                    if not path.is_file() or sha_file(path) != expected:
                        integrity_errors.append(label)
                release_cells = cells_by_release[(alias, version)]
                expected_cells = {(c, o) for c, o in TOOLCHAINS}
                seen_cells = {(row["compiler"], row["optimization"]) for row in release_cells}
                if seen_cells != expected_cells:
                    integrity_errors.append("compiler cell inventory")
                for row in release_cells:
                    integrity_errors.extend(f"{message}:{row['compiler']}:{row['optimization']}" for message in row["errors"])
                behavior_pass = all(row["behavior_pass"] for row in release_cells)
                executable_pass = all(row["executable_pass"] for row in release_cells)

                observed, parse_errors = parse_carriers(source_text, manifest)
                recovery = decode_payload(observed)
                recovery_pass = recovery["status"] == "CERTIFIED_UNIQUE" and recovery["payload_hex"] == manifest["payload_hex"]
                source_pass, source_errors = source_relation(source_text, manifest)
                parent_version = cert.get("parent_version")
                parent_cert = None if parent_version is None else certs[(alias, parent_version)]
                parent_reconstructed = None if parent_version is None else reconstructed_by_release.get((alias, parent_version))
                parent_decision = None if parent_reconstructed is None else typed_decision(
                    [parent_reconstructed[name]["passed"] for name in RELATION_NAMES]
                )
                parent_accepted = parent_version is None or parent_decision == "PASS"
                policy_compatible, policy_errors = validate_policy_binding(root, cert, alias, environment, parent_cert)
                if policy_errors:
                    errors.extend(f"{alias}/{version}: {message}" for message in policy_errors)
                if parent_version is None:
                    preserved = 28
                    continuity_pass = True
                    continuity_status = "GENESIS"
                    lineage_pass = (
                        cert.get("parent_certificate_sha256") is None
                        and cert.get("parent_policy_canonical_sha256") is None
                        and cert.get("parent_decision") is None
                        and cert.get("parent_accepted") is True
                        and policy_compatible
                    )
                else:
                    parent_ids = visible_ids(sources[(alias, parent_version)], manifests[(alias, parent_version)])
                    current_ids = visible_ids(source_text, manifest)
                    preserved = len(parent_ids & current_ids)
                    continuity_pass = preserved >= TRACE_THRESHOLD
                    continuity_status = "MEASURED"
                    lineage_pass = (
                        cert.get("parent_certificate_sha256") == parent_cert.get("certificate_sha256")
                        and cert.get("parent_policy_canonical_sha256") == parent_cert.get("policy", {}).get("canonical_sha256")
                        and cert.get("parent_decision") == parent_decision
                        and cert.get("parent_accepted") is parent_accepted
                        and parent_accepted
                        and policy_compatible
                    )

                reconstructed = {
                    "behavior": {"passed": behavior_pass, "state": relation_state(behavior_pass), "case_count_per_cell": PROJECTS[alias]["cases"]},
                    "recovery": {"passed": recovery_pass, "state": relation_state(recovery_pass), **recovery},
                    "continuity": {"passed": continuity_pass, "state": relation_state(continuity_pass), "preserved": preserved, "required": TRACE_THRESHOLD, "status": continuity_status},
                    "source_conformance": {"passed": source_pass, "state": relation_state(source_pass), "errors": source_errors + parse_errors},
                    "executable_reproduction": {"passed": executable_pass, "state": relation_state(executable_pass)},
                    "integrity": {"passed": not integrity_errors, "state": relation_state(not integrity_errors), "errors": integrity_errors},
                    "lineage": {"passed": lineage_pass, "state": relation_state(lineage_pass)},
                }
                verdict = typed_decision([reconstructed[name]["passed"] for name in RELATION_NAMES])
                claim_errors = verify_stored_claims(cert, reconstructed, verdict)
                if claim_errors:
                    errors.extend(f"{alias}/{version}: {message}" for message in claim_errors)
                expected_verdict = "REJECT" if version == "adverse" else "PASS"
                if verdict != expected_verdict:
                    errors.append(f"unexpected reconstructed verdict: {alias}/{version}={verdict}")
                if verdict == "PASS":
                    pass_count += 1
                elif verdict == "HOLD":
                    hold_count += 1
                else:
                    reject_count += 1
                reconstructed_by_release[(alias, version)] = reconstructed

    compiler_cells = len(cell_results)
    assembly_files = len(cell_results)
    executable_files = len(cell_results)
    case_evaluations = sum(row["stored_case_count"] for row in cell_results)
    fresh_case_evaluations = sum(row["fresh_case_count"] for row in cell_results)

    # Closed-world inventory checks.
    certificate_paths = sorted((layer / "certificates").glob("*/*.json"))
    manifest_paths = sorted((layer / "manifests").glob("*/*.json"))
    source_paths = sorted((layer / "sources").glob("*/*.c"))
    if len(certificate_paths) != 28 or len(manifest_paths) != 28:
        errors.append("release inventory is not exactly twenty-eight")
    # Twenty-eight intended sources plus the isolated executable-substitution source.
    if len(source_paths) != 29:
        errors.append("source inventory mismatch")
    policy_paths = sorted((layer / "policies").glob("*.json"))
    if len(policy_paths) != 7:
        errors.append("policy inventory mismatch")
    if compiler_cells != 112:
        errors.append("compiler-cell count mismatch")
    if case_evaluations != 3_215_120 or fresh_case_evaluations != 3_215_120:
        errors.append("case-evaluation count mismatch")
    if (pass_count, hold_count, reject_count) != (21, 0, 7):
        errors.append("typed decision count mismatch")

    # One stored-verdict edit plus one relation forgery for each isolating control.
    mutations: list[tuple[str, str, dict[str, Any]]] = []
    m0 = copy.deepcopy(certs[("A", "adverse")]); m0["verdict"] = "PASS"; mutations.append(("stored verdict", "A", add_self_hash(m0)))
    relation_for_alias = {alias: PROJECTS[alias]["control"] for alias in PROJECTS}
    for alias, relation in relation_for_alias.items():
        mutant = copy.deepcopy(certs[(alias, "adverse")])
        mutant["relations"][relation]["passed"] = True
        if relation == "continuity":
            mutant["relations"][relation]["preserved"] = 28
        mutations.append((f"{relation} relation", alias, add_self_hash(mutant)))
    mutation_results = []
    for name, alias, mutant in mutations:
        reconstructed = reconstructed_by_release[(alias, "adverse")]
        verdict = typed_decision([reconstructed[relation]["passed"] for relation in RELATION_NAMES])
        rejected = bool(verify_stored_claims(mutant, reconstructed, verdict))
        mutation_results.append({"name": name, "project": alias, "outer_self_hash_valid": certificate_self_hash_valid(mutant), "rejected": rejected})
        if not rejected:
            errors.append(f"semantic substitution accepted: {name}")

    # A digest-valid rejected predecessor is not an accepted historical state.
    # Refresh the child link and self-hash so rejection depends on independently
    # reconstructed predecessor acceptability rather than stale metadata.
    graft = copy.deepcopy(certs[("A", "tolerated")])
    graft["parent_version"] = "adverse"
    rejected_parent = certs[("A", "adverse")]
    graft["parent_certificate_sha256"] = rejected_parent["certificate_sha256"]
    graft["parent_policy_canonical_sha256"] = rejected_parent["policy"]["canonical_sha256"]
    graft["parent_decision"] = rejected_parent["verdict"]
    graft["parent_accepted"] = False
    graft["relations"]["lineage"] = {"passed": True, "state": relation_state(True)}
    graft["verdict"] = "PASS"
    graft = add_self_hash(graft)
    parent_reconstructed = reconstructed_by_release[("A", "adverse")]
    parent_decision = typed_decision([parent_reconstructed[name]["passed"] for name in RELATION_NAMES])
    graft_reconstructed = copy.deepcopy(reconstructed_by_release[("A", "tolerated")])
    graft_reconstructed["lineage"] = {
        "passed": parent_decision == "PASS",
        "state": relation_state(parent_decision == "PASS"),
    }
    graft_verdict = typed_decision([graft_reconstructed[name]["passed"] for name in RELATION_NAMES])
    graft_errors = verify_stored_claims(graft, graft_reconstructed, graft_verdict)
    mutation_results.append({
        "name": "rejected predecessor graft",
        "project": "A",
        "outer_self_hash_valid": certificate_self_hash_valid(graft),
        "rejected": bool(graft_errors),
        "errors": graft_errors,
    })
    if not graft_errors:
        errors.append("semantic substitution accepted: rejected predecessor graft")

    # A silent policy-threshold change refreshes the policy-file hash, canonical
    # digest, and certificate self-hash while retaining the original relation
    # vector. Independent policy reconstruction and parent-policy compatibility
    # must still reject it.
    policy_alias, policy_version = "A", "tolerated"
    policy_mutant = copy.deepcopy(certs[(policy_alias, policy_version)])
    policy_path = root / policy_mutant["policy"]["path"]
    original_policy_bytes = policy_path.read_bytes()
    try:
        changed_policy = expected_project_policy(policy_alias, environment, 25)
        policy_path.write_text(json.dumps(changed_policy, indent=2, sort_keys=True) + "\n", encoding="utf-8")
        policy_mutant["policy"]["file_sha256"] = sha_file(policy_path)
        policy_mutant["policy"]["canonical_sha256"] = canonical_hash(changed_policy)
        policy_mutant = add_self_hash(policy_mutant)
        parent_cert = certs[(policy_alias, policy_mutant["parent_version"])]
        _, policy_mutation_errors = validate_policy_binding(root, policy_mutant, policy_alias, environment, parent_cert)
    finally:
        policy_path.write_bytes(original_policy_bytes)
    policy_rejected = bool(policy_mutation_errors)
    mutation_results.append({
        "name": "silent policy threshold change",
        "project": policy_alias,
        "outer_self_hash_valid": certificate_self_hash_valid(policy_mutant),
        "rejected": policy_rejected,
        "errors": policy_mutation_errors,
    })
    if not policy_rejected:
        errors.append("semantic substitution accepted: silent policy threshold change")

    decision_fixtures = [
        {"name": "all-established", "values": [True] * 7, "decision": typed_decision([True] * 7)},
        {"name": "one-unresolved", "values": [True] * 6 + [None], "decision": typed_decision([True] * 6 + [None])},
        {
            "name": "false-dominates-unresolved",
            "values": [True] * 5 + [None, False],
            "decision": typed_decision([True] * 5 + [None, False]),
        },
    ]
    decision_fixtures_pass = [row["decision"] for row in decision_fixtures] == ["PASS", "HOLD", "REJECT"]
    if not decision_fixtures_pass:
        errors.append("typed decision fixture mismatch")

    report = {
        "schema": "tse01.commit-replay.independent-recheck.v3",
        "all_valid": not errors,
        "errors": errors,
        "projects_rechecked": 7,
        "policy_files_reconstructed": len(policy_paths),
        "certificates_rechecked": len(certificate_paths),
        "compiler_cells_recompiled": compiler_cells,
        "stored_executables_reexecuted": executable_files,
        "fresh_executables_reexecuted": compiler_cells,
        "assembly_files_rehashed": assembly_files,
        "declared_case_evaluations_reexecuted": case_evaluations,
        "fresh_case_evaluations_reexecuted": fresh_case_evaluations,
        "pass_count": pass_count,
        "hold_count": hold_count,
        "reject_count": reject_count,
        "decision_fixtures": decision_fixtures,
        "decision_fixtures_pass": decision_fixtures_pass,
        "semantic_tamper_test_count": len(mutation_results),
        "refreshed_binding_test_count": len(mutation_results),
        "semantic_tamper_tests": mutation_results,
        "semantic_tamper_tests_pass": all(row["outer_self_hash_valid"] and row["rejected"] for row in mutation_results),
        "checker_independence": "imports neither the primary replay generator nor its carrier/reference utilities",
        "verdict": "PASS" if not errors else "FAIL",
    }
    results = layer / "results"
    results.mkdir(parents=True, exist_ok=True)
    (results / "independent_recheck.json").write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({k: report[k] for k in (
        "all_valid", "certificates_rechecked", "compiler_cells_recompiled",
        "declared_case_evaluations_reexecuted", "pass_count", "hold_count",
        "reject_count", "decision_fixtures_pass", "semantic_tamper_test_count", "verdict",
    )}, sort_keys=True))
    if errors:
        raise SystemExit(1)
    return report


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    args = parser.parse_args()
    recheck(args.root.resolve())


if __name__ == "__main__":
    main()
