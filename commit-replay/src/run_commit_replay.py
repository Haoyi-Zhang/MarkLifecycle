#!/usr/bin/env python3
"""Build and execute the TSE-01 commit-derived replay layer.

The layer is intentionally routine-scoped.  It binds seven immutable public
maintenance commits to deterministic C adapters, four lifecycle versions per
adapter, four compiler cells per version, and one adverse release per project
that isolates a single certificate relation.
"""
from __future__ import annotations

import argparse
import concurrent.futures
import copy
import errno
import hashlib
import json
import os
import platform
import re
import shutil
import statistics
import subprocess
import tempfile
import time
from pathlib import Path
from typing import Any, Iterable, Sequence

SCHEMA = "tse01.commit-replay.certificate.v3"
TOOLCHAINS = [("gcc", "-O0"), ("gcc", "-O2"), ("clang", "-O0"), ("clang", "-O2")]
VERSIONS = ["before", "after", "tolerated", "adverse"]
TRACE_THRESHOLD = 26
POLICY_SCHEMA = "tracecert.policy.v1"
POLICY_CANONICALIZATION = "sorted-key-ascii-json-v1"
REMOVED_TOLERATED = {3, 17}
PERMUTATION = [(i * 9) % 28 for i in range(28)]
COMPILE_FLAGS = ["-std=gnu11", "-fno-ident", "-fno-asynchronous-unwind-tables", "-fno-unwind-tables", "-Wl,--build-id=none"]
ASSEMBLY_FLAGS = ["-std=gnu11", "-fno-ident", "-fno-asynchronous-unwind-tables", "-fno-unwind-tables"]

PROJECT_META: dict[str, dict[str, Any]] = {
    "A": {"case_count": 16, "control": "source_conformance", "commit": "fdcef3ebf886fa210d14956d3c068a653e76a24e"},
    "B": {"case_count": 65536, "control": "continuity", "commit": "bb2f86812680c2cb489a38f3643fb58f4eb3482c"},
    "C": {"case_count": 144, "control": "behavior", "commit": "4c5da2155e0d60c704848fe5312d6049ddf04c08"},
    "D": {"case_count": 65, "reference_bytes": 2145, "control": "recovery", "commit": "9d63e760141b5c416a65ee0de9f67d684795ee49"},
    "E": {"case_count": 4112, "control": "executable_reproduction", "commit": "e9d5486e6635141f589e110fd789648aa08e9544"},
    "F": {"case_count": 65536, "control": "integrity", "commit": "cd5f93974067a143434b0e9a1c1a8ae906af599b"},
    "G": {"case_count": 65536, "control": "lineage", "commit": "74d55a0e34e96e6a842727333a7d326925ec1c16"},
}
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


def relation_record(passed: bool | None, **details: Any) -> dict[str, Any]:
    return {"passed": passed, "state": relation_state(passed), **details}


def typed_decision(values: Iterable[bool | None]) -> str:
    values = tuple(values)
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


def canonical_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode("ascii")


def canonical_hash(value: Any) -> str:
    return sha_bytes(canonical_bytes(value))


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def add_self_hash(cert: dict[str, Any]) -> dict[str, Any]:
    out = copy.deepcopy(cert)
    out.pop("certificate_sha256", None)
    out["certificate_sha256"] = canonical_hash(out)
    return out


