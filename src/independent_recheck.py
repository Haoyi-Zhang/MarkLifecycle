#!/usr/bin/env python3
"""Independent, dependency-free recheck of the released TraceCert artifact.

The checker intentionally imports neither ``tracecert.py`` nor
``run_experiments.py``.  It independently reconstructs the frozen reference
functions and manifests, parses source carriers, decodes Hamming blocks,
recomputes predecessor continuity, verifies the exact four compiler cells,
recompiles and re-executes every retained compiler cell, rehashes raw and
canonical manifests, executables, outputs, and assembly, checks certificate
links, and exercises semantic tamper cases whose self-hashes have been
recomputed.
"""
from __future__ import annotations

import argparse
import concurrent.futures
import copy
import hashlib
import json
import math
import platform
import re
import shutil
import subprocess
import tempfile
from pathlib import Path
from typing import Any, Callable, Sequence

CERTIFICATE_SCHEMA = "tracecert.release.v5"
POLICY_SCHEMA = "tracecert.policy.v1"
POLICY_BRIDGE_SCHEMA = "tracecert.policy-bridge.v1"
POLICY_CANONICALIZATION = "sorted-key-ascii-json-v1"
TRACE_THRESHOLD = 26 / 28
EXPECTED_TOOLCHAINS = [("gcc", "-O0"), ("gcc", "-O2"), ("clang", "-O0"), ("clang", "-O2")]
LOCKED_SYSTEM = "Linux"
LOCKED_MACHINE = "x86_64"
LOCKED_COMPILER_VERSIONS = {
    "gcc": "gcc (Debian 14.2.0-19) 14.2.0",
    "clang": "clang version 17.0.0 (https://github.com/swiftlang/llvm-project.git 10999b6d034fe318f3d56c83bddb6572593a8bb0)",
}
VARIANT_PARENTS = {
    "baseline": (),
    "rename": ("baseline",),
    "reorder": ("rename",),
    "extract": ("reorder",),
    "dependency_upgrade": ("extract",),
    "format": ("dependency_upgrade",),
    "erase_tolerable": ("dependency_upgrade",),
    "merge_tolerable": ("format", "erase_tolerable"),
    "flip_tolerable": ("merge_tolerable",),
    "recovery_break": ("dependency_upgrade",),
    "reseed": ("dependency_upgrade",),
    "behavior_drift": ("dependency_upgrade",),
}
PASS_VARIANTS = {
    "baseline", "rename", "reorder", "extract", "dependency_upgrade",
    "format", "erase_tolerable", "merge_tolerable", "flip_tolerable",
}
KERNELS = [
    "fnv_step", "jenkins_step", "crc8_step", "fletcher_step", "rotate_mix",
    "varint_state", "json_state", "utf8_state", "base64_state", "luhn_state",
    "saturating_add", "branch_mix",
]
HEX64 = re.compile(r"^[0-9a-f]{64}$")
COMPILE_TIMEOUT_SECONDS = 30
RUN_TIMEOUT_SECONDS = 5
REPLAY_WORKERS = 4
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


