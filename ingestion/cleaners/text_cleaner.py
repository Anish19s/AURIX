
import re


def clean_text(text: str) -> str:
    """
    Clean extracted document text while preserving paragraph boundaries.
    """

    if not isinstance(text, str):
        raise TypeError("Input must be a string")

    # Normalise Windows and old Mac line endings
    text = text.replace("\r\n", "\n").replace("\r", "\n")

    # Convert escaped newline and tab sequences from extracted text
    text = text.replace(r"\r\n", "\n").replace(r"\n", "\n").replace(r"\r", "\n")
    text = text.replace(r"\t", " ")

    # Remove unwanted control characters, preserving tabs and newlines
    text = re.sub(r"[^\S\n]+", " ", text)

    # Remove spaces at the beginning and end of each line
    lines = [line.strip() for line in text.split("\n")]

    # Collapse excessive blank lines, preserving paragraph separation
    text = "\n".join(lines)
    text = re.sub(r"\n{3,}", "\n\n", text)

    return text.strip()
