#!/usr/bin/env python3
"""Verify the frozen scholarly-reference set and local sentence bindings."""
from __future__ import annotations
import argparse, hashlib, json, re
from datetime import date
from pathlib import Path
ART = Path(__file__).resolve().parents[1]
CHECKS = ART / "paper_support"
from typing import Any
from refresh_reference_lock import support_sentence


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical(value: Any) -> str:
    return sha(json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode("ascii"))


def entries(text: str) -> dict[str, str]:
    matches = list(re.finditer(r"\\bibitem\{([^}]+)\}\s*", text))
    out = {}
    for i, match in enumerate(matches):
        end = matches[i + 1].start() if i + 1 < len(matches) else text.find("\\end{thebibliography}", match.end())
        out[match.group(1)] = re.sub(r"\s+", " ", text[match.end():end]).strip()
    return out


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--paper", type=Path, required=True)
    args = parser.parse_args()
    paper = args.paper.resolve()
    source_bytes = (paper / "main.tex").read_bytes()
    bibliography_bytes = (paper / "references.tex").read_bytes()
    source = source_bytes.decode("utf-8")
    bibliography = bibliography_bytes.decode("utf-8")
    lock = json.loads((CHECKS / "reference_verification_lock.json").read_text(encoding="utf-8"))
    target = json.loads((CHECKS / "reference_target_lock.json").read_text(encoding="utf-8"))
    errors = []
    if lock.get("schema") != "tse01.reference-verification-lock.v2": errors.append("lock schema")
    if lock.get("manuscript_sha256") != sha(source_bytes): errors.append("manuscript binding")
    if lock.get("bibliography_sha256") != sha(bibliography_bytes): errors.append("bibliography binding")
    records = lock.get("records", [])
    if lock.get("reference_count") != len(records): errors.append("reference count field")
    if lock.get("records_set_sha256") != canonical(records): errors.append("record-set binding")
    parsed_entries = entries(bibliography)
    bibliography_order = list(parsed_entries)
    record_by_key = {row.get("key"): row for row in records}
    record_order = [row.get("key") for row in records]
    cite_groups = re.findall(r"\\cite\{([^}]+)\}", source)
    cited = [group.strip() for group in cite_groups]
    if any("," in group or ";" in group for group in cited): errors.append("multi-key citation command")
    if len(cited) != len(set(cited)): errors.append("citation key reused")
    if set(cited) != set(parsed_entries) or set(cited) != set(record_by_key): errors.append("citation/reference/lock set mismatch")
    if cited != bibliography_order: errors.append("bibliography not ordered by first citation appearance")
    if record_order != bibliography_order: errors.append("reference lock order mismatch")
    if lock.get("citation_order") != bibliography_order: errors.append("citation order binding")
    if re.search(r"\\cite\{[^}]+\}\s*\\cite\{", source): errors.append("adjacent citation pile")
    sentence_chunks = re.split(r"(?<=[.!?])\s+(?=[A-Z\\])", source)
    multi_citation_sentences = [
        re.sub(r"\s+", " ", chunk).strip()
        for chunk in sentence_chunks
        if len(re.findall(r"\\cite\{[^}]+\}", chunk)) > 1
    ]
    if multi_citation_sentences: errors.append("multiple citations in one support sentence")
    if len(records) < int(target.get("frozen_reference_floor", target.get("reference_floor", 0))): errors.append("below frozen reference floor")
    for key, row in record_by_key.items():
        entry = parsed_entries.get(key, "")
        if row.get("entry") != entry or row.get("entry_sha256") != sha(entry.encode("utf-8")): errors.append(f"entry binding:{key}")
        ident = str(row.get("scholarly_identifier", ""))
        locator = str(row.get("source_locator", ""))
        if not (ident.startswith("DBLP:") or ident.startswith("DOI:") or ident.startswith("10.")): errors.append(f"identifier:{key}")
        if not (locator.startswith("https://dblp.org/rec/") or locator.startswith("https://doi.org/")): errors.append(f"locator:{key}")
        if row.get("verification_status") != "MANUALLY_VERIFIED_EXACT_METADATA_AND_LOCAL_SUPPORT": errors.append(f"status:{key}")
        sentence = str(row.get("support_sentence", ""))
        if f"\\cite{{{key}}}" not in sentence: errors.append(f"support sentence citation:{key}")
        if row.get("support_sentence_sha256") != sha(sentence.encode("utf-8")): errors.append(f"support binding:{key}")
        try:
            current_sentence, _ = support_sentence(source, key)
            if sentence != current_sentence: errors.append(f"current support sentence:{key}")
        except ValueError:
            errors.append(f"current support sentence:{key}")
        location = str(row.get("manuscript_location", ""))
        match = re.fullmatch(r"paper/main\.tex:(\d+)", location)
        if not match: errors.append(f"location:{key}")
        else:
            line = int(match.group(1))
            lines = source.splitlines()
            if line < 1 or line > len(lines) or f"\\cite{{{key}}}" not in lines[line - 1]: errors.append(f"location binding:{key}")
    result = {
        "schema": "tse01.reference-lock-audit.v1",
        "verification_kind": "local-byte-and-position-check-not-primary-source-review",
        "binding_check_date": date.today().isoformat(),
        "fresh_primary_fulltext_review_count": 0,
        "verdict": "PASS" if not errors else "FAIL",
        "reference_count": len(records),
        "citation_command_count": len(cited),
        "single_key_commands": all("," not in x and ";" not in x for x in cited),
        "multi_citation_sentences": len(multi_citation_sentences),
        "unique_use_per_reference": len(cited) == len(set(cited)) == len(records),
        "bibliography_order_matches_first_appearance": cited == bibliography_order,
        "frozen_floor": target.get("frozen_reference_floor", target.get("reference_floor")),
        "errors": errors,
        "manuscript_sha256": sha(source_bytes),
        "bibliography_sha256": sha(bibliography_bytes),
    }
    (CHECKS / "reference_lock_audit.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(result, sort_keys=True))
    if errors: raise SystemExit(1)

if __name__ == "__main__": main()
