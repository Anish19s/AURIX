import unittest

from ingestion.cleaners.text_cleaner import clean_text


class CleanTextTests(unittest.TestCase):
    def test_normalizes_whitespace_and_preserves_paragraphs(self):
        raw_text = "Microsoft       Corporation\n\n\nMicrosoft\n   partnered with NVIDIA in 2025.\n"

        self.assertEqual(
            clean_text(raw_text),
            "Microsoft Corporation\n\nMicrosoft\npartnered with NVIDIA in 2025.",
        )

    def test_converts_escaped_newlines_and_tabs(self):
        self.assertEqual(clean_text(r"First\n\nSecond\tline"), "First\n\nSecond line")

    def test_rejects_non_string_input(self):
        with self.assertRaises(TypeError):
            clean_text(None)


if __name__ == "__main__":
    unittest.main()