def canonical_hash(obj: Any) -> str:
    data = json.dumps(obj, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode("ascii")
    return sha_bytes(data)


def expected_finite_policy(kernel: str, environment: dict[str, Any], required_count: int = 26, *, policy_id: str | None = None) -> dict[str, Any]:
    return {
        "schema": POLICY_SCHEMA,
        "policy_id": policy_id or f"finite:{kernel}:v1",
        "layer": "finite-contract",
        "behavior": {
            "contract_id": kernel,
            "input_domain": {"x": [0, 255], "y": [0, 255]},
            "case_count": 65536,
            "output_bytes_per_case": 1,
            "reference_semantics": "independent-complete-enumeration-v1",
        },
        "compiler_cells": [
            {
                "compiler": compiler,
                "version": environment[compiler],
                "optimization": optimization,
                "compile_flags": ["-std=c11", "-Wall", "-Wextra", "-Werror"],
                "assembly_flags": ["-std=c11"],
            }
            for compiler, optimization in EXPECTED_TOOLCHAINS
        ],
        "watermark": {
            "payload_bits": 16,
            "code": "four-independent-Hamming-7-4-blocks",
            "minimum_distance": 3,
            "unique_recovery_condition": "2e+s<3-per-block",
        },
        "source_profiles": {
            "accepted": ["direct-v1", "tc-helper-v1", "tc-helper-v2"],
            "inventory_rule": "exact-issued-carrier-accounting",
        },
        "continuity": {
            "baseline_count": 28,
            "required_count": required_count,
            "scope": "each-named-parent-issued-identities",
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


def command_version(exe: str) -> str:
    completed = subprocess.run(
        [exe, "--version"], text=True, stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT, check=True,
    )
    return completed.stdout.splitlines()[0].strip()


def validate_locked_environment(environment: dict[str, Any]) -> list[str]:
    errors: list[str] = []
    recorded_expected = {
        "system": LOCKED_SYSTEM,
        "machine": LOCKED_MACHINE,
        **LOCKED_COMPILER_VERSIONS,
    }
    for key, expected in recorded_expected.items():
        if environment.get(key) != expected:
            errors.append(f"recorded environment mismatch: {key}")
    if platform.system() != LOCKED_SYSTEM:
        errors.append("current system does not match locked system")
    if platform.machine() != LOCKED_MACHINE:
        errors.append("current machine does not match locked machine")
    for compiler, expected in LOCKED_COMPILER_VERSIONS.items():
        try:
            observed = command_version(compiler)
        except (OSError, subprocess.SubprocessError) as exc:
            errors.append(f"cannot query locked compiler {compiler}: {exc}")
            continue
        if observed != expected:
            errors.append(f"current compiler version mismatch: {compiler}")
    return errors


def add_self_hash(cert: dict[str, Any]) -> dict[str, Any]:
    out = copy.deepcopy(cert)
    out.pop("certificate_sha256", None)
    out["certificate_sha256"] = canonical_hash(out)
    return out


def close(a: Any, b: float) -> bool:
    try:
        return math.isclose(float(a), b, rel_tol=0.0, abs_tol=1e-15)
    except (TypeError, ValueError):
        return False


# ---------------------------------------------------------------------------
# Independent finite reference model.
# ---------------------------------------------------------------------------
def rotl8(v: int, n: int) -> int:
    v &= 0xFF
    return ((v << n) | (v >> (8 - n))) & 0xFF


def ref_fnv(x: int, y: int) -> int:
    return ((x ^ y) * 0x93) & 0xFF


def ref_jenkins(x: int, y: int) -> int:
    s = (x + y) & 0xFF
    s = (s + ((s << 3) & 0xFF)) & 0xFF
    s ^= s >> 4
    s = (s * 0x1B) & 0xFF
    s ^= s >> 3
    return s & 0xFF


def ref_crc8(x: int, y: int) -> int:
    s = (x ^ y) & 0xFF
    for _ in range(8):
        s = (((s << 1) ^ 0x07) if s & 0x80 else (s << 1)) & 0xFF
    return s


def ref_fletcher(x: int, y: int) -> int:
    return (x + y) % 255


def ref_rotate(x: int, y: int) -> int:
    return (rotl8(x, 3) ^ y ^ (y >> 2)) & 0xFF


def ref_varint(x: int, y: int) -> int:
    return (((x << 1) ^ (y & 0x7F)) if y & 0x80 else x + y) & 0xFF


def ref_json(x: int, y: int) -> int:
    if y in (9, 10, 13, 32):
        return x
    if y in (123, 91):
        return (x + 1) & 0xFF
    if y in (125, 93):
        return (x - 1) & 0xFF
    if y == 34:
        return x ^ 0x80
    return (x + (y & 3)) & 0xFF


def ref_utf8(x: int, y: int) -> int:
    if x:
        return (x - 1) & 0xFF if (y & 0xC0) == 0x80 else 0xFF
    if y < 0x80:
        return 0
    if 0xC2 <= y <= 0xDF:
        return 1
    if 0xE0 <= y <= 0xEF:
        return 2
    if 0xF0 <= y <= 0xF4:
        return 3
    return 0xFF


def ref_base64(x: int, y: int) -> int:
    if 65 <= y <= 90:
        value = y - 65
    elif 97 <= y <= 122:
        value = y - 71
    elif 48 <= y <= 57:
        value = y + 4
    elif y == 43:
        value = 62
    elif y == 47:
        value = 63
    else:
        value = 0xFF
    return (value ^ x) & 0xFF


def ref_luhn(x: int, y: int) -> int:
    digit = y % 10
    if x & 1:
        digit *= 2
        if digit > 9:
            digit -= 9
    return (x + digit) & 0xFF


def ref_saturating(x: int, y: int) -> int:
    return min(255, x + y)


def ref_branch(x: int, y: int) -> int:
    if (x ^ y) & 1:
        return (((x * 17) + y) ^ 0x5A) & 0xFF
    return (((y * 29) + x) ^ 0xA5) & 0xFF


REFERENCE_FUNCTIONS: dict[str, Callable[[int, int], int]] = {
    "fnv_step": ref_fnv,
    "jenkins_step": ref_jenkins,
    "crc8_step": ref_crc8,
    "fletcher_step": ref_fletcher,
    "rotate_mix": ref_rotate,
    "varint_state": ref_varint,
    "json_state": ref_json,
    "utf8_state": ref_utf8,
    "base64_state": ref_base64,
    "luhn_state": ref_luhn,
    "saturating_add": ref_saturating,
    "branch_mix": ref_branch,
}


def reference_table(kernel: str) -> bytes:
    fn = REFERENCE_FUNCTIONS[kernel]
    return bytes(fn(x, y) & 0xFF for x in range(256) for y in range(256))


def first_mismatch(reference: bytes, actual: bytes) -> dict[str, int] | None:
    n = min(len(reference), len(actual))
    for i in range(n):
        if reference[i] != actual[i]:
            return {
                "index": i,
                "x": i // 256,
                "y": i % 256,
                "expected": reference[i],
                "actual": actual[i],
            }
    if len(reference) != len(actual):
        return {"index": n, "x": n // 256, "y": n % 256, "expected": -1, "actual": -1}
    return None


# ---------------------------------------------------------------------------
# Independent manifest and Hamming model.
# ---------------------------------------------------------------------------
def bits_from_u16(value: int) -> list[int]:
    return [(value >> shift) & 1 for shift in range(15, -1, -1)]


def encode_nibble(bits: Sequence[int]) -> list[int]:
    d1, d2, d3, d4 = bits
    return [d1 ^ d2 ^ d4, d1 ^ d3 ^ d4, d1, d2 ^ d3 ^ d4, d2, d3, d4]


def encode_u16(value: int) -> list[int]:
    bits = bits_from_u16(value)
    out: list[int] = []
    for start in range(0, 16, 4):
        out.extend(encode_nibble(bits[start:start + 4]))
    return out


def decode_block(obs: Sequence[int | None]) -> dict[str, Any]:
    erasures = sum(x is None for x in obs)
    scores: list[tuple[int, tuple[int, ...]]] = []
    for nibble in range(16):
        data = tuple((nibble >> shift) & 1 for shift in (3, 2, 1, 0))
        code = encode_nibble(data)
        errors = sum(a is not None and a != b for a, b in zip(obs, code))
        scores.append((errors, data))
    best = min(score for score, _ in scores)
    candidates = [data for score, data in scores if score == best]
    condition = 2 * best + erasures < 3
    if len(candidates) == 1 and condition:
        status = "CERTIFIED_UNIQUE"
        decoded: tuple[int, ...] | None = candidates[0]
    elif len(candidates) == 1:
        status = "UNIQUE_BUT_OUTSIDE_RADIUS"
        decoded = candidates[0]
    else:
        status = "AMBIGUOUS"
        decoded = None
    return {
        "status": status,
        "decoded_bits": decoded,
        "errors": best,
        "erasures": erasures,
        "candidate_count": len(candidates),
        "condition_holds": condition,
    }


def decode_u16(obs: Sequence[int | None]) -> dict[str, Any]:
    blocks = [decode_block(obs[start:start + 7]) for start in range(0, 28, 7)]
    certified = all(block["status"] == "CERTIFIED_UNIQUE" for block in blocks)
    decoded_bits: list[int] = []
    for block in blocks:
        if block["decoded_bits"] is None:
            return {
                "status": "NOT_CERTIFIED",
                "payload_hex": None,
                "blocks": blocks,
                "total_errors": sum(int(b["errors"]) for b in blocks),
                "total_erasures": sum(int(b["erasures"]) for b in blocks),
            }
        decoded_bits.extend(block["decoded_bits"])
    value = 0
    for bit in decoded_bits:
        value = (value << 1) | int(bit)
    return {
        "status": "CERTIFIED_UNIQUE" if certified else "NOT_CERTIFIED",
        "payload_hex": f"{value:04x}",
        "blocks": blocks,
        "total_errors": sum(int(b["errors"]) for b in blocks),
        "total_erasures": sum(int(b["erasures"]) for b in blocks),
    }


def expected_payload(kernel: str) -> int:
    return int.from_bytes(hashlib.sha256(("TSE-01:" + kernel).encode()).digest()[:2], "big")


def expected_constants(kernel: str, reseed: bool) -> list[int]:
    label = "reseed" if reseed else "baseline"
    values: list[int] = []
    counter = 0
    while len(values) < 28:
        digest = hashlib.sha256(f"TSE-01:{kernel}:{label}:{counter}".encode()).digest()
        value = (int.from_bytes(digest[:4], "big") | 0x01010101) & 0xFFFFFFFF
        if value not in values and value not in (0, 0xFFFFFFFF):
            values.append(value)
        counter += 1
    return values


def validate_manifest(manifest: dict[str, Any], kernel: str, variant: str) -> list[str]:
    errors: list[str] = []
    if manifest.get("schema") != "tracecert.watermark-manifest.v1":
        errors.append("manifest schema mismatch")
    if manifest.get("kernel") != kernel:
        errors.append("manifest kernel mismatch")
    if manifest.get("code") != "four independent Hamming(7,4) blocks":
        errors.append("manifest code mismatch")
    if manifest.get("minimum_distance") != 3:
        errors.append("manifest minimum distance mismatch")
    payload = expected_payload(kernel)
    if manifest.get("payload_hex") != f"{payload:04x}":
        errors.append("manifest payload mismatch")
    carriers = manifest.get("carriers")
    if not isinstance(carriers, list) or len(carriers) != 28:
        errors.append("manifest must contain exactly 28 carriers")
        return errors
    expected_bits = encode_u16(payload)
    reseed = variant == "reseed"
    expected_ids = [f"{kernel}:{'R' if reseed else 'B'}:{i:02d}" for i in range(28)]
    expected_keys = expected_constants(kernel, reseed)
    positions: list[int] = []
    ids: list[str] = []
    constants: list[int] = []
    for index, carrier in enumerate(carriers):
        try:
            position = int(carrier["position"])
            bit = int(carrier["bit"])
            constant = int(carrier["constant"])
            carrier_id = str(carrier["carrier_id"])
        except (KeyError, TypeError, ValueError):
            errors.append(f"malformed manifest carrier at index {index}")
            continue
        positions.append(position)
        ids.append(carrier_id)
        constants.append(constant)
        if position != index:
            errors.append(f"manifest carrier position mismatch at index {index}")
            continue
        if bit != expected_bits[index]:
            errors.append(f"manifest carrier bit mismatch at position {index}")
        if carrier_id != expected_ids[index]:
            errors.append(f"manifest carrier id mismatch at position {index}")
        if constant != expected_keys[index]:
            errors.append(f"manifest carrier constant mismatch at position {index}")
    if positions != list(range(28)):
        errors.append("manifest positions are not exactly 0..27")
    if len(set(ids)) != 28:
        errors.append("manifest carrier ids are not unique")
    if len(set(constants)) != 28:
        errors.append("manifest constants are not unique")
    return errors


# ---------------------------------------------------------------------------
# Independent source-carrier extraction.
# ---------------------------------------------------------------------------
DIRECT_ADD = re.compile(
    r"(?P<v>[A-Za-z_]\w*)\s*=\s*\(\(\s*(?P=v)\s*\+\s*(?P<k>0x[0-9a-fA-F]+)[uU]\s*\)\s*-\s*(?P=k)[uU]\s*\)\s*;"
)
DIRECT_XOR = re.compile(
    r"(?P<v>[A-Za-z_]\w*)\s*=\s*\(\(\s*(?P=v)\s*\^\s*(?P<k>0x[0-9a-fA-F]+)[uU]\s*\)\s*\^\s*(?P=k)[uU]\s*\)\s*;"
)
HELPER = re.compile(
    r"(?P<v>[A-Za-z_]\w*)\s*=\s*tc_(?P<kind>add|xor)_v(?P<version>[12])\s*\(\s*(?P=v)\s*,\s*(?P<k>0x[0-9a-fA-F]+)[uU]\s*\)\s*;"
)

HELPER_DEFINITION = re.compile(
    r"static\s+__attribute__\s*\(\(\s*noinline\s*\)\)\s+uint32_t\s+"
    r"tc_(?P<kind>add|xor)_v(?P<version>[12])\s*\(\s*uint32_t\s+v\s*,\s*"
    r"uint32_t\s+k\s*\)\s*\{(?P<body>[^{}]*)\}"
)
LOCKED_HELPER_BODIES = {
    ("add", "1"): "return(v+k)-k;",
    ("xor", "1"): "return(v^k)^k;",
    ("add", "2"): "return(v-k)+k;",
    ("xor", "2"): "returnv^(k^k);",
}
HELPER_SYMBOL = re.compile(r"\btc_(?P<kind>add|xor)_v(?P<version>[12])\b")
UNIVERSAL_CHARACTER_ESCAPE = re.compile(r"\\(?:u[0-9a-fA-F]{4}|U[0-9a-fA-F]{8})")
ALLOWED_PREPROCESSOR_DIRECTIVES = [
    "#include <stdint.h>",
    "#include <stdio.h>",
]


def strip_c_noncode(text: str) -> str:
    """Replace comments and string/character contents while preserving layout."""
    out = list(text)
    i = 0
    state = "code"
    while i < len(text):
        ch = text[i]
        nxt = text[i + 1] if i + 1 < len(text) else ""
        if state == "code":
            if ch == "/" and nxt == "/":
                out[i] = out[i + 1] = " "
                i += 2
                state = "line_comment"
                continue
            if ch == "/" and nxt == "*":
                out[i] = out[i + 1] = " "
                i += 2
                state = "block_comment"
                continue
            if ch == '"':
                out[i] = " "
                i += 1
                state = "string"
                continue
            if ch == "'":
                out[i] = " "
                i += 1
                state = "char"
                continue
        elif state == "line_comment":
            if ch == "\n":
                state = "code"
            else:
                out[i] = " "
        elif state == "block_comment":
            if ch == "*" and nxt == "/":
                out[i] = out[i + 1] = " "
                i += 2
                state = "code"
                continue
            if ch != "\n":
                out[i] = " "
        elif state in {"string", "char"}:
            quote = '"' if state == "string" else "'"
            if ch == "\\":
                out[i] = " "
                if i + 1 < len(text):
                    if text[i + 1] != "\n":
                        out[i + 1] = " "
                    i += 2
                    continue
            if ch == quote:
                out[i] = " "
                state = "code"
            elif ch != "\n":
                out[i] = " "
        i += 1
    return "".join(out)


def validate_locked_helper_definitions(source_text: str) -> list[str]:
    code = strip_c_noncode(source_text)
    errors: list[str] = []

    if re.search(r"\\\r?\n", source_text):
        errors.append("line splicing is outside the locked source grammar")
    if "??" in source_text:
        errors.append("trigraph-like tokens are outside the locked source grammar")
    if UNIVERSAL_CHARACTER_ESCAPE.search(source_text):
        errors.append("universal-character escapes are outside the locked source grammar")
    if re.search(r"\b_Pragma\s*\(", code):
        errors.append("_Pragma is outside the locked source grammar")

    directives: list[str] = []
    for line in code.splitlines():
        stripped = line.strip()
        if stripped.startswith(("#", "%:", "??=")):
            directives.append(stripped)
    if directives != ALLOWED_PREPROCESSOR_DIRECTIVES:
        errors.append(
            "preprocessor directive set mismatch: "
            f"expected={ALLOWED_PREPROCESSOR_DIRECTIVES} actual={directives}"
        )

    calls = list(HELPER.finditer(code))
    versions = {match.group("version") for match in calls}
    definitions = list(HELPER_DEFINITION.finditer(code))
    if len(versions) > 1:
        errors.append(f"mixed helper versions in carrier calls: {sorted(versions)}")
    expected_names = {
        (kind, version) for version in versions for kind in ("add", "xor")
    }
    actual_names = [(match.group("kind"), match.group("version")) for match in definitions]
    if len(actual_names) != len(set(actual_names)):
        errors.append("duplicate locked helper definitions")
    if set(actual_names) != expected_names:
        errors.append(
            f"locked helper definition set mismatch: expected={sorted(expected_names)} actual={sorted(set(actual_names))}"
        )
    for match in definitions:
        name = (match.group("kind"), match.group("version"))
        normalized = re.sub(r"\s+", "", match.group("body"))
        expected = LOCKED_HELPER_BODIES.get(name)
        if expected is None or normalized != expected:
            errors.append(f"locked helper body mismatch: tc_{name[0]}_v{name[1]}")

    call_counts: dict[tuple[str, str], int] = {}
    for match in calls:
        name = (match.group("kind"), match.group("version"))
        call_counts[name] = call_counts.get(name, 0) + 1
    symbol_counts: dict[tuple[str, str], int] = {}
    for match in HELPER_SYMBOL.finditer(code):
        name = (match.group("kind"), match.group("version"))
        symbol_counts[name] = symbol_counts.get(name, 0) + 1
    all_names = set(symbol_counts) | expected_names
    for name in sorted(all_names):
        expected_count = call_counts.get(name, 0) + (1 if name in expected_names else 0)
        actual_count = symbol_counts.get(name, 0)
        if actual_count != expected_count:
            errors.append(
                "locked helper symbol binding mismatch: "
                f"tc_{name[0]}_v{name[1]} expected_occurrences={expected_count} "
                f"actual_occurrences={actual_count}"
            )
    return errors


def source_observation(source_text: str, manifest: dict[str, Any]) -> tuple[dict[str, Any], list[str]]:
    code = strip_c_noncode(source_text)
    errors = validate_locked_helper_definitions(code)
    found: list[dict[str, Any]] = []
    for pattern, bit, family in ((DIRECT_ADD, 0, "direct-add"), (DIRECT_XOR, 1, "direct-xor")):
        for match in pattern.finditer(code):
            found.append({
                "offset": match.start(),
                "line": code.count("\n", 0, match.start()) + 1,
                "constant": int(match.group("k"), 16),
                "observed_bit": bit,
                "family": family,
            })
    for match in HELPER.finditer(code):
        found.append({
            "offset": match.start(),
            "line": code.count("\n", 0, match.start()) + 1,
            "constant": int(match.group("k"), 16),
            "observed_bit": 0 if match.group("kind") == "add" else 1,
            "family": f"helper-v{match.group('version')}",
        })
    found.sort(key=lambda item: int(item["offset"]))
    by_constant: dict[int, list[dict[str, Any]]] = {}
    for item in found:
        by_constant.setdefault(int(item["constant"]), []).append(item)
    expected_constants_set = {int(c["constant"]) for c in manifest["carriers"]}
    extra = [int(item["constant"]) for item in found if int(item["constant"]) not in expected_constants_set]
    if extra:
        errors.append(f"unmanifested recognized carrier constants: {extra}")
    symbols: list[int | None] = [None] * 28
    carriers: list[dict[str, Any]] = []
    duplicate_constants: list[int] = []
    for expected in manifest["carriers"]:
        constant = int(expected["constant"])
        matches = by_constant.get(constant, [])
        if len(matches) > 1:
            duplicate_constants.append(constant)
        match = matches[0] if len(matches) == 1 else None
        bit = None if match is None else int(match["observed_bit"])
        position = int(expected["position"])
        symbols[position] = bit
        carriers.append({
            "carrier_id": expected["carrier_id"],
            "position": position,
            "constant": constant,
            "expected_bit": int(expected["bit"]),
            "observed_bit": bit,
            "line": None if match is None else int(match["line"]),
            "family": None if match is None else match["family"],
            "state": "ERASURE" if bit is None else ("MATCH" if bit == int(expected["bit"]) else "ERROR"),
        })
    if duplicate_constants:
        errors.append(f"duplicate recognized carrier constants: {duplicate_constants}")
    decode = decode_u16(symbols)
    return {
        "extracted_count": len(found),
        "manifest_count": 28,
        "duplicate_constants": duplicate_constants,
        "observed_symbols": "".join("?" if bit is None else str(bit) for bit in symbols),
        "carriers": carriers,
        "decode": decode,
    }, errors


def compute_provenance(
    parent_manifest: dict[str, Any] | None,
    child_manifest: dict[str, Any],
    observation: dict[str, Any],
) -> dict[str, Any]:
    if parent_manifest is None:
        return {"mapped_count": 28, "baseline_count": 28, "traceability": 1.0, "mappings": []}
    parent_ids = {c["carrier_id"]: c for c in parent_manifest["carriers"]}
    child_ids = {c["carrier_id"]: c for c in child_manifest["carriers"]}
    observed_ids = {c["carrier_id"]: c for c in observation["carriers"]}
    mappings: list[dict[str, Any]] = []
    for carrier in parent_manifest["carriers"]:
        carrier_id = carrier["carrier_id"]
        parent = parent_ids[carrier_id]
        child = child_ids.get(carrier_id)
        observed = observed_ids.get(carrier_id)
        if child is None or observed is None or observed["observed_bit"] is None:
            continue
        mappings.append({
            "carrier_id": carrier_id,
            "parent_position": int(parent["position"]),
            "child_position": int(child["position"]),
            "child_line": int(observed["line"]),
            "bit_changed": int(parent["bit"]) != int(observed["observed_bit"]),
        })
    return {
        "mapped_count": len(mappings),
        "baseline_count": len(parent_manifest["carriers"]),
        "traceability": len(mappings) / len(parent_manifest["carriers"]),
        "mappings": mappings,
    }


def recompute_assembly_retention(
    assembly_text: str,
    manifest: dict[str, Any],
    observed_ids: set[str],
) -> dict[str, Any]:
    text = assembly_text.lower()
    found: list[str] = []
    for item in manifest["carriers"]:
        if item["carrier_id"] not in observed_ids:
            continue
        value = int(item["constant"])
        forms = {
            f"0x{value:x}", f"0x{value:08x}", str(value),
            str(value if value < 2**31 else value - 2**32),
        }
        if any(form in text for form in forms):
            found.append(item["carrier_id"])
    denominator = len(observed_ids)
    return {
        "retained_count": len(found),
        "source_present_count": denominator,
        "retention": 0.0 if denominator == 0 else len(found) / denominator,
        "retained_carrier_ids": found,
        "method": "immediate-constant presence in emitted assembly; heuristic, not a formal detector",
    }


# ---------------------------------------------------------------------------
# Certificate validation.
# ---------------------------------------------------------------------------
def compare_decode(stored: Any, actual: dict[str, Any]) -> bool:
    if not isinstance(stored, dict):
        return False
    for key in ("status", "payload_hex", "total_errors", "total_erasures"):
        if stored.get(key) != actual.get(key):
            return False
    sblocks = stored.get("blocks")
    ablocks = actual.get("blocks")
    if not isinstance(sblocks, list) or len(sblocks) != len(ablocks):
        return False
    for stored_block, actual_block in zip(sblocks, ablocks):
        for key in ("status", "errors", "erasures", "candidate_count", "condition_holds"):
            if stored_block.get(key) != actual_block.get(key):
                return False
        stored_bits = stored_block.get("decoded_bits")
        actual_bits = actual_block.get("decoded_bits")
        if stored_bits is None:
            if actual_bits is not None:
                return False
        elif list(stored_bits) != list(actual_bits or []):
            return False
    return True


def validate_certificate(
    root: Path,
    cert: dict[str, Any],
    certs: dict[tuple[str, str], dict[str, Any]],
    manifests: dict[tuple[str, str], dict[str, Any]],
    references: dict[str, bytes],
    environment: dict[str, Any],
    replay_root: Path | None = None,
    parent_validations: dict[str, dict[str, Any]] | None = None,
    reconstruction_sink: dict[str, Any] | None = None,
) -> list[str]:
    errors: list[str] = []
    integrity_errors: list[str] = []

    def record_integrity_error(message: str) -> None:
        errors.append(message)
        integrity_errors.append(message)

    def finish(
        relations: dict[str, Any] | None = None,
        verdict: str | None = None,
    ) -> list[str]:
        if reconstruction_sink is not None:
            reconstruction_sink.clear()
            reconstruction_sink.update({
                "errors": list(errors),
                "relations": copy.deepcopy(relations),
                "verdict": verdict,
                "valid": not errors,
            })
        return errors
    kernel = cert.get("kernel")
    variant = cert.get("variant")
    if cert.get("schema") != CERTIFICATE_SCHEMA:
        errors.append("certificate schema mismatch")
    if kernel not in KERNELS:
        errors.append("unknown kernel")
        return finish()
    if variant not in VARIANT_PARENTS:
        errors.append("unknown variant")
        return finish()
    key = (kernel, variant)
    parent_variants = list(VARIANT_PARENTS[variant])
    sole_parent = parent_variants[0] if len(parent_variants) == 1 else None
    if cert.get("parent_variants") != parent_variants:
        errors.append("parent variant set mismatch")
    if cert.get("parent_variant") != sole_parent:
        errors.append("legacy parent variant mismatch")

    unsigned = copy.deepcopy(cert)
    stored_self_hash = unsigned.pop("certificate_sha256", None)
    if not isinstance(stored_self_hash, str) or stored_self_hash != canonical_hash(unsigned):
        record_integrity_error("certificate self-hash mismatch")

    expected_policy_rel = f"artifact/policies/finite/{kernel}.json"
    policy_ref = cert.get("policy", {})
    expected_policy = expected_finite_policy(kernel, environment)
    expected_policy_hash = canonical_hash(expected_policy)
    if not isinstance(policy_ref, dict) or set(policy_ref) != {"path", "policy_id", "file_sha256", "canonical_sha256"}:
        record_integrity_error("policy binding fields mismatch")
        policy_ref = {}
    if policy_ref.get("path") != expected_policy_rel:
        record_integrity_error("policy path mismatch")
    if policy_ref.get("policy_id") != expected_policy["policy_id"]:
        errors.append("policy identifier mismatch")
    policy_path = root / expected_policy_rel
    if not policy_path.is_file():
        errors.append("policy file missing")
        actual_policy = None
    else:
        try:
            actual_policy = json.loads(policy_path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError):
            actual_policy = None
            errors.append("policy file is not valid JSON")
        if policy_ref.get("file_sha256") != sha_file(policy_path):
            record_integrity_error("policy file hash mismatch")
        if actual_policy is not None and policy_ref.get("canonical_sha256") != canonical_hash(actual_policy):
            record_integrity_error("policy canonical hash mismatch")
        if actual_policy != expected_policy:
            record_integrity_error("policy content mismatch")
    if policy_ref.get("canonical_sha256") != expected_policy_hash:
        record_integrity_error("policy expected digest mismatch")

    expected_source_rel = f"artifact/benchmark/generated/{kernel}/{variant}/kernel.c"
    expected_manifest_rel = f"artifact/benchmark/generated/{kernel}/{variant}/watermark_manifest.json"
    expected_reference_rel = f"artifact/benchmark/reference/{kernel}.bin"
    source = cert.get("source", {})
    manifest_ref = cert.get("manifest", {})
    behavior = cert.get("behavior", {})
    if source.get("path") != expected_source_rel:
        record_integrity_error("source path mismatch")
    if manifest_ref.get("path") != expected_manifest_rel:
        record_integrity_error("manifest path mismatch")
    if behavior.get("reference_table_path") != expected_reference_rel:
        record_integrity_error("reference path mismatch")

    source_path = root / expected_source_rel
    manifest_path = root / expected_manifest_rel
    reference_path = root / expected_reference_rel
    if not source_path.is_file():
        errors.append("source file missing")
        return finish()
    if not manifest_path.is_file():
        errors.append("manifest file missing")
        return finish()
    if not reference_path.is_file():
        errors.append("reference file missing")
        return finish()

    actual_source_hash = sha_file(source_path)
    if source.get("sha256") != actual_source_hash:
        record_integrity_error("source hash mismatch")
    parent_certs = [certs.get((kernel, parent)) for parent in parent_variants]
    if any(parent_cert is None for parent_cert in parent_certs):
        errors.append("parent certificate missing")
    expected_parent_sources = [
        parent_cert.get("source", {}).get("sha256")
        for parent_cert in parent_certs if parent_cert is not None
    ]
    expected_parent_source = expected_parent_sources[0] if len(expected_parent_sources) == 1 else None
    if source.get("parent_sha256") != expected_parent_source:
        errors.append("legacy parent source hash mismatch")
    if source.get("parent_sha256s") != expected_parent_sources:
        errors.append("parent source hash set mismatch")

    manifest = manifests[key]
    errors.extend(validate_manifest(manifest, kernel, variant))
    if set(manifest_ref) != {"path", "file_sha256", "canonical_sha256"}:
        record_integrity_error("manifest binding fields mismatch")
    if manifest_ref.get("file_sha256") != sha_file(manifest_path):
        record_integrity_error("manifest file hash mismatch")
    if manifest_ref.get("canonical_sha256") != canonical_hash(manifest):
        record_integrity_error("manifest canonical hash mismatch")

    reference = references[kernel]
    packaged_reference = reference_path.read_bytes()
    if packaged_reference != reference:
        record_integrity_error("independent reference table mismatch")
    reference_hash = sha_bytes(reference)
    if behavior.get("reference_sha256") != reference_hash:
        record_integrity_error("reference hash mismatch")
    if behavior.get("contract") != "all x,y in {0,...,255}; one output byte":
        record_integrity_error("behavior contract mismatch")

    observation, observation_errors = source_observation(source_path.read_text(encoding="utf-8"), manifest)
    errors.extend(observation_errors)
    watermark = cert.get("watermark", {})
    if watermark.get("expected_payload_hex") != manifest.get("payload_hex"):
        errors.append("expected payload field mismatch")
    if watermark.get("observed_symbols") != observation["observed_symbols"]:
        errors.append("observed symbol string mismatch")
    if watermark.get("source_carriers") != observation["carriers"]:
        errors.append("source carrier evidence mismatch")
    if not compare_decode(watermark.get("decode"), observation["decode"]):
        errors.append("independent decode mismatch")
    payload_pass = (
        observation["decode"]["status"] == "CERTIFIED_UNIQUE"
        and observation["decode"]["payload_hex"] == manifest["payload_hex"]
    )
    if bool(watermark.get("payload_recoverable")) != payload_pass:
        errors.append("payload recoverable flag mismatch")

    provenance_by_parent: list[dict[str, Any]] = []
    for parent_variant in parent_variants:
        parent_manifest = manifests.get((kernel, parent_variant))
        if parent_manifest is None:
            errors.append(f"parent manifest missing: {parent_variant}")
            continue
        edge = compute_provenance(parent_manifest, manifest, observation)
        provenance_by_parent.append({"parent_variant": parent_variant, **edge})
    if not provenance_by_parent:
        provenance = {
            "mapped_count": 28,
            "baseline_count": 28,
            "traceability": 1.0,
            "mappings": [],
            "aggregation": "genesis",
        }
    elif len(provenance_by_parent) == 1:
        provenance = {
            key: value for key, value in provenance_by_parent[0].items()
            if key != "parent_variant"
        }
        provenance["aggregation"] = "single-parent-edge"
    else:
        provenance = {
            "mapped_count": min(edge["mapped_count"] for edge in provenance_by_parent),
            "baseline_count": max(edge["baseline_count"] for edge in provenance_by_parent),
            "traceability": min(edge["traceability"] for edge in provenance_by_parent),
            "mappings": [],
            "aggregation": "minimum-over-parent-edges",
        }
    if watermark.get("provenance_by_parent") != provenance_by_parent:
        errors.append("independent parent-edge provenance mismatch")
    if watermark.get("provenance") != provenance:
        errors.append("independent aggregate provenance mismatch")
    if not close(watermark.get("traceability_threshold"), TRACE_THRESHOLD):
        errors.append("traceability threshold mismatch")
    trace_pass = all(
        edge["traceability"] >= TRACE_THRESHOLD for edge in provenance_by_parent
    ) if provenance_by_parent else True
    expected_continuity = "TRACEABLE_WITHIN_LOCK" if trace_pass else "CONTINUITY_BELOW_LOCK"
    if watermark.get("continuity_status") != expected_continuity:
        errors.append("continuity status mismatch")

    toolchains = behavior.get("toolchains")
    if not isinstance(toolchains, list):
        record_integrity_error("toolchains is not a list")
        toolchains = []
    observed_cells = [(tc.get("compiler"), tc.get("optimization")) for tc in toolchains if isinstance(tc, dict)]
    if len(toolchains) != 4 or sorted(observed_cells) != sorted(EXPECTED_TOOLCHAINS) or len(set(observed_cells)) != 4:
        record_integrity_error("certificate does not contain exactly the four locked compiler cells")
    tc_map = {(tc.get("compiler"), tc.get("optimization")): tc for tc in toolchains if isinstance(tc, dict)}
    behavior_matches: list[bool] = []
    executable_matches: list[bool] = []
    observed_ids = {c["carrier_id"] for c in observation["carriers"] if c["observed_bit"] is not None}
    for compiler, optimization in EXPECTED_TOOLCHAINS:
        tc = tc_map.get((compiler, optimization))
        if tc is None:
            behavior_matches.append(False)
            executable_matches.append(False)
            continue
        cell_reproduced = False
        tag = f"{compiler}_{optimization[1:].lower()}"
        expected_output_rel = f"artifact/results/raw/{kernel}/{variant}/{tag}.out"
        expected_assembly_rel = f"artifact/results/raw/{kernel}/{variant}/{tag}.s"
        expected_binary_rel = f"artifact/results/raw/{kernel}/{variant}/{tag}"
        expected_command = [
            compiler, "-std=c11", "-Wall", "-Wextra", "-Werror", optimization,
            expected_source_rel, "-o", expected_binary_rel,
        ]
        expected_assembly_command = [
            compiler, "-std=c11", optimization, "-S",
            expected_source_rel, "-o", expected_assembly_rel,
        ]
        if tc.get("compile_command") != expected_command:
            record_integrity_error(f"compile command mismatch: {compiler} {optimization}")
        if tc.get("assembly_command") != expected_assembly_command:
            record_integrity_error(f"assembly command mismatch: {compiler} {optimization}")
        if tc.get("compiler_version") != environment.get(compiler):
            record_integrity_error(f"compiler version mismatch: {compiler} {optimization}")
        if (
            tc.get("status") != "EXECUTED"
            or tc.get("compile_returncode") != 0
            or tc.get("assembly_returncode") != 0
            or tc.get("run_returncode") != 0
        ):
            record_integrity_error(f"execution status mismatch: {compiler} {optimization}")
        if tc.get("binary_path") != expected_binary_rel:
            record_integrity_error(f"binary path mismatch: {compiler} {optimization}")
        if tc.get("output_path") != expected_output_rel:
            record_integrity_error(f"output path mismatch: {compiler} {optimization}")
        if tc.get("assembly_path") != expected_assembly_rel:
            record_integrity_error(f"assembly path mismatch: {compiler} {optimization}")
        binary_path = root / expected_binary_rel
        output_path = root / expected_output_rel
        assembly_path = root / expected_assembly_rel
        if not binary_path.is_file():
            record_integrity_error(f"binary file missing: {compiler} {optimization}")
        elif tc.get("binary_sha256") != sha_file(binary_path):
            record_integrity_error(f"binary hash mismatch: {compiler} {optimization}")
        if not output_path.is_file():
            record_integrity_error(f"output file missing: {compiler} {optimization}")
            behavior_matches.append(False)
            executable_matches.append(False)
            continue
        actual = output_path.read_bytes()
        actual_hash = sha_bytes(actual)
        mismatch = first_mismatch(reference, actual)
        match = mismatch is None
        behavior_matches.append(match)
        if len(actual) != 65536 or tc.get("output_size") != len(actual):
            record_integrity_error(f"output size mismatch: {compiler} {optimization}")
        if tc.get("output_sha256") != actual_hash:
            record_integrity_error(f"output hash mismatch: {compiler} {optimization}")
        if bool(tc.get("matches_reference")) != match:
            errors.append(f"behavior flag mismatch: {compiler} {optimization}")
        if tc.get("first_mismatch") != mismatch:
            errors.append(f"first mismatch evidence mismatch: {compiler} {optimization}")
        if not assembly_path.is_file():
            record_integrity_error(f"assembly file missing: {compiler} {optimization}")
        else:
            if tc.get("assembly_sha256") != sha_file(assembly_path):
                record_integrity_error(f"assembly hash mismatch: {compiler} {optimization}")
            retention = recompute_assembly_retention(
                assembly_path.read_text(encoding="utf-8", errors="replace"), manifest, observed_ids
            )
            if tc.get("assembly_retention") != retention:
                errors.append(f"assembly retention mismatch: {compiler} {optimization}")
        if not isinstance(tc.get("binary_sha256"), str) or not HEX64.fullmatch(tc["binary_sha256"]):
            record_integrity_error(f"malformed binary hash record: {compiler} {optimization}")

        # Bind source -> compiler realization -> executable -> fresh output.
        # Merely rehashing a retained executable and comparing a stored output
        # does not establish that the executable was produced by the named
        # source or that it emitted those bytes. The independent pass therefore
        # recompiles the executable in a fresh directory, requires a
        # byte-identical compiler realization, executes the replayed binary,
        # and compares its stdout with both the retained output and the
        # independently reconstructed reference. Assembly remains a secondary
        # surface that is independently rehashed and rescanned, not recompiled.
        if replay_root is not None:
            replay_dir = replay_root / str(kernel) / str(variant) / tag
            replay_dir.mkdir(parents=True, exist_ok=True)
            replay_binary = replay_dir / tag
            replay_compile_command = [
                compiler, "-std=c11", "-Wall", "-Wextra", "-Werror",
                optimization, expected_source_rel, "-o", str(replay_binary),
            ]
            try:
                replay_compile = subprocess.run(
                    replay_compile_command,
                    cwd=root,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,
                    timeout=COMPILE_TIMEOUT_SECONDS,
                )
            except (OSError, subprocess.SubprocessError) as exc:
                errors.append(f"independent recompilation failed: {compiler} {optimization}: {exc}")
                replay_compile = None
            if replay_compile is not None:
                if replay_compile.returncode != 0 or not replay_binary.is_file():
                    errors.append(
                        f"independent recompilation status mismatch: {compiler} {optimization}"
                    )
                elif binary_path.is_file():
                    cell_reproduced = sha_file(replay_binary) == sha_file(binary_path)
                    if not cell_reproduced:
                        errors.append(
                            f"independent recompilation binary mismatch: {compiler} {optimization}"
                        )

            if replay_binary.is_file():
                try:
                    replay_execution = subprocess.run(
                        [str(replay_binary)],
                        cwd=root,
                        stdout=subprocess.PIPE,
                        stderr=subprocess.PIPE,
                        timeout=RUN_TIMEOUT_SECONDS,
                    )
                except (OSError, subprocess.SubprocessError) as exc:
                    errors.append(f"independent executable replay failed: {compiler} {optimization}: {exc}")
                    replay_execution = None
                if replay_execution is not None:
                    if replay_execution.returncode != 0:
                        errors.append(
                            f"independent executable replay return code mismatch: {compiler} {optimization}"
                        )
                    replay_stderr = replay_execution.stderr.decode("utf-8", "replace")
                    if replay_stderr != tc.get("stderr"):
                        errors.append(
                            f"independent executable replay stderr mismatch: {compiler} {optimization}"
                        )
                    if replay_execution.stdout != actual:
                        errors.append(
                            f"independent executable replay output-file mismatch: {compiler} {optimization}"
                        )
                    replay_mismatch = first_mismatch(reference, replay_execution.stdout)
                    if replay_mismatch != mismatch:
                        errors.append(
                            f"independent executable replay counterexample mismatch: {compiler} {optimization}"
                        )
        executable_matches.append(cell_reproduced)

    behavior_pass = len(behavior_matches) == 4 and all(behavior_matches)
    if bool(behavior.get("exact_finite_equivalence")) != behavior_pass:
        errors.append("exact finite equivalence flag mismatch")
    expected_maturity = "VERIFIED" if behavior_pass else "COUNTEREXAMPLE_FOUND"
    if behavior.get("maturity") != expected_maturity:
        errors.append("behavior maturity mismatch")

    chain = cert.get("chain", {})
    parent_validations = parent_validations or {}
    expected_edges: list[dict[str, Any]] = []
    for parent_variant, parent_cert in zip(parent_variants, parent_certs):
        if parent_cert is None:
            continue
        parent_validation = parent_validations.get(parent_variant)
        if parent_validation is None:
            expected_parent_decision = None
            parent_accepted = False
            errors.append(f"independent parent reconstruction missing: {parent_variant}")
        else:
            expected_parent_decision = parent_validation.get("verdict")
            parent_accepted = bool(
                parent_validation.get("valid") is True
                and expected_parent_decision == "PASS"
            )
        parent_policy_hash = parent_cert.get("policy", {}).get("canonical_sha256")
        policy_compatible = policy_ref.get("canonical_sha256") == parent_policy_hash
        expected_edges.append({
            "variant": parent_variant,
            "certificate_sha256": parent_cert.get("certificate_sha256"),
            "policy_canonical_sha256": parent_policy_hash,
            "decision": expected_parent_decision,
            "accepted": parent_accepted,
            "hash_link_valid": True,
            "policy_compatible": policy_compatible,
        })

    if chain.get("parents") != expected_edges:
        errors.append("parent-edge set mismatch")
    expected_sole_edge = expected_edges[0] if len(expected_edges) == 1 else None
    expected_predecessor_hash = None if expected_sole_edge is None else expected_sole_edge["certificate_sha256"]
    expected_predecessor_policy_hash = None if expected_sole_edge is None else expected_sole_edge["policy_canonical_sha256"]
    expected_predecessor_decision = None if expected_sole_edge is None else expected_sole_edge["decision"]
    expected_predecessor_accepted = True if not expected_edges else (
        None if expected_sole_edge is None else expected_sole_edge["accepted"]
    )
    expected_hash_links = all(edge["hash_link_valid"] for edge in expected_edges) if expected_edges else True
    expected_policy_compatibility = all(edge["policy_compatible"] for edge in expected_edges) if expected_edges else True
    expected_all_parents_accepted = all(edge["accepted"] for edge in expected_edges) if expected_edges else True
    if chain.get("predecessor_certificate_sha256") != expected_predecessor_hash:
        errors.append("legacy predecessor link mismatch")
    if chain.get("predecessor_policy_canonical_sha256") != expected_predecessor_policy_hash:
        errors.append("legacy predecessor policy link mismatch")
    if chain.get("predecessor_decision") != expected_predecessor_decision:
        errors.append("legacy predecessor decision mismatch")
    if chain.get("predecessor_accepted") is not expected_predecessor_accepted:
        errors.append("legacy predecessor acceptance mismatch")
    if chain.get("hash_link_valid") is not expected_hash_links:
        errors.append("hash link validity field mismatch")
    if chain.get("policy_compatible") is not expected_policy_compatibility:
        errors.append("policy compatibility field mismatch")
    if chain.get("all_parents_accepted") is not expected_all_parents_accepted:
        errors.append("all-parent acceptance field mismatch")

    executable_pass = len(executable_matches) == len(EXPECTED_TOOLCHAINS) and all(executable_matches)
    source_pass = not observation_errors
    lineage_pass = (
        chain.get("parents") == expected_edges
        and chain.get("hash_link_valid") is expected_hash_links
        and chain.get("policy_compatible") is expected_policy_compatibility
        and chain.get("all_parents_accepted") is expected_all_parents_accepted
        and expected_hash_links
        and expected_policy_compatibility
        and expected_all_parents_accepted
    )
    # Integrity is a reconstructed relation, not a hidden validation channel.
    # Every mismatch in the certificate self-binding, policy binding, frozen
    # object paths, compiler-cell inventory, or retained object hashes records
    # an established false integrity coordinate.  This keeps the typed verdict
    # aligned with the public seven-relation model: a coherent-looking package
    # cannot be rejected solely by an unmodelled structural side condition.
    integrity_pass = not integrity_errors
    reconstructed_relations = {
        "behavior": {
            "passed": behavior_pass,
            "state": relation_state(behavior_pass),
            "exact_finite_equivalence": behavior_pass,
        },
        "recovery": {
            "passed": payload_pass,
            "state": relation_state(payload_pass),
            "status": observation["decode"]["status"],
            "payload_hex": observation["decode"]["payload_hex"],
        },
        "continuity": {
            "passed": trace_pass,
            "state": relation_state(trace_pass),
            "mapped_count": provenance["mapped_count"],
            "baseline_count": provenance["baseline_count"],
            "required_count": 26,
            "parent_edge_count": len(parent_variants),
            "per_parent": [
                {
                    "parent_variant": edge["parent_variant"],
                    "mapped_count": edge["mapped_count"],
                    "baseline_count": edge["baseline_count"],
                    "traceability": edge["traceability"],
                }
                for edge in provenance_by_parent
            ],
        },
        "source_conformance": {
            "passed": source_pass,
            "state": relation_state(source_pass),
        },
        "executable_reproduction": {
            "passed": executable_pass,
            "state": relation_state(executable_pass),
        },
        "integrity": {
            "passed": integrity_pass,
            "state": relation_state(integrity_pass),
        },
        "lineage": {
            "passed": lineage_pass,
            "state": relation_state(lineage_pass),
        },
    }
    stored_relations = cert.get("relations", {})
    if set(stored_relations) != set(RELATION_NAMES):
        errors.append("relation inventory mismatch")
    for relation in RELATION_NAMES:
        stored = stored_relations.get(relation)
        actual = reconstructed_relations[relation]
        if not isinstance(stored, dict):
            errors.append(f"missing stored relation: {relation}")
            continue
        if stored.get("passed") is not actual["passed"]:
            errors.append(f"stored relation outcome mismatch: {relation}")
        if stored.get("state") != actual["state"]:
            errors.append(f"stored relation state mismatch: {relation}")
        for field in sorted(set(actual) - {"passed", "state"}):
            if stored.get(field) != actual[field]:
                errors.append(f"stored relation detail mismatch: {relation}.{field}")

    expected_verdict = typed_decision(
        [reconstructed_relations[name]["passed"] for name in RELATION_NAMES]
    )
    if cert.get("verdict") != expected_verdict:
        errors.append("typed verdict predicate mismatch")
    locked_verdict = "PASS" if variant in PASS_VARIANTS else "REJECT"
    if expected_verdict != locked_verdict:
        errors.append("locked variant outcome mismatch")

    # Clause-separating controls are checked at their exact boundary values.
    if variant == "recovery_break":
        blocks = observation["decode"].get("blocks", [])
        first = blocks[0] if blocks else {}
        if (
            not behavior_pass
            or payload_pass
            or provenance["mapped_count"] != 27
            or first.get("status") != "AMBIGUOUS"
            or first.get("errors") != 1
            or first.get("erasures") != 1
            or first.get("candidate_count") != 2
        ):
            errors.append("recovery_break control semantics mismatch")
    elif variant == "reseed":
        if not behavior_pass or not payload_pass or provenance["mapped_count"] != 0:
            errors.append("reseed control semantics mismatch")
    elif variant == "behavior_drift":
        if behavior_pass or not payload_pass or provenance["mapped_count"] != 28:
            errors.append("behavior_drift control semantics mismatch")
        for compiler, optimization in EXPECTED_TOOLCHAINS:
            tc = tc_map.get((compiler, optimization), {})
            mismatch = tc.get("first_mismatch")
            if not isinstance(mismatch, dict) or (mismatch.get("x"), mismatch.get("y")) != (66, 153):
                errors.append(f"behavior_drift counterexample mismatch: {compiler} {optimization}")
    return finish(reconstructed_relations, expected_verdict)


def certificate_self_hash_valid(cert: dict[str, Any]) -> bool:
    stored = cert.get("certificate_sha256")
    if not isinstance(stored, str) or not HEX64.fullmatch(stored):
        return False
    unsigned = copy.deepcopy(cert)
    unsigned.pop("certificate_sha256", None)
    return canonical_hash(unsigned) == stored


def validate_mutant_with_fresh_replay(
    root: Path,
    cert: dict[str, Any],
    certs: dict[tuple[str, str], dict[str, Any]],
    manifests: dict[tuple[str, str], dict[str, Any]],
    references: dict[str, bytes],
    environment: dict[str, Any],
    label: str,
    reconstructed_results: dict[tuple[str, str], dict[str, Any]] | None = None,
    parent_validations: dict[str, dict[str, Any]] | None = None,
    parent_validation: dict[str, Any] | None = None,
    reconstruction_sink: dict[str, Any] | None = None,
) -> list[str]:
    """Validate one adversarial certificate without a missing-replay confound."""
    with tempfile.TemporaryDirectory(prefix=f"tse01-tamper-{label}-") as temporary:
        parents = list(VARIANT_PARENTS.get(cert.get("variant"), ()))
        if parent_validations is None:
            parent_validations = {}
            if reconstructed_results is not None:
                parent_validations.update({
                    parent: reconstructed_results.get((cert.get("kernel"), parent), {})
                    for parent in parents
                })
            elif parent_validation is not None and len(parents) == 1:
                parent_validations[parents[0]] = parent_validation
        return validate_certificate(
            root,
            cert,
            certs,
            manifests,
            references,
            environment,
            replay_root=Path(temporary),
            parent_validations=parent_validations,
            reconstruction_sink=reconstruction_sink,
        )


def run_semantic_tamper_tests(
    root: Path,
    certs: dict[tuple[str, str], dict[str, Any]],
    manifests: dict[tuple[str, str], dict[str, Any]],
    references: dict[str, bytes],
    environment: dict[str, Any],
    reconstructed_results: dict[tuple[str, str], dict[str, Any]],
) -> list[dict[str, Any]]:
    tests: list[tuple[str, dict[str, Any]]] = []

    omission = copy.deepcopy(certs[("fnv_step", "baseline")])
    omission["behavior"]["toolchains"] = omission["behavior"]["toolchains"][:1]
    tests.append(("locked_toolchain_omission", add_self_hash(omission)))

    forged_trace = copy.deepcopy(certs[("fnv_step", "reseed")])
    forged_trace["watermark"]["provenance"] = {
        "mapped_count": 28, "baseline_count": 28, "traceability": 1.0,
        "mappings": copy.deepcopy(certs[("fnv_step", "dependency_upgrade")]["watermark"]["provenance"]["mappings"]),
    }
    forged_trace["watermark"]["continuity_status"] = "TRACEABLE_WITHIN_LOCK"
    forged_trace["verdict"] = "PASS"
    tests.append(("forged_continuity_with_fresh_self_hash", add_self_hash(forged_trace)))

    forged_assembly = copy.deepcopy(certs[("fnv_step", "baseline")])
    forged_assembly["behavior"]["toolchains"][0]["assembly_sha256"] = "0" * 64
    tests.append(("forged_assembly_hash_with_fresh_self_hash", add_self_hash(forged_assembly)))

    forged_mapping = copy.deepcopy(certs[("fnv_step", "recovery_break")])
    forged_mapping["watermark"]["provenance"]["mapped_count"] = 28
    forged_mapping["watermark"]["provenance"]["traceability"] = 1.0
    forged_mapping["watermark"]["continuity_status"] = "TRACEABLE_WITHIN_LOCK"
    tests.append(("forged_mapping_count_with_fresh_self_hash", add_self_hash(forged_mapping)))

    forged_binary = copy.deepcopy(certs[("fnv_step", "baseline")])
    forged_binary["behavior"]["toolchains"][0]["binary_sha256"] = "0" * 64
    tests.append(("forged_binary_hash_with_fresh_self_hash", add_self_hash(forged_binary)))

    forged_manifest_file = copy.deepcopy(certs[("fnv_step", "baseline")])
    forged_manifest_file["manifest"]["file_sha256"] = "0" * 64
    tests.append(("forged_manifest_file_hash_with_fresh_self_hash", add_self_hash(forged_manifest_file)))

    # Silent policy substitution with refreshed file, canonical, and certificate
    # hashes. The relation vector is unchanged, so only independent policy
    # reconstruction and policy-compatible lineage can reject it.
    policy_target = ("fnv_step", "flip_tolerable")
    policy_cert = copy.deepcopy(certs[policy_target])
    policy_path = root / policy_cert["policy"]["path"]
    original_policy_bytes = policy_path.read_bytes()
    try:
        changed_policy = expected_finite_policy("fnv_step", environment, 25)
        policy_path.write_text(json.dumps(changed_policy, indent=2, sort_keys=True) + "\n", encoding="utf-8")
        policy_cert["policy"]["file_sha256"] = sha_file(policy_path)
        policy_cert["policy"]["canonical_sha256"] = canonical_hash(changed_policy)
        policy_cert = add_self_hash(policy_cert)
        changed_certs = dict(certs)
        changed_certs[policy_target] = policy_cert
        policy_errors = validate_mutant_with_fresh_replay(
            root, policy_cert, changed_certs, manifests, references, environment, "policy",
            reconstructed_results=reconstructed_results,
        )
    finally:
        policy_path.write_bytes(original_policy_bytes)
    tests.append(("silent_policy_threshold_change_with_fresh_hashes", policy_cert))

    # A merge certificate must bind every frozen parent edge.  Remove the
    # second parent and refresh every affected outer field; reconstruction must
    # still reject because the release specification requires both parents.
    merge_omission = copy.deepcopy(certs[("fnv_step", "merge_tolerable")])
    kept_edge = copy.deepcopy(merge_omission["chain"]["parents"][0])
    kept_provenance = copy.deepcopy(merge_omission["watermark"]["provenance_by_parent"][0])
    kept_source_hash = merge_omission["source"]["parent_sha256s"][0]
    merge_omission["parent_variants"] = ["format"]
    merge_omission["parent_variant"] = "format"
    merge_omission["source"]["parent_sha256s"] = [kept_source_hash]
    merge_omission["source"]["parent_sha256"] = kept_source_hash
    merge_omission["watermark"]["provenance_by_parent"] = [kept_provenance]
    merge_omission["watermark"]["provenance"] = {
        key: value for key, value in kept_provenance.items()
        if key != "parent_variant"
    }
    merge_omission["watermark"]["provenance"]["aggregation"] = "single-parent-edge"
    merge_omission["chain"]["parents"] = [kept_edge]
    merge_omission["chain"]["predecessor_certificate_sha256"] = kept_edge["certificate_sha256"]
    merge_omission["chain"]["predecessor_policy_canonical_sha256"] = kept_edge["policy_canonical_sha256"]
    merge_omission["chain"]["predecessor_decision"] = kept_edge["decision"]
    merge_omission["chain"]["predecessor_accepted"] = kept_edge["accepted"]
    merge_omission["chain"]["hash_link_valid"] = kept_edge["hash_link_valid"]
    merge_omission["chain"]["policy_compatible"] = kept_edge["policy_compatible"]
    merge_omission["chain"]["all_parents_accepted"] = kept_edge["accepted"]
    merge_omission["relations"]["continuity"]["parent_edge_count"] = 1
    merge_omission["relations"]["continuity"]["per_parent"] = [{
        "parent_variant": kept_provenance["parent_variant"],
        "mapped_count": kept_provenance["mapped_count"],
        "baseline_count": kept_provenance["baseline_count"],
        "traceability": kept_provenance["traceability"],
    }]
    merge_omission = add_self_hash(merge_omission)
    tests.append(("merge_second_parent_omission_with_fresh_hashes", merge_omission))

    # A cryptographically valid but rejected certificate must not become an
    # admissible predecessor merely because the successor refreshes its chain
    # fields and self-hash.  The full checker validates every certificate; this
    # local fixture isolates the accepted-predecessor premise.
    graft_target = ("fnv_step", "flip_tolerable")
    graft_parent_key = ("fnv_step", "merge_tolerable")
    rejected_parent = certs[("fnv_step", "recovery_break")]
    rejected_graft = copy.deepcopy(certs[graft_target])
    rejected_edge = rejected_graft["chain"]["parents"][0]
    rejected_edge["certificate_sha256"] = rejected_parent["certificate_sha256"]
    rejected_edge["policy_canonical_sha256"] = rejected_parent["policy"]["canonical_sha256"]
    rejected_edge["decision"] = rejected_parent["verdict"]
    rejected_edge["accepted"] = False
    rejected_edge["hash_link_valid"] = True
    rejected_edge["policy_compatible"] = True
    rejected_graft["chain"]["predecessor_certificate_sha256"] = rejected_parent["certificate_sha256"]
    rejected_graft["chain"]["predecessor_policy_canonical_sha256"] = rejected_parent["policy"]["canonical_sha256"]
    rejected_graft["chain"]["predecessor_decision"] = rejected_parent["verdict"]
    rejected_graft["chain"]["predecessor_accepted"] = False
    rejected_graft["chain"]["hash_link_valid"] = True
    rejected_graft["chain"]["policy_compatible"] = True
    rejected_graft["chain"]["all_parents_accepted"] = False
    rejected_graft["relations"]["lineage"]["passed"] = True
    rejected_graft["relations"]["lineage"]["state"] = relation_state(True)
    rejected_graft["verdict"] = "PASS"
    rejected_parent_certs = dict(certs)
    rejected_parent_certs[graft_parent_key] = rejected_parent
    rejected_graft["source"]["parent_sha256"] = rejected_parent["source"]["sha256"]
    rejected_graft["source"]["parent_sha256s"] = [rejected_parent["source"]["sha256"]]
    rejected_graft = add_self_hash(rejected_graft)
    rejected_parent_reconstruction: dict[str, Any] = {}
    rejected_parent_validation_errors = validate_mutant_with_fresh_replay(
        root,
        rejected_parent,
        rejected_parent_certs,
        manifests,
        references,
        environment,
        "rejected-parent-validation",
        reconstructed_results=reconstructed_results,
        reconstruction_sink=rejected_parent_reconstruction,
    )
    rejected_parent_errors = validate_mutant_with_fresh_replay(
        root,
        rejected_graft,
        rejected_parent_certs,
        manifests,
        references,
        environment,
        "rejected-parent",
        parent_validation=rejected_parent_reconstruction,
    )
    if not rejected_parent_validation_errors and rejected_parent_reconstruction.get("verdict") == "PASS":
        rejected_parent_errors.append("rejected-parent fixture did not reconstruct as non-pass")

    outcomes: list[dict[str, Any]] = []
    integrity_relation_mutants = {
        "locked_toolchain_omission",
        "forged_assembly_hash_with_fresh_self_hash",
        "forged_binary_hash_with_fresh_self_hash",
        "forged_manifest_file_hash_with_fresh_self_hash",
    }
    for name, cert in tests:
        reconstruction: dict[str, Any] = {}
        if name == "silent_policy_threshold_change_with_fresh_hashes":
            errors = list(policy_errors)
        else:
            errors = validate_mutant_with_fresh_replay(
                root, cert, certs, manifests, references, environment, name.replace("_", "-"),
                reconstructed_results=reconstructed_results,
                reconstruction_sink=reconstruction,
            )
        reconstructed_integrity = (reconstruction.get("relations") or {}).get("integrity", {}).get("passed")
        reconstructed_verdict = reconstruction.get("verdict")
        if name in integrity_relation_mutants and not (
            reconstructed_integrity is False and reconstructed_verdict == "REJECT"
        ):
            errors.append(
                "integrity-binding mutant did not reconstruct integrity=false and verdict=REJECT"
            )
        outcomes.append({
            "name": name,
            "binding_mode": "refreshed_certificate_or_file",
            "outer_self_hash_valid": certificate_self_hash_valid(cert),
            "rejected": bool(errors),
            "reconstructed_integrity": reconstructed_integrity,
            "reconstructed_verdict": reconstructed_verdict,
            "errors": errors,
        })

    outcomes.append({
        "name": "rejected_predecessor_graft_with_fresh_hashes",
        "binding_mode": "refreshed_certificate_or_file",
        "outer_self_hash_valid": certificate_self_hash_valid(rejected_graft),
        "rejected": bool(rejected_parent_errors),
        "errors": rejected_parent_errors,
    })

    # A parent can carry a valid self-hash and stored PASS claims while its
    # bound evidence is invalid.  A child-only check of those stored claims used
    # to accept the refreshed link.  Reconstruct the forged parent first and
    # require that full result when validating the child.
    forged_parent_key = ("fnv_step", "merge_tolerable")
    forged_child_key = ("fnv_step", "flip_tolerable")
    forged_parent = copy.deepcopy(certs[forged_parent_key])
    forged_parent["behavior"]["toolchains"][0]["binary_sha256"] = "0" * 64
    forged_parent = add_self_hash(forged_parent)
    forged_parent_certs = dict(certs)
    forged_parent_certs[forged_parent_key] = forged_parent
    forged_child = copy.deepcopy(certs[forged_child_key])
    forged_edge = forged_child["chain"]["parents"][0]
    forged_edge["certificate_sha256"] = forged_parent["certificate_sha256"]
    forged_edge["decision"] = "PASS"
    forged_edge["accepted"] = True
    forged_edge["hash_link_valid"] = True
    forged_edge["policy_compatible"] = True
    forged_child["chain"]["predecessor_certificate_sha256"] = forged_parent["certificate_sha256"]
    forged_child["chain"]["predecessor_decision"] = "PASS"
    forged_child["chain"]["predecessor_accepted"] = True
    forged_child["chain"]["hash_link_valid"] = True
    forged_child["chain"]["policy_compatible"] = True
    forged_child["chain"]["all_parents_accepted"] = True
    forged_child = add_self_hash(forged_child)
    forged_parent_certs[forged_child_key] = forged_child
    forged_parent_reconstruction: dict[str, Any] = {}
    forged_parent_errors = validate_mutant_with_fresh_replay(
        root,
        forged_parent,
        forged_parent_certs,
        manifests,
        references,
        environment,
        "forged-parent-validation",
        reconstructed_results=reconstructed_results,
        reconstruction_sink=forged_parent_reconstruction,
    )
    forged_child_reconstruction: dict[str, Any] = {}
    forged_child_errors = validate_mutant_with_fresh_replay(
        root,
        forged_child,
        forged_parent_certs,
        manifests,
        references,
        environment,
        "forged-parent-child",
        parent_validation=forged_parent_reconstruction,
        reconstruction_sink=forged_child_reconstruction,
    )
    if not forged_parent_errors:
        forged_child_errors.append("forged parent unexpectedly validated")
    outcomes.append({
        "name": "forged_parent_claims_with_fresh_hashes",
        "binding_mode": "refreshed_certificate_or_file",
        "outer_self_hash_valid": certificate_self_hash_valid(forged_child),
        "rejected": bool(forged_child_errors),
        "errors": forged_child_errors,
        "parent_error_count": len(forged_parent_errors),
        "reconstructed_parent_valid": forged_parent_reconstruction.get("valid"),
        "reconstructed_parent_verdict": forged_parent_reconstruction.get("verdict"),
        "reconstructed_child_verdict": forged_child_reconstruction.get("verdict"),
    })

    # The remaining source and file substitutions are appended below.
    helper_path = root / "artifact/benchmark/generated/fnv_step/reseed/kernel.c"
    helper_source = helper_path.read_text(encoding="utf-8")
    original_add = "static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }"
    original_xor = "static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }"
    swapped_add = "static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }"
    swapped_xor = "static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return (v - k) + k; }"
    if original_add not in helper_source or original_xor not in helper_source:
        helper_errors = ["locked helper source fixture mismatch"]
    else:
        mutated_source = helper_source.replace(original_add, swapped_add).replace(original_xor, swapped_xor)
        _, helper_errors = source_observation(mutated_source, manifests[("fnv_step", "reseed")])
    outcomes.append({
        "name": "swapped_locked_helper_bodies",
        "binding_mode": "direct_source_interpretation",
        "outer_self_hash_valid": None,
        "rejected": bool(helper_errors),
        "errors": helper_errors,
    })

    macro_alias_source = helper_source.replace(
        original_xor,
        original_xor + "\n#define tc_add_v2(v,k) tc_xor_v2((v),(k))",
        1,
    ).replace(
        "uint32_t accumulator = ((uint32_t)(x ^ y) * 0x93u) & 0xffu;",
        "uint32_t accumulator = ((uint32_t)(x ^ y) * 0x93u) & 0xffu;\n(void)tc_add_v2;",
        1,
    )
    _, macro_alias_errors = source_observation(
        macro_alias_source, manifests[("fnv_step", "reseed")]
    )
    outcomes.append({
        "name": "helper_macro_alias",
        "binding_mode": "direct_source_interpretation",
        "outer_self_hash_valid": None,
        "rejected": bool(macro_alias_errors),
        "errors": macro_alias_errors,
    })

    local_shadow_source = helper_source.replace(
        "uint32_t accumulator = ((uint32_t)(x ^ y) * 0x93u) & 0xffu;",
        "uint32_t accumulator = ((uint32_t)(x ^ y) * 0x93u) & 0xffu;\n"
        "(void)tc_add_v2;\n"
        "uint32_t (*tc_add_v2)(uint32_t, uint32_t) = tc_xor_v2;",
        1,
    )
    _, local_shadow_errors = source_observation(
        local_shadow_source, manifests[("fnv_step", "reseed")]
    )
    outcomes.append({
        "name": "helper_function_pointer_shadow",
        "binding_mode": "direct_source_interpretation",
        "outer_self_hash_valid": None,
        "rejected": bool(local_shadow_errors),
        "errors": local_shadow_errors,
    })

    # File-level substitution with all outer hashes refreshed. The target is a
    # leaf certificate so no descendant link needs alteration. A checker that
    # only rehashes the retained executable and trusts the stored output accepts
    # this mutation; independent recompilation and execution must reject it.
    target = ("fnv_step", "flip_tolerable")
    substituted_cert = copy.deepcopy(certs[target])
    with tempfile.TemporaryDirectory(prefix="tse01-executable-substitution-") as tmp:
        tmp_root = Path(tmp) / "root"
        required_paths = {
            substituted_cert["source"]["path"],
            substituted_cert["manifest"]["path"],
            substituted_cert["behavior"]["reference_table_path"],
            substituted_cert["policy"]["path"],
        }
        for cell in substituted_cert["behavior"]["toolchains"]:
            required_paths.update({
                cell["binary_path"], cell["output_path"], cell["assembly_path"],
            })
        for rel in sorted(required_paths):
            src = root / rel
            dst = tmp_root / rel
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(src, dst)

        target_cell = next(
            cell for cell in substituted_cert["behavior"]["toolchains"]
            if cell["compiler"] == "gcc" and cell["optimization"] == "-O0"
        )
        substituted_binary = tmp_root / target_cell["binary_path"]
        substituted_binary.write_bytes(b"#!/bin/sh\nexit 0\n")
        substituted_binary.chmod(0o755)
        target_cell["binary_sha256"] = sha_file(substituted_binary)
        substituted_cert = add_self_hash(substituted_cert)
        substituted_certs = dict(certs)
        substituted_certs[target] = substituted_cert
        replay_dir = Path(tmp) / "replay"
        substitution_errors = validate_certificate(
            tmp_root,
            substituted_cert,
            substituted_certs,
            manifests,
            references,
            environment,
            replay_root=replay_dir,
            parent_validations={"merge_tolerable": reconstructed_results.get(("fnv_step", "merge_tolerable"), {})},
        )
    outcomes.append({
        "name": "retained_executable_substitution_with_fresh_hashes",
        "binding_mode": "refreshed_certificate_or_file",
        "outer_self_hash_valid": certificate_self_hash_valid(substituted_cert),
        "rejected": bool(substitution_errors),
        "errors": substitution_errors,
    })
    return outcomes


def validate_policy_bridge(root: Path, certs: dict[tuple[str, str], dict[str, Any]], environment: dict[str, Any]) -> list[str]:
    errors: list[str] = []
    bridge_path = root / "artifact/policies/bridge/fnv_step-threshold-25-bridge.json"
    to_policy_path = root / "artifact/policies/bridge/fnv_step-threshold-25.json"
    if not bridge_path.is_file() or not to_policy_path.is_file():
        return ["policy bridge fixture missing"]
    bridge = json.loads(bridge_path.read_text(encoding="utf-8"))
    unsigned = copy.deepcopy(bridge)
    stored = unsigned.pop("certificate_sha256", None)
    if stored != canonical_hash(unsigned):
        errors.append("policy bridge self-hash mismatch")
    if bridge.get("schema") != POLICY_BRIDGE_SCHEMA:
        errors.append("policy bridge schema mismatch")
    subject = certs.get(("fnv_step", "dependency_upgrade"))
    if subject is None:
        return errors + ["policy bridge subject missing"]
    expected_subject = {
        "kernel": "fnv_step",
        "variant": "dependency_upgrade",
        "certificate_sha256": subject["certificate_sha256"],
        "source_sha256": subject["source"]["sha256"],
    }
    if bridge.get("subject") != expected_subject:
        errors.append("policy bridge subject mismatch")
    if bridge.get("from_policy") != subject.get("policy"):
        errors.append("policy bridge source policy mismatch")
    expected_to = expected_finite_policy(
        "fnv_step", environment, 25, policy_id="finite:fnv_step:threshold-25-bridge-v1"
    )
    actual_to = json.loads(to_policy_path.read_text(encoding="utf-8"))
    if actual_to != expected_to:
        errors.append("policy bridge target policy mismatch")
    expected_to_binding = {
        "path": "artifact/policies/bridge/fnv_step-threshold-25.json",
        "policy_id": expected_to["policy_id"],
        "file_sha256": sha_file(to_policy_path),
        "canonical_sha256": canonical_hash(expected_to),
    }
    if bridge.get("to_policy") != expected_to_binding:
        errors.append("policy bridge target binding mismatch")
    vector = {name: bool(subject["relations"][name]["passed"]) for name in RELATION_NAMES}
    if bridge.get("from_relation_vector") != vector or bridge.get("to_relation_vector") != vector:
        errors.append("policy bridge relation vector mismatch")
    if bridge.get("from_decision") != typed_decision(list(vector.values())) or bridge.get("to_decision") != typed_decision(list(vector.values())):
        errors.append("policy bridge decision mismatch")
    if bridge.get("authorization") != "explicit-dual-policy-evaluation":
        errors.append("policy bridge authorization mismatch")
    if subject["policy"]["canonical_sha256"] == expected_to_binding["canonical_sha256"]:
        errors.append("policy bridge does not change policy identity")
    return errors


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[2])
    args = parser.parse_args()
    root = args.root.resolve()
    cert_root = root / "artifact" / "certificates"

    environment = json.loads((root / "artifact/environment.json").read_text(encoding="utf-8"))
    environment_errors = validate_locked_environment(environment)
    references = {kernel: reference_table(kernel) for kernel in KERNELS}
    certs: dict[tuple[str, str], dict[str, Any]] = {}
    manifests: dict[tuple[str, str], dict[str, Any]] = {}

    expected_cert_paths = {
        (kernel, variant): cert_root / kernel / f"{variant}.json"
        for kernel in KERNELS for variant in VARIANT_PARENTS
    }
    actual_cert_paths = set(cert_root.glob("*/*.json"))
    expected_path_set = set(expected_cert_paths.values())
    structural_errors: list[str] = list(environment_errors)
    if actual_cert_paths != expected_path_set:
        missing = sorted(str(p.relative_to(root)) for p in expected_path_set - actual_cert_paths)
        extra = sorted(str(p.relative_to(root)) for p in actual_cert_paths - expected_path_set)
        structural_errors.append(f"certificate set mismatch; missing={missing}; extra={extra}")

    for key, cert_path in expected_cert_paths.items():
        if not cert_path.is_file():
            continue
        certs[key] = json.loads(cert_path.read_text(encoding="utf-8"))
        manifest_path = root / f"artifact/benchmark/generated/{key[0]}/{key[1]}/watermark_manifest.json"
        if manifest_path.is_file():
            manifests[key] = json.loads(manifest_path.read_text(encoding="utf-8"))

    findings: list[dict[str, Any]] = []
    reconstructed_results: dict[tuple[str, str], dict[str, Any]] = {}
    with tempfile.TemporaryDirectory(prefix="tse01-independent-replay-") as replay_tmp:
        replay_root = Path(replay_tmp)

        def validate_kernel(kernel: str) -> tuple[list[dict[str, Any]], dict[tuple[str, str], dict[str, Any]]]:
            rows: list[dict[str, Any]] = []
            local_results: dict[tuple[str, str], dict[str, Any]] = {}
            for variant in VARIANT_PARENTS:
                key = (kernel, variant)
                cert = certs.get(key)
                if cert is None or key not in manifests:
                    sink = {"errors": ["certificate or manifest missing"], "relations": None,
                            "verdict": None, "valid": False}
                else:
                    parent_validations = {
                        parent: local_results.get((kernel, parent), {})
                        for parent in VARIANT_PARENTS[variant]
                    }
                    sink: dict[str, Any] = {}
                    validate_certificate(
                        root, cert, certs, manifests, references, environment,
                        replay_root=replay_root,
                        parent_validations=parent_validations,
                        reconstruction_sink=sink,
                    )
                local_results[key] = sink
                rows.append({
                    "kernel": kernel,
                    "variant": variant,
                    "valid": sink.get("valid") is True,
                    "verdict": sink.get("verdict"),
                    "errors": sink.get("errors", ["reconstruction result missing"]),
                })
            return rows, local_results

        with concurrent.futures.ThreadPoolExecutor(max_workers=REPLAY_WORKERS) as executor:
            for rows, local_results in executor.map(validate_kernel, KERNELS):
                findings.extend(rows)
                reconstructed_results.update(local_results)

    tampered_path = root / "artifact/results/raw/tampered_certificate.json"
    tamper_errors: list[str]
    if tampered_path.is_file():
        tampered = json.loads(tampered_path.read_text(encoding="utf-8"))
        tampered_parents = VARIANT_PARENTS.get(tampered.get("variant"), ())
        parent_validations = {
            parent: reconstructed_results.get((tampered.get("kernel"), parent), {})
            for parent in tampered_parents
        }
        tamper_errors = validate_certificate(
            root, tampered, certs, manifests, references, environment,
            parent_validations=parent_validations,
        )
    else:
        tamper_errors = ["tampered certificate fixture missing"]
    tamper_rejected = bool(tamper_errors)

    semantic_tamper_tests = run_semantic_tamper_tests(
        root, certs, manifests, references, environment, reconstructed_results
    )
    refreshed_binding_tests = [row for row in semantic_tamper_tests if row.get("binding_mode") == "refreshed_certificate_or_file"]
    direct_source_tests = [row for row in semantic_tamper_tests if row.get("binding_mode") == "direct_source_interpretation"]
    semantic_tamper_pass = (
        len(refreshed_binding_tests) == 11
        and len(direct_source_tests) == 3
        and all(row.get("outer_self_hash_valid") is True and row.get("rejected") is True for row in refreshed_binding_tests)
        and all(row.get("outer_self_hash_valid") is None and row.get("rejected") is True for row in direct_source_tests)
    )
    policy_bridge_errors = validate_policy_bridge(root, certs, environment)
    policy_bridge_fixture_pass = not policy_bridge_errors
    if not policy_bridge_fixture_pass:
        structural_errors.extend(policy_bridge_errors)
    all_valid = not structural_errors and all(row["valid"] for row in findings)
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
        structural_errors.append("typed decision fixture mismatch")
        all_valid = False

    receipt = {
        "schema": "tracecert.independent-recheck.v10",
        "checker_independence": "standard-library implementation; imports neither generator nor primary checker",
        "locked_environment_rechecked": not environment_errors,
        "certificate_count": len(findings),
        "compiler_cells_rechecked": len(findings) * len(EXPECTED_TOOLCHAINS),
        "input_evaluations_rechecked": len(findings) * len(EXPECTED_TOOLCHAINS) * 65536,
        "compiler_cells_recompiled": len(findings) * len(EXPECTED_TOOLCHAINS),
        "executables_reexecuted": len(findings) * len(EXPECTED_TOOLCHAINS),
        "input_evaluations_reexecuted": len(findings) * len(EXPECTED_TOOLCHAINS) * 65536,
        "reference_tables_recomputed": len(references),
        "provenance_mappings_recomputed": sum(
            len(VARIANT_PARENTS[row["variant"]]) for row in findings
        ),
        "parent_decisions_independently_reconstructed": sum(
            len(VARIANT_PARENTS[row["variant"]]) for row in findings
        ),
        "multi_parent_releases_rechecked": sum(
            1 for row in findings if len(VARIANT_PARENTS[row["variant"]]) > 1
        ),
        "manifest_files_rehashed": len(findings),
        "manifest_canonical_forms_rehashed": len(findings),
        "executables_rehashed": len(findings) * len(EXPECTED_TOOLCHAINS),
        "assembly_files_rehashed_and_rescanned": len(findings) * len(EXPECTED_TOOLCHAINS),
        "all_valid": all_valid,
        "tamper_rejected": tamper_rejected,
        "tamper_errors": tamper_errors,
        "semantic_tamper_tests_pass": semantic_tamper_pass,
        "semantic_tamper_test_count": len(semantic_tamper_tests),
        "refreshed_binding_test_count": len(refreshed_binding_tests),
        "direct_source_interpretation_test_count": len(direct_source_tests),
        "semantic_tamper_tests": semantic_tamper_tests,
        "policy_files_reconstructed": len(KERNELS),
        "policy_bridge_fixture_pass": policy_bridge_fixture_pass,
        "policy_bridge_errors": policy_bridge_errors,
        "decision_fixtures": decision_fixtures,
        "decision_fixtures_pass": decision_fixtures_pass,
        "pass_count": sum(row.get("verdict") == "PASS" for row in reconstructed_results.values()),
        "hold_count": sum(row.get("verdict") == "HOLD" for row in reconstructed_results.values()),
        "reject_count": sum(row.get("verdict") == "REJECT" for row in reconstructed_results.values()),
        "structural_errors": structural_errors,
        "findings": findings,
    }
    out = root / "artifact/results/independent_recheck.json"
    out.write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    summary = {key: receipt[key] for key in (
        "certificate_count", "compiler_cells_rechecked", "input_evaluations_rechecked",
        "compiler_cells_recompiled", "executables_reexecuted", "input_evaluations_reexecuted",
        "manifest_files_rehashed", "executables_rehashed", "assembly_files_rehashed_and_rescanned",
        "parent_decisions_independently_reconstructed",
        "all_valid", "tamper_rejected", "semantic_tamper_tests_pass", "semantic_tamper_test_count",
        "decision_fixtures_pass", "pass_count", "hold_count", "reject_count",
    )}
    print(json.dumps(summary, indent=2, sort_keys=True))
    return 0 if all_valid and tamper_rejected and semantic_tamper_pass and policy_bridge_fixture_pass else 1


if __name__ == "__main__":
    raise SystemExit(main())
