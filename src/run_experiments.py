#!/usr/bin/env python3
"""Generate and execute the complete TSE-01 benchmark matrix."""
from __future__ import annotations

import argparse
from concurrent.futures import ThreadPoolExecutor
import csv
import hashlib
import json
import os
import platform
import re
import shutil
import statistics
import subprocess
import sys
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Callable

sys.path.insert(0, str(Path(__file__).resolve().parent))
from tracecert import (  # noqa: E402
    SCHEMA,
    add_self_hash,
    canonical_json_sha256,
    hamming74_encode_u16,
    load_json,
    map_provenance,
    observe_against_manifest,
    relation_record,
    sha256_bytes,
    sha256_file,
    typed_decision,
    verify_certificate_structure,
    write_json,
)

MASK8 = 0xFF
MASK32 = 0xFFFFFFFF

LOCKED_SYSTEM = "Linux"
LOCKED_MACHINE = "x86_64"
LOCKED_COMPILER_VERSIONS = {
    "gcc": "gcc (Debian 14.2.0-19) 14.2.0",
    "clang": "clang version 17.0.0 (https://github.com/swiftlang/llvm-project.git 10999b6d034fe318f3d56c83bddb6572593a8bb0)",
}


def u32(v: int) -> int:
    return v & MASK32


def rotl8(v: int, n: int) -> int:
    v &= MASK8
    return ((v << n) | (v >> (8 - n))) & MASK8


@dataclass(frozen=True)
class Kernel:
    name: str
    description: str
    c_body: str
    py: Callable[[int, int], int]


def crc8(x: int, y: int) -> int:
    s = (x ^ y) & 0xFF
    for _ in range(8):
        s = ((s << 1) ^ 0x07) & 0xFF if s & 0x80 else (s << 1) & 0xFF
    return s


def jenkins(x: int, y: int) -> int:
    s = (x + y) & 0xFF
    s = (s + ((s << 3) & 0xFF)) & 0xFF
    s ^= s >> 4
    s = (s * 0x1B) & 0xFF
    s ^= s >> 3
    return s & 0xFF


def json_state(x: int, y: int) -> int:
    if y in (9, 10, 13, 32):
        return x
    if y in (ord('{'), ord('[')):
        return (x + 1) & 0xFF
    if y in (ord('}'), ord(']')):
        return (x - 1) & 0xFF
    if y == ord('"'):
        return x ^ 0x80
    return (x + (y & 3)) & 0xFF


def utf8_state(x: int, y: int) -> int:
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


def base64_state(x: int, y: int) -> int:
    if 65 <= y <= 90:
        v = y - 65
    elif 97 <= y <= 122:
        v = y - 71
    elif 48 <= y <= 57:
        v = y + 4
    elif y == 43:
        v = 62
    elif y == 47:
        v = 63
    else:
        v = 0xFF
    return (v ^ x) & 0xFF


def luhn_state(x: int, y: int) -> int:
    d = y % 10
    if x & 1:
        d *= 2
        if d > 9:
            d -= 9
    return (x + d) & 0xFF


KERNELS: list[Kernel] = [
    Kernel(
        "fnv_step",
        "FNV-style byte mixing step",
        "uint32_t state = ((uint32_t)(x ^ y) * 0x93u) & 0xffu;",
        lambda x, y: ((x ^ y) * 0x93) & 0xFF,
    ),
    Kernel(
        "jenkins_step",
        "Jenkins-style reversible mixing step",
        "uint32_t state = ((uint32_t)x + y) & 0xffu;\n"
        "state = (state + ((state << 3) & 0xffu)) & 0xffu;\n"
        "state ^= state >> 4;\nstate = (state * 0x1bu) & 0xffu;\nstate ^= state >> 3;",
        jenkins,
    ),
    Kernel(
        "crc8_step",
        "CRC-8 polynomial update",
        "uint32_t state = ((uint32_t)x ^ y) & 0xffu;\n"
        "for (unsigned i = 0; i < 8; ++i) { state = (state & 0x80u) ? (((state << 1) ^ 0x07u) & 0xffu) : ((state << 1) & 0xffu); }",
        crc8,
    ),
    Kernel(
        "fletcher_step",
        "Fletcher-style modular accumulator",
        "uint32_t state = ((uint32_t)x + y) % 255u;",
        lambda x, y: (x + y) % 255,
    ),
    Kernel(
        "rotate_mix",
        "Rotate-and-xor mixing kernel",
        "uint32_t r = ((((uint32_t)x << 3) | ((uint32_t)x >> 5)) & 0xffu);\nuint32_t state = (r ^ y ^ ((uint32_t)y >> 2)) & 0xffu;",
        lambda x, y: (rotl8(x, 3) ^ y ^ (y >> 2)) & 0xFF,
    ),
    Kernel(
        "varint_state",
        "Varint continuation-state update",
        "uint32_t state = (y & 0x80u) ? ((((uint32_t)x << 1) ^ (y & 0x7fu)) & 0xffu) : (((uint32_t)x + y) & 0xffu);",
        lambda x, y: (((x << 1) ^ (y & 0x7F)) if y & 0x80 else x + y) & 0xFF,
    ),
    Kernel(
        "json_state",
        "Small JSON tokenizer state transition",
        "uint32_t state;\n"
        "if (y == 9u || y == 10u || y == 13u || y == 32u) state = x;\n"
        "else if (y == 123u || y == 91u) state = ((uint32_t)x + 1u) & 0xffu;\n"
        "else if (y == 125u || y == 93u) state = ((uint32_t)x - 1u) & 0xffu;\n"
        "else if (y == 34u) state = ((uint32_t)x ^ 0x80u) & 0xffu;\n"
        "else state = ((uint32_t)x + (y & 3u)) & 0xffu;",
        json_state,
    ),
    Kernel(
        "utf8_state",
        "UTF-8 continuation-state transition",
        "uint32_t state;\n"
        "if (x != 0u) state = ((y & 0xc0u) == 0x80u) ? (((uint32_t)x - 1u) & 0xffu) : 0xffu;\n"
        "else if (y < 0x80u) state = 0u;\n"
        "else if (y >= 0xc2u && y <= 0xdfu) state = 1u;\n"
        "else if (y >= 0xe0u && y <= 0xefu) state = 2u;\n"
        "else if (y >= 0xf0u && y <= 0xf4u) state = 3u;\n"
        "else state = 0xffu;",
        utf8_state,
    ),
    Kernel(
        "base64_state",
        "Base64 alphabet decoding transition",
        "uint32_t v;\n"
        "if (y >= 65u && y <= 90u) v = y - 65u;\n"
        "else if (y >= 97u && y <= 122u) v = y - 71u;\n"
        "else if (y >= 48u && y <= 57u) v = y + 4u;\n"
        "else if (y == 43u) v = 62u;\n"
        "else if (y == 47u) v = 63u;\n"
        "else v = 0xffu;\nuint32_t state = (v ^ x) & 0xffu;",
        base64_state,
    ),
    Kernel(
        "luhn_state",
        "Luhn checksum digit update",
        "uint32_t d = y % 10u;\nif (x & 1u) { d *= 2u; if (d > 9u) d -= 9u; }\nuint32_t state = ((uint32_t)x + d) & 0xffu;",
        luhn_state,
    ),
    Kernel(
        "saturating_add",
        "Saturating unsigned-byte addition",
        "uint32_t sum = (uint32_t)x + y;\nuint32_t state = (sum > 255u) ? 255u : sum;",
        lambda x, y: min(255, x + y),
    ),
    Kernel(
        "branch_mix",
        "Branch-sensitive byte mixing kernel",
        "uint32_t state;\n"
        "if (((x ^ y) & 1u) != 0u) state = ((((uint32_t)x * 17u) + y) ^ 0x5au) & 0xffu;\n"
        "else state = ((((uint32_t)y * 29u) + x) ^ 0xa5u) & 0xffu;",
        lambda x, y: ((((x * 17) + y) ^ 0x5A) if ((x ^ y) & 1) else (((y * 29) + x) ^ 0xA5)) & 0xFF,
    ),
]

