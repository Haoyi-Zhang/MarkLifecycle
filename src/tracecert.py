#!/usr/bin/env python3
"""Deterministic lifecycle certificate utilities for TSE-01.

The checker is intentionally small and dependency-free.  It supports:
- Hamming(7,4) encoding and bounded-distance decoding with erasures;
- keyed source-carrier manifests;
- extraction of the benchmark's four semantics-preserving carrier forms;
- SHA-256 binding and certificate-chain validation.
"""
from __future__ import annotations

import hashlib
import json
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable, Sequence

SCHEMA = "tracecert.release.v5"

RELATION_NAMES = (
    "behavior",
    "recovery",
    "continuity",
    "source_conformance",
    "executable_reproduction",
    "integrity",
    "lineage",
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


def typed_decision(values: Iterable[bool | None]) -> str:
    """Return the certificate's three-valued release decision.

    A demonstrated violation dominates unresolved evidence.  PASS requires all
    relations to be established true; HOLD is reserved for vectors with no
    established false relation and at least one unresolved relation.
    """
    values = tuple(values)
    if any(value is False for value in values):
        return "REJECT"
    if all(value is True for value in values):
        return "PASS"
    return "HOLD"


def relation_record(passed: bool | None, **details: Any) -> dict[str, Any]:
    return {"passed": passed, "state": relation_state(passed), **details}


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode("ascii")


def canonical_json_sha256(value: Any) -> str:
    return sha256_bytes(canonical_json_bytes(value))


def bits_from_u16(value: int) -> list[int]:
    if not 0 <= value <= 0xFFFF:
        raise ValueError("payload must fit in 16 bits")
    return [(value >> shift) & 1 for shift in range(15, -1, -1)]


def u16_from_bits(bits: Sequence[int]) -> int:
    if len(bits) != 16 or any(bit not in (0, 1) for bit in bits):
        raise ValueError("expected 16 binary bits")
    out = 0
    for bit in bits:
        out = (out << 1) | bit
    return out


def hamming74_encode_nibble(data: Sequence[int]) -> list[int]:
    """Encode d1,d2,d3,d4 into positions 1..7 with even parity."""
    if len(data) != 4 or any(bit not in (0, 1) for bit in data):
        raise ValueError("expected four data bits")
    d1, d2, d3, d4 = data
    p1 = d1 ^ d2 ^ d4
    p2 = d1 ^ d3 ^ d4
    p4 = d2 ^ d3 ^ d4
    return [p1, p2, d1, p4, d2, d3, d4]


def hamming74_encode_u16(payload: int) -> list[int]:
    bits = bits_from_u16(payload)
    out: list[int] = []
    for i in range(0, 16, 4):
        out.extend(hamming74_encode_nibble(bits[i : i + 4]))
    return out


@dataclass(frozen=True)
class BlockDecode:
    status: str
    decoded_bits: tuple[int, ...] | None
    errors: int
    erasures: int
    candidate_count: int
    condition_holds: bool


def decode_hamming74_block(observed: Sequence[int | None]) -> BlockDecode:
    if len(observed) != 7:
        raise ValueError("expected seven symbols")
    erasures = sum(x is None for x in observed)
    scored: list[tuple[int, tuple[int, ...], list[int]]] = []
    for nibble in range(16):
        data = tuple((nibble >> shift) & 1 for shift in (3, 2, 1, 0))
        code = hamming74_encode_nibble(data)
        errors = sum(o is not None and o != c for o, c in zip(observed, code))
        scored.append((errors, data, code))
    best = min(x[0] for x in scored)
    candidates = [x for x in scored if x[0] == best]
    condition = 2 * best + erasures < 3
    if len(candidates) == 1 and condition:
        return BlockDecode("CERTIFIED_UNIQUE", candidates[0][1], best, erasures, 1, True)
    if len(candidates) == 1:
        return BlockDecode("UNIQUE_BUT_OUTSIDE_RADIUS", candidates[0][1], best, erasures, 1, False)
    return BlockDecode("AMBIGUOUS", None, best, erasures, len(candidates), False)


def decode_hamming74_u16(observed: Sequence[int | None]) -> dict[str, Any]:
    if len(observed) != 28:
        raise ValueError("expected 28 symbols")
    blocks = [decode_hamming74_block(observed[i : i + 7]) for i in range(0, 28, 7)]
    certified = all(b.status == "CERTIFIED_UNIQUE" for b in blocks)
    decoded_bits: list[int] = []
    for block in blocks:
        if block.decoded_bits is None:
            return {
                "status": "NOT_CERTIFIED",
                "payload_hex": None,
                "blocks": [b.__dict__ for b in blocks],
                "total_errors": sum(b.errors for b in blocks),
                "total_erasures": sum(b.erasures for b in blocks),
            }
        decoded_bits.extend(block.decoded_bits)
    payload = u16_from_bits(decoded_bits)
    return {
        "status": "CERTIFIED_UNIQUE" if certified else "NOT_CERTIFIED",
        "payload_hex": f"{payload:04x}",
        "blocks": [b.__dict__ for b in blocks],
        "total_errors": sum(b.errors for b in blocks),
        "total_erasures": sum(b.erasures for b in blocks),
    }


# Direct expression forms. The variable and key are required to repeat exactly.
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


def validate_locked_helper_definitions(source: str) -> list[str]:
    """Require the exact helper bodies and an unambiguous source binding.

    The finite benchmark grammar permits only the two locked system includes.
    Helper names may occur only in their one exact definition and in carrier
    calls recognized by ``HELPER``.  This rejects preprocessor aliases,
    function-pointer shadows, assembler aliases, or other rebinding syntax that
    would make a call name cease to identify the locked helper implementation.
    """
    code = strip_c_noncode(source)
    errors: list[str] = []

    if re.search(r"\\\r?\n", source):
        errors.append("line splicing is outside the locked source grammar")
    if "??" in source:
        errors.append("trigraph-like tokens are outside the locked source grammar")
    if UNIVERSAL_CHARACTER_ESCAPE.search(source):
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
    versions = {m.group("version") for m in calls}
    definitions = list(HELPER_DEFINITION.finditer(code))
    if len(versions) > 1:
        errors.append(f"mixed helper versions in carrier calls: {sorted(versions)}")
    expected_names = {
        (kind, version) for version in versions for kind in ("add", "xor")
    }
    actual_names = [(m.group("kind"), m.group("version")) for m in definitions]
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
            errors.append(
                f"locked helper body mismatch: tc_{name[0]}_v{name[1]}"
            )

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


def extract_source_carriers(source: str) -> list[dict[str, Any]]:
    source = strip_c_noncode(source)
    found: list[dict[str, Any]] = []
    for pattern, bit, family in (
        (DIRECT_ADD, 0, "direct-add"),
        (DIRECT_XOR, 1, "direct-xor"),
    ):
        for m in pattern.finditer(source):
            found.append(
                {
                    "offset": m.start(),
                    "line": source.count("\n", 0, m.start()) + 1,
                    "constant": int(m.group("k"), 16),
                    "observed_bit": bit,
                    "family": family,
                }
            )
    for m in HELPER.finditer(source):
        found.append(
            {
                "offset": m.start(),
                "line": source.count("\n", 0, m.start()) + 1,
                "constant": int(m.group("k"), 16),
                "observed_bit": 0 if m.group("kind") == "add" else 1,
                "family": f"helper-v{m.group('version')}",
            }
        )
    found.sort(key=lambda x: x["offset"])
    return found




def validate_manifest_issuance(manifest: dict[str, Any]) -> list[str]:
    """Validate the issued carrier-key inventory without judging observations.

    Source conformance binds the admitted syntax and the one-to-one issuance-key
    namespace.  Whether an issued key is missing or carries the wrong symbol is
    deliberately left to recovery and continuity.
    """
    errors: list[str] = []
    carriers = manifest.get("carriers")
    if not isinstance(carriers, list):
        return ["manifest carrier inventory malformed"]
    if len(carriers) != 28:
        errors.append(f"manifest carrier count mismatch: {len(carriers)}")
    positions: list[int] = []
    carrier_ids: list[str] = []
    constants: list[int] = []
    for index, row in enumerate(carriers):
        if not isinstance(row, dict):
            errors.append(f"manifest carrier row malformed: {index}")
            continue
        try:
            position = int(row.get("position"))
            constant = int(row.get("constant"))
            bit = int(row.get("bit"))
        except (TypeError, ValueError):
            errors.append(f"manifest carrier scalar malformed: {index}")
            continue
        carrier_id = row.get("carrier_id")
        if not isinstance(carrier_id, str) or not carrier_id:
            errors.append(f"manifest carrier id malformed: {index}")
        else:
            carrier_ids.append(carrier_id)
        positions.append(position)
        constants.append(constant)
        if bit not in (0, 1):
            errors.append(f"manifest carrier bit malformed: {index}")
    if sorted(positions) != list(range(28)):
        errors.append("manifest carrier positions are not the complete 0..27 set")
    if len(carrier_ids) != len(set(carrier_ids)):
        errors.append("manifest carrier ids are not unique")
    if len(constants) != len(set(constants)):
        errors.append("manifest issuance constants are not unique")
    return errors

def observe_against_manifest(source_path: Path, manifest: dict[str, Any]) -> dict[str, Any]:
    source = source_path.read_text(encoding="utf-8")
    helper_errors = validate_locked_helper_definitions(source)
    manifest_errors = validate_manifest_issuance(manifest)
    extracted = extract_source_carriers(source)
    by_constant: dict[int, list[dict[str, Any]]] = {}
    for item in extracted:
        by_constant.setdefault(item["constant"], []).append(item)
    expected_constants = {int(row["constant"]) for row in manifest.get("carriers", []) if isinstance(row, dict) and "constant" in row}
    extra_constants = sorted(
        int(item["constant"]) for item in extracted
        if int(item["constant"]) not in expected_constants
    )
    observed: list[int | None] = [None] * 28
    carriers: list[dict[str, Any]] = []
    duplicates: list[int] = []
    for expected in manifest.get("carriers", []):
        if not isinstance(expected, dict):
            continue
        position = int(expected["position"])
        if position not in range(28):
            continue
        matches = by_constant.get(int(expected["constant"]), [])
        if len(matches) > 1:
            duplicates.append(int(expected["constant"]))
        match = matches[0] if len(matches) == 1 else None
        bit = None if match is None else int(match["observed_bit"])
        observed[position] = bit
        carriers.append(
            {
                "carrier_id": expected["carrier_id"],
                "position": position,
                "constant": int(expected["constant"]),
                "expected_bit": int(expected["bit"]),
                "observed_bit": bit,
                "line": None if match is None else match["line"],
                "family": None if match is None else match["family"],
                "state": "ERASURE" if bit is None else ("MATCH" if bit == int(expected["bit"]) else "ERROR"),
            }
        )
    decoded = decode_hamming74_u16(observed)
    observed_count = sum(bit is not None for bit in observed)
    erasure_count = sum(bit is None for bit in observed)
    symbol_error_count = sum(
        row["observed_bit"] is not None and row["observed_bit"] != row["expected_bit"]
        for row in carriers
    )
    grammar_valid = not helper_errors
    issuance_keys_unique = not manifest_errors
    occurrence_binding_valid = not duplicates and not extra_constants
    source_errors = [*helper_errors, *manifest_errors]
    if duplicates:
        source_errors.append(f"duplicate recognized issuance constants: {sorted(duplicates)}")
    if extra_constants:
        source_errors.append(f"unissued recognized carrier constants: {extra_constants}")
    return {
        "source_sha256": sha256_file(source_path),
        "manifest_canonical_sha256": canonical_json_sha256(manifest),
        "extracted_count": len(extracted),
        "manifest_count": len(manifest.get("carriers", [])),
        "duplicate_constants": sorted(duplicates),
        "extra_constants": extra_constants,
        "observed_symbols": "".join("?" if x is None else str(x) for x in observed),
        "carriers": carriers,
        "decode": decoded,
        "source_conformance": {
            "passed": grammar_valid and issuance_keys_unique and occurrence_binding_valid,
            "grammar_valid": grammar_valid,
            "issuance_keys_unique": issuance_keys_unique,
            "occurrence_binding_valid": occurrence_binding_valid,
            "observed_count": observed_count,
            "erasure_count": erasure_count,
            "symbol_error_count": symbol_error_count,
            "errors": source_errors,
            "symbol_loss_and_flip_scope": "recovery-and-continuity",
        },
    }


def map_provenance(parent_manifest: dict[str, Any], child_manifest: dict[str, Any], child_observation: dict[str, Any]) -> dict[str, Any]:
    parent_ids = {c["carrier_id"]: c for c in parent_manifest["carriers"]}
    child_by_id = {c["carrier_id"]: c for c in child_manifest["carriers"]}
    observed_by_id = {c["carrier_id"]: c for c in child_observation["carriers"]}
    mappings: list[dict[str, Any]] = []
    for carrier_id, parent in parent_ids.items():
        child = child_by_id.get(carrier_id)
        obs = observed_by_id.get(carrier_id)
        if child is None or obs is None or obs["observed_bit"] is None:
            continue
        mappings.append(
            {
                "carrier_id": carrier_id,
                "parent_position": parent["position"],
                "child_position": child["position"],
                "child_line": obs["line"],
                "bit_changed": parent["bit"] != obs["observed_bit"],
            }
        )
    total = len(parent_manifest["carriers"])
    return {
        "mapped_count": len(mappings),
        "baseline_count": total,
        "traceability": 0.0 if total == 0 else len(mappings) / total,
        "mappings": mappings,
    }


def verify_certificate_structure(cert: dict[str, Any]) -> list[str]:
    errors: list[str] = []
    if cert.get("schema") != SCHEMA:
        errors.append("schema mismatch")
    required = ["kernel", "variant", "policy", "source", "watermark", "behavior", "chain", "relations", "verdict"]
    for key in required:
        if key not in cert:
            errors.append(f"missing key: {key}")
    parent_variants = cert.get("parent_variants")
    if not isinstance(parent_variants, list) or any(not isinstance(parent, str) for parent in parent_variants):
        errors.append("parent variant set malformed")
        parent_variants = []
    elif len(parent_variants) != len(set(parent_variants)):
        errors.append("parent variant set contains duplicates")
    expected_legacy_parent = parent_variants[0] if len(parent_variants) == 1 else None
    if cert.get("parent_variant") != expected_legacy_parent:
        errors.append("legacy parent variant mismatch")
    source = cert.get("source")
    if not isinstance(source, dict):
        errors.append("source binding malformed")
        source = {}
    parent_source_hashes = source.get("parent_sha256s")
    if not isinstance(parent_source_hashes, list) or len(parent_source_hashes) != len(parent_variants):
        errors.append("parent source hash set mismatch")
        parent_source_hashes = []
    expected_legacy_source = parent_source_hashes[0] if len(parent_source_hashes) == 1 else None
    if source.get("parent_sha256") != expected_legacy_source:
        errors.append("legacy parent source hash mismatch")
    chain = cert.get("chain")
    if not isinstance(chain, dict):
        errors.append("chain binding malformed")
        chain = {}
    parent_edges = chain.get("parents")
    if not isinstance(parent_edges, list) or len(parent_edges) != len(parent_variants):
        errors.append("parent edge set mismatch")
        parent_edges = []
    elif [edge.get("variant") for edge in parent_edges if isinstance(edge, dict)] != parent_variants:
        errors.append("parent edge order mismatch")
    provenance_by_parent = cert.get("watermark", {}).get("provenance_by_parent")
    if not isinstance(provenance_by_parent, list) or len(provenance_by_parent) != len(parent_variants):
        errors.append("parent provenance set mismatch")
    continuity = cert.get("relations", {}).get("continuity", {})
    if isinstance(continuity, dict):
        if continuity.get("parent_edge_count") != len(parent_variants):
            errors.append("continuity parent-edge count mismatch")
        per_parent = continuity.get("per_parent")
        if not isinstance(per_parent, list) or len(per_parent) != len(parent_variants):
            errors.append("continuity parent detail mismatch")

    policy = cert.get("policy")
    if not isinstance(policy, dict) or set(policy) != {"path", "policy_id", "file_sha256", "canonical_sha256"}:
        errors.append("policy binding fields mismatch")
    relations = cert.get("relations")
    if not isinstance(relations, dict) or set(relations) != set(RELATION_NAMES):
        errors.append("relation inventory mismatch")
    else:
        values: list[bool | None] = []
        for name in RELATION_NAMES:
            record = relations.get(name)
            if not isinstance(record, dict):
                errors.append(f"malformed relation record: {name}")
                continue
            passed = record.get("passed")
            if passed not in (True, False, None):
                errors.append(f"invalid relation truth value: {name}")
                continue
            values.append(passed)
            if record.get("state") != relation_state(passed):
                errors.append(f"relation state mismatch: {name}")
        if len(values) == len(RELATION_NAMES) and cert.get("verdict") != typed_decision(values):
            errors.append("typed verdict mismatch")
    stored = cert.get("certificate_sha256")
    if stored:
        unsigned = dict(cert)
        unsigned.pop("certificate_sha256", None)
        actual = canonical_json_sha256(unsigned)
        if actual != stored:
            errors.append("certificate self-hash mismatch")
    return errors


def add_self_hash(cert: dict[str, Any]) -> dict[str, Any]:
    out = dict(cert)
    out.pop("certificate_sha256", None)
    out["certificate_sha256"] = canonical_json_sha256(out)
    return out


def load_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
