#!/usr/bin/env python3
"""Refresh byte and sentence bindings of the manually verified reference lock.

This utility does not discover, add, or promote references.  It updates only
bindings that become stale when the manuscript is edited, while preserving the
manually verified scholarly metadata and status of the frozen manually verified reference set.
"""
from __future__ import annotations
import argparse, copy, hashlib, json, re
from datetime import date
from pathlib import Path
ART = Path(__file__).resolve().parents[1]
CHECKS = ART / "paper_support"
from typing import Any


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical(value: Any) -> str:
    return sha(json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode("ascii"))


def parse_entries(text: str) -> dict[str, str]:
    matches = list(re.finditer(r"\\bibitem\{([^}]+)\}\s*", text))
    out: dict[str, str] = {}
    for i, match in enumerate(matches):
        end = matches[i + 1].start() if i + 1 < len(matches) else text.find("\\end{thebibliography}", match.end())
        entry = re.sub(r"\s+", " ", text[match.end():end]).strip()
        out[match.group(1)] = entry
    return out


def support_sentence(source: str, key: str) -> tuple[str, int]:
    needle = f"\\cite{{{key}}}"
    positions = [m.start() for m in re.finditer(re.escape(needle), source)]
    if len(positions) != 1:
        raise ValueError(f"{key}: expected exactly one citation, found {len(positions)}")
    pos = positions[0]
    paragraph_start = source.rfind("\n\n", 0, pos)
    paragraph_origin = paragraph_start + 2 if paragraph_start >= 0 else 0
    sentence_boundaries = [m.end() for m in re.finditer(r"[.!?](?:\s+|\n)", source[paragraph_origin:pos])]
    start = paragraph_origin
    if sentence_boundaries:
        start = max(start, paragraph_origin + sentence_boundaries[-1])
    end_match = re.search(r"[.!?](?:\s|\n|$)", source[pos:])
    end = pos + (end_match.end() if end_match else len(source) - pos)
    sentence = re.sub(r"\s+", " ", source[start:end]).strip()
    line = source.count("\n", 0, pos) + 1
    return sentence, line


def refresh_bindings(lock: dict, source: str, bibliography_text: str) -> dict:
    """Refresh locations only after exact inherited entries/sentences agree.

    A changed citation-bearing sentence requires a separate source review; this
    operation cannot promote inherited metadata review to fresh full-text review.
    """
    entries = parse_entries(bibliography_text)
    records = {row["key"]: copy.deepcopy(row) for row in lock["records"]}
    citation_order = [group.strip() for group in re.findall(r"\\cite\{([^}]+)\}", source)]
    if (set(entries) != set(records) or citation_order != list(entries)
            or len(citation_order) != len(set(citation_order))):
        raise ValueError("reference set, order or single-use contract changed")
    refreshed = []
    for key in citation_order:
        row = records[key]
        sentence, line = support_sentence(source, key)
        if (entries[key] != row["entry"] or sha(entries[key].encode()) != row["entry_sha256"]
                or sentence != row["support_sentence"]
                or sha(sentence.encode()) != row["support_sentence_sha256"]):
            raise ValueError(f"{key}: entry/support changed; inherited review cannot be rebound")
        row["manuscript_location"] = f"paper/main.tex:{line}"
        refreshed.append(row)
    output = copy.deepcopy(lock)
    output.update({"bibliography_sha256": sha(bibliography_text.encode()),
                   "manuscript_sha256": sha(source.encode()), "records": refreshed,
                   "citation_order": citation_order, "records_set_sha256": canonical(refreshed),
                   "binding_scope": "local byte and citation-position refresh only; inherited review provenance preserved",
                   "binding_refresh_date": date.today().isoformat(),
                   "fresh_primary_fulltext_review_count": 0})
    return output


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--paper", type=Path, default=ART.parent / "paper")
    args = parser.parse_args()
    paper = args.paper.resolve()
    lock_path = CHECKS / "reference_verification_lock.json"
    lock = json.loads(lock_path.read_text(encoding="utf-8"))
    source = (paper / "main.tex").read_text(encoding="utf-8")
    bibliography_text = (paper / "references.tex").read_text(encoding="utf-8")
    output = refresh_bindings(lock, source, bibliography_text)
    lock_path.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"reference_count": output["reference_count"], "manuscript_sha256": output["manuscript_sha256"], "fresh_primary_fulltext_review_count": 0}, sort_keys=True))

if __name__ == "__main__":
    main()
