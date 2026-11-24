
from ingestion.cleaners.text_cleaner import clean_text


def test_multiple_spaces():
    assert clean_text("Microsoft     Corporation") == "Microsoft Corporation"


def test_multiple_newlines():
    assert clean_text("Microsoft\n\n\nNVIDIA") == "Microsoft\n\nNVIDIA"


def test_escaped_newlines():
    assert clean_text(r"Microsoft\nNVIDIA") == "Microsoft\nNVIDIA"


def test_tabs():
    assert clean_text("Microsoft\tNVIDIA") == "Microsoft NVIDIA"


def test_non_breaking_space():
    assert clean_text("Microsoft\u00a0NVIDIA") == "Microsoft NVIDIA"


def test_financial_data_preserved():
    text = "Revenue: $45.6 billion in 2025."
    assert clean_text(text) == text


def test_empty_input():
    assert clean_text("") == ""


print("All cleaner tests passed!")

if __name__ == "__main__":
    test_multiple_spaces()
    test_multiple_newlines()
    test_escaped_newlines()
    test_tabs()
    test_non_breaking_space()
    test_financial_data_preserved()
    test_empty_input()

    print("All cleaner tests passed!")