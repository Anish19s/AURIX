from ingestion.parsers.pdf_parser import parse_pdf
from ingestion.cleaners.text_cleaner import clean_text
from ingestion.collectors.pdf_collector import download_pdf
from ingestion.document_registry import register_document,update_registry
from pathlib import Path
from ingestion.utils import calculate_file_hash


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

    # 1. Collect & download the PDF
    file_path = download_pdf(url)

    file_hash=calculate_file_hash(file_path)

    # 2. Register doc as downloaded
    registry_record={
        "document_id":file_hash,
        "file_name":Path(file_path).name,
        "source_url":url,
        "file_hash":file_hash,
        "processing_status":"downloaded"
    }

    register_document(registry_record)
    update_registry(file_hash,"processing")

    try:
        # 3. Parse and clean the downloaded PDF
        document = ingest_pdf(file_path)
        # 4.update 
        update_registry(file_hash,"processed")
        # 5.return doc
        return document
    except Exception:
        update_registry(file_hash,"failed")
        raise

 