from ingestion.parsers.pdf_parser import parse_pdf
from ingestion.cleaners.text_cleaner import clean_text
from ingestion.collectors.pdf_collector import download_pdf

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



def ingest_pdf_from_url(url: str) -> dict:
    """
    Download a PDF from a URL and run the complete ingestion pipeline.
    """

    # 1. Collect the PDF
    file_path = download_pdf(url)

    # 2. Parse and clean the downloaded PDF
    document = ingest_pdf(file_path)

    # 3. Return structured document
    return document
