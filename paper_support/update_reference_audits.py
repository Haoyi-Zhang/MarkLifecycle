#!/usr/bin/env python3
"""Regenerate current byte bindings for the frozen 79-reference audit."""
from __future__ import annotations
import argparse, csv, hashlib, json, re
from datetime import date
from pathlib import Path
ART = Path(__file__).resolve().parents[1]
CHECKS = ART / "paper_support"
from refresh_reference_lock import support_sentence

DATE = "2026-09-24"

def sha_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()

def main() -> None:
    ap=argparse.ArgumentParser()
    ap.add_argument('--paper',type=Path,required=True)
    a=ap.parse_args(); paper=a.paper.resolve()
    main_path=paper/'main.tex'; bib_path=paper/'references.tex'; lock_path=CHECKS/'reference_verification_lock.json'
    source=main_path.read_text(encoding='utf-8'); bib=bib_path.read_text(encoding='utf-8')
    lock=json.loads(lock_path.read_text(encoding='utf-8'))
    records=lock['records']
    csv_path=paper/'reference_audit.csv'
    with csv_path.open(newline='',encoding='utf-8') as f:
        rows=list(csv.DictReader(f))
    if [r['citation_key'] for r in rows] != [r['key'] for r in records]:
        raise ValueError('inherited reference review inventory changed')
    for old, record in zip(rows,records):
        for field in ('title','authors','year','scholarly_identifier','source_locator'):
            if str(old[field]) != str(record[field]):
                raise ValueError('inherited review metadata differs from lock')
    # Preserve the original CSV, review dates, verdicts and review counts exactly.
    audit=json.loads((CHECKS/'reference_audit.json').read_text(encoding='utf-8'))
    audit.update({
        'binding_scope':'current local byte/position checks; 2026-09-24 source reviews remain inherited',
        'binding_refresh_date':date.today().isoformat(),
        'fresh_primary_fulltext_review_count':0,
        'bibliography_sha256':sha_bytes(bib_path.read_bytes()),
        'manuscript_sha256':sha_bytes(main_path.read_bytes()),
        'reference_lock_sha256':sha_bytes(lock_path.read_bytes()),
        'audit_csv_sha256':sha_bytes(csv_path.read_bytes()),
    })
    (CHECKS/'reference_audit.json').write_text(json.dumps(audit,indent=2,sort_keys=True)+'\n',encoding='utf-8')
    seen={k:set() for k in ('key','title','identifier','locator')}; check_rows=[]; errors=[]
    for idx,r in enumerate(records,1):
        checks={}
        values={'key':r['key'],'title':r['title'].casefold(),'identifier':r['scholarly_identifier'],'locator':r['source_locator']}
        for field,val in values.items(): checks[f'unique_{field}']=val not in seen[field]; seen[field].add(val)
        entry=r['entry']; title_norm=re.sub(r'[^a-z0-9]','',r['title'].casefold()); entry_norm=re.sub(r'[^a-z0-9]','',entry.casefold())
        checks.update({
            'title_present_in_entry':title_norm in entry_norm,
            'year_present_in_entry':str(r['year']) in entry,
            'authors_nonempty':bool(str(r['authors']).strip()),
            'identifier_locator_consistent':(
                str(r['scholarly_identifier']).startswith('DBLP:') and r['source_locator']=='https://dblp.org/rec/'+str(r['scholarly_identifier'])[5:]
            ) or (
                str(r['scholarly_identifier']).startswith('DOI:') and r['source_locator']=='https://doi.org/'+str(r['scholarly_identifier'])[4:]
            ) or (
                str(r['scholarly_identifier']).startswith('10.') and r['source_locator']=='https://doi.org/'+str(r['scholarly_identifier'])
            ),
            'support_contains_exact_citation':f"\\cite{{{r['key']}}}" in r['support_sentence'],
            'support_hash_matches':sha_bytes(r['support_sentence'].encode())==r['support_sentence_sha256'],
            'entry_hash_matches':sha_bytes(entry.encode())==r['entry_sha256'],
            'location_shape_valid':bool(re.fullmatch(r'paper/main\.tex:\d+',r['manuscript_location'])),
            'current_support_sentence_matches':support_sentence(source,r['key'])[0]==r['support_sentence'],
            'current_location_matches':r['manuscript_location']==f"paper/main.tex:{support_sentence(source,r['key'])[1]}",
        })
        failed=[k for k,v in checks.items() if not v]
        if failed: errors.append({'key':r['key'],'failed':failed})
        check_rows.append({'ordinal':idx,'key':r['key'],'checks':checks,'verdict':'PASS' if not failed else 'FAIL'})
    cross={
        'schema':'tse01.reference-crosscheck','checked_date':DATE,'reference_count':len(records),
        'unique_keys':len(seen['key']),'unique_titles':len(seen['title']),'unique_identifiers':len(seen['identifier']),
        'unique_locators':len(seen['locator']),'rows':check_rows,'errors':errors,
        'lock_sha256':sha_bytes(lock_path.read_bytes()),'bibliography_sha256':sha_bytes(bib_path.read_bytes()),
        'manuscript_sha256':sha_bytes(main_path.read_bytes()),'verdict':'PASS' if not errors else 'FAIL'
    }
    cross['verification_kind']='local-record-crosscheck-not-primary-source-review'
    cross['binding_refresh_date']=date.today().isoformat()
    cross['fresh_primary_fulltext_review_count']=0
    (CHECKS/'reference_crosscheck.json').write_text(json.dumps(cross,indent=2,sort_keys=True)+'\n',encoding='utf-8')
    print(json.dumps({'reference_count':len(records),'audit_sha256':sha_bytes((CHECKS/'reference_audit.json').read_bytes()),'crosscheck_verdict':cross['verdict']},sort_keys=True))
    if errors: raise SystemExit(1)
if __name__=='__main__': main()