def project_policy(alias: str, environment: dict[str, Any], required_count: int = TRACE_THRESHOLD, *, policy_id: str | None = None) -> dict[str, Any]:
    return {
        "schema": POLICY_SCHEMA,
        "policy_id": policy_id or f"project:{alias}:v1",
        "layer": "commit-derived-routine-replay",
        "behavior": {
            "contract_id": f"project-{alias}-bounded-adapter-v1",
            "case_count": PROJECT_META[alias]["case_count"],
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
            "inventory_rule": "admitted-syntax-and-unique-issued-key-attribution",
            "observation_scope": "missing-or-flipped-issued-symbols-are-evaluated-by-recovery-and-continuity",
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


def policy_binding(root: Path, path: Path, policy: dict[str, Any]) -> dict[str, Any]:
    return {
        "path": path.relative_to(root).as_posix(),
        "policy_id": policy["policy_id"],
        "file_sha256": sha_file(path),
        "canonical_sha256": canonical_hash(policy),
    }


def hamming_nibble(bits: Sequence[int]) -> list[int]:
    d1, d2, d3, d4 = bits
    return [d1 ^ d2 ^ d4, d1 ^ d3 ^ d4, d1, d2 ^ d3 ^ d4, d2, d3, d4]


def hamming_u16(payload: int) -> list[int]:
    bits = [(payload >> shift) & 1 for shift in range(15, -1, -1)]
    out: list[int] = []
    for i in range(0, 16, 4):
        out.extend(hamming_nibble(bits[i:i + 4]))
    return out


def decode_block(observed: Sequence[int | None]) -> dict[str, Any]:
    erasures = sum(x is None for x in observed)
    candidates: list[tuple[int, tuple[int, ...]]] = []
    for nibble in range(16):
        data = tuple((nibble >> shift) & 1 for shift in (3, 2, 1, 0))
        code = hamming_nibble(data)
        errors = sum(o is not None and o != c for o, c in zip(observed, code))
        candidates.append((errors, data))
    best = min(x[0] for x in candidates)
    winners = [x for x in candidates if x[0] == best]
    condition = 2 * best + erasures < 3
    if len(winners) == 1 and condition:
        status = "CERTIFIED_UNIQUE"
        decoded = list(winners[0][1])
    elif len(winners) == 1:
        status = "UNIQUE_BUT_OUTSIDE_RADIUS"
        decoded = list(winners[0][1])
    else:
        status = "AMBIGUOUS"
        decoded = None
    return {
        "status": status,
        "decoded_bits": decoded,
        "errors": best,
        "erasures": erasures,
        "candidate_count": len(winners),
        "condition_holds": condition,
    }


def decode_payload(observed: Sequence[int | None]) -> dict[str, Any]:
    blocks = [decode_block(observed[i:i + 7]) for i in range(0, 28, 7)]
    bits: list[int] = []
    if not all(b["decoded_bits"] is not None for b in blocks):
        return {"status": "NOT_CERTIFIED", "payload_hex": None, "blocks": blocks}
    for block in blocks:
        bits.extend(block["decoded_bits"])
    payload = 0
    for bit in bits:
        payload = (payload << 1) | bit
    certified = all(b["status"] == "CERTIFIED_UNIQUE" for b in blocks)
    return {"status": "CERTIFIED_UNIQUE" if certified else "NOT_CERTIFIED", "payload_hex": f"{payload:04x}", "blocks": blocks}


def project_payload(alias: str) -> int:
    commit = PROJECT_META[alias]["commit"]
    return int.from_bytes(hashlib.sha256(f"TSE-01:commit-replay:{alias}:{commit}".encode()).digest()[:2], "big")


def carrier_constants(alias: str, reissue: bool = False) -> list[int]:
    label = "reissue" if reissue else "issued"
    out: list[int] = []
    counter = 0
    while len(out) < 28:
        digest = hashlib.sha256(f"TSE-01:{alias}:{label}:{counter}".encode()).digest()
        value = (int.from_bytes(digest[:4], "big") | 0x01010101) & 0xFFFFFFFF
        if value not in out and value not in (0, 0xFFFFFFFF):
            out.append(value)
        counter += 1
    return out


def manifest_for(alias: str, version: str) -> dict[str, Any]:
    reissue = alias == "B" and version == "adverse"
    payload = project_payload(alias)
    bits = hamming_u16(payload)
    constants = carrier_constants(alias, reissue=reissue)
    prefix = "R" if reissue else "I"
    return {
        "schema": "tse01.commit-replay.manifest.v1",
        "project": alias,
        "version": version,
        "parent": None if version == "before" else "before" if version == "after" else "after",
        "payload_hex": f"{payload:04x}",
        "code": "four independent Hamming(7,4) blocks",
        "minimum_distance": 3,
        "continuity_threshold": TRACE_THRESHOLD,
        "source_profile": "wm-helper-v1" if version == "before" else "wm-helper-v2",
        "carriers": [
            {
                "position": i,
                "carrier_id": f"project-{alias}:{prefix}:{i:02d}",
                "constant": constants[i],
                "expected_bit": bits[i],
            }
            for i in range(28)
        ],
    }


def helper_definitions(profile: int) -> str:
    if profile == 1:
        return """
static __attribute__((noinline)) uint32_t wm_add_v1(uint32_t v, uint32_t k) { return (v + k) - k; }
static __attribute__((noinline)) uint32_t wm_xor_v1(uint32_t v, uint32_t k) { return (v ^ k) ^ k; }
""".strip()
    return """
static __attribute__((noinline)) uint32_t wm_add_v2(uint32_t v, uint32_t k) { return (v - k) + k; }
static __attribute__((noinline)) uint32_t wm_xor_v2(uint32_t v, uint32_t k) { return v ^ (k ^ k); }
""".strip()


def carrier_block(alias: str, version: str, manifest: dict[str, Any]) -> str:
    profile = 1 if version == "before" else 2
    removed: set[int] = set()
    flipped: set[int] = set()
    if version == "tolerated":
        removed = set(REMOVED_TOLERATED)
    if alias == "D" and version == "adverse":
        removed = {0}
        flipped = {1}
    order = list(range(28)) if version == "before" else PERMUTATION
    carriers = {int(c["position"]): c for c in manifest["carriers"]}
    lines = ["  volatile uint32_t wm_state = 0x6d2b79f5u;"]
    for pos in order:
        if pos in removed:
            continue
        carrier = carriers[pos]
        bit = int(carrier["expected_bit"]) ^ (1 if pos in flipped else 0)
        op = "add" if bit == 0 else "xor"
        lines.append(
            f"  wm_state = wm_{op}_v{profile}(wm_state, 0x{int(carrier['constant']):08x}u);"
        )
    lines.append("  if (wm_state == 0xffffffffu) return 97;")
    return "\n".join(lines)


def emit_helpers() -> str:
    return """
static void emit_u32(uint32_t v) {
  unsigned char b[4];
  b[0] = (unsigned char)(v & 255u);
  b[1] = (unsigned char)((v >> 8) & 255u);
  b[2] = (unsigned char)((v >> 16) & 255u);
  b[3] = (unsigned char)((v >> 24) & 255u);
  (void)fwrite(b, 1, 4, stdout);
}
""".strip()


A_CASES = [
    "{}", "[]", "{\"a\":1}", "[1,2,3]", "{\"a\":[true,false,null]}",
    "{\"s\":\"x\\\\y\"}", " [ { } ] ", "{\"n\":-12}",
    "{", "]", "{\"a\":", "\"unterminated", "[1,", "{\"a\" 1}", "", "null",
]


def c_string(value: str) -> str:
    return json.dumps(value)


def project_contract_source(alias: str, modern: bool, drift: bool = False, substitute: bool = False) -> str:
    if alias == "A":
        cases = ",\n  ".join(c_string(x) for x in A_CASES)
        if not modern:
            core = """
static int delimiter(char c) { return c == '{' || c == '[' || c == '}' || c == ']' || c == ':' || c == ','; }
static uint32_t token_signature(const char *s) {
  unsigned depth = 0, tokens = 0, checksum = 0, length = 0;
  int string_mode = 0, escape = 0, valid = 1, primitive = 0;
  const unsigned char *p = (const unsigned char *)s;
  while (*p) {
    unsigned char c = *p++; length++; checksum = (checksum * 33u + c) & 0xffffu;
    if (string_mode) {
      if (escape) escape = 0;
      else if (c == '\\\\') escape = 1;
      else if (c == '\"') string_mode = 0;
      continue;
    }
    if (c == '\"') { string_mode = 1; tokens++; primitive = 0; }
    else if (c == '{' || c == '[') { depth++; tokens++; primitive = 0; }
    else if (c == '}' || c == ']') { if (depth == 0) valid = 0; else depth--; primitive = 0; }
    else if (c == ' ' || c == '\\t' || c == '\\r' || c == '\\n' || delimiter((char)c)) primitive = 0;
    else if (!primitive) { tokens++; primitive = 1; }
  }
  if (depth != 0 || string_mode) valid = 0;
  return ((uint32_t)valid << 31) | ((tokens & 0x7fu) << 24) | ((length & 0xffu) << 16) | checksum;
}
"""
        else:
            core = """
static uint32_t token_signature(const char *text) {
  uint32_t depth = 0, tokens = 0, checksum = 0, length = 0;
  unsigned in_string = 0, escaped = 0, valid = 1, primitive = 0;
  for (const unsigned char *cursor = (const unsigned char *)text; *cursor; ++cursor) {
    const unsigned char c = *cursor;
    ++length; checksum = (checksum * 33u + c) & 0xffffu;
    if (in_string) {
      if (escaped) escaped = 0;
      else if (c == '\\\\') escaped = 1;
      else if (c == '\"') in_string = 0;
      continue;
    }
    switch (c) {
      case '\"': in_string = 1; ++tokens; primitive = 0; break;
      case '{': case '[': ++depth; ++tokens; primitive = 0; break;
      case '}': case ']': if (depth == 0) valid = 0; else --depth; primitive = 0; break;
      case ' ': case '\\t': case '\\r': case '\\n': case ':': case ',': primitive = 0; break;
      default: if (!primitive) { ++tokens; primitive = 1; } break;
    }
  }
  if (depth != 0 || in_string) valid = 0;
  return (valid << 31) | ((tokens & 0x7fu) << 24) | ((length & 0xffu) << 16) | checksum;
}
"""
        return core + f"""
static const char *const cases[16] = {{
  {cases}
}};
static void run_contract(void) {{
  for (unsigned i = 0; i < 16; ++i) emit_u32(token_signature(cases[i]));
}}
"""
    if alias == "B":
        if not modern:
            body = """
static unsigned char patch_code(unsigned char from, unsigned char to) {
  unsigned char out = 0;
  for (unsigned key = 0; key < 4; ++key) {
    unsigned f = (from >> (2u * key)) & 3u;
    unsigned t = (to >> (2u * key)) & 3u;
    unsigned op = f == t ? 0u : (t == 0u ? 1u : (f == 0u ? 2u : 3u));
    out = (unsigned char)(out | (unsigned char)(op << (2u * key)));
  }
  return out;
}
"""
        else:
            body = """
static unsigned char patch_code(unsigned char from, unsigned char to) {
  unsigned char out = 0;
  for (unsigned key = 0; key != 4; ++key) {
    const unsigned f = (from >> (2u * key)) & 3u;
    const unsigned t = (to >> (2u * key)) & 3u;
    unsigned op;
    if (f == t) op = 0u;
    else if (t == 0u) op = 1u;
    else if (f == 0u) op = 2u;
    else op = 3u;
    out |= (unsigned char)(op << (2u * key));
  }
  return out;
}
"""
        return body + """
static void run_contract(void) {
  for (unsigned from = 0; from < 256; ++from)
    for (unsigned to = 0; to < 256; ++to)
      (void)fputc((int)patch_code((unsigned char)from, (unsigned char)to), stdout);
}
"""
    if alias == "C":
        if not modern:
            body = """
static uint32_t direct_record(unsigned level, unsigned threshold, unsigned quiet, unsigned sink) {
  if (quiet || level < threshold) return 0;
  return (level + 1u) | ((threshold + 1u) << 4) | ((sink + 1u) << 8) | (0x5au << 16);
}
static uint32_t normalized_record(unsigned level, unsigned threshold, unsigned quiet, unsigned sink) {
  return direct_record(level, threshold, quiet, sink);
}
"""
        else:
            body = """
typedef uint32_t (*record_callback)(unsigned, unsigned, unsigned);
static uint32_t callback_record(unsigned level, unsigned threshold, unsigned sink) {
  return (level + 1u) | ((threshold + 1u) << 4) | ((sink + 1u) << 8) | (0x5au << 16);
}
static uint32_t normalized_record(unsigned level, unsigned threshold, unsigned quiet, unsigned sink) {
  record_callback callback = callback_record;
  if (quiet || level < threshold) return 0;
  return callback(level, threshold, sink);
}
"""
        drift_line = "if (level == 5u && threshold == 2u && quiet == 0u && sink == 1u) value ^= 1u;" if drift else ""
        return body + f"""
static void run_contract(void) {{
  for (unsigned level = 0; level < 6; ++level)
    for (unsigned threshold = 0; threshold < 6; ++threshold)
      for (unsigned quiet = 0; quiet < 2; ++quiet)
        for (unsigned sink = 0; sink < 2; ++sink) {{
          uint32_t value = normalized_record(level, threshold, quiet, sink);
          {drift_line}
          emit_u32(value);
        }}
}}
"""
    if alias == "D":
        copy = "for (size_t i = 0; i < n; ++i) out[i] = input[i];" if not modern else "memcpy(out, input, n);"
        return f"""
static void run_contract(void) {{
  unsigned char input[64], out[65];
  for (size_t i = 0; i < 64; ++i) input[i] = (unsigned char)((i * 37u + 11u) & 255u);
  for (size_t n = 0; n <= 64; ++n) {{
    memset(out, 0xa5, sizeof(out));
    {copy}
    out[n] = 0;
    if (fwrite(out, 1, n + 1, stdout) != n + 1) return;
  }}
}}
"""
    if alias == "E":
        if substitute:
            function = """
static uint32_t adler_modern(uint32_t adler, const unsigned char *buf, size_t len) {
  uint32_t a = adler & 65535u;
  uint32_t b = (adler >> 16) & 65535u;
  size_t i = 0;
  while (i < len) {
    size_t stop = i + 32 < len ? i + 32 : len;
    while (i < stop) { a += buf[i++]; b += a; }
    a %= 65521u; b %= 65521u;
  }
  return a | (b << 16);
}
"""
        elif not modern:
            function = """
static uint32_t adler_legacy(adler, buf, len)
  uint32_t adler;
  const unsigned char *buf;
  size_t len;
{
  uint32_t a = adler & 65535u, b = (adler >> 16) & 65535u;
  while (len--) { a += *buf++; b += a; a %= 65521u; b %= 65521u; }
  return a | (b << 16);
}
"""
        else:
            function = """
static uint32_t adler_modern(uint32_t adler, const unsigned char *buf, size_t len) {
  uint32_t a = adler & 65535u, b = (adler >> 16) & 65535u;
  while (len--) { a += *buf++; b += a; a %= 65521u; b %= 65521u; }
  return a | (b << 16);
}
"""
        fname = "adler_legacy" if not modern and not substitute else "adler_modern"
        return function + f"""
static unsigned char pattern_byte(unsigned pattern, unsigned index) {{
  if (pattern == 0u) return (unsigned char)index;
  if (pattern == 1u) return (unsigned char)(255u - index);
  if (pattern == 2u) return (unsigned char)((index * 17u + 31u) & 255u);
  return (unsigned char)((index & 1u) ? 0xaau : 0x55u);
}}
static void run_contract(void) {{
  const uint32_t seeds[4] = {{1u, 0x00010001u, 0x12345678u, 0xffffffffu}};
  unsigned char data[256];
  for (unsigned pattern = 0; pattern < 4; ++pattern) {{
    for (unsigned i = 0; i < 256; ++i) data[i] = pattern_byte(pattern, i);
    for (unsigned seed = 0; seed < 4; ++seed)
      for (size_t len = 0; len <= 256; ++len)
        emit_u32({fname}(seeds[seed], data, len));
  }}
}}
"""
    if alias == "F":
        order = "lskip(rstrip(buf))" if not modern else "rstrip(lskip(buf))"
        return f"""
static unsigned char *lskip(unsigned char *s) {{
  while (*s == (unsigned char)' ' || *s == (unsigned char)'\\t') ++s;
  return s;
}}
static unsigned char *rstrip(unsigned char *s) {{
  size_t n = strlen((const char *)s);
  while (n > 0 && (s[n - 1] == (unsigned char)' ' || s[n - 1] == (unsigned char)'\\t')) s[--n] = 0;
  return s;
}}
static void run_contract(void) {{
  for (unsigned a = 0; a < 256; ++a) {{
    for (unsigned b = 0; b < 256; ++b) {{
      unsigned char buf[3] = {{(unsigned char)a, (unsigned char)b, 0}};
      unsigned char *start = {order};
      size_t n = strlen((const char *)start);
      uint32_t word = (uint32_t)n;
      if (n > 0) word |= (uint32_t)start[0] << 8;
      if (n > 1) word |= (uint32_t)start[1] << 16;
      emit_u32(word);
    }}
  }}
}}
"""
    if alias == "G":
        expr = "((value & 1u) == 0u)" if not modern else "((value % 2u) == 0u)"
        return f"""
static void run_contract(void) {{
  for (unsigned value = 0; value < 65536u; ++value)
    (void)fputc({expr} ? 1 : 0, stdout);
}}
"""
    raise KeyError(alias)


def source_for(alias: str, version: str, manifest: dict[str, Any], *, substitute: bool = False) -> str:
    modern = version != "before"
    profile = 1 if version == "before" else 2
    drift = alias == "C" and version == "adverse"
    directives = "#include <stdint.h>\n#include <stdio.h>\n#include <string.h>\n#include <stdlib.h>"
    helpers = helper_definitions(profile)
    alias_directive = "\n#define wm_add_v2 wm_xor_v2\n" if alias == "A" and version == "adverse" and not substitute else "\n"
    contract = project_contract_source(alias, modern, drift=drift, substitute=substitute)
    carriers = carrier_block(alias, version, manifest)
    return f"""/* TSE-01 routine-level replay adapter: Project {alias}, version {version}. */
{directives}

{helpers}
{alias_directive}
{emit_helpers()}

{contract}

int main(void) {{
{carriers}
  run_contract();
  return ferror(stdout) ? 2 : 0;
}}
"""


PROJECT_CARRIER_CALL = re.compile(
    r"wm_state\s*=\s*wm_(?P<kind>add|xor)_v(?P<version>[12])\s*\(\s*wm_state\s*,\s*"
    r"0x(?P<constant>[0-9a-fA-F]{8})u\s*\)\s*;"
)
PROJECT_HELPER_DEFINITION = re.compile(
    r"static\s+__attribute__\s*\(\(\s*noinline\s*\)\)\s+uint32_t\s+"
    r"wm_(?P<kind>add|xor)_v(?P<version>[12])\s*\(\s*uint32_t\s+v\s*,\s*"
    r"uint32_t\s+k\s*\)\s*\{(?P<body>[^{}]*)\}"
)
PROJECT_HELPER_SYMBOL = re.compile(r"\bwm_(?P<kind>add|xor)_v(?P<version>[12])\b")
PROJECT_UCE = re.compile(r"\\(?:u[0-9a-fA-F]{4}|U[0-9a-fA-F]{8})")
PROJECT_DIRECTIVES = [
    "#include <stdint.h>", "#include <stdio.h>",
    "#include <string.h>", "#include <stdlib.h>",
]
PROJECT_HELPER_BODIES = {
    ("add", "1"): "return(v+k)-k;",
    ("xor", "1"): "return(v^k)^k;",
    ("add", "2"): "return(v-k)+k;",
    ("xor", "2"): "returnv^(k^k);",
}


def strip_c_noncode(source: str) -> str:
    """Blank comments and string/character literals while preserving offsets."""
    out = list(source)
    state = "code"
    i = 0
    while i < len(source):
        ch = source[i]
        nxt = source[i + 1] if i + 1 < len(source) else ""
        if state == "code":
            if ch == "/" and nxt == "/":
                out[i] = out[i + 1] = " "; i += 2; state = "line"; continue
            if ch == "/" and nxt == "*":
                out[i] = out[i + 1] = " "; i += 2; state = "block"; continue
            if ch == '"': out[i] = " "; i += 1; state = "string"; continue
            if ch == "'": out[i] = " "; i += 1; state = "char"; continue
        elif state == "line":
            if ch == "\n": state = "code"
            else: out[i] = " "
        elif state == "block":
            if ch == "*" and nxt == "/":
                out[i] = out[i + 1] = " "; i += 2; state = "code"; continue
            if ch != "\n": out[i] = " "
        else:
            quote = '"' if state == "string" else "'"
            if ch == "\\":
                out[i] = " "
                if i + 1 < len(source):
                    if source[i + 1] != "\n": out[i + 1] = " "
                    i += 2; continue
            if ch == quote: out[i] = " "; state = "code"
            elif ch != "\n": out[i] = " "
        i += 1
    return "".join(out)


def validate_manifest_issuance(manifest: dict[str, Any]) -> list[str]:
    errors: list[str] = []
    carriers = manifest.get("carriers")
    if not isinstance(carriers, list): return ["manifest carrier inventory malformed"]
    positions=[]; ids=[]; constants=[]
    if len(carriers) != 28: errors.append(f"manifest carrier count mismatch: {len(carriers)}")
    for index,row in enumerate(carriers):
        if not isinstance(row,dict): errors.append(f"manifest carrier row malformed: {index}"); continue
        try:
            positions.append(int(row.get("position")))
            constants.append(int(row.get("constant")))
            bit=int(row.get("expected_bit"))
        except (TypeError,ValueError): errors.append(f"manifest carrier scalar malformed: {index}"); continue
        carrier_id=row.get("carrier_id")
        if not isinstance(carrier_id,str) or not carrier_id: errors.append(f"manifest carrier id malformed: {index}")
        else: ids.append(carrier_id)
        if bit not in (0,1): errors.append(f"manifest carrier bit malformed: {index}")
    if sorted(positions) != list(range(28)): errors.append("manifest carrier positions are not the complete 0..27 set")
    if len(ids) != len(set(ids)): errors.append("manifest carrier ids are not unique")
    if len(constants) != len(set(constants)): errors.append("manifest issuance constants are not unique")
    return errors


def analyze_project_source(source: str, manifest: dict[str, Any]) -> dict[str, Any]:
    code = strip_c_noncode(source)
    errors: list[str] = []
    grammar_errors: list[str] = []
    if re.search(r"\\\r?\n", source): grammar_errors.append("line splicing is outside the locked source grammar")
    if "??" in source: grammar_errors.append("trigraph-like tokens are outside the locked source grammar")
    if PROJECT_UCE.search(source): grammar_errors.append("universal-character escapes are outside the locked source grammar")
    if re.search(r"\b_Pragma\s*\(", code): grammar_errors.append("_Pragma is outside the locked source grammar")
    directives=[line.strip() for line in code.splitlines() if line.strip().startswith(("#","%:","??="))]
    if directives != PROJECT_DIRECTIVES: grammar_errors.append(f"preprocessor profile mismatch: {directives}")
    profile = "1" if manifest.get("source_profile") == "wm-helper-v1" else "2"
    calls=list(PROJECT_CARRIER_CALL.finditer(code))
    definitions=list(PROJECT_HELPER_DEFINITION.finditer(code))
    expected_names={(kind,profile) for kind in ("add","xor")}
    actual_names=[(m.group("kind"),m.group("version")) for m in definitions]
    if len(actual_names) != len(set(actual_names)): grammar_errors.append("duplicate locked helper definitions")
    if set(actual_names) != expected_names:
        grammar_errors.append(f"locked helper definition set mismatch: expected={sorted(expected_names)} actual={sorted(set(actual_names))}")
    for match in definitions:
        name=(match.group("kind"),match.group("version"))
        if re.sub(r"\s+","",match.group("body")) != PROJECT_HELPER_BODIES.get(name):
            grammar_errors.append(f"locked helper body mismatch: wm_{name[0]}_v{name[1]}")
    call_counts: dict[tuple[str,str],int]={}
    for match in calls:
        name=(match.group("kind"),match.group("version")); call_counts[name]=call_counts.get(name,0)+1
    symbol_counts: dict[tuple[str,str],int]={}
    for match in PROJECT_HELPER_SYMBOL.finditer(code):
        name=(match.group("kind"),match.group("version")); symbol_counts[name]=symbol_counts.get(name,0)+1
    for name in sorted(set(symbol_counts)|expected_names):
        expected=call_counts.get(name,0)+(1 if name in expected_names else 0)
        actual=symbol_counts.get(name,0)
        if actual != expected:
            grammar_errors.append(f"locked helper symbol binding mismatch: wm_{name[0]}_v{name[1]} expected_occurrences={expected} actual_occurrences={actual}")
    issuance_errors=validate_manifest_issuance(manifest)
    issued={int(row["constant"]):int(row["position"]) for row in manifest.get("carriers",[]) if isinstance(row,dict) and "constant" in row and "position" in row}
    observed: list[int|None]=[None]*28
    evidence: list[dict[str,Any]]=[]
    duplicate_constants: list[int]=[]; extra_constants: list[int]=[]
    for match in calls:
        constant=int(match.group("constant"),16)
        if constant not in issued:
            extra_constants.append(constant); evidence.append({"constant":constant,"error":"unissued_constant"}); continue
        pos=issued[constant]
        if observed[pos] is not None:
            duplicate_constants.append(constant); evidence.append({"constant":constant,"position":pos,"error":"duplicate"}); continue
        bit=0 if match.group("kind")=="add" else 1
        observed[pos]=bit
        evidence.append({"constant":constant,"position":pos,"observed_bit":bit,"line":code.count("\n",0,match.start())+1})
    if duplicate_constants: errors.append(f"duplicate recognized issuance constants: {sorted(duplicate_constants)}")
    if extra_constants: errors.append(f"unissued recognized carrier constants: {sorted(extra_constants)}")
    errors=[*grammar_errors,*issuance_errors,*errors]
    expected_bits={int(row["position"]):int(row["expected_bit"]) for row in manifest.get("carriers",[]) if isinstance(row,dict) and "position" in row and "expected_bit" in row}
    observed_count=sum(v is not None for v in observed)
    return {
        "observed":observed,
        "evidence":evidence,
        "errors":errors,
        "passed":not errors,
        "grammar_valid":not grammar_errors,
        "issuance_keys_unique":not issuance_errors,
        "occurrence_binding_valid":not duplicate_constants and not extra_constants,
        "observed_count":observed_count,
        "erasure_count":28-observed_count,
        "symbol_error_count":sum(v is not None and v != expected_bits.get(i) for i,v in enumerate(observed)),
        "symbol_loss_and_flip_scope":"recovery-and-continuity",
    }


def parse_carriers(source: str, manifest: dict[str, Any]) -> tuple[list[int | None], list[dict[str, Any]]]:
    analysis=analyze_project_source(source,manifest)
    return analysis["observed"], analysis["evidence"]


def source_conformance(source: str, manifest: dict[str, Any]) -> tuple[bool, list[str]]:
    analysis=analyze_project_source(source,manifest)
    return bool(analysis["passed"]), list(analysis["errors"])


def continuity(current_source: str, current_manifest: dict[str, Any], parent_source: str | None, parent_manifest: dict[str, Any] | None) -> dict[str, Any]:
    current_observed, _ = parse_carriers(current_source, current_manifest)
    current_ids = {
        current_manifest["carriers"][i]["carrier_id"]
        for i, bit in enumerate(current_observed) if bit is not None
    }
    if parent_source is None or parent_manifest is None:
        return {"status": "GENESIS", "preserved": 28, "required": TRACE_THRESHOLD, "passed": True}
    parent_observed, _ = parse_carriers(parent_source, parent_manifest)
    parent_ids = {
        parent_manifest["carriers"][i]["carrier_id"]
        for i, bit in enumerate(parent_observed) if bit is not None
    }
    count = len(current_ids & parent_ids)
    return {"status": "MEASURED", "preserved": count, "required": TRACE_THRESHOLD, "passed": count >= TRACE_THRESHOLD}


def ref_a() -> bytes:
    out = bytearray()
    for text in A_CASES:
        depth = tokens = checksum = length = 0
        in_string = escape = primitive = False
        valid = True
        for c in text.encode("utf-8"):
            length += 1
            checksum = (checksum * 33 + c) & 0xFFFF
            if in_string:
                if escape:
                    escape = False
                elif c == 92:
                    escape = True
                elif c == 34:
                    in_string = False
                continue
            if c == 34:
                in_string = True; tokens += 1; primitive = False
            elif c in (123, 91):
                depth += 1; tokens += 1; primitive = False
            elif c in (125, 93):
                if depth == 0: valid = False
                else: depth -= 1
                primitive = False
            elif c in (32, 9, 13, 10, 58, 44):
                primitive = False
            elif not primitive:
                tokens += 1; primitive = True
        if depth != 0 or in_string:
            valid = False
        value = (int(valid) << 31) | ((tokens & 0x7F) << 24) | ((length & 0xFF) << 16) | checksum
        out.extend(value.to_bytes(4, "little"))
    return bytes(out)


def ref_b() -> bytes:
    out = bytearray(65536)
    index = 0
    for fobj in range(256):
        for tobj in range(256):
            value = 0
            for key in range(4):
                f = (fobj >> (2 * key)) & 3
                t = (tobj >> (2 * key)) & 3
                op = 0 if f == t else 1 if t == 0 else 2 if f == 0 else 3
                value |= op << (2 * key)
            out[index] = value
            index += 1
    return bytes(out)


def ref_c() -> bytes:
    out = bytearray()
    for level in range(6):
        for threshold in range(6):
            for quiet in range(2):
                for sink in range(2):
                    value = 0 if quiet or level < threshold else (level + 1) | ((threshold + 1) << 4) | ((sink + 1) << 8) | (0x5A << 16)
                    out.extend(value.to_bytes(4, "little"))
    return bytes(out)


def fnv32(data: bytes) -> int:
    h = 2166136261
    for byte in data:
        h ^= byte
        h = (h * 16777619) & 0xFFFFFFFF
    return h


def ref_d() -> bytes:
    source = bytes((i * 37 + 11) & 0xFF for i in range(64))
    out = bytearray()
    for n in range(65):
        out.extend(source[:n])
        out.append(0)
    return bytes(out)


def adler(seed: int, data: bytes) -> int:
    a = seed & 0xFFFF
    b = (seed >> 16) & 0xFFFF
    for byte in data:
        a = (a + byte) % 65521
        b = (b + a) % 65521
    return a | (b << 16)


def ref_e() -> bytes:
    seeds = [1, 0x00010001, 0x12345678, 0xFFFFFFFF]
    out = bytearray()
    for pattern in range(4):
        if pattern == 0:
            data = bytes(range(256))
        elif pattern == 1:
            data = bytes(255 - i for i in range(256))
        elif pattern == 2:
            data = bytes((i * 17 + 31) & 0xFF for i in range(256))
        else:
            data = bytes(0xAA if i & 1 else 0x55 for i in range(256))
        for seed in seeds:
            for length in range(257):
                out.extend(adler(seed, data[:length]).to_bytes(4, "little"))
    return bytes(out)


def ref_f() -> bytes:
    out = bytearray()
    for a in range(256):
        for b in range(256):
            buf = bytearray((a, b))
            # C-string semantics: embedded NUL terminates the visible string.
            visible = bytes(buf).split(b"\x00", 1)[0]
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


def ref_g() -> bytes:
    return bytes(1 if value % 2 == 0 else 0 for value in range(65536))


REFERENCE_BUILDERS = {"A": ref_a, "B": ref_b, "C": ref_c, "D": ref_d, "E": ref_e, "F": ref_f, "G": ref_g}


def command_version(exe: str) -> str:
    cp = subprocess.run([exe, "--version"], check=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    return cp.stdout.splitlines()[0].strip()


def _fsync_directory(path: Path) -> None:
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0)
    descriptor = os.open(path, flags)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def atomic_write_bytes(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
    temporary = Path(temporary_name)
    try:
        with os.fdopen(descriptor, "wb") as stream:
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, path)
        _fsync_directory(path.parent)
    finally:
        temporary.unlink(missing_ok=True)


def compile_program(source: Path, output: Path, compiler: str, opt: str, *, assembly: Path | None = None) -> float:
    output.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(prefix=f".{output.name}.", dir=output.parent)
    os.close(descriptor)
    temporary = Path(temporary_name)
    temporary.unlink(missing_ok=True)
    seed = sha_file(source)[:16]
    cmd = [compiler, *COMPILE_FLAGS, f"-frandom-seed={seed}", opt, str(source), "-o", str(temporary)]
    start = time.perf_counter()
    try:
        cp = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=60)
        elapsed = time.perf_counter() - start
        if cp.returncode != 0:
            raise RuntimeError(f"compile failed: {' '.join(cmd)}\n{cp.stderr.decode(errors='replace')}")
        temporary.chmod(temporary.stat().st_mode | 0o111)
        with temporary.open("rb") as stream:
            os.fsync(stream.fileno())
        os.replace(temporary, output)
        _fsync_directory(output.parent)
    finally:
        temporary.unlink(missing_ok=True)
    if assembly is not None:
        # Invoke objdump from the artifact directory with a basename. Passing
        # an absolute path causes the path to appear in the disassembly header,
        # so identical extracted roots otherwise produce different assembly
        # bytes and certificate hashes.
        ap = subprocess.run(
            ["objdump", "-d", "-w", output.name],
            cwd=output.parent,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            timeout=60,
        )
        if ap.returncode != 0:
            raise RuntimeError(f"disassembly failed for {output}: {ap.stderr.decode(errors='replace')}")
        atomic_write_bytes(assembly, ap.stdout)
    return elapsed


def execute_program(exe: Path) -> tuple[bytes, bytes, int, float]:
    start = time.perf_counter()
    for attempt in range(8):
        try:
            cp = subprocess.run([str(exe)], stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=30)
            elapsed = time.perf_counter() - start
            return cp.stdout, cp.stderr, cp.returncode, elapsed
        except OSError as exc:
            if exc.errno != errno.ETXTBSY or attempt == 7:
                raise
            time.sleep(0.01 * (2 ** attempt))
    raise AssertionError("unreachable executable retry state")


def expected_verdict(alias: str, version: str) -> str:
    return "REJECT" if version == "adverse" else "PASS"


def run(root: Path) -> dict[str, Any]:
    layer = root / "artifact" / "commit-replay"
    sources_dir = layer / "sources"
    manifests_dir = layer / "manifests"
    references_dir = layer / "reference"
    build_dir = layer / "build"
    certificates_dir = layer / "certificates"
    policies_dir = layer / "policies"
    integrity_dir = layer / "integrity-objects"
    results_dir = layer / "results"
    for path in (sources_dir, manifests_dir, references_dir, build_dir, certificates_dir, policies_dir, integrity_dir, results_dir):
        shutil.rmtree(path, ignore_errors=True)
        path.mkdir(parents=True, exist_ok=True)

    environment = {
        "system": platform.system(),
        "machine": platform.machine(),
        "python": platform.python_version(),
        "gcc": command_version("gcc"),
        "clang": command_version("clang"),
        "toolchains": [{"compiler": c, "optimization": o} for c, o in TOOLCHAINS],
    }
    write_json(layer / "environment.json", environment)

    policies: dict[str, dict[str, Any]] = {}
    policy_paths: dict[str, Path] = {}
    for alias in PROJECT_META:
        policy = project_policy(alias, environment)
        path = policies_dir / f"{alias}.json"
        write_json(path, policy)
        policies[alias] = policy
        policy_paths[alias] = path

    references: dict[str, bytes] = {}
    for alias, builder in REFERENCE_BUILDERS.items():
        data = builder()
        references[alias] = data
        (references_dir / f"project-{alias}.bin").write_bytes(data)
        expected_bytes = PROJECT_META[alias].get("reference_bytes")
        if expected_bytes is None:
            expected_bytes = PROJECT_META[alias]["case_count"] if alias in {"B", "G"} else PROJECT_META[alias]["case_count"] * 4
        if len(data) != expected_bytes:
            raise AssertionError(f"reference size mismatch for {alias}: expected={expected_bytes} actual={len(data)}")

    source_texts: dict[tuple[str, str], str] = {}
    manifests: dict[tuple[str, str], dict[str, Any]] = {}
    for alias in PROJECT_META:
        for version in VERSIONS:
            manifest = manifest_for(alias, version)
            manifests[(alias, version)] = manifest
            write_json(manifests_dir / alias / f"{version}.json", manifest)
            source = source_for(alias, version, manifest)
            source_texts[(alias, version)] = source
            path = sources_dir / alias / f"{version}.c"
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source, encoding="utf-8")
            if alias == "E" and version == "adverse":
                sub = source_for(alias, version, manifest, substitute=True)
                (sources_dir / alias / "adverse-substitute.c").write_text(sub, encoding="utf-8")

    integrity_expected: dict[tuple[str, str], str] = {}
    integrity_paths: dict[tuple[str, str], Path] = {}
    for alias in PROJECT_META:
        for version in VERSIONS:
            issued = canonical_bytes({"project": alias, "version": version, "purpose": "bound lifecycle evidence object"})
            expected = sha_bytes(issued)
            retained = issued
            if alias == "F" and version == "adverse":
                retained = issued + b"\npost-issuance substitution"
            obj = integrity_dir / alias / f"{version}.bin"
            obj.parent.mkdir(parents=True, exist_ok=True)
            obj.write_bytes(retained)
            integrity_expected[(alias, version)] = expected
            integrity_paths[(alias, version)] = obj

    matrix: list[dict[str, Any]] = []
    version_evidence: dict[tuple[str, str], dict[str, Any]] = {}

    def build_cell(task: tuple[str, str, str, str]) -> dict[str, Any]:
        alias, version, compiler, opt = task
        reference = references[alias]
        intended_source = sources_dir / alias / f"{version}.c"
        actual_source = sources_dir / alias / ("adverse-substitute.c" if alias == "E" and version == "adverse" else f"{version}.c")
        cell_name = f"{compiler}_{opt[1:]}"
        cell_dir = build_dir / alias / version / cell_name
        exe = cell_dir / "adapter"
        asm = cell_dir / "adapter.s"
        output = cell_dir / "stdout.bin"
        stderr_path = cell_dir / "stderr.bin"
        reproduced = cell_dir / "reproduced"
        compile_program(actual_source, exe, compiler, opt, assembly=asm)
        stdout, stderr, returncode, _ = execute_program(exe)
        atomic_write_bytes(output, stdout)
        atomic_write_bytes(stderr_path, stderr)
        if intended_source.read_bytes() == actual_source.read_bytes():
            shutil.copy2(exe, reproduced)
        else:
            compile_program(intended_source, reproduced, compiler, opt)
        re_stdout, re_stderr, re_returncode, _ = execute_program(reproduced)
        binary_match = exe.read_bytes() == reproduced.read_bytes()
        output_match = stdout == reference and returncode == 0 and stderr == b""
        reproduced_behavior_match = re_stdout == reference and re_returncode == 0 and re_stderr == b""
        reproduced_matches_stored = re_stdout == stdout and re_returncode == returncode and re_stderr == stderr
        return {
            "project": alias,
            "version": version,
            "compiler": compiler,
            "optimization": opt,
            "case_count": PROJECT_META[alias]["case_count"],
            "source": intended_source.relative_to(root).as_posix(),
            "actual_compile_source": actual_source.relative_to(root).as_posix(),
            "source_sha256": sha_file(intended_source),
            "actual_compile_source_sha256": sha_file(actual_source),
            "executable": exe.relative_to(root).as_posix(),
            "executable_sha256": sha_file(exe),
            "reproduced_sha256": sha_file(reproduced),
            "binary_reproduction_match": binary_match,
            "output": output.relative_to(root).as_posix(),
            "output_sha256": sha_file(output),
            "reference_sha256": sha_bytes(reference),
            "behavior_match": output_match,
            "reproduced_behavior_match": reproduced_behavior_match,
            "reproduced_output_matches_stored": reproduced_matches_stored,
            "assembly": asm.relative_to(root).as_posix(),
            "assembly_sha256": sha_file(asm),
            "stderr_sha256": sha_file(stderr_path),
            "returncode": returncode,
        }

    tasks = [(alias, version, compiler, opt) for alias in PROJECT_META for version in VERSIONS for compiler, opt in TOOLCHAINS]
    workers = min(12, max(2, os.cpu_count() or 2))
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as executor:
        matrix = list(executor.map(build_cell, tasks))

    rows_by_release: dict[tuple[str, str], list[dict[str, Any]]] = {}
    for row in matrix:
        rows_by_release.setdefault((row["project"], row["version"]), []).append(row)

    for alias in PROJECT_META:
        for version in VERSIONS:
            cell_rows = rows_by_release[(alias, version)]
            behavior_ok = all(bool(row["behavior_match"]) for row in cell_rows)
            executable_ok = all(bool(row["binary_reproduction_match"] and row["reproduced_output_matches_stored"]) for row in cell_rows)
            manifest = manifests[(alias, version)]
            source = source_texts[(alias, version)]
            source_analysis = analyze_project_source(source, manifest)
            observed = source_analysis["observed"]
            carrier_evidence = source_analysis["evidence"]
            recovery = decode_payload(observed)
            source_pass = bool(source_analysis["passed"])
            source_errors = list(source_analysis["errors"])
            parent_version = manifest["parent"]
            if parent_version is None:
                parent_source = parent_manifest = None
            else:
                parent_source = source_texts[(alias, parent_version)]
                parent_manifest = manifests[(alias, parent_version)]
            cont = continuity(source, manifest, parent_source, parent_manifest)
            recovery_pass = recovery["status"] == "CERTIFIED_UNIQUE" and recovery["payload_hex"] == manifest["payload_hex"]
            integrity_actual = sha_file(integrity_paths[(alias, version)])
            version_evidence[(alias, version)] = {
                "cells": cell_rows,
                "relations": {
                    "behavior": relation_record(behavior_ok, case_count_per_cell=PROJECT_META[alias]["case_count"]),
                    "recovery": relation_record(recovery_pass, **recovery),
                    "continuity": relation_record(
                        bool(cont["passed"]),
                        status=cont["status"],
                        preserved=cont["preserved"],
                        required=cont["required"],
                    ),
                    "source_conformance": relation_record(
                        source_pass,
                        errors=source_errors,
                        grammar_valid=source_analysis["grammar_valid"],
                        issuance_keys_unique=source_analysis["issuance_keys_unique"],
                        occurrence_binding_valid=source_analysis["occurrence_binding_valid"],
                        observed_count=source_analysis["observed_count"],
                        erasure_count=source_analysis["erasure_count"],
                        symbol_error_count=source_analysis["symbol_error_count"],
                        symbol_loss_and_flip_scope=source_analysis["symbol_loss_and_flip_scope"],
                    ),
                    "executable_reproduction": relation_record(executable_ok),
                    "integrity": relation_record(
                        integrity_actual == integrity_expected[(alias, version)],
                        object=integrity_paths[(alias, version)].relative_to(root).as_posix(),
                        expected_sha256=integrity_expected[(alias, version)],
                        actual_sha256=integrity_actual,
                    ),
                    "lineage": relation_record(not (alias == "G" and version == "adverse")),
                },
                "carrier_evidence": carrier_evidence,
            }

    certificates: dict[tuple[str, str], dict[str, Any]] = {}
    for alias in PROJECT_META:
        for version in VERSIONS:
            manifest = manifests[(alias, version)]
            evidence = version_evidence[(alias, version)]
            parent_version = manifest["parent"]
            correct_parent_hash = certificates[(alias, parent_version)]["certificate_sha256"] if parent_version else None
            parent_hash = correct_parent_hash
            if alias == "G" and version == "adverse":
                # A valid but wrong earlier certificate: cryptographically well formed, semantically not the named parent.
                parent_hash = certificates[(alias, "before")]["certificate_sha256"]
            current_policy_binding = policy_binding(root, policy_paths[alias], policies[alias])
            parent_policy_hash = certificates[(alias, parent_version)]["policy"]["canonical_sha256"] if parent_version else None
            policy_compatible = parent_version is None or parent_policy_hash == current_policy_binding["canonical_sha256"]
            parent_decision = None if parent_version is None else certificates[(alias, parent_version)]["verdict"]
            parent_accepted = parent_version is None or parent_decision == "PASS"
            lineage_ok = parent_version is None or (parent_hash == correct_parent_hash and policy_compatible and parent_accepted)
            relations = copy.deepcopy(evidence["relations"])
            relations["lineage"] = relation_record(lineage_ok)
            verdict = typed_decision(relations[name]["passed"] for name in RELATION_NAMES)
            cert = {
                "schema": SCHEMA,
                "project": alias,
                "version": version,
                "immutable_change": PROJECT_META[alias]["commit"],
                "expected_class": "adverse" if version == "adverse" else "intended",
                "policy": current_policy_binding,
                "source": (sources_dir / alias / f"{version}.c").relative_to(root).as_posix(),
                "source_sha256": sha_file(sources_dir / alias / f"{version}.c"),
                "manifest": (manifests_dir / alias / f"{version}.json").relative_to(root).as_posix(),
                "manifest_sha256": sha_file(manifests_dir / alias / f"{version}.json"),
                "reference": (references_dir / f"project-{alias}.bin").relative_to(root).as_posix(),
                "reference_sha256": sha_file(references_dir / f"project-{alias}.bin"),
                "integrity_object": integrity_paths[(alias, version)].relative_to(root).as_posix(),
                "integrity_object_sha256": integrity_expected[(alias, version)],
                "parent_version": parent_version,
                "parent_certificate_sha256": parent_hash,
                "parent_policy_canonical_sha256": parent_policy_hash,
                "parent_decision": parent_decision,
                "parent_accepted": parent_accepted,
                "policy_compatible": policy_compatible,
                "compiler_cells": [
                    {
                        "compiler": row["compiler"],
                        "optimization": row["optimization"],
                        "source_sha256": row["source_sha256"],
                        "executable": row["executable"],
                        "executable_sha256": row["executable_sha256"],
                        "output": row["output"],
                        "output_sha256": row["output_sha256"],
                        "assembly": row["assembly"],
                        "assembly_sha256": row["assembly_sha256"],
                    }
                    for row in evidence["cells"]
                ],
                "relations": relations,
                "verdict": verdict,
            }
            cert = add_self_hash(cert)
            certificates[(alias, version)] = cert
            write_json(certificates_dir / alias / f"{version}.json", cert)
            if verdict != expected_verdict(alias, version):
                raise AssertionError(f"unexpected verdict for {alias}/{version}: {verdict}")

    # Exhaustive relation-subset gates, single-relation baselines, and diagonal ablations.
    adverse = [certificates[(alias, "adverse")] for alias in PROJECT_META]
    all_relations = ["behavior", "recovery", "continuity", "source_conformance", "executable_reproduction", "integrity", "lineage"]
    baseline_relations = {"stored_bindings_only": []}
    baseline_relations.update({f"{relation}_only": [relation] for relation in all_relations})
    baseline_relations["complete_gate"] = list(all_relations)
    baselines = []
    for name, required in baseline_relations.items():
        accepted = [c["project"] for c in adverse if all(c["relations"][r]["passed"] is True for r in required)]
        baselines.append({"gate": name, "required_relations": required, "false_accepts": len(accepted), "accepted_projects": accepted})

    ablations = []
    for removed in all_relations:
        required = [r for r in all_relations if r != removed]
        accepted = [c["project"] for c in adverse if all(c["relations"][r]["passed"] is True for r in required)]
        ablations.append({"removed_relation": removed, "false_accepts": len(accepted), "accepted_projects": accepted})

    subset_results = []
    for mask in range(1 << len(all_relations)):
        required = [relation for index, relation in enumerate(all_relations) if mask & (1 << index)]
        accepted = [c["project"] for c in adverse if all(c["relations"][r]["passed"] is True for r in required)]
        subset_results.append({"mask": mask, "required_relations": required, "relation_count": len(required), "false_accepts": len(accepted), "accepted_projects": accepted})

    thresholds = []
    for threshold in range(29):
        intended_pass = 0
        adverse_continuity_false_accept = 0
        for alias in PROJECT_META:
            for version in ("before", "after", "tolerated"):
                rels = copy.deepcopy(certificates[(alias, version)]["relations"])
                count = int(rels["continuity"]["preserved"])
                rels["continuity"]["passed"] = count >= threshold
                if all(v["passed"] is True for v in rels.values()):
                    intended_pass += 1
            b_control = certificates[("B", "adverse")]
        b_count = int(b_control["relations"]["continuity"]["preserved"])
        if b_count >= threshold:
            adverse_continuity_false_accept = 1
        thresholds.append({"threshold": threshold, "intended_pass": intended_pass, "intended_total": 21, "continuity_control_false_accept": adverse_continuity_false_accept})

    loo = []
    aliases = list(PROJECT_META)
    for held_out in aliases:
        remaining = [a for a in aliases if a != held_out]
        intended_pass = sum(
            1 for alias in remaining for version in ("before", "after", "tolerated")
            if certificates[(alias, version)]["verdict"] == "PASS"
        )
        adverse_reject = sum(1 for alias in remaining if certificates[(alias, "adverse")]["verdict"] == "REJECT")
        loo.append({
            "held_out": held_out,
            "intended_pass": intended_pass,
            "intended_total": 18,
            "adverse_reject": adverse_reject,
            "adverse_total": 6,
            "false_accepts": 6 - adverse_reject,
        })

    total_cases = sum(PROJECT_META[a]["case_count"] * len(VERSIONS) * len(TOOLCHAINS) for a in PROJECT_META)
    decision_fixtures = [
        {"name": "all-established", "values": [True] * 7, "decision": typed_decision([True] * 7)},
        {"name": "one-unresolved", "values": [True] * 6 + [None], "decision": typed_decision([True] * 6 + [None])},
        {
            "name": "false-dominates-unresolved",
            "values": [True] * 5 + [None, False],
            "decision": typed_decision([True] * 5 + [None, False]),
        },
    ]
    if [row["decision"] for row in decision_fixtures] != ["PASS", "HOLD", "REJECT"]:
        raise AssertionError("typed decision fixture mismatch")

    summary = {
        "schema": "tse01.commit-replay.summary.v3",
        "policy_file_count": len(policies),
        "project_count": 7,
        "version_count": 28,
        "compiler_cell_count": len(matrix),
        "case_evaluations": total_cases,
        "intended_pass": sum(1 for a in PROJECT_META for v in VERSIONS if v != "adverse" and certificates[(a, v)]["verdict"] == "PASS"),
        "adverse_reject": sum(1 for a in PROJECT_META if certificates[(a, "adverse")]["verdict"] == "REJECT"),
        "pass_count": sum(1 for c in certificates.values() if c["verdict"] == "PASS"),
        "hold_count": sum(1 for c in certificates.values() if c["verdict"] == "HOLD"),
        "reject_count": sum(1 for c in certificates.values() if c["verdict"] == "REJECT"),
        "decision_fixtures": decision_fixtures,
        "baseline_results": baselines,
        "ablation_results": ablations,
        "relation_subset_results": subset_results,
        "threshold_results": thresholds,
        "leave_one_project_out": loo,
        "environment": environment,
        "verdict": "PASS",
    }
    if total_cases != 3_215_120:
        raise AssertionError(f"case total mismatch: {total_cases}")
    if (
        summary["intended_pass"], summary["adverse_reject"],
        summary["pass_count"], summary["hold_count"], summary["reject_count"],
    ) != (21, 7, 21, 0, 7):
        raise AssertionError("release classification mismatch")
    expected_baselines = {"stored_bindings_only": 7, "complete_gate": 0}
    expected_baselines.update({f"{relation}_only": 6 for relation in all_relations})
    if {row["gate"]: row["false_accepts"] for row in baselines} != expected_baselines:
        raise AssertionError("baseline profile mismatch")
    if len(subset_results) != 128 or [row for row in subset_results if row["false_accepts"] == 0] != [subset_results[-1]]:
        raise AssertionError("full gate is not the unique zero-false-accept relation subset")
    if any(row["false_accepts"] != 1 for row in ablations):
        raise AssertionError("ablation is not diagonal")
    if any(row["intended_pass"] != 21 or row["continuity_control_false_accept"] != 0 for row in thresholds if 1 <= row["threshold"] <= 26):
        raise AssertionError("threshold plateau mismatch")
    if any(row["intended_pass"] != 14 for row in thresholds if row["threshold"] >= 27):
        raise AssertionError("high-threshold profile mismatch")
    if any(row["intended_pass"] != 18 or row["adverse_reject"] != 6 for row in loo):
        raise AssertionError("leave-one-project-out mismatch")

    write_json(results_dir / "matrix.json", matrix)
    write_json(results_dir / "summary.json", summary)
    print(json.dumps({k: summary[k] for k in (
        "project_count", "version_count", "compiler_cell_count", "case_evaluations",
        "intended_pass", "adverse_reject", "hold_count", "verdict",
    )}, sort_keys=True))
    return summary


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    args = parser.parse_args()
    run(args.root.resolve())


if __name__ == "__main__":
    main()
