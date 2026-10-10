#!/usr/bin/env python3
"""Generate the deterministic public ledgers and release bindings for TSE-01.

The script consumes completed gate-model, finite-domain, and commit-derived executions.  It
does not generate experimental verdicts or promote reference metadata.  The
manually verified reference lock is checked by paper/verify_reference_lock.py.
"""
from __future__ import annotations

import csv
import hashlib
import json
import os
import re
import shutil
import subprocess
import tempfile
from pathlib import Path
from typing import Any

ROOT = Path(os.environ.get("TSE01_ROOT", Path(__file__).resolve().parents[2])).resolve()
ART = ROOT / "artifact"
PAPER = ROOT / "paper"
FINITE = ART / "results"
PROJECT = ART / "commit-replay" / "results"
GATE = ART / "gate-model" / "results"
UPSTREAM = ART / "upstream-validation" / "results"
FIXED_TIME = "2026-09-24T00:00:00-07:00"


def sha_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def canonical_hash(value: Any) -> str:
    return sha_bytes(json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode("ascii"))


def read_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def write_csv(path: Path, fields: list[str], rows: list[dict[str, Any]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows([{field: row.get(field, "") for field in fields} for row in rows])


def command_output(command: list[str]) -> str:
    return subprocess.run(command, check=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT).stdout


def pdf_pages(path: Path) -> int:
    output = command_output(["pdfinfo", str(path)])
    match = re.search(r"^Pages:\s+(\d+)$", output, re.MULTILINE)
    if not match:
        raise RuntimeError("pdfinfo did not report a page count")
    return int(match.group(1))


def parse_entries(text: str) -> dict[str, str]:
    matches = list(re.finditer(r"\\bibitem\{([^}]+)\}\s*", text))
    out: dict[str, str] = {}
    for i, match in enumerate(matches):
        end = matches[i + 1].start() if i + 1 < len(matches) else text.find("\\end{thebibliography}", match.end())
        out[match.group(1)] = re.sub(r"\s+", " ", text[match.end():end]).strip()
    return out


def build_paper_audits() -> None:
    main_tex = (PAPER / "main.tex").read_text(encoding="utf-8")
    references_tex = (PAPER / "references.tex").read_text(encoding="utf-8")
    pdf = PAPER / "main.pdf"
    manuscript_hash = sha_file(PAPER / "main.tex")
    pdf_hash = sha_file(pdf)
    cite_groups = re.findall(r"\\cite\{([^}]+)\}", main_tex)
    cited = [group.strip() for group in cite_groups]
    entries = parse_entries(references_tex)
    reference_lock = read_json(PAPER / "reference_verification_lock.json")
    target_lock = read_json(PAPER / "reference_target_lock.json")
    citation_errors: list[str] = []
    if any("," in group or ";" in group for group in cited): citation_errors.append("multi-key citation command")
    if re.search(r"\\cite\{[^}]+\}\s*\\cite\{", main_tex): citation_errors.append("adjacent citation pile")
    sentence_chunks = re.split(r"(?<=[.!?])\s+(?=[A-Z\\])", main_tex)
    multi_citation_sentences = [
        re.sub(r"\s+", " ", chunk).strip()
        for chunk in sentence_chunks
        if len(re.findall(r"\\cite\{[^}]+\}", chunk)) > 1
    ]
    if multi_citation_sentences: citation_errors.append("multiple citations in one support sentence")
    if len(cited) != len(set(cited)): citation_errors.append("citation key reused")
    if set(cited) != set(entries): citation_errors.append("citation and bibliography sets differ")
    if cited != list(entries): citation_errors.append("bibliography not ordered by first citation appearance")
    if set(cited) != {row["key"] for row in reference_lock["records"]}: citation_errors.append("citation and lock sets differ")
    if [row["key"] for row in reference_lock["records"]] != list(entries): citation_errors.append("reference lock order differs from bibliography")
    citation_audit = {
        "schema": "tse01.citation-shape-audit.v2",
        "manuscript_sha256": manuscript_hash,
        "bibliography_sha256": sha_file(PAPER / "references.tex"),
        "citation_command_count": len(cited),
        "unique_citation_key_count": len(set(cited)),
        "bibliography_entry_count": len(entries),
        "single_key_commands": all("," not in group and ";" not in group for group in cited),
        "each_reference_used_exactly_once": len(cited) == len(set(cited)) == len(entries),
        "bibliography_order_matches_first_appearance": cited == list(entries),
        "adjacent_piles": 0 if not re.search(r"\\cite\{[^}]+\}\s*\\cite\{", main_tex) else 1,
        "multi_citation_sentences": len(multi_citation_sentences),
        "numeric_ranges": 0,
        "frozen_reference_floor": target_lock["frozen_reference_floor"],
        "reference_floor_satisfied": len(entries) >= target_lock["frozen_reference_floor"],
        "errors": citation_errors,
        "verdict": "PASS" if not citation_errors else "FAIL",
    }
    write_json(PAPER / "citation_shape_audit.json", citation_audit)

    # Bind the manuscript's scientific vocabulary and executed parent-set scope
    # to the current evidence.  This catches stale prose left behind after an
    # experimental expansion, such as describing an executed two-parent corpus
    # as singleton-only or collapsing the seven-relation basis in the conclusion.
    finite_summary = read_json(FINITE / "summary.json")
    finite_recheck = read_json(FINITE / "independent_recheck.json")
    project_summary = read_json(PROJECT / "summary.json")
    project_recheck = read_json(PROJECT / "independent_recheck.json")
    gate_summary = read_json(GATE / "summary.json")
    relation_names = [
        "behavior", "recovery", "continuity", "source conformance",
        "executable reproduction", "integrity", "lineage",
    ]
    relation_macros = [r"\Beh(r)", r"\Rec(r)", r"\Cont(r)", r"\Src(r)", r"\Exe(r)", r"\Intg(r)", r"\Line(r)"]
    consistency_errors: list[str] = []
    stale_phrases = [
        "The executable study instantiates singleton parent sets",
        "The executed chains have at most one parent",
    ]
    stale_found = [phrase for phrase in stale_phrases if phrase in main_tex]
    if stale_found:
        consistency_errors.extend(f"stale parent-scope prose: {phrase}" for phrase in stale_found)

    barrier_pos = main_tex.find(r"\FloatBarrier")
    conclusion_pos = main_tex.find(r"\section{Conclusion}")
    floats_flushed_before_conclusion = barrier_pos >= 0 and conclusion_pos > barrier_pos
    if not floats_flushed_before_conclusion:
        consistency_errors.append("manuscript floats are not flushed before the conclusion")

    accept_match = re.search(
        r"\\Accept\(r\)=.*?\\label\{eq:accept\}", main_tex, flags=re.DOTALL
    )
    accept_text = accept_match.group(0) if accept_match else ""
    if not accept_match:
        consistency_errors.append("acceptance equation missing")
    elif any(accept_text.count(macro) != 1 for macro in relation_macros):
        consistency_errors.append("acceptance equation does not enumerate each of the seven relation macros exactly once")

    abstract_match = re.search(r"\\begin\{abstract\}(.*?)\\end\{abstract\}", main_tex, flags=re.DOTALL)
    abstract_text = re.sub(r"\\[A-Za-z]+|[{}$]", " ", abstract_match.group(1) if abstract_match else "")
    abstract_text = re.sub(r"\s+", " ", abstract_text).casefold()
    abstract_missing = [term for term in relation_names if term not in abstract_text]
    if not abstract_match:
        consistency_errors.append("abstract missing")
    elif abstract_missing:
        consistency_errors.append(f"abstract omits relation terms: {abstract_missing}")

    conclusion_match = re.search(
        r"\\section\{Conclusion\}\s*(.*?)(?:\n\n|\\input\{references\.tex\})",
        main_tex, flags=re.DOTALL,
    )
    conclusion_text = re.sub(r"\\[A-Za-z]+|[{}$]", " ", conclusion_match.group(1) if conclusion_match else "")
    conclusion_text = re.sub(r"\s+", " ", conclusion_text).casefold()
    conclusion_missing = [term for term in relation_names if term not in conclusion_text]
    if not conclusion_match:
        consistency_errors.append("conclusion opening paragraph missing")
    elif conclusion_missing:
        consistency_errors.append(f"conclusion omits relation terms: {conclusion_missing}")

    expected_parent_statements = [
        "The finite stratum exercises one- and two-parent sets",
        "the commit-derived stratum uses one",
        "The finite stratum executes twelve two-parent diamond merges",
        "the commit-derived histories remain single-parent",
    ]
    manuscript_casefold = main_tex.casefold()
    parent_statement_presence = {text: text.casefold() in manuscript_casefold for text in expected_parent_statements}

    expected_section_sequence = [
        "Introduction",
        "From Watermark Detection to Release Assurance",
        "Lifecycle-Assurance Model",
        "Implementation and Study Design",
        "Results",
        "Engineering Implications and Validity",
        "Conclusion",
    ]
    section_sequence = re.findall(r"^\\section\{([^}]+)\}", main_tex, flags=re.MULTILINE)
    if section_sequence != expected_section_sequence:
        consistency_errors.append(f"top-level narrative sequence differs: {section_sequence}")
    abstract_source = abstract_match.group(1) if abstract_match else ""
    abstract_plain = re.sub(r"\\[A-Za-z]+(?:\[[^]]*\])?", " ", abstract_source)
    abstract_plain = re.sub(r"[{}$~\-]+", " ", abstract_plain)
    abstract_words = re.findall(r"[A-Za-z0-9]+(?:['’][A-Za-z0-9]+)?", abstract_plain)
    abstract_word_count = len(abstract_words)
    if not 100 <= abstract_word_count <= 200:
        consistency_errors.append(f"abstract word count outside 100--200: {abstract_word_count}")
    mechanical_phrases = [
        "in this paper, we", "it is worth noting", "it should be noted",
        "in today's rapidly", "delve into", "comprehensive overview",
        "this section presents", "the remainder of this paper",
        "there are several", "furthermore,", "moreover,", "in conclusion,",
        "leveraging", "seamlessly", "robust and scalable", "holistic",
        "paradigm", "transformative",
    ]
    mechanical_phrase_hits = [phrase for phrase in mechanical_phrases if phrase in manuscript_casefold]
    if mechanical_phrase_hits:
        consistency_errors.append(f"mechanical or promotional prose markers found: {mechanical_phrase_hits}")
    if finite_summary.get("multi_parent_release_count", 0) > 0 and not all(parent_statement_presence.values()):
        consistency_errors.append("manuscript does not state the executed finite and project parent-set scopes consistently")

    # Prevent two recurrent narrative regressions: presenting the familiar
    # three-valued conjunction as the novelty, and reporting only abstract
    # relation-subset baselines without interpretable engineering examples.
    novelty_calibration_phrases = [
        "three-valued conjunction is not presented as a new logic",
        "not an embedding scheme or new logic",
    ]
    novelty_calibration_present = any(phrase in manuscript_casefold for phrase in novelty_calibration_phrases)
    if not novelty_calibration_present:
        consistency_errors.append("manuscript does not calibrate the novelty of the three-valued conjunction")
    named_baseline_phrases = [
        "behavior plus recovery falsely accepts five controls",
        "recovery plus integrity and lineage",
        "behavior plus executable reproduction and integrity",
    ]
    named_engineering_baselines_present = {
        phrase: phrase in manuscript_casefold for phrase in named_baseline_phrases
    }
    if not all(named_engineering_baselines_present.values()):
        consistency_errors.append("manuscript omits one or more named engineering baselines")

    combined_counts = {
        "release_count": finite_recheck["certificate_count"] + project_recheck["certificates_rechecked"],
        "compiler_cells": finite_recheck["compiler_cells_rechecked"] + project_recheck["compiler_cells_recompiled"],
        "executed_contract_cases": finite_recheck["input_evaluations_reexecuted"] + project_recheck["declared_case_evaluations_reexecuted"],
        "pass_count": finite_recheck["pass_count"] + project_recheck["pass_count"],
        "hold_count": finite_recheck["hold_count"] + project_recheck["hold_count"],
        "reject_count": finite_recheck["reject_count"] + project_recheck["reject_count"],
        "semantic_tamper_tests": finite_recheck["semantic_tamper_test_count"] + project_recheck["semantic_tamper_test_count"],
    }
    numeric_presence = {key: f"{value:,}" in main_tex for key, value in combined_counts.items() if value != 0}
    if not all(numeric_presence.values()):
        consistency_errors.append(f"current combined evidence counts missing from manuscript: {[k for k,v in numeric_presence.items() if not v]}")
    if gate_summary.get("relations") != [
        "behavior", "recovery", "continuity", "source_conformance",
        "executable_reproduction", "integrity", "lineage",
    ]:
        consistency_errors.append("gate-model relation order differs from manuscript relation basis")

    manuscript_consistency = {
        "schema": "tse01.manuscript-consistency-audit.v1",
        "manuscript_sha256": manuscript_hash,
        "relation_count": len(relation_names),
        "relation_terms": relation_names,
        "acceptance_equation_relation_macros": relation_macros,
        "abstract_relation_terms_present": [term for term in relation_names if term in abstract_text],
        "conclusion_relation_terms_present": [term for term in relation_names if term in conclusion_text],
        "finite_multi_parent_release_count": finite_summary.get("multi_parent_release_count"),
        "finite_parent_edge_count": finite_summary.get("parent_edge_count"),
        "project_parent_mode": "singleton",
        "parent_scope_statements": parent_statement_presence,
        "top_level_section_sequence": section_sequence,
        "expected_top_level_section_sequence": expected_section_sequence,
        "abstract_word_count": abstract_word_count,
        "abstract_within_official_100_200_word_range": 100 <= abstract_word_count <= 200,
        "mechanical_phrase_hits": mechanical_phrase_hits,
        "floats_flushed_before_conclusion": floats_flushed_before_conclusion,
        "novelty_calibration_present": novelty_calibration_present,
        "named_engineering_baselines_present": named_engineering_baselines_present,
        "combined_counts": combined_counts,
        "combined_count_strings_present": numeric_presence,
        "stale_parent_scope_phrases_found": stale_found,
        "errors": consistency_errors,
        "verdict": "PASS" if not consistency_errors else "FAIL",
    }
    write_json(PAPER / "manuscript_consistency_audit.json", manuscript_consistency)

    with tempfile.TemporaryDirectory(prefix="tse01-lexical-") as temp_dir:
        text_path = Path(temp_dir) / "main.txt"
        subprocess.run(["pdftotext", "-layout", str(pdf), str(text_path)], check=True)
        rendered = text_path.read_text(encoding="utf-8", errors="replace")
    lexical_findings: list[dict[str, Any]] = []
    checks = {
        "visible_underscore": r"_",
        "source_filename": r"\b[A-Za-z0-9.-]+\.(?:c|h|py|json|csv|sh|tex|bib)\b",
        "function_like_underscored_identifier": r"\b[A-Za-z][A-Za-z0-9]*_[A-Za-z0-9_]+\s*\(",
    }
    for label, pattern in checks.items():
        found = sorted(set(re.findall(pattern, rendered, flags=re.IGNORECASE)))
        if found:
            lexical_findings.append({"check": label, "matches": found[:20]})
    rendered_normalized = rendered.replace("’", "'").replace("‘", "'")
    public_subject_names = ["jsmn", "cJSON", "rxi logging library", "Parson", "zlib", "inih", "uthash"]
    public_subject_names_present = {
        name: name.casefold() in rendered_normalized.casefold() for name in public_subject_names
    }
    lexical_audit = {
        "schema": "tse01.lexical-audit.v5",
        "pdf_sha256": pdf_hash,
        "public_subject_names_present": public_subject_names_present,
        "all_public_subject_names_present": all(public_subject_names_present.values()),
        "findings": lexical_findings,
        "verdict": "PASS" if (
            not lexical_findings
            and all(public_subject_names_present.values())
        ) else "FAIL",
    }
    write_json(PAPER / "lexical_audit.json", lexical_audit)

    compile_log = PAPER / "compile.log"
    log_text = compile_log.read_text(encoding="utf-8", errors="replace") if compile_log.is_file() else ""
    overfull = len(re.findall(r"Overfull \\[hv]box", log_text))
    underfull = len(re.findall(r"Underfull \\[hv]box", log_text))
    unresolved = len(re.findall(r"(?:undefined references|Citation .* undefined|Reference .* undefined|Undefined control sequence)", log_text, flags=re.IGNORECASE))
    font_output = command_output(["pdffonts", str(pdf)])
    font_rows = [line for line in font_output.splitlines()[2:] if line.strip()]
    embedded = sum(1 for line in font_rows if re.search(r"\byes\s+yes\s+yes\b", line.lower()))
    # pdffonts columns vary; use the embedded column when the compact pattern is unavailable.
    if embedded == 0 and font_rows:
        embedded = sum(1 for line in font_rows if len(line.split()) >= 7 and line.split()[5].lower() == "yes")
    compile_audit = {
        "schema": "tse01.compile-audit.v2",
        "pdf_sha256": pdf_hash,
        "pdf_bytes": pdf.stat().st_size,
        "pages": pdf_pages(pdf),
        "overfull_boxes": overfull,
        "underfull_boxes": underfull,
        "unresolved_references_or_controls": unresolved,
        "font_instances": len(font_rows),
        "embedded_font_instances": embedded,
        "all_fonts_embedded": bool(font_rows) and embedded == len(font_rows),
        "verdict": "PASS" if pdf_pages(pdf) == 14 and overfull == 0 and unresolved == 0 and bool(font_rows) and embedded == len(font_rows) else "FAIL",
    }
    write_json(PAPER / "compile_audit.json", compile_audit)

    # Initial-submission template audit.  This intentionally distinguishes the
    # author manuscript from IEEE production output: the journal template is
    # required for review, while received dates, running heads, publication IDs,
    # biographies/photos, and final issue metadata are production-stage material.
    class_line_match = re.search(r"\\documentclass\[([^]]+)\]\{IEEEtran\}", main_tex)
    class_options = [item.strip() for item in class_line_match.group(1).split(",")] if class_line_match else []
    class_text = (PAPER / "IEEEtran.cls").read_text(encoding="utf-8", errors="replace")
    class_version_match = re.search(r"\\ProvidesClass\{IEEEtran\}\[([^]]+)\]", class_text)
    pdfinfo_text = command_output(["pdfinfo", str(pdf)])
    page_size_match = re.search(r"^Page size:\s+([0-9.]+) x ([0-9.]+) pts", pdfinfo_text, re.MULTILINE)
    page_size_points = [float(page_size_match.group(1)), float(page_size_match.group(2))] if page_size_match else []
    abstract_match = re.search(r"\\begin\{abstract\}(.*?)\\end\{abstract\}", main_tex, re.DOTALL)
    abstract_source = abstract_match.group(1) if abstract_match else ""
    abstract_plain = re.sub(r"\\[A-Za-z@]+(?:\[[^]]*\])?", " ", abstract_source)
    abstract_plain = re.sub(r"[{}$]", " ", abstract_plain)
    abstract_words = re.findall(r"[A-Za-z0-9]+(?:[-'][A-Za-z0-9]+)*", abstract_plain)
    keyword_match = re.search(r"\\begin\{IEEEkeywords\}(.*?)\\end\{IEEEkeywords\}", main_tex, re.DOTALL)
    keywords = [item.strip() for item in (keyword_match.group(1).split(",") if keyword_match else []) if item.strip()]
    production_commands = {
        "running_head": r"\markboth" in main_tex,
        "publication_id": r"\IEEEpubid" in main_tex or r"\IEEEpubidadjcol" in main_tex,
        "publisher_issue_metadata": r"\IEEEpublicationid" in main_tex,
        "author_biographies": bool(re.search(r"\\begin\{IEEEbiography|\\begin\{biography", main_tex)),
        "inline_appendix": r"\appendix" in main_tex,
    }
    expected_class_hash = "c972aca108fda004c3514d63658e02816da2e54d9a1451e870b9bd970e003f55"
    expected_bst_hash = "fca86cd4f041a5c5326295fa04dcce56eaf2c8a4bf3219549401235502f24c25"
    template_errors = []
    if class_options != ["letterpaper", "journal"]:
        template_errors.append("document class is not the supplied IEEEtran letterpaper journal mode")
    if sha_file(PAPER / "IEEEtran.cls") != expected_class_hash:
        template_errors.append("IEEEtran class differs from the supplied template")
    if sha_file(PAPER / "IEEEtranS.bst") != expected_bst_hash:
        template_errors.append("IEEE bibliography style differs from the supplied template")
    if page_size_points != [612.0, 792.0]:
        template_errors.append("PDF page size is not US Letter")
    if any(production_commands.values()):
        template_errors.append("production-only or appendix surface is present")
    if not (100 <= len(abstract_words) <= 200):
        template_errors.append("abstract is outside the Computer Society regular-paper range")
    if re.search(r"\\cite\{|\$|\\begin\{equation", abstract_source):
        template_errors.append("abstract contains a citation or mathematical expression")
    if not (3 <= len(keywords) <= 5):
        template_errors.append("keyword count is outside the IEEE Author Center recommendation")
    if "This work received no external funding." not in main_tex:
        template_errors.append("funding status is not in the first footnote")
    submission_template_audit = {
        "schema": "tse01.submission-template-audit.v1",
        "venue": "IEEE Transactions on Software Engineering",
        "article_type": "Regular research article",
        "manuscript_stage": "initial peer-review submission",
        "manuscript_sha256": manuscript_hash,
        "pdf_sha256": pdf_hash,
        "documentclass": "IEEEtran",
        "documentclass_options": class_options,
        "class_version": class_version_match.group(1) if class_version_match else None,
        "supplied_class_sha256": expected_class_hash,
        "current_class_sha256": sha_file(PAPER / "IEEEtran.cls"),
        "supplied_bibliography_style_sha256": expected_bst_hash,
        "current_bibliography_style_sha256": sha_file(PAPER / "IEEEtranS.bst"),
        "template_files_unmodified": sha_file(PAPER / "IEEEtran.cls") == expected_class_hash and sha_file(PAPER / "IEEEtranS.bst") == expected_bst_hash,
        "page_size_points": page_size_points,
        "us_letter": page_size_points == [612.0, 792.0],
        "journal_double_column_mode": class_options == ["letterpaper", "journal"],
        "funding_status_in_first_footnote": "This work received no external funding." in main_tex,
        "abstract_word_count": len(abstract_words),
        "abstract_within_100_200_words": 100 <= len(abstract_words) <= 200,
        "abstract_has_citations_or_math": bool(re.search(r"\\cite\{|\$|\\begin\{equation", abstract_source)),
        "keyword_count": len(keywords),
        "keywords": keywords,
        "production_only_elements_present": production_commands,
        "received_revised_accepted_dates_authored": False,
        "author_biographies_present": production_commands["author_biographies"],
        "biographies_required_for_initial_submission": False,
        "template_is_author_submission_format_not_ieee_final_layout": True,
        "ieee_production_staff_formats_published_version": True,
        "official_mopc_threshold_pages": 12,
        "official_initial_submission_hard_cap_verified": False,
        "official_page_rule_note": "The accessible IEEE Computer Society guidance defines twelve pages as the Transactions MOPC threshold and states that submission limits may differ; no accessible official TSE page established a twelve-page initial-submission hard cap.",
        "project_internal_total_page_contract": 14,
        "submission_policy_status": "SUBMISSION_POLICY_HOLD",
        "open_submission_metadata": [
            "recheck the live TSE portal page route before upload",
        ],
        "official_sources": [
            "https://www.computer.org/publications/author-resources",
            "https://journals.ieeeauthorcenter.ieee.org/create-your-ieee-journal-article/create-the-text-of-your-article/structure-your-article/",
            "https://www.computer.org/digital-library/journals/ts/cfp-ieee-transactions-on-software-engineering",
        ],
        "errors": template_errors,
        "verdict": "PASS" if not template_errors else "FAIL",
    }
    write_json(PAPER / "submission_template_audit.json", submission_template_audit)

    font_names = [line.split()[0] for line in font_rows]
    base_font_names = [name.split("+", 1)[-1] for name in font_names]
    legacy_cm_math_fonts = sorted({
        name for name in base_font_names
        if re.match(r"^(?:CMR|CMMI|CMSS|CMSY|CMEX)", name, flags=re.IGNORECASE)
    })
    times_math_fonts = sorted({
        name for name in base_font_names
        if re.search(r"(?:NewTX|TeXGyreTermesX|txmia|txsys|txsym|txexs)", name, flags=re.IGNORECASE)
    })
    version_match = re.search(r"`newtxmath' v([0-9.]+)", log_text)
    expected_predicate_definitions = {
        "behavior": r"\newcommand{\Beh}{\mathrm{B}}",
        "recovery": r"\newcommand{\Rec}{\mathrm{R}}",
        "continuity": r"\newcommand{\Cont}{\mathrm{T}}",
        "source": r"\newcommand{\Src}{\mathrm{S}}",
        "executable": r"\newcommand{\Exe}{\mathrm{X}}",
        "integrity": r"\newcommand{\Intg}{\mathrm{I}}",
        "lineage": r"\newcommand{\Line}{\mathrm{L}}",
        "release_gate": r"\newcommand{\Accept}{\mathcal{A}}",
    }
    predicate_definitions_present = {
        key: definition in main_tex for key, definition in expected_predicate_definitions.items()
    }
    sans_serif_math_occurrences = len(re.findall(r"\\mathsf\b", main_tex))
    word_form_gate_occurrences = len(re.findall(
        r"\\(?:mathsf|mathrm|operatorname)\{Accept\}", main_tex
    ))
    typography_errors = []
    if r"\usepackage{newtxmath}" not in main_tex:
        typography_errors.append("newtxmath package declaration missing")
    if version_match is None:
        typography_errors.append("newtxmath version not found in compile log")
    if not times_math_fonts:
        typography_errors.append("Times-compatible mathematics fonts absent from PDF")
    if legacy_cm_math_fonts:
        typography_errors.append("legacy Computer Modern mathematics fonts remain embedded")
    if sans_serif_math_occurrences:
        typography_errors.append("sans-serif mathematics command remains in manuscript source")
    if word_form_gate_occurrences:
        typography_errors.append("word-form Accept operator remains in mathematics")
    if not all(predicate_definitions_present.values()):
        typography_errors.append("serif predicate notation is incomplete")
    typography_audit = {
        "schema": "tse01.typography-audit.v1",
        "pdf_sha256": pdf_hash,
        "manuscript_sha256": manuscript_hash,
        "text_family": "Times-compatible IEEEtran serif",
        "math_package": "newtxmath",
        "math_package_version": version_match.group(1) if version_match else None,
        "times_compatible_math_fonts": times_math_fonts,
        "legacy_computer_modern_math_fonts": legacy_cm_math_fonts,
        "sans_serif_math_occurrences": sans_serif_math_occurrences,
        "word_form_accept_operator_occurrences": word_form_gate_occurrences,
        "predicate_definitions_present": predicate_definitions_present,
        "release_gate_notation": r"\mathcal{A}",
        "all_fonts_embedded": bool(font_rows) and embedded == len(font_rows),
        "errors": typography_errors,
        "verdict": "PASS" if not typography_errors and bool(font_rows) and embedded == len(font_rows) else "FAIL",
    }
    write_json(PAPER / "typography_audit.json", typography_audit)

    with tempfile.TemporaryDirectory(prefix="tse01-page-fit-") as temporary:
        prefix = Path(temporary) / "page14"
        subprocess.run(["pdftoppm", "-f", "14", "-l", "14", "-singlefile", "-r", "200", "-png", str(pdf), str(prefix)], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        from PIL import Image
        image = Image.open(prefix.with_suffix(".png")).convert("L")
        width, height = image.size
        pixels = image.load()
        x_ranges = [(int(width * 0.07), int(width * 0.49)), (int(width * 0.51), int(width * 0.93))]
        last_ink = []
        for left, right in x_ranges:
            bottom = 0
            for y in range(int(height * 0.08), int(height * 0.96)):
                if any(pixels[x, y] < 245 for x in range(left, right)):
                    bottom = y
            last_ink.append(bottom)
    visual_record = PAPER / "visual_inspection.json"
    visual = read_json(visual_record) if visual_record.is_file() else {}
    visual_current = visual.get("pdf_sha256") == pdf_hash and visual.get("verdict") == "PASS"
    page_fit = {
        "schema": "tse01.page-fit-audit.v2",
        "LIMIT_KIND": "TOTAL_PAGES",
        "project_contract_total_pages": 14,
        "counted_matter": ["abstract", "normal sections", "references", "all article matter present"],
        "inline_scientific_appendix": False,
        "separate_supplement_used": False,
        "template_class_sha256": sha_file(PAPER / "IEEEtran.cls"),
        "pdf_sha256": pdf_hash,
        "total_pages": pdf_pages(pdf),
        "page14_image_pixels": [width, height],
        "page14_column_last_ink_y": last_ink,
        "page14_column_baseline_difference_pixels": abs(last_ink[0] - last_ink[1]),
        "ordinary_line_tolerance_pixels": 25,
        "manual_visual_inspection_current": visual_current,
        "visual_inspection_record": "paper/visual_inspection.json" if visual_record.is_file() else None,
        "overflow": overfull,
        "verdict": "PASS" if pdf_pages(pdf) == 14 and overfull == 0 and abs(last_ink[0] - last_ink[1]) <= 25 and visual_current else "PENDING_VISUAL_RECHECK",
    }
    write_json(PAPER / "page_fit_audit.json", page_fit)


def make_citation_support() -> None:
    lock = read_json(PAPER / "reference_verification_lock.json")
    rows = []
    for record in lock["records"]:
        rows.append({
            "citation_key": record["key"],
            "claim_id": "RW-" + record["key"].upper(),
            "manuscript_location": record["manuscript_location"],
            "verified_scholarly_identifier": record["scholarly_identifier"],
            "source_locator": record["source_locator"],
            "support_paraphrase": record["support_sentence"],
            "evidence_sha256": record["support_sentence_sha256"],
            "verification_status": record["verification_status"],
        })
    fields = ["citation_key", "claim_id", "manuscript_location", "verified_scholarly_identifier", "source_locator", "support_paraphrase", "evidence_sha256", "verification_status"]
    write_csv(ART / "citation_support.csv", fields, rows)



def make_combined_summary() -> None:
    gate = read_json(GATE / "independent_recheck.json")
    gate_summary = read_json(GATE / "summary.json")
    finite = read_json(FINITE / "independent_recheck.json")
    project = read_json(PROJECT / "independent_recheck.json")
    upstream = read_json(UPSTREAM / "summary.json")
    upstream_recheck = read_json(UPSTREAM / "independent_recheck.json")
    payload = {
        "schema": "tse01.combined-summary.v4",
        "gate_model_layer": {
            "three_valued_vectors": gate["three_valued_vectors_rechecked"],
            "boolean_completions": gate["boolean_completions_recounted"],
            "relation_subset_gates": gate["relation_subset_gates_rechecked"],
            "nonempty_failure_sets": gate["nonempty_failure_sets_rechecked"],
            "aggregate_mutation_tests": gate["aggregate_mutation_test_count"],
            "ancestry_graph_fixtures": gate["ancestry_graph_fixtures_rechecked"],
            "diamond_merge_shared_ancestor_accepts": gate["diamond_merge_shared_ancestor_rechecked"],
            "invalid_ancestry_fixtures_rejected": sum(row["independent_decision"] == "reject" for row in gate["ancestry_graph_results"]),
            "decision_counts": gate_summary["decision_counts"],
            "independent_recheck": gate["all_valid"],
        },
        "finite_layer": {
            "release_count": finite["certificate_count"],
            "compiler_cells": finite["compiler_cells_recompiled"],
            "executed_contract_cases": finite["input_evaluations_reexecuted"],
            "pass_count": finite["pass_count"],
            "hold_count": finite["hold_count"],
            "reject_count": finite["reject_count"],
            "decision_fixtures_pass": finite["decision_fixtures_pass"],
            "semantic_tamper_tests": finite["semantic_tamper_test_count"],
            "independent_recheck": finite["all_valid"] and finite["semantic_tamper_tests_pass"],
        },
        "commit_derived_layer": {
            "release_count": project["certificates_rechecked"],
            "compiler_cells": project["compiler_cells_recompiled"],
            "executed_contract_cases": project["declared_case_evaluations_reexecuted"],
            "pass_count": project["pass_count"],
            "hold_count": project["hold_count"],
            "reject_count": project["reject_count"],
            "decision_fixtures_pass": project["decision_fixtures_pass"],
            "semantic_tamper_tests": project["semantic_tamper_test_count"],
            "independent_recheck": project["all_valid"] and project["semantic_tamper_tests_pass"],
        },
        "upstream_source_validation": {
            "repository": upstream["repository"],
            "exact_source_blob_count": upstream["exact_source_blob_count"],
            "compiler_cells": upstream["compiler_cell_count"],
            "case_evaluations": upstream["case_evaluation_count"],
            "adapter_compiler_cells_compared": upstream["adapter_before_after_compiler_cells"],
            "adapter_cases_per_cell": upstream["adapter_case_count_per_cell"],
            "adapter_outputs_equal": upstream["adapter_before_after_outputs_equal"],
            "default_and_parent_link_configs_equal": upstream["default_and_parent_link_configs_equal"],
            "strict_changed_case_ids": upstream["strict_changed_case_ids"],
            "independent_recheck": upstream_recheck["verdict"] == "PASS",
            "scope": upstream["scope"],
        },
    }
    payload["combined"] = {
        "release_count": payload["finite_layer"]["release_count"] + payload["commit_derived_layer"]["release_count"],
        "compiler_cells": payload["finite_layer"]["compiler_cells"] + payload["commit_derived_layer"]["compiler_cells"],
        "executed_contract_cases": payload["finite_layer"]["executed_contract_cases"] + payload["commit_derived_layer"]["executed_contract_cases"],
        "pass_count": payload["finite_layer"]["pass_count"] + payload["commit_derived_layer"]["pass_count"],
        "hold_count": payload["finite_layer"]["hold_count"] + payload["commit_derived_layer"]["hold_count"],
        "reject_count": payload["finite_layer"]["reject_count"] + payload["commit_derived_layer"]["reject_count"],
        "semantic_tamper_tests": payload["finite_layer"]["semantic_tamper_tests"] + payload["commit_derived_layer"]["semantic_tamper_tests"],
    }
    payload["total_execution_burden"] = {
        "compiler_cells": payload["combined"]["compiler_cells"] + payload["upstream_source_validation"]["compiler_cells"],
        "case_evaluations": payload["combined"]["executed_contract_cases"] + payload["upstream_source_validation"]["case_evaluations"],
        "release_certificates": payload["combined"]["release_count"],
        "note": "Upstream source observations are separate transfer-validity evidence and are not release certificates.",
    }
    payload["verdict"] = "PASS" if all((
        payload["gate_model_layer"]["independent_recheck"],
        payload["finite_layer"]["independent_recheck"],
        payload["commit_derived_layer"]["independent_recheck"],
        payload["upstream_source_validation"]["independent_recheck"],
        payload["finite_layer"]["decision_fixtures_pass"],
        payload["commit_derived_layer"]["decision_fixtures_pass"],
    )) else "FAIL"
    write_json(FINITE / "combined_summary.json", payload)

def make_results_manifest() -> None:
    fields = ["result_id", "result_type", "subject", "version", "compiler", "optimization", "command", "environment", "input_hashes", "raw_output", "raw_output_sha256", "derived_output", "derived_output_sha256", "independent_recheck", "status", "notes"]
    rows: list[dict[str, Any]] = []
    finite_summary = read_json(FINITE / "summary.json")
    finite_matrix = list(csv.DictReader((FINITE / "matrix.csv").open(newline="", encoding="utf-8")))
    for row in finite_matrix:
        cert = read_json(ART / "certificates" / row["kernel"] / f"{row['variant']}.json")
        cell = next(item for item in cert["behavior"]["toolchains"] if item["compiler"] == row["compiler"] and item["optimization"] == row["optimization"])
        output = ROOT / cell["output_path"]
        assembly = ROOT / cell["assembly_path"]
        rows.append({
            "result_id": f"FINITE-{row['kernel']}-{row['variant']}-{row['compiler']}-{row['optimization'][1:]}",
            "result_type": "FINITE_EXHAUSTIVE_COMPILER_CELL",
            "subject": row["kernel"], "version": row["variant"], "compiler": row["compiler"], "optimization": row["optimization"],
            "command": " ".join(cell["compile_command"]),
            "environment": cell["compiler_version"],
            "input_hashes": f"source={cert['source']['sha256']};reference={cert['behavior']['reference_sha256']};manifest={cert['manifest']['file_sha256']}",
            "raw_output": output.relative_to(ROOT).as_posix(), "raw_output_sha256": sha_file(output),
            "derived_output": assembly.relative_to(ROOT).as_posix(), "derived_output_sha256": sha_file(assembly),
            "independent_recheck": "artifact/results/independent_recheck.json", "status": cell["status"],
            "notes": "65,536 ordered byte-pair cases; retained output and assembly bound to certificate.",
        })
    project_matrix = read_json(PROJECT / "matrix.json")
    for row in project_matrix:
        output = ROOT / row["output"]
        assembly = ROOT / row["assembly"]
        rows.append({
            "result_id": f"PROJECT-{row['project']}-{row['version']}-{row['compiler']}-{row['optimization'][1:]}",
            "result_type": "COMMIT_DERIVED_COMPILER_CELL",
            "subject": row["project"], "version": row["version"], "compiler": row["compiler"], "optimization": row["optimization"],
            "command": f"{row['compiler']} -std=gnu11 {row['optimization']} {row['source']}",
            "environment": json.dumps(read_json(ART / "commit-replay" / "environment.json"), sort_keys=True),
            "input_hashes": f"source={row['source_sha256']};reference={row['reference_sha256']}",
            "raw_output": output.relative_to(ROOT).as_posix(), "raw_output_sha256": sha_file(output),
            "derived_output": assembly.relative_to(ROOT).as_posix(), "derived_output_sha256": sha_file(assembly),
            "independent_recheck": "artifact/commit-replay/results/independent_recheck.json", "status": "EXECUTED",
            "notes": f"{row['case_count']} deterministic contract cases; byte-level executable reproduction={row['binary_reproduction_match']}.",
        })
    upstream_matrix = read_json(UPSTREAM / "matrix.json")
    upstream_manifest = read_json(ART / "upstream-validation" / "source_manifest.json")
    source_hashes = ";".join(f"{row['path']}={row['sha256']}" for row in upstream_manifest["source_files"])
    for row in upstream_matrix:
        stdout = ROOT / row["stdout"]
        executable = ROOT / row["executable"]
        rows.append({
            "result_id": f"UPSTREAM-jsmn-{row['version']}-{row['compiler']}-{row['optimization'][1:]}-{row['configuration']}",
            "result_type": "UPSTREAM_VALIDATION_COMPILER_CELL",
            "subject": "jsmn", "version": row["version"], "compiler": row["compiler"],
            "optimization": row["optimization"],
            "command": " ".join(row["compile_command"]),
            "environment": json.dumps(read_json(ART / "commit-replay" / "environment.json"), sort_keys=True),
            "input_hashes": source_hashes,
            "raw_output": stdout.relative_to(ROOT).as_posix(), "raw_output_sha256": sha_file(stdout),
            "derived_output": executable.relative_to(ROOT).as_posix(), "derived_output_sha256": sha_file(executable),
            "independent_recheck": "artifact/upstream-validation/results/independent_recheck.json",
            "status": "EXECUTED",
            "notes": f"24 exact-source parser observations in {row['configuration']} mode; source blobs bound to the named public commit and parent.",
        })
    aggregates = [
        ("FINITE-SUMMARY", FINITE / "summary.json", "FINITE_AGGREGATE", "artifact/results/independent_recheck.json"),
        ("FINITE-RECHECK", FINITE / "independent_recheck.json", "FINITE_INDEPENDENT_RECHECK", "artifact/results/independent_recheck.json"),
        ("PROJECT-SUMMARY", PROJECT / "summary.json", "PROJECT_AGGREGATE", "artifact/commit-replay/results/independent_recheck.json"),
        ("PROJECT-RECHECK", PROJECT / "independent_recheck.json", "PROJECT_INDEPENDENT_RECHECK", "artifact/commit-replay/results/independent_recheck.json"),
        ("GATE-SUMMARY", GATE / "summary.json", "GATE_MODEL_AGGREGATE", "artifact/gate-model/results/independent_recheck.json"),
        ("GATE-RECHECK", GATE / "independent_recheck.json", "GATE_MODEL_INDEPENDENT_RECHECK", "artifact/gate-model/results/independent_recheck.json"),
        ("GATE-ANCESTRY-GRAPHS", GATE / "ancestry_graphs.json", "GATE_MODEL_GRAPH_FIXTURES", "artifact/gate-model/results/independent_recheck.json"),
        ("COMBINED-SUMMARY", FINITE / "combined_summary.json", "COMBINED_AGGREGATE", "artifact/gate-model/results/independent_recheck.json; artifact/results/independent_recheck.json; artifact/commit-replay/results/independent_recheck.json"),
        ("UPSTREAM-SUMMARY", UPSTREAM / "summary.json", "UPSTREAM_VALIDATION_AGGREGATE", "artifact/upstream-validation/results/independent_recheck.json"),
        ("UPSTREAM-RECHECK", UPSTREAM / "independent_recheck.json", "UPSTREAM_VALIDATION_INDEPENDENT_RECHECK", "artifact/upstream-validation/results/independent_recheck.json"),
        ("UPSTREAM-SOURCE-MANIFEST", ART / "upstream-validation" / "source_manifest.json", "UPSTREAM_SOURCE_BINDING", "artifact/upstream-validation/results/independent_recheck.json"),
        ("REFERENCE-LOCK", PAPER / "reference_verification_lock.json", "REFERENCE_EVIDENCE", "paper/reference_lock_audit.json"),
        ("REFERENCE-AUDIT-TABLE", PAPER / "reference_audit.csv", "REFERENCE_METADATA_AND_SUPPORT", "paper/reference_lock_audit.json"),
        ("REFERENCE-AUDIT", PAPER / "reference_audit.json", "REFERENCE_METADATA_AND_SUPPORT_AUDIT", "paper/reference_lock_audit.json"),
        ("REFERENCE-CROSSCHECK", PAPER / "reference_crosscheck.json", "REFERENCE_INTERNAL_CONSISTENCY", "paper/reference_lock_audit.json"),
        ("REFERENCE-TARGET", PAPER / "reference_target_lock.json", "REFERENCE_CALIBRATION", "paper/reference_lock_audit.json"),
        ("PAPER-PDF", PAPER / "main.pdf", "FORMATTED_MANUSCRIPT", "paper/compile_audit.json"),
        ("PAPER-CITATION-AUDIT", PAPER / "citation_shape_audit.json", "MANUSCRIPT_AUDIT", "paper/reference_lock_audit.json"),
        ("PAPER-CONSISTENCY-AUDIT", PAPER / "manuscript_consistency_audit.json", "MANUSCRIPT_AUDIT", "paper/manuscript_consistency_audit.json"),
        ("PAPER-LEXICAL-AUDIT", PAPER / "lexical_audit.json", "MANUSCRIPT_AUDIT", "paper/lexical_audit.json"),
        ("PAPER-PAGE-FIT", PAPER / "page_fit_audit.json", "MANUSCRIPT_AUDIT", "paper/visual_inspection.json"),
        ("RETAINED-OUTPUT-CLOSURE", FINITE / "retained_output_closure.json", "DELIVERY_EVIDENCE_CLOSURE", "artifact/results/retained_output_closure.json"),
        ("ENTRYPOINT-PATH-SMOKE", FINITE / "entrypoint_path_smoke.json", "CLEAN_ROOT_ENTRYPOINT_SMOKE", "artifact/results/entrypoint_path_smoke.json"),
        ("FINITE-HAMMING-EDGE-CASES", FINITE / "hamming_edge_cases.json", "HAMMING_EDGE_CASE_ENUMERATION", "artifact/results/independent_recheck.json"),
        ("FINITE-RELATION-BOUNDARIES", FINITE / "relation_decision_boundaries.json", "RELATION_FIRST_AND_AVAILABILITY_BOUNDARIES", "artifact/results/independent_recheck.json"),
        ("FINITE-STATIC-POLICY-PROJECTION", ART / "policies/bridge/fnv_step-threshold-25-bridge.json", "STATIC_DUAL_POLICY_PROJECTION", "artifact/results/independent_recheck.json"),
        ("PROJECT-RELATION-BOUNDARIES", PROJECT / "relation_decision_boundaries.json", "RELATION_FIRST_AND_AVAILABILITY_BOUNDARIES", "artifact/commit-replay/results/independent_recheck.json"),
        ("PROJECT-SOURCE-PARSER-SECURITY", PROJECT / "source_parser_security.json", "LEXICAL_SOURCE_PARSER_SECURITY", "artifact/commit-replay/results/independent_recheck.json"),
    ]
    for result_id, path, result_type, recheck in aggregates:
        rows.append({
            "result_id": result_id, "result_type": result_type, "subject": "", "version": "", "compiler": "", "optimization": "",
            "command": "./artifact/run_all.sh", "environment": json.dumps(finite_summary["environment"], sort_keys=True),
            "input_hashes": "", "raw_output": path.relative_to(ROOT).as_posix(), "raw_output_sha256": sha_file(path),
            "derived_output": path.relative_to(ROOT).as_posix(), "derived_output_sha256": sha_file(path),
            "independent_recheck": recheck, "status": "VERIFIED", "notes": "Frozen aggregate or audit surface.",
        })
    write_csv(ART / "results_manifest.csv", fields, rows)


def make_claim_ledgers() -> None:
    fields = ["claim_id", "claim_text", "claim_scope", "paper_location", "evidence_type", "theorem_or_lemma", "proof_or_checker", "source_or_test", "experiment_id", "figure_or_table", "raw_result", "maturity_state", "independent_recheck_status", "limitations"]
    rows = [
        {"claim_id": "C1", "claim_text": "The completion semantics partitions all 2,187 evidence vectors and the full seven-relation gate is the unique zero-false-accept relation subset under isolating witnesses.", "claim_scope": "complete seven-relation three-valued state space", "paper_location": "Section 3", "evidence_type": "human proof plus exhaustive model checking", "theorem_or_lemma": "unique completion-stable lift; minimal relation basis", "proof_or_checker": "artifact/gate-model/src/independent_recheck.py", "source_or_test": "artifact/gate-model/results/summary.json", "experiment_id": "GATE-MODEL", "figure_or_table": "tab:reconstruction", "raw_result": "artifact/gate-model/results/summary.json", "maturity_state": "INDEPENDENTLY_RECHECKED", "independent_recheck_status": "2,187 ternary vectors; 16,384 Boolean completions; 128 subset gates; 127 nonempty failure sets", "limitations": "model-space completeness does not establish completeness of real-world evidence relations"},
        {"claim_id": "C2", "claim_text": "All intended finite releases, including twelve two-parent merges, pass and all finite controls are rejected over the complete byte-pair domain.", "claim_scope": "twelve finite C contracts and twelve independently reconstructed merge releases", "paper_location": "Sections 4 and 5", "evidence_type": "exhaustive implementation evaluation", "theorem_or_lemma": "conditional finite-contract soundness and accepted-parent admissibility", "proof_or_checker": "artifact/src/independent_recheck.py", "source_or_test": "artifact/results/matrix.csv; artifact/results/summary.json", "experiment_id": "FINITE-144", "figure_or_table": "tab:outcomes; tab:controlmatrix", "raw_result": "artifact/results/summary.json", "maturity_state": "INDEPENDENTLY_RECHECKED", "independent_recheck_status": "144 certificates; 576 fresh cells; 37,748,736 cases; 12 two-parent releases and 144 parent edges", "limitations": "finite contracts and conspicuous source carriers"},
        {"claim_id": "C3", "claim_text": "Twenty-one intended commit-derived versions pass and seven one-relation adverse versions are rejected.", "claim_scope": "seven routine-level adapters from immutable public commits", "paper_location": "Sections 4 and 5", "evidence_type": "deterministic multi-project replay", "theorem_or_lemma": "minimal relation basis", "proof_or_checker": "artifact/commit-replay/src/independent_recheck.py", "source_or_test": "artifact/commit-replay/results/matrix.json", "experiment_id": "PROJECT-28", "figure_or_table": "tab:subjects; tab:projects; tab:outcomes", "raw_result": "artifact/commit-replay/results/summary.json", "maturity_state": "INDEPENDENTLY_RECHECKED", "independent_recheck_status": "28 certificates; 112 fresh cells; 3,215,120 declared cases", "limitations": "routine-level adapters, not complete repository builds"},
        {"claim_id": "C4", "claim_text": "Every proper relation subset accepts at least one matching isolated adverse release, while the complete gate accepts none.", "claim_scope": "all 128 relation subsets over seven isolated controls", "paper_location": "Section 5", "evidence_type": "complete subset sweep and ablation", "theorem_or_lemma": "minimal relation basis", "proof_or_checker": "artifact/commit-replay/src/independent_recheck.py", "source_or_test": "artifact/commit-replay/results/summary.json", "experiment_id": "PROJECT-SUBSETS", "figure_or_table": "fig:sensitivity; tab:controlmatrix; tab:baselines", "raw_result": "artifact/commit-replay/results/summary.json", "maturity_state": "INDEPENDENTLY_RECHECKED", "independent_recheck_status": "128 of 128 gates enumerated; only the full set has zero false accepts", "limitations": "controls are designed isolating witnesses, not prevalence estimates"},
        {"claim_id": "C5", "claim_text": "Thresholds 1 through 26 preserve all intended project releases while rejecting complete reissue; seven leave-one-project-out checks preserve all remaining outcomes.", "claim_scope": "frozen seven-project corpus", "paper_location": "Section 5", "evidence_type": "complete threshold scan and subject removal", "theorem_or_lemma": "ancestry lower bound", "proof_or_checker": "artifact/commit-replay/src/run_commit_replay.py", "source_or_test": "artifact/commit-replay/results/summary.json", "experiment_id": "PROJECT-SENSITIVITY", "figure_or_table": "fig:sensitivity", "raw_result": "artifact/commit-replay/results/summary.json", "maturity_state": "VERIFIED", "independent_recheck_status": "policies retained without post-hoc reselection", "limitations": "sensitivity analysis, not statistical generalization"},
        {"claim_id": "C6", "claim_text": "Twenty-four adversarial substitutions are rejected by lower-level reconstruction.", "claim_scope": "twenty-one certificate or file substitutions with refreshed bindings plus three direct source-interpretation fixtures; fourteen finite and ten project probes", "paper_location": "Section 5", "evidence_type": "adversarial mutation tests", "theorem_or_lemma": "conditional soundness and accepted-parent admissibility", "proof_or_checker": "three independent checkers", "source_or_test": "artifact/gate-model/results/independent_recheck.json; artifact/results/independent_recheck.json; artifact/commit-replay/results/independent_recheck.json", "experiment_id": "TAMPER-24", "figure_or_table": "tab:tamper", "raw_result": "three independent recheck reports", "maturity_state": "INDEPENDENTLY_RECHECKED", "independent_recheck_status": "24 of 24 rejected; 21 refresh certificate or file bindings; omitted second merge parent rejected", "limitations": "not an adaptive cryptographic attack game"},
        {"claim_id": "C7", "claim_text": "The two software strata cover 172 releases, 688 compiler cells, and 40,963,856 deterministic contract executions.", "claim_scope": "frozen finite and commit-derived corpora", "paper_location": "Abstract and Section 5", "evidence_type": "combined accounting", "theorem_or_lemma": "", "proof_or_checker": "artifact/src/verify_release.py", "source_or_test": "artifact/results/combined_summary.json", "experiment_id": "COMBINED", "figure_or_table": "tab:layers; tab:outcomes", "raw_result": "artifact/results/combined_summary.json", "maturity_state": "INDEPENDENTLY_RECHECKED", "independent_recheck_status": "129 intended pass; 43 established-failure reject; 0 unresolved hold", "limitations": "deterministic case counts are not population estimates"},
        {"claim_id": "C8", "claim_text": "The manuscript contains exactly 14 formatted pages and 79 individually supported scholarly references.", "claim_scope": "current frozen manuscript bytes", "paper_location": "entire manuscript", "evidence_type": "format, citation, lexical, and visual audits", "theorem_or_lemma": "", "proof_or_checker": "paper audits", "source_or_test": "paper/main.pdf; paper/reference_verification_lock.json", "experiment_id": "PAPER-QA", "figure_or_table": "", "raw_result": "paper/compile_audit.json; paper/typography_audit.json; paper/citation_shape_audit.json; paper/page_fit_audit.json", "maturity_state": "VERIFIED", "independent_recheck_status": "automated audits plus byte-bound visual inspection", "limitations": "format checks do not replace the journal's live submission requirements"},
        {"claim_id": "C9", "claim_text": "Finite-parent reconstruction accepts shared-ancestor graphs and twelve executed two-parent merges while rejecting invalid ancestry and omitted-parent claims.", "claim_scope": "six ancestry-graph fixtures and twelve finite-contract merge releases", "paper_location": "Sections 3--5", "evidence_type": "two-algorithm graph model check plus exhaustive software replay", "theorem_or_lemma": "finite ancestry-subgraph validity and accepted-parent admissibility", "proof_or_checker": "artifact/gate-model/src/independent_recheck.py; artifact/src/independent_recheck.py", "source_or_test": "artifact/gate-model/results/ancestry_graphs.json; artifact/results/summary.json; artifact/results/independent_recheck.json", "experiment_id": "FINITE-PARENT-DAG", "figure_or_table": "fig:ancestry; tab:outcomes; tab:controlmatrix", "raw_result": "artifact/gate-model/results/ancestry_graphs.json; artifact/results/summary.json", "maturity_state": "INDEPENDENTLY_RECHECKED", "independent_recheck_status": "two graph algorithms agree; 12 two-parent merge certificates reconstruct 144 total parent edges; second-parent omission rejected", "limitations": "commit-derived histories remain single-parent; finite contracts are not whole-repository merges"},
        {"claim_id": "C10", "claim_text": "An exact-source jsmn replay agrees with the adapter on its declared sixteen-input contract but exposes two strict-mode boundary differences outside that contract.", "claim_scope": "one public jsmn maintenance commit and its direct parent; exact core source; four parser configurations", "paper_location": "Sections 4--6", "evidence_type": "exact-source transfer-validity check", "theorem_or_lemma": "adapter transfer condition", "proof_or_checker": "artifact/upstream-validation/src/independent_recheck.py", "source_or_test": "artifact/upstream-validation/results/summary.json", "experiment_id": "UPSTREAM-JSMN", "figure_or_table": "tab:layers; tab:projects; Section 5.4", "raw_result": "artifact/upstream-validation/results/summary.json", "maturity_state": "INDEPENDENTLY_RECHECKED", "independent_recheck_status": "3 exact Git blobs; 32 compiler cells; 768 observations; strict cases 22 and 23 differ", "limitations": "one exact core library history, not seven whole repositories; differences lie outside the adapter's declared contract"},
    ]
    write_csv(ART / "claim_evidence_ledger.csv", fields, rows)

    correspondence_fields = ["paper_item", "kind", "paper_location", "assumptions", "proof_location", "checker_or_test", "status", "notes"]
    items = [
        ("Evidence vector and completion", "definition", "Section 3.1", "seven typed relations; unknowns admit Boolean completions", "paper/main.tex", "gate-model state enumeration", "INDEPENDENTLY_RECHECKED", "all 2,187 vectors enumerated"),
        ("Unique maximally decisive completion-stable lift", "theorem", "Section 3.1", "soundness over every completion and maximal decisiveness", "artifact/proofs.md#unique-completion-stable-lift", "gate-model independent checker", "INDEPENDENTLY_RECHECKED", "supervaluation of conjunction"),
        ("Complete partition and refinement stability", "proposition", "Section 3.1", "refinement replaces unknown by true or false", "artifact/proofs.md#complete-partition-and-refinement-stability", "gate-model independent checker", "INDEPENDENTLY_RECHECKED", "1 pass, 127 hold, 2,059 reject"),
        ("Unique bounded recovery", "lemma", "Section 3.2", "minimum distance d and 2e+s<d", "artifact/proofs.md#unique-bounded-recovery", "both independent decoders", "INDEPENDENTLY_RECHECKED", "all sixteen codewords enumerated per block"),
        ("Block locality", "lemma", "Section 3.2", "four independent Hamming blocks", "artifact/proofs.md#block-locality", "recovery control", "INDEPENDENTLY_RECHECKED", "global counts do not imply local decodability"),
        ("Ancestry lower bound", "theorem", "Section 3.2", "stable identities; no resurrection", "artifact/proofs.md#ancestry-lower-bound", "continuity reconstruction", "VERIFIED", "lower bound max(0,n-k(n-q))"),
        ("No retroactive strengthening", "proposition", "Section 3.3", "policy digest is certificate-bound", "artifact/proofs.md#no-retroactive-strengthening", "both lineage checkers plus silent-policy substitutions", "INDEPENDENTLY_RECHECKED", "policy change requires bridge or new object"),
        ("Finite ancestry-subgraph validity", "theorem", "Section 3.3", "finite closed parent inventory; active-path cycle and policy checks on every edge", "artifact/proofs.md#finite-ancestry-subgraph-validity", "active-path DFS, reachable-closure topological sorting, and finite software merge reconstruction", "INDEPENDENTLY_RECHECKED", "diamond shared ancestor and 12 two-parent software merges accepted; cycle, missing parent, rejected parent, unbridged mismatch, and omitted merge parent rejected"),
        ("Sound shared-ancestor reuse", "proposition", "Section 3.3", "deterministic reconstruction bound to canonical certificate and policy digests; edge checks remain parent-specific", "artifact/proofs.md#sound-shared-ancestor-reuse", "active-path DFS and reachable-closure topological sorting", "INDEPENDENTLY_RECHECKED", "completed shared ancestor is memoized; repeated active-path digest still rejects as a cycle"),
        ("Accepted-parent admissibility", "proposition", "Section 4.2", "every named parent independently reconstructs to pass under its bound policy", "artifact/proofs.md#accepted-parent-admissibility", "rejected-parent graft substitutions in both software strata", "INDEPENDENTLY_RECHECKED", "digest validity alone is insufficient"),
        ("Conditional finite-contract soundness", "theorem", "Section 3.4", "hash, compiler, runtime, checker, issuance, finite-contract assumptions", "artifact/proofs.md#conditional-finite-contract-soundness", "both independent software checkers", "INDEPENDENTLY_RECHECKED", "bounded, not universal equivalence"),
        ("Minimal relation basis", "theorem", "Section 3.4", "one isolating witness per relation", "artifact/proofs.md#minimal-relation-basis", "gate and project subset sweeps", "INDEPENDENTLY_RECHECKED", "only the full relation set has zero false accepts"),
        ("Contract strengthening", "proposition", "Section 3.4", "release bytes fixed", "artifact/proofs.md#contract-strengthening", "predicate construction", "VERIFIED", "new obligations cannot rescue rejection"),
        ("Module substitution", "proposition", "Section 3.5", "conservative replacement and bound assumptions", "artifact/proofs.md#module-substitution", "static dual-policy projection independently recomputed from reconstructed evidence", "INDEPENDENTLY_RECHECKED", "no retroactive reinterpretation"),
        ("Sound incremental reuse", "proposition", "Section 6.4", "complete dependency closure, module, and policy bindings unchanged", "artifact/proofs.md#sound-incremental-reuse", "dependency-closure rule and full-reconstruction reference semantics", "VERIFIED", "extension rule; no speedup measured"),
    ]
    write_csv(ART / "correctness_correspondence.csv", correspondence_fields, [dict(zip(correspondence_fields, row)) for row in items])

def make_external_resources() -> None:
    fields = ["name", "URL", "version_or_commit", "sha256", "license", "access_date", "resource_type", "acquisition_method", "integration_mode", "claim_supported", "internals_modified"]
    finite_summary = read_json(FINITE / "summary.json")
    rows = [
        {"name": "GCC", "URL": "https://gcc.gnu.org/", "version_or_commit": finite_summary["environment"]["gcc"], "sha256": sha_file(Path(shutil.which("gcc") or "/usr/bin/gcc")), "license": "GPL-3.0-or-later", "access_date": "2026-07-20", "resource_type": "compiler", "acquisition_method": "preinstalled system binary", "integration_mode": "subprocess compiler cell", "claim_supported": "cross-compiler finite and project execution", "internals_modified": "false"},
        {"name": "Clang", "URL": "https://clang.llvm.org/", "version_or_commit": finite_summary["environment"]["clang"], "sha256": sha_file(Path(shutil.which("clang") or "/usr/bin/clang")), "license": "Apache-2.0 WITH LLVM-exception", "access_date": "2026-07-20", "resource_type": "compiler", "acquisition_method": "preinstalled system binary", "integration_mode": "subprocess compiler cell", "claim_supported": "cross-compiler finite and project execution", "internals_modified": "false"},
        {"name": "Python", "URL": "https://www.python.org/", "version_or_commit": finite_summary["environment"]["python"], "sha256": sha_file(Path(os.path.realpath(shutil.which("python3") or "/usr/bin/python3"))), "license": "PSF-2.0", "access_date": "2026-07-20", "resource_type": "runtime", "acquisition_method": "preinstalled system binary", "integration_mode": "deterministic artifact runner", "claim_supported": "generation and independent checking", "internals_modified": "false"},
    ]
    projects = read_json(ART / "commit-replay" / "resources" / "projects.json")
    history_by_commit: dict[str, Path] = {}
    for evidence_path in sorted((ART / "history-evidence").glob("*.json")):
        evidence = read_json(evidence_path)
        commit = evidence.get("commit")
        if isinstance(commit, str):
            history_by_commit[commit] = evidence_path
    for project in projects["projects"]:
        resource_path = history_by_commit.get(project["commit"])
        if resource_path is None:
            raise RuntimeError(f"missing immutable history evidence for {project['commit']}")
        rows.append({"name": f"Project {project['alias']} immutable maintenance commit", "URL": f"https://github.com/{project['repository']}/commit/{project['commit']}", "version_or_commit": project["commit"], "sha256": sha_file(resource_path), "license": project["license"], "access_date": "2026-07-20", "resource_type": "public source history", "acquisition_method": "read-only public repository records and immutable commit files", "integration_mode": "routine-level deterministic adapter", "claim_supported": project["adapter_contract"], "internals_modified": "false; upstream code not modified; adapter boundary declared"})
    upstream_manifest = read_json(ART / "upstream-validation" / "source_manifest.json")
    rows.append({
        "name": "jsmn exact core source pair",
        "URL": f"https://github.com/zserge/jsmn/commit/{upstream_manifest['commit']}",
        "version_or_commit": upstream_manifest["commit"],
        "sha256": sha_file(ART / "upstream-validation" / "source_manifest.json"),
        "license": upstream_manifest["license"],
        "access_date": "2026-09-24",
        "resource_type": "exact public source snapshot",
        "acquisition_method": "immutable Git blobs verified by Git object hash",
        "integration_mode": "32-cell before/after parser probe across four configurations",
        "claim_supported": "adapter-to-upstream transfer check and strict-mode boundary counterexample",
        "internals_modified": "false; exact core source bytes retained; external probe supplied separately",
    })
    write_csv(ART / "external_resources.csv", fields, rows)


def make_proofs() -> None:
    text = r"""# Proof record for TSE-01

The manuscript contains the theorem statements and human-readable proofs. This
record expands the assumptions and connects each result to executable evidence.
No result is claimed as mechanically proved.

## Unique completion-stable lift

For a partial evidence vector, sound acceptance requires every Boolean
completion to satisfy the seven-way conjunction, which happens only when every
coordinate is true. Sound rejection requires every completion to violate the
conjunction, which happens exactly when at least one coordinate is false. All
remaining vectors have no false coordinate and at least one unknown, so both an
accepting and a rejecting completion exist; hold is therefore forced. Any more
decisive sound completion-stable rule would have to decide one of these mixed
completion sets and would be unsound.

## Complete partition and refinement stability

The seven-relation state space has 3^7=2,187 vectors. Exactly one is all true.
There are 2^7-1=127 vectors containing only true and unknown coordinates with at
least one unknown; these are holds. The remaining 2,059 contain a false
coordinate and are rejects. Refining unknown coordinates cannot remove an
already false relation or change the all-true vector, and a held vector can
resolve only to pass, hold, or reject according to the same rule.

## Unique bounded recovery

For two codewords at distance at least d, an observation with e wrong known
symbols and s erased symbols cannot place a competitor at least as close as the
transmitted word when 2e+s<d. Both artifact decoders enumerate all sixteen
Hamming codewords independently and require a unique minimizer plus this bound.

## Block locality

Two erasures split across two distance-three blocks satisfy the bound in each
block. One error plus one erasure in one block reaches 2e+s=3 and permits a tie.
The two states can expose the same global number of carriers. Therefore recovery
must retain the block partition.

## Ancestry lower bound

At an accepted edge at most n-q predecessor identities disappear. Under stable
identity and no resurrection, the worst case removes previously surviving
origin identities at every edge. After k edges no more than k(n-q) origin
identities have disappeared, giving max(0,n-k(n-q)).

## No retroactive strengthening

The policy digest is part of canonical certificate bytes and the predecessor
check. Changing policy changes the object. Reusing the old predecessor breaks
the link; replacing history creates new certificates. A bridge exposes rather
than hides the change.

## Finite ancestry-subgraph validity

For every named parent, the checker resolves the exact canonical digest and
requires an accepted parent with a compatible policy or explicit bridge. During
depth-first reconstruction, a digest repeated on the active path is a cycle; a
digest completed on another branch is memoized and may be reused. Thus a diamond
merge with one shared ancestor is accepted, whereas cycles, missing or rejected
parents, and unbridged policy mismatches reject. Reachable-closure topological
sorting independently checks the same six graph fixtures.

## Sound shared-ancestor reuse

Reconstruction of one certificate under one bound policy is deterministic and
bound to canonical certificate and policy digests. Once that result has been
completed, a second incoming edge to the same digest may reuse it without
changing the reconstructed relation vector. The second edge must still verify
its own named digest, policy compatibility, and bridge conditions. A digest
encountered again before completion remains on the active path and therefore
rejects as a cycle.

## Accepted-parent admissibility

A parent digest authenticates only the named certificate bytes. Lineage also
reconstructs the parent decision under its bound policy. If a parent holds, a
required premise for the successor remains unresolved; if it rejects, a named
lineage premise is false. Requiring every parent to pass, match its digest, and
satisfy the edge policy preserves the induction used by the finite ancestry
subgraph theorem. The rejected-parent graft substitutions exercise this rule in
both software strata.

## Conditional finite-contract soundness

Under collision resistance, faithful deterministic tool execution, correct
checker execution, honest issuance, and the declared finite scope, the verifier
rebuilds every compiler cell and compares fresh executable bytes, fresh and
retained outputs, and independently reconstructed references. It also reparses
carriers, enumerates decoder candidates, recomputes parent-relative identity
intersections, rehashes all evidence, and follows every canonical parent digest.
These are the seven conjuncts. The conclusion is complete only for the declared
cases and compiler cells.

## Minimal relation basis

For each relation r, the frozen control corpus contains a vector whose only
false coordinate is r. Any subset gate omitting r accepts that vector. Hence
every proper subset has a false accept, while the full conjunction rejects all
seven isolating controls. Enumeration of all 128 subsets independently checks
this argument.

## Contract strengthening

Adding cases, compiler cells, bindings, or predecessor obligations adds
conjuncts while release bytes remain fixed. Conjunction cannot turn false into
true by adding obligations.

## Module substitution

A conservative replacement supplies the same semantic premise for its one
relation and reports undecided outcomes as unknown. Binding its identity and
assumptions yields a new policy object, so the conditional soundness proof
continues for new certificates without reinterpreting old ones.

## Sound incremental reuse

A relation module is deterministic on its complete declared input tuple. If a
prior result is bound to that tuple and the dependency closure, module identity,
and policy digest are byte-identical, re-evaluation returns the same coordinate.
Every coordinate whose closure changed is reconstructed by the full rule. The
incremental and full vectors therefore agree pointwise and induce the same typed
decision. Reusing a top-level verdict or an incompletely bound dependency set
does not satisfy the premise.
"""
    (ART / "proofs.md").write_text(text, encoding="utf-8")

def update_target_lock() -> None:
    path = PAPER / "reference_target_lock.json"
    target = read_json(path)
    reference_count = len(parse_entries((PAPER / "references.tex").read_text(encoding="utf-8")))
    citation_count = len(re.findall(r"\\cite\{[^}]+\}", (PAPER / "main.tex").read_text(encoding="utf-8")))
    target["current_reference_count"] = reference_count
    target["current_citation_count"] = citation_count
    target["current_manuscript_sha256"] = sha_file(PAPER / "main.tex")
    target["manuscript_reference_count_after_revision"] = reference_count
    write_json(path, target)


def make_local_gap_record() -> None:
    write_json(ART / "local_execution_gaps.json", {
        "schema": "tse01.local-execution-gaps.v1",
        "delegated_tasks": [],
        "completed_here": [
            "complete three-valued gate-model enumeration and independent reconstruction",
            "finite-domain primary and independent execution",
            "seven-project routine-level replay and independent reconstruction",
            "exact-source jsmn replay at one public commit and its direct parent",
            "paper compilation, reference audits, and full-document visual inspection",
        ],
        "objectively_unavailable": [
            {
                "task": "build complete historical repository and dependency snapshots for the six public subjects not covered by the exact-source jsmn replay",
                "attempts": ["read-only public repository inspection", "immutable commit-file retrieval", "bounded changed-region reconstruction"],
                "observed_blocker": "the final artifact does not contain complete historical dependency closures for those six repositories",
                "scientific_resolution": "retain immutable commit-derived routine adapters, add one exact-source transfer check, and state explicitly that the study is not a seven-repository whole-build evaluation",
                "delegation": "none",
            }
        ],
    })


def make_release_manifest() -> None:
    exclusions = {"artifact/release_manifest.json", "artifact/results/release_audit.json"}
    files = []
    for path in sorted(ROOT.rglob("*")):
        if not path.is_file() or path.is_symlink():
            continue
        rel = path.relative_to(ROOT).as_posix()
        if rel in exclusions:
            continue
        files.append({"path": rel, "bytes": path.stat().st_size, "sha256": sha_file(path)})
    write_json(ART / "release_manifest.json", {"schema": "tse01.release-manifest.v2", "generated_at": FIXED_TIME, "files": files})


def main() -> None:
    update_target_lock()
    # The verification script creates a byte-bound audit and fails on any stale
    # manual lock; it is deliberately separate from this generator.
    subprocess.run(["python3", str(PAPER / "verify_reference_lock.py"), "--paper", str(PAPER)], check=True)
    make_citation_support()
    build_paper_audits()
    make_combined_summary()
    make_results_manifest()
    make_claim_ledgers()
    make_external_resources()
    make_proofs()
    make_local_gap_record()
    for transient in ["main.aux", "main.out", "main.fls", "main.fdb_latexmk", "main.synctex.gz"]:
        (PAPER / transient).unlink(missing_ok=True)
    make_release_manifest()
    print(json.dumps({
        "gate_vectors": read_json(GATE / "independent_recheck.json")["three_valued_vectors_rechecked"],
        "finite_certificates": read_json(FINITE / "independent_recheck.json")["certificate_count"],
        "project_certificates": read_json(PROJECT / "independent_recheck.json")["certificates_rechecked"],
        "reference_count": read_json(PAPER / "reference_verification_lock.json")["reference_count"],
        "paper_pages": pdf_pages(PAPER / "main.pdf"),
        "release_manifest_entries": len(read_json(ART / "release_manifest.json")["files"]),
    }, sort_keys=True))

if __name__ == "__main__":
    main()
