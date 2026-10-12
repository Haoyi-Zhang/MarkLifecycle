"""Current packaging rules; no research execution or source certification."""
from __future__ import annotations

from pathlib import Path, PurePosixPath

INTERNAL_PAGE_BUDGET = 15
PAGE_BUDGET_KIND = "INTERNAL_BASELINE_MAXIMUM_NOT_OFFICIAL_VENUE_LIMIT"


def within_page_budget(pages: int) -> bool:
    return type(pages) is int and 1 <= pages <= INTERNAL_PAGE_BUDGET


def root_entries_valid(entries: set[str], profile: str, skip_manifest: bool = False) -> bool:
    required = {"paper", "artifact"}
    if profile == "review" and not skip_manifest:
        required.add("REVIEW_PACKET_MANIFEST.json")
    # The optional overview and extraction-directory name have no scientific role.
    return entries in (required, required | {"README.md"})


def closed_path(root: Path, rel: str) -> Path:
    path = PurePosixPath(rel)
    if (not rel or "\\" in rel or ":" in rel or path.is_absolute()
            or any(part in {"", ".", ".."} for part in rel.split("/"))):
        raise ValueError("not a canonical relative inventory path")
    target = root / rel
    if not target.resolve().is_relative_to(root.resolve()):
        raise ValueError("inventory path leaves the bundle")
    return target


def inspect_pdf(path: Path) -> dict:
    """Read/render a PDF in-process with PyMuPDF, without launching programs."""
    import fitz
    from PIL import Image

    with fitz.open(path) as document:
        fonts = {row[0]: row for page in document for row in page.get_fonts(full=True)}
        font_rows = []
        embedded = 0
        for xref, row in sorted(fonts.items()):
            name, extension, kind, data = document.extract_font(xref)
            is_embedded = bool(data)
            embedded += is_embedded
            font_rows.append(name)
        last = document[-1].get_pixmap(matrix=fitz.Matrix(200 / 72, 200 / 72), colorspace=fitz.csGRAY, alpha=False)
        image = Image.frombytes("L", (last.width, last.height), last.samples)
        pixels = image.load()
        width, height = image.size
        last_ink = []
        for left, right in [(int(width * .07), int(width * .49)), (int(width * .51), int(width * .93))]:
            bottom = 0
            for y in range(int(height * .08), int(height * .96)):
                if any(pixels[x, y] < 245 for x in range(left, right)):
                    bottom = y
            last_ink.append(bottom)
        return {
            "pages": len(document), "page_size_points": [document[0].rect.width, document[0].rect.height],
            "all_page_sizes_points": [[page.rect.width, page.rect.height] for page in document],
            "font_rows": font_rows, "embedded_fonts": embedded,
            "text": "\n".join(page.get_text(sort=True) for page in document),
            "last_page_image_pixels": [width, height], "last_page_column_last_ink_y": last_ink,
            "reader": "PyMuPDF in-process metadata and 200-dpi rasterization",
        }
