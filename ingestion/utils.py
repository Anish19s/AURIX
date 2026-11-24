import hashlib
from pathlib import Path


def calculate_file_hash(file_path: str) -> str:
    """
    Calculate the SHA-256 hash of a file.
    Reads the file in chunks to avoid loading it entirely into memory.
    """

    sha256 = hashlib.sha256()

    with Path(file_path).open("rb") as file:
        for chunk in iter(lambda: file.read(8192), b""):
            sha256.update(chunk)

    return sha256.hexdigest()
