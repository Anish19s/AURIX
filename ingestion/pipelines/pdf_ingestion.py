from ingestion.parsers.pdf_parser import parse_pdf
from ingestion.cleaners.text_cleaner import clean_text


def ingest_pdf(file_path: str) -> dict:
    """
    Parse and clean a PDF while preserving original page text.
    """

    # Step 1: Extract PDF content
    document = parse_pdf(file_path)

    # Step 2: Clean each page individually
    processed_pages = []

    for page in document["pages"]:
        cleaned_text = clean_text(page["text"])

        processed_pages.append({
            "page_number": page["page_number"],
            "raw_text": page["text"],
            "cleaned_text": cleaned_text
        })

    # Step 3: Construct the final document
    result = {
        "file_name": document["file_name"],
        "metadata": document["metadata"],
        "number_of_pages": document["number_of_pages"],
        "pages": processed_pages
    }

    return result
