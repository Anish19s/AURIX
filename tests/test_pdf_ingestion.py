
from ingestion.pipelines.pdf_ingestion import ingest_pdf


def test_pdf_ingestion():

    result = ingest_pdf("datasets/raw/test_document.pdf")

    # Check document metadata
    assert result["file_name"] == "test_document.pdf"
    assert result["number_of_pages"] == 2

    # Check page structure
    assert len(result["pages"]) == 2

    # Check page numbers
    assert result["pages"][0]["page_number"] == 1
    assert result["pages"][1]["page_number"] == 2

    # Check original and cleaned text
    assert "Microsoft partnered with NVIDIA" in result["pages"][0]["cleaned_text"]
    assert result["pages"][0]["raw_text"] is not None

    assert "NVIDIA develops AI infrastructure" in result["pages"][1]["cleaned_text"]

    print("PDF ingestion pipeline test passed!")


if __name__ == "__main__":
    test_pdf_ingestion()
