# TSE-01 Initial-Submission Template Compliance

## Verdict

`PASS_FOR_INITIAL_IEEE_JOURNAL_TEMPLATE_MODE_WITH_SUBMISSION_POLICY_HOLD`

The manuscript is an author-prepared **initial peer-review submission**, not an accepted-paper production proof. It uses the exact supplied template bytes:

```latex
\documentclass[letterpaper,journal]{IEEEtran}
```

- `IEEEtran.cls`: `c972aca108fda004c3514d63658e02816da2e54d9a1451e870b9bd970e003f55`
- `IEEEtranS.bst`: `fca86cd4f041a5c5326295fa04dcce56eaf2c8a4bf3219549401235502f24c25`

The current files match the supplied files byte for byte.

## Initial-submission elements present

- US Letter page size.
- IEEE journal double-column author template.
- Visible authors for TSE single-anonymous review.
- Corresponding author and no-funding statement in the first unnumbered footnote.
- Two affiliation groups with institution, city, postal code, country, and e-mail addresses.
- A 173-word self-contained abstract without citations or mathematical expressions.
- Five index terms.
- Numbered references in order of first appearance.
- Figures and tables embedded near their callouts.

## Production-stage elements intentionally absent

The source does not author publisher-supplied or accepted-paper production material:

- received, revised, accepted, or online-publication dates;
- running journal headers;
- volume, issue, page-range, DOI, publication-ID, or copyright lines;
- author photographs;
- author biographies;
- proof-stage corrections or final issue metadata.

IEEE staff prepare the published layout after acceptance; the author template does not reproduce the final issue layout.

## Page-policy distinction

Accessible IEEE Computer Society guidance defines twelve formatted pages as the regular-Transactions mandatory-overlength threshold after final editing/layout and explicitly states that submission limits may differ. No accessible official TSE page established a twelve-page initial-submission hard cap. The project therefore retains the user-locked fourteen-page manuscript and records `SUBMISSION_POLICY_HOLD` until the live TSE submission route is checked.

## Remaining author-side checks

- Confirm department or organizational unit for each affiliation if applicable.
- Authenticate all four ORCIDs in the submission account.
- Confirm author contributions, conflicts, institutional approvals, and related-work declarations.
- Prepare truthful generated-content disclosure based on the actual workflow.
- Recheck the live TSE page route and required file designations immediately before upload.

## Official sources

- IEEE Computer Society author resources: https://www.computer.org/publications/author-resources
- IEEE Author Center article structure: https://journals.ieeeauthorcenter.ieee.org/create-your-ieee-journal-article/create-the-text-of-your-article/structure-your-article/
- TSE call for papers: https://www.computer.org/digital-library/journals/ts/cfp-ieee-transactions-on-software-engineering
