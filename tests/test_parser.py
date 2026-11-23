import unittest
from pathlib import Path

from ingestion.parsers.pdf_parser import parse_pdf


PROJECT_ROOT = Path(__file__).resolve().parents[1]
SAMPLE_PDF = PROJECT_ROOT / "datasets" / "raw" / "test_document.pdf"
INVALID_PDF = PROJECT_ROOT / "datasets" / "raw" / "invalid.pdf"


class ParsePdfTests(unittest.TestCase):
    def test_parses_sample_pdf(self):
        result = parse_pdf(str(SAMPLE_PDF))

        self.assertEqual(result["file_name"], "test_document.pdf")
        self.assertGreater(result["number_of_pages"], 0)
        self.assertEqual(len(result["pages"]), result["number_of_pages"])
        self.assertTrue(all("page_number" in page and "text" in page for page in result["pages"]))

    def test_rejects_invalid_pdf(self):
        with self.assertRaisesRegex(ValueError, "Invalid or corrupted PDF"):
            parse_pdf(str(INVALID_PDF))


if __name__ == "__main__":
    unittest.main()