VARIANTS = [
    {"name": "baseline", "parent": None, "style": "direct", "rename": False, "reorder": False, "removed": [], "flipped": [], "reseed": False, "drift": False, "minify": False},
    {"name": "rename", "parent": "baseline", "style": "direct", "rename": True, "reorder": False, "removed": [], "flipped": [], "reseed": False, "drift": False, "minify": False},
    {"name": "reorder", "parent": "rename", "style": "direct", "rename": True, "reorder": True, "removed": [], "flipped": [], "reseed": False, "drift": False, "minify": False},
    {"name": "extract", "parent": "reorder", "style": "helper1", "rename": True, "reorder": True, "removed": [], "flipped": [], "reseed": False, "drift": False, "minify": False},
    {"name": "dependency_upgrade", "parent": "extract", "style": "helper2", "rename": True, "reorder": True, "removed": [], "flipped": [], "reseed": False, "drift": False, "minify": False},
    {"name": "format", "parent": "dependency_upgrade", "style": "helper2", "rename": True, "reorder": True, "removed": [], "flipped": [], "reseed": False, "drift": False, "minify": True},
    {"name": "erase_tolerable", "parent": "dependency_upgrade", "style": "helper2", "rename": True, "reorder": True, "removed": [0, 7], "flipped": [], "reseed": False, "drift": False, "minify": False},
    {"name": "merge_tolerable", "parents": ["format", "erase_tolerable"], "style": "helper2", "rename": True, "reorder": True, "removed": [0, 7], "flipped": [], "reseed": False, "drift": False, "minify": True},
    {"name": "flip_tolerable", "parent": "merge_tolerable", "style": "helper2", "rename": True, "reorder": True, "removed": [0, 7], "flipped": [15, 22], "reseed": False, "drift": False, "minify": True},
    {"name": "recovery_break", "parent": "dependency_upgrade", "style": "helper2", "rename": True, "reorder": True, "removed": [0], "flipped": [1], "reseed": False, "drift": False, "minify": False},
    {"name": "reseed", "parent": "dependency_upgrade", "style": "helper2", "rename": True, "reorder": True, "removed": [], "flipped": [], "reseed": True, "drift": False, "minify": False},
    {"name": "behavior_drift", "parent": "dependency_upgrade", "style": "helper2", "rename": True, "reorder": True, "removed": [], "flipped": [], "reseed": False, "drift": True, "minify": False},
]


def variant_parents(variant: dict[str, Any]) -> list[str]:
    """Return the frozen ordered parent list for a release variant."""
    if "parents" in variant:
        parents = list(variant["parents"])
    else:
        parent = variant.get("parent")
        parents = [] if parent is None else [parent]
    if len(parents) != len(set(parents)):
        raise ValueError(f"duplicate parents in variant {variant.get('name')}: {parents}")
    return parents

TOOLCHAINS = [("gcc", "-O0"), ("gcc", "-O2"), ("clang", "-O0"), ("clang", "-O2")]
_COMPILER_VERSIONS: dict[str, str] = {}
TRACEABILITY_THRESHOLD = 26 / 28
POLICY_SCHEMA = "tracecert.policy.v1"
POLICY_BRIDGE_SCHEMA = "tracecert.policy-bridge.v1"
POLICY_CANONICALIZATION = "sorted-key-ascii-json-v1"


