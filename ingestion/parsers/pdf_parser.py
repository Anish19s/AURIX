
from pathlib import Path

import pymupdf


def parse_pdf(file_path: str) -> dict:

    realpath = Path(file_path)

    # Check whether the file exists
    if not realpath.exists():
        raise FileNotFoundError(f"PDF not found: {file_path}")

    # Check the file extension
    if realpath.suffix.lower() != ".pdf":
        raise ValueError("File is not a PDF")

    # Open and process the PDF
    try:
        with pymupdf.open(realpath) as doc:

            pages = []

            for page_num, page in enumerate(doc, start=1):
                page_text = page.get_text("text").strip()

                pages.append({
                    "page_number": page_num,
                    "text": page_text
                })

            result = {
                "file_name": realpath.name,
                "metadata": doc.metadata,
                "number_of_pages": len(doc),
                "pages": pages
            }

        return result

    except pymupdf.FileDataError as exc:
        raise ValueError(
            f"Invalid or corrupted PDF: {file_path}"
        ) from exc