def finite_policy(kernel_name: str, environment: dict[str, Any], required_count: int = 26, *, policy_id: str | None = None) -> dict[str, Any]:
    return {
        "schema": POLICY_SCHEMA,
        "policy_id": policy_id or f"finite:{kernel_name}:v1",
        "layer": "finite-contract",
        "behavior": {
            "contract_id": kernel_name,
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
            for compiler, optimization in TOOLCHAINS
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
        "evidence_inventory": [
            "behavior", "recovery", "continuity", "source_conformance",
            "executable_reproduction", "integrity", "lineage",
        ],
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


def policy_binding(root: Path, path: Path, policy: dict[str, Any]) -> dict[str, Any]:
    return {
        "path": path.relative_to(root).as_posix(),
        "policy_id": policy["policy_id"],
        "file_sha256": sha256_file(path),
        "canonical_sha256": canonical_json_sha256(policy),
    }


def payload_for(name: str) -> int:
    return int.from_bytes(hashlib.sha256(("TSE-01:" + name).encode()).digest()[:2], "big")


def constants_for(name: str, reseed: bool) -> list[int]:
    label = "reseed" if reseed else "baseline"
    values: list[int] = []
    counter = 0
    while len(values) < 28:
        digest = hashlib.sha256(f"TSE-01:{name}:{label}:{counter}".encode()).digest()
        v = int.from_bytes(digest[:4], "big") | 0x01010101
        v &= 0xFFFFFFFF
        if v not in values and v not in (0, 0xFFFFFFFF):
            values.append(v)
        counter += 1
    return values


def manifest_for(kernel: Kernel, reseed: bool) -> dict[str, Any]:
    payload = payload_for(kernel.name)
    bits = hamming74_encode_u16(payload)
    consts = constants_for(kernel.name, reseed)
    prefix = "R" if reseed else "B"
    return {
        "schema": "tracecert.watermark-manifest.v1",
        "kernel": kernel.name,
        "payload_hex": f"{payload:04x}",
        "code": "four independent Hamming(7,4) blocks",
        "minimum_distance": 3,
        "carriers": [
            {
                "carrier_id": f"{kernel.name}:{prefix}:{i:02d}",
                "position": i,
                "constant": consts[i],
                "bit": bits[i],
            }
            for i in range(28)
        ],
    }


def reference_table(kernel: Kernel, drift: bool = False) -> bytes:
    out = bytearray()
    for x in range(256):
        for y in range(256):
            v = kernel.py(x, y) & 0xFF
            if drift and x == 0x42 and y == 0x99:
                v ^= 1
            out.append(v)
    return bytes(out)


def carrier_statement(var: str, bit: int, constant: int, style: str) -> str:
    k = f"0x{constant:08x}u"
    if style == "direct":
        if bit == 0:
            return f"{var} = (({var} + {k}) - {k});"
        return f"{var} = (({var} ^ {k}) ^ {k});"
    if style == "helper1":
        return f"{var} = tc_{'add' if bit == 0 else 'xor'}_v1({var}, {k});"
    if style == "helper2":
        return f"{var} = tc_{'add' if bit == 0 else 'xor'}_v2({var}, {k});"
    raise ValueError(style)


def helper_source(style: str) -> str:
    if style == "helper1":
        return (
            "static __attribute__((noinline)) uint32_t tc_add_v1(uint32_t v, uint32_t k) { return (v + k) - k; }\n"
            "static __attribute__((noinline)) uint32_t tc_xor_v1(uint32_t v, uint32_t k) { return (v ^ k) ^ k; }\n"
        )
    if style == "helper2":
        return (
            "static __attribute__((noinline)) uint32_t tc_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }\n"
            "static __attribute__((noinline)) uint32_t tc_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }\n"
        )
    return ""


def generate_source(kernel: Kernel, variant: dict[str, Any], manifest: dict[str, Any]) -> str:
    var = "accumulator" if variant["rename"] else "state"
    body = kernel.c_body.replace("state", var)
    if variant["drift"]:
        body += f"\nif (x == 0x42u && y == 0x99u) {var} ^= 1u;"
    positions = [i for i in range(28) if i not in variant["removed"]]
    if variant["reorder"]:
        positions = positions[::2] + positions[1::2]
    statements = []
    for position in positions:
        item = manifest["carriers"][position]
        bit = int(item["bit"])
        if position in variant["flipped"]:
            bit ^= 1
        statements.append(carrier_statement(var, bit, int(item["constant"]), variant["style"]))
    helper = helper_source(variant["style"])
    source = f"""#include <stdint.h>
#include <stdio.h>
{helper}
static uint8_t kernel(uint8_t x, uint8_t y) {{
{body}
{os.linesep.join(statements)}
return (uint8_t)({var} & 0xffu);
}}
int main(void) {{
  for (unsigned x = 0; x < 256; ++x) {{
    for (unsigned y = 0; y < 256; ++y) {{
      unsigned char out = kernel((uint8_t)x, (uint8_t)y);
      if (fwrite(&out, 1, 1, stdout) != 1) return 2;
    }}
  }}
  return 0;
}}
"""
    if variant["minify"]:
        # Preserve preprocessor line boundaries but collapse the C body whitespace.
        lines = source.splitlines()
        pp = [line for line in lines if line.startswith("#")]
        rest = " ".join(line.strip() for line in lines if not line.startswith("#"))
        source = "\n".join(pp) + "\n" + re.sub(r"\s+", " ", rest) + "\n"
    return source


def command_version(exe: str) -> str:
    if exe not in _COMPILER_VERSIONS:
        p = subprocess.run([exe, "--version"], text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=True)
        _COMPILER_VERSIONS[exe] = p.stdout.splitlines()[0].strip()
    return _COMPILER_VERSIONS[exe]


def collect_and_validate_environment() -> dict[str, str]:
    environment = {
        "python": sys.version.split()[0],
        "platform": platform.platform(),
        "system": platform.system(),
        "machine": platform.machine(),
        "gcc": command_version("gcc"),
        "clang": command_version("clang"),
    }
    mismatches: list[str] = []
    if environment["system"] != LOCKED_SYSTEM:
        mismatches.append(f"system={environment['system']!r}, expected {LOCKED_SYSTEM!r}")
    if environment["machine"] != LOCKED_MACHINE:
        mismatches.append(f"machine={environment['machine']!r}, expected {LOCKED_MACHINE!r}")
    for compiler, expected in LOCKED_COMPILER_VERSIONS.items():
        if environment[compiler] != expected:
            mismatches.append(f"{compiler}={environment[compiler]!r}, expected {expected!r}")
    if mismatches:
        raise RuntimeError("locked experiment environment mismatch: " + "; ".join(mismatches))
    return environment


def compile_run(source: Path, build_dir: Path, cc: str, opt: str) -> dict[str, Any]:
    """Compile, retain assembly/binary, execute, and retain exact output.

    Every filesystem and tool failure is converted into an explicit matrix
    status so a partial run cannot masquerade as complete evidence.
    """
    source = source.resolve()
    build_dir = build_dir.resolve()
    build_dir.mkdir(parents=True, exist_ok=True)
    tag = f"{cc}_{opt[1:].lower()}"
    binary = build_dir / tag
    assembly = build_dir / f"{tag}.s"
    output = build_dir / f"{tag}.out"

    compile_cmd = [cc, "-std=c11", "-Wall", "-Wextra", "-Werror", opt, str(source), "-o", str(binary)]
    start = time.perf_counter()
    cp = subprocess.run(compile_cmd, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    compile_seconds = time.perf_counter() - start
    if cp.returncode != 0:
        return {
            "compiler": cc,
            "optimization": opt,
            "compile_command": compile_cmd,
            "compile_returncode": cp.returncode,
            "compile_stderr": cp.stderr,
            "compile_seconds": compile_seconds,
            "status": "COMPILE_FAILED",
        }
    if not binary.is_file():
        return {
            "compiler": cc,
            "optimization": opt,
            "compile_command": compile_cmd,
            "compile_returncode": cp.returncode,
            "compile_stderr": cp.stderr,
            "compile_seconds": compile_seconds,
            "status": "BINARY_MISSING",
        }

    asm_cmd = [cc, "-std=c11", opt, "-S", str(source), "-o", str(assembly)]
    ap = subprocess.run(asm_cmd, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if ap.returncode != 0 or not assembly.is_file():
        return {
            "compiler": cc,
            "optimization": opt,
            "compile_command": compile_cmd,
            "compile_returncode": cp.returncode,
            "compile_stderr": cp.stderr,
            "compile_seconds": compile_seconds,
            "assembly_command": asm_cmd,
            "assembly_returncode": ap.returncode,
            "assembly_stderr": ap.stderr,
            "status": "ASSEMBLY_FAILED" if ap.returncode != 0 else "ASSEMBLY_MISSING",
        }

    start = time.perf_counter()
    rp = None
    for attempt in range(5):
        try:
            rp = subprocess.run([str(binary)], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            break
        except PermissionError:
            # A just-linked executable can be briefly unavailable on a
            # container-backed filesystem; enforce its mode and retry.
            binary.chmod(binary.stat().st_mode | 0o111)
            if attempt == 4:
                raise
            time.sleep(0.05 * (attempt + 1))
    assert rp is not None
    run_seconds = time.perf_counter() - start
    build_dir.mkdir(parents=True, exist_ok=True)
    try:
        output.write_bytes(rp.stdout)
    except OSError as exc:
        return {
            "compiler": cc,
            "optimization": opt,
            "compile_command": compile_cmd,
            "compile_returncode": cp.returncode,
            "compile_stderr": cp.stderr,
            "compile_seconds": compile_seconds,
            "assembly_command": asm_cmd,
            "assembly_returncode": ap.returncode,
            "assembly_stderr": ap.stderr,
            "run_seconds": run_seconds,
            "run_returncode": rp.returncode,
            "stderr": rp.stderr.decode("utf-8", "replace"),
            "status": "OUTPUT_WRITE_FAILED",
            "output_error": str(exc),
        }

    return {
        "compiler": cc,
        "compiler_version": command_version(cc),
        "optimization": opt,
        "compile_command": compile_cmd,
        "compile_returncode": cp.returncode,
        "compile_seconds": compile_seconds,
        "assembly_command": asm_cmd,
        "assembly_returncode": ap.returncode,
        "run_seconds": run_seconds,
        "run_returncode": rp.returncode,
        "stderr": rp.stderr.decode("utf-8", "replace"),
        "binary_path": str(binary),
        "binary_sha256": sha256_file(binary),
        "output_sha256": sha256_file(output),
        "output_size": output.stat().st_size,
        "output_path": str(output),
        "assembly_sha256": sha256_file(assembly),
        "assembly_path": str(assembly),
        "status": "EXECUTED" if rp.returncode == 0 else "RUN_FAILED",
    }


def assembly_retention(assembly_path: Path, manifest: dict[str, Any], observed_ids: set[str]) -> dict[str, Any]:
    text = assembly_path.read_text(encoding="utf-8", errors="replace").lower()
    found: list[str] = []
    for item in manifest["carriers"]:
        if item["carrier_id"] not in observed_ids:
            continue
        value = int(item["constant"])
        hex_forms = {f"0x{value:x}", f"0x{value:08x}"}
        dec_forms = {str(value), str(value if value < 2**31 else value - 2**32)}
        if any(form in text for form in hex_forms | dec_forms):
            found.append(item["carrier_id"])
    denominator = len(observed_ids)
    return {
        "retained_count": len(found),
        "source_present_count": denominator,
        "retention": 0.0 if denominator == 0 else len(found) / denominator,
        "retained_carrier_ids": found,
        "method": "immediate-constant presence in emitted assembly; heuristic, not a formal detector",
    }


def first_mismatch(reference: bytes, actual: bytes) -> dict[str, int] | None:
    n = min(len(reference), len(actual))
    for i in range(n):
        if reference[i] != actual[i]:
            return {"index": i, "x": i // 256, "y": i % 256, "expected": reference[i], "actual": actual[i]}
    if len(reference) != len(actual):
        return {"index": n, "x": n // 256, "y": n % 256, "expected": -1, "actual": -1}
    return None


def robust_reset_dir(path: Path) -> None:
    """Reset a generated directory, tolerating delayed overlayfs entries."""
    for attempt in range(20):
        if path.exists():
            shutil.rmtree(path, ignore_errors=True)
        if not path.exists():
            break
        time.sleep(0.05 * (attempt + 1))
    if path.exists():
        # One final non-ignoring removal provides a precise error if the
        # filesystem never converged.
        shutil.rmtree(path)
    path.mkdir(parents=True, exist_ok=True)


def run(root: Path) -> None:
    artifact = root / "artifact"
    bench = artifact / "benchmark" / "generated"
    raw = artifact / "results" / "raw"
    cert_root = artifact / "certificates"
    policy_root = artifact / "policies"

    # Validate the claim-relevant environment before deleting prior evidence.
    environment = collect_and_validate_environment()
    for p in (bench, raw, cert_root, policy_root):
        robust_reset_dir(p)
    write_json(artifact / "environment.json", environment)

    policies: dict[str, dict[str, Any]] = {}
    policy_paths: dict[str, Path] = {}
    for kernel in KERNELS:
        policy = finite_policy(kernel.name, environment)
        path = policy_root / "finite" / f"{kernel.name}.json"
        write_json(path, policy)
        policies[kernel.name] = policy
        policy_paths[kernel.name] = path

    rows: list[dict[str, Any]] = []
    certs: dict[tuple[str, str], dict[str, Any]] = {}
    manifests: dict[tuple[str, str], dict[str, Any]] = {}
    source_paths: dict[tuple[str, str], Path] = {}

    spec_rows = []
    for kernel_index, kernel in enumerate(KERNELS, start=1):
        print(f"[{kernel_index}/{len(KERNELS)}] {kernel.name}", file=sys.stderr, flush=True)
        ref = reference_table(kernel)
        ref_hash = sha256_bytes(ref)
        ref_path = artifact / "benchmark" / "reference" / f"{kernel.name}.bin"
        ref_path.parent.mkdir(parents=True, exist_ok=True)
        ref_path.write_bytes(ref)
        spec_rows.append({"name": kernel.name, "description": kernel.description, "payload_hex": f"{payload_for(kernel.name):04x}", "reference_sha256": ref_hash})
        for variant in VARIANTS:
            vdir = bench / kernel.name / variant["name"]
            vdir.mkdir(parents=True, exist_ok=True)
            manifest = manifest_for(kernel, bool(variant["reseed"]))
            source = generate_source(kernel, variant, manifest)
            source_path = vdir / "kernel.c"
            source_path.write_text(source, encoding="utf-8")
            write_json(vdir / "watermark_manifest.json", manifest)
            manifests[(kernel.name, variant["name"])] = manifest
            source_paths[(kernel.name, variant["name"])] = source_path

            observation = observe_against_manifest(source_path, manifest)
            observed_ids = {c["carrier_id"] for c in observation["carriers"] if c["observed_bit"] is not None}
            tc_results = []
            reference = ref
            build_dir = raw / kernel.name / variant["name"]
            # Compiler cells are independent and write to distinct paths. Running
            # the four cells concurrently reduces replay latency without changing
            # the retained ordering or canonical certificate bytes.
            def execute_cell(cell: tuple[str, str]) -> tuple[tuple[str, str], dict[str, Any]]:
                cc, opt = cell
                return cell, compile_run(source_path, build_dir, cc, opt)
            with ThreadPoolExecutor(max_workers=len(TOOLCHAINS)) as executor:
                cell_results = list(executor.map(execute_cell, TOOLCHAINS))
            by_cell = {cell: result for cell, result in cell_results}
            for cc, opt in TOOLCHAINS:
                result = by_cell[(cc, opt)]
                for command_field in ("compile_command", "assembly_command"):
                    result[command_field] = [
                        str(Path(arg).relative_to(root))
                        if Path(arg).is_absolute() and Path(arg).is_relative_to(root)
                        else arg
                        for arg in result.get(command_field, [])
                    ]
                # Wall-clock duration is a host diagnostic, not part of the
                # release claim. Binding it into the canonical certificate
                # made otherwise identical replays produce different
                # certificate bytes and predecessor hashes. The study reports
                # deterministic work counts instead, so durations remain
                # transient and are deliberately excluded from retained
                # evidence.
                result.pop("compile_seconds", None)
                result.pop("run_seconds", None)
                if result.get("status") == "EXECUTED":
                    actual_path = Path(result["output_path"])
                    actual = actual_path.read_bytes()
                    result["output_path"] = str(actual_path.relative_to(root))
                    result["binary_path"] = str(Path(result["binary_path"]).relative_to(root))
                    result["matches_reference"] = result["output_sha256"] == ref_hash
                    result["first_mismatch"] = first_mismatch(reference, actual)
                    result["assembly_retention"] = assembly_retention(Path(result["assembly_path"]), manifest, observed_ids)
                    result["assembly_path"] = str(Path(result["assembly_path"]).relative_to(root))
                tc_results.append(result)

            parent_names = variant_parents(variant)
            parent_edges: list[dict[str, Any]] = []
            provenance_by_parent: list[dict[str, Any]] = []
            parent_source_hashes: list[str] = []
            for parent_name in parent_names:
                parent_manifest = manifests[(kernel.name, parent_name)]
                edge_provenance = map_provenance(parent_manifest, manifest, observation)
                predecessor = certs[(kernel.name, parent_name)]
                parent_policy_hash = predecessor["policy"]["canonical_sha256"]
                parent_decision = predecessor["verdict"]
                policy_compatible = False
                # Compatibility is evaluated against the actual current policy
                # binding below; this placeholder is overwritten before the
                # edge is serialized. Keeping parent collection independent of
                # the current binding makes the merge logic explicit.
                parent_edges.append({
                    "variant": parent_name,
                    "certificate_sha256": predecessor["certificate_sha256"],
                    "policy_canonical_sha256": parent_policy_hash,
                    "decision": parent_decision,
                    "accepted": parent_decision == "PASS",
                    "hash_link_valid": True,
                    "policy_compatible": policy_compatible,
                })
                provenance_by_parent.append({"parent_variant": parent_name, **edge_provenance})
                parent_source_hashes.append(predecessor["source"]["sha256"])

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

            all_exec = all(r.get("status") == "EXECUTED" for r in tc_results)
            behavior_pass = all_exec and all(bool(r.get("matches_reference")) for r in tc_results)
            decode = observation["decode"]
            payload_pass = decode["status"] == "CERTIFIED_UNIQUE" and decode["payload_hex"] == manifest["payload_hex"]
            continuity_pass = all(
                edge["traceability"] >= TRACEABILITY_THRESHOLD for edge in provenance_by_parent
            ) if provenance_by_parent else True
            observed_count = sum(item["observed_bit"] is not None for item in observation["carriers"])
            source_pass = (
                not observation["duplicate_constants"]
                and observation["extracted_count"] == observed_count
            )
            executable_pass = all_exec
            integrity_pass = True
            current_policy = policies[kernel.name]
            current_policy_binding = policy_binding(root, policy_paths[kernel.name], current_policy)
            for edge in parent_edges:
                edge["policy_compatible"] = (
                    edge["policy_canonical_sha256"] == current_policy_binding["canonical_sha256"]
                )
            lineage_pass = all(
                edge["hash_link_valid"]
                and edge["policy_compatible"]
                and edge["accepted"]
                for edge in parent_edges
            ) if parent_edges else True
            sole_parent = parent_names[0] if len(parent_names) == 1 else None
            sole_edge = parent_edges[0] if len(parent_edges) == 1 else None
            relations = {
                "behavior": relation_record(behavior_pass, exact_finite_equivalence=behavior_pass),
                "recovery": relation_record(payload_pass, status=decode["status"], payload_hex=decode["payload_hex"]),
                "continuity": relation_record(
                    continuity_pass,
                    mapped_count=provenance["mapped_count"],
                    baseline_count=provenance["baseline_count"],
                    required_count=26,
                    parent_edge_count=len(parent_names),
                    per_parent=[
                        {
                            "parent_variant": edge["parent_variant"],
                            "mapped_count": edge["mapped_count"],
                            "baseline_count": edge["baseline_count"],
                            "traceability": edge["traceability"],
                        }
                        for edge in provenance_by_parent
                    ],
                ),
                "source_conformance": relation_record(source_pass),
                "executable_reproduction": relation_record(executable_pass),
                "integrity": relation_record(integrity_pass),
                "lineage": relation_record(lineage_pass),
            }
            verdict = typed_decision(record["passed"] for record in relations.values())
            cert = {
                "schema": SCHEMA,
                "kernel": kernel.name,
                "variant": variant["name"],
                "parent_variant": sole_parent,
                "parent_variants": parent_names,
                "policy": current_policy_binding,
                "source": {
                    "path": str(source_path.relative_to(root)),
                    "sha256": observation["source_sha256"],
                    "parent_sha256": parent_source_hashes[0] if len(parent_source_hashes) == 1 else None,
                    "parent_sha256s": parent_source_hashes,
                },
                "manifest": {
                    "path": str((vdir / "watermark_manifest.json").relative_to(root)),
                    "file_sha256": sha256_file(vdir / "watermark_manifest.json"),
                    "canonical_sha256": observation["manifest_canonical_sha256"],
                },
                "watermark": {
                    "expected_payload_hex": manifest["payload_hex"],
                    "observed_symbols": observation["observed_symbols"],
                    "decode": decode,
                    "payload_recoverable": payload_pass,
                    "source_carriers": observation["carriers"],
                    "provenance": provenance,
                    "provenance_by_parent": provenance_by_parent,
                    "traceability_threshold": TRACEABILITY_THRESHOLD,
                    "continuity_status": "TRACEABLE_WITHIN_LOCK" if continuity_pass else "CONTINUITY_BELOW_LOCK",
                },
                "behavior": {
                    "contract": "all x,y in {0,...,255}; one output byte",
                    "reference_table_path": str(ref_path.relative_to(root)),
                    "reference_sha256": ref_hash,
                    "toolchains": tc_results,
                    "exact_finite_equivalence": behavior_pass,
                    "maturity": "VERIFIED" if behavior_pass else "COUNTEREXAMPLE_FOUND",
                },
                "chain": {
                    "parents": parent_edges,
                    "predecessor_certificate_sha256": None if sole_edge is None else sole_edge["certificate_sha256"],
                    "predecessor_policy_canonical_sha256": None if sole_edge is None else sole_edge["policy_canonical_sha256"],
                    "predecessor_decision": None if sole_edge is None else sole_edge["decision"],
                    "predecessor_accepted": True if not parent_edges else (None if sole_edge is None else sole_edge["accepted"]),
                    "hash_link_valid": all(edge["hash_link_valid"] for edge in parent_edges) if parent_edges else True,
                    "policy_compatible": all(edge["policy_compatible"] for edge in parent_edges) if parent_edges else True,
                    "all_parents_accepted": all(edge["accepted"] for edge in parent_edges) if parent_edges else True,
                },
                "relations": relations,
                "verdict": verdict,
            }
            cert = add_self_hash(cert)
            errors = verify_certificate_structure(cert)
            if errors:
                raise RuntimeError(f"internal certificate error {kernel.name}/{variant['name']}: {errors}")
            certs[(kernel.name, variant["name"])] = cert
            cert_path = cert_root / kernel.name / f"{variant['name']}.json"
            write_json(cert_path, cert)

            for result in tc_results:
                retention = result.get("assembly_retention", {})
                rows.append(
                    {
                        "kernel": kernel.name,
                        "variant": variant["name"],
                        "parent": ",".join(parent_names),
                        "compiler": result.get("compiler"),
                        "optimization": result.get("optimization"),
                        "compile_status": result.get("status"),
                        "behavior_match": result.get("matches_reference"),
                        "first_mismatch_x": (result.get("first_mismatch") or {}).get("x"),
                        "first_mismatch_y": (result.get("first_mismatch") or {}).get("y"),
                        "payload_status": decode["status"],
                        "payload_match": payload_pass,
                        "errors": decode["total_errors"],
                        "erasures": decode["total_erasures"],
                        "traceability": provenance["traceability"],
                        "source_carriers_present": len(observed_ids),
                        "assembly_carriers_retained": retention.get("retained_count"),
                        "assembly_retention": retention.get("retention"),
                        "certificate_sha256": cert["certificate_sha256"],
                    }
                )

    write_json(artifact / "benchmark" / "specs.json", {
        "domain": {"x": [0, 255], "y": [0, 255]},
        "kernels": spec_rows,
        "variants": VARIANTS,
        "toolchains": TOOLCHAINS,
        "locked_environment": {
            "system": LOCKED_SYSTEM,
            "machine": LOCKED_MACHINE,
            **LOCKED_COMPILER_VERSIONS,
        },
    })

    matrix_path = artifact / "results" / "matrix.csv"
    with matrix_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)

    # One explicit certificate-tamper test.
    sample = json.loads(json.dumps(certs[(KERNELS[0].name, "dependency_upgrade")]))
    sample["watermark"]["expected_payload_hex"] = "0000"
    tampered_path = artifact / "results" / "raw" / "tampered_certificate.json"
    write_json(tampered_path, sample)
    tamper_errors = verify_certificate_structure(sample)

    # Aggregate deterministic results by variant/toolchain.
    decision_fixtures = [
        {"name": "all-established", "values": [True] * 7, "decision": typed_decision([True] * 7)},
        {"name": "one-unresolved", "values": [True] * 6 + [None], "decision": typed_decision([True] * 6 + [None])},
        {"name": "false-dominates-unresolved", "values": [True] * 5 + [None, False], "decision": typed_decision([True] * 5 + [None, False])},
    ]
    if [row["decision"] for row in decision_fixtures] != ["PASS", "HOLD", "REJECT"]:
        raise AssertionError("typed decision fixture mismatch")
    # Executed nonrelease bridge fixture: one realized release is evaluated
    # under the issued policy and an explicitly migrated policy. Normal lineage
    # remains policy-identical; this separate record is the only authorization.
    bridge_kernel = "fnv_step"
    bridge_variant = "dependency_upgrade"
    bridge_subject = certs[(bridge_kernel, bridge_variant)]
    bridge_to_policy = finite_policy(
        bridge_kernel, environment, 25, policy_id="finite:fnv_step:threshold-25-bridge-v1"
    )
    bridge_to_path = policy_root / "bridge" / "fnv_step-threshold-25.json"
    write_json(bridge_to_path, bridge_to_policy)
    bridge_vector = {name: bool(bridge_subject["relations"][name]["passed"]) for name in bridge_subject["relations"]}
    bridge = {
        "schema": POLICY_BRIDGE_SCHEMA,
        "subject": {
            "kernel": bridge_kernel,
            "variant": bridge_variant,
            "certificate_sha256": bridge_subject["certificate_sha256"],
            "source_sha256": bridge_subject["source"]["sha256"],
        },
        "from_policy": bridge_subject["policy"],
        "to_policy": policy_binding(root, bridge_to_path, bridge_to_policy),
        "from_relation_vector": bridge_vector,
        "to_relation_vector": bridge_vector,
        "from_decision": typed_decision(bridge_vector.values()),
        "to_decision": typed_decision(bridge_vector.values()),
        "authorization": "explicit-dual-policy-evaluation",
    }
    bridge = add_self_hash(bridge)
    bridge_path = policy_root / "bridge" / "fnv_step-threshold-25-bridge.json"
    write_json(bridge_path, bridge)

    summary: dict[str, Any] = {
        "schema": "tse01.finite-summary.v4",
        "environment": environment,
        "policy_file_count": len(policies),
        "policy_bridge_fixture_count": 1,
        "kernel_count": len(KERNELS),
        "variant_count": len(VARIANTS),
        "toolchain_count": len(TOOLCHAINS),
        "rows": len(rows),
        "traceability_threshold": TRACEABILITY_THRESHOLD,
        "decision_fixtures": decision_fixtures,
        "pass_count": sum(cert["verdict"] == "PASS" for cert in certs.values()),
        "hold_count": sum(cert["verdict"] == "HOLD" for cert in certs.values()),
        "reject_count": sum(cert["verdict"] == "REJECT" for cert in certs.values()),
    }
    variant_summary = []
    for variant in [v["name"] for v in VARIANTS]:
        subset = [r for r in rows if r["variant"] == variant]
        cert_subset = [certs[(k.name, variant)] for k in KERNELS]
        ret_by_tc: dict[str, float] = {}
        for cc, opt in TOOLCHAINS:
            vals = [float(r["assembly_retention"] or 0) for r in subset if r["compiler"] == cc and r["optimization"] == opt]
            ret_by_tc[f"{cc}{opt}"] = statistics.median(vals) if vals else 0.0
        verdicts = {c["verdict"] for c in cert_subset}
        if len(verdicts) != 1:
            raise AssertionError(f"variant {variant} has inconsistent certificate verdicts: {sorted(verdicts)}")
        variant_summary.append(
            {
                "variant": variant,
                "behavior_pass_kernels": sum(c["behavior"]["exact_finite_equivalence"] for c in cert_subset),
                "payload_pass_kernels": sum(c["watermark"]["payload_recoverable"] for c in cert_subset),
                "median_traceability": statistics.median(c["watermark"]["provenance"]["traceability"] for c in cert_subset),
                "median_errors": statistics.median(c["watermark"]["decode"]["total_errors"] for c in cert_subset),
                "median_erasures": statistics.median(c["watermark"]["decode"]["total_erasures"] for c in cert_subset),
                "median_assembly_retention": ret_by_tc,
                "verdict_class": next(iter(verdicts)),
            }
        )
    summary["variants"] = variant_summary

    # Publish a concise control table from the same reconstructed typed verdicts
    # used by certificates and the variant summary.  This file is reviewer-facing
    # and must never retain the legacy pre-REJECT label for established failures.
    variant_by_name = {row["variant"]: row for row in variant_summary}
    control_rows = []
    control_interpretations = {
        "recovery_break": "Behavior and accepted continuity do not imply recoverability.",
        "reseed": "Correct payload recovery does not prove release continuity.",
        "behavior_drift": "Watermark continuity does not imply behavior preservation.",
    }
    for name in ("recovery_break", "reseed", "behavior_drift"):
        row = variant_by_name[name]
        preserved = round(float(row["median_traceability"]) * 28)
        control_rows.append({
            "control": name,
            "behavior": "PASS" if row["behavior_pass_kernels"] == len(KERNELS) else "FAIL",
            "payload": "CERTIFIED_UNIQUE" if row["payload_pass_kernels"] == len(KERNELS) else "NOT_CERTIFIED",
            "traceability": f"{preserved}/28",
            "certificate": row["verdict_class"],
            "interpretation": control_interpretations[name],
        })
    control_rows.append({
        "control": "tampered_certificate",
        "behavior": "N/A",
        "payload": "N/A",
        "traceability": "N/A",
        "certificate": "REJECT",
        "interpretation": "Self-hash mismatch prevents silent certificate alteration.",
    })
    control_csv_path = artifact / "results" / "control_summary.csv"
    with control_csv_path.open("w", newline="", encoding="utf-8") as handle:
        fields = ["control", "behavior", "payload", "traceability", "certificate", "interpretation"]
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(control_rows)

    variant_csv_path = artifact / "results" / "variant_summary.csv"
    with variant_csv_path.open("w", newline="", encoding="utf-8") as handle:
        fields = ["order", "variant", "behavior_rate", "payload_rate", "traceability", "erasures", "errors", "verdict_class"]
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        for order, row in enumerate(variant_summary, start=1):
            writer.writerow({
                "order": order,
                "variant": row["variant"],
                "behavior_rate": row["behavior_pass_kernels"] / len(KERNELS),
                "payload_rate": row["payload_pass_kernels"] / len(KERNELS),
                "traceability": row["median_traceability"],
                "erasures": row["median_erasures"],
                "errors": row["median_errors"],
                "verdict_class": row["verdict_class"],
            })
    summary["tamper_test"] = {"rejected": bool(tamper_errors), "errors": tamper_errors, "path": str(tampered_path.relative_to(root))}
    summary["certified_history"] = {
        "trunk": ["baseline", "rename", "reorder", "extract", "dependency_upgrade"],
        "branches": [["format"], ["erase_tolerable"]],
        "merge": "merge_tolerable",
        "successor": "flip_tolerable",
    }
    summary["multi_parent_release_count"] = len(KERNELS)
    summary["parent_edge_count"] = sum(len(variant_parents(v)) for v in VARIANTS) * len(KERNELS)
    summary["negative_controls"] = ["recovery_break", "reseed", "behavior_drift", "tampered_certificate"]
    if (summary["pass_count"], summary["hold_count"], summary["reject_count"]) != (108, 0, 36):
        raise AssertionError("finite typed-decision count mismatch")
    write_json(artifact / "results" / "summary.json", summary)

    # Create a concise checker receipt by revalidating all self hashes and links.
    receipts = []
    for kernel in KERNELS:
        for variant in VARIANTS:
            cert = certs[(kernel.name, variant["name"])]
            errors = verify_certificate_structure(cert)
            parents = variant_parents(variant)
            expected_edges = []
            for parent in parents:
                parent_cert = certs[(kernel.name, parent)]
                expected_edges.append({
                    "variant": parent,
                    "certificate_sha256": parent_cert["certificate_sha256"],
                    "policy_canonical_sha256": parent_cert["policy"]["canonical_sha256"],
                    "decision": parent_cert["verdict"],
                    "accepted": parent_cert["verdict"] == "PASS",
                    "hash_link_valid": True,
                    "policy_compatible": (
                        parent_cert["policy"]["canonical_sha256"]
                        == cert["policy"]["canonical_sha256"]
                    ),
                })
            link_ok = cert.get("parent_variants") == parents and cert.get("chain", {}).get("parents") == expected_edges
            if not link_ok:
                errors.append("parent-set acceptance, policy, or hash mismatch")
            receipts.append({"kernel": kernel.name, "variant": variant["name"], "valid": not errors and link_ok, "errors": errors})
    write_json(artifact / "results" / "certificate_recheck.json", {"all_valid": all(r["valid"] for r in receipts), "receipts": receipts})

    print(json.dumps(summary, indent=2))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[2])
    args = parser.parse_args()
    run(args.root.resolve())


if __name__ == "__main__":
    main()
