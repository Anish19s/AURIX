
from pathlib import Path
from urllib.parse import urlparse, unquote
import hashlib
import re
import requests


def calculate_file_hash(file_path: Path) -> str:
    """Calculate the SHA-256 hash of a file."""

    sha256 = hashlib.sha256()

    with file_path.open("rb") as file:
        for chunk in iter(lambda: file.read(8192), b""):
            sha256.update(chunk)

    return sha256.hexdigest()


def download_pdf(url: str) -> str:
    """
    Download a PDF into datasets/raw/.
    Reject files larger than 50 MB and detect duplicate content.
    """

    # 1. Validate URL
    parsed_url = urlparse(url)

    if parsed_url.scheme not in ("http", "https") or not parsed_url.netloc:
        raise ValueError("A valid HTTP or HTTPS URL is required")

    # 2. Define storage directory
    raw_dir = Path("datasets/raw")
    raw_dir.mkdir(parents=True, exist_ok=True)

    max_file_size = 50 * 1024 * 1024

    # 3. Generate a safe filename
    filename = unquote(Path(parsed_url.path).name)
    filename = re.sub(r"[^a-zA-Z0-9._-]", "_", filename)

    if not filename.lower().endswith(".pdf"):
        filename = "downloaded_document.pdf"

    # 4. Create a collision-free filename
    original_path = Path(filename)
    stem = original_path.stem
    suffix = original_path.suffix

    file_path = raw_dir / filename
    counter = 1

    while file_path.exists():
        file_path = raw_dir / f"{stem}_{counter}{suffix}"
        counter += 1

    # 5. Create temporary download path
    temp_path = raw_dir / f".{file_path.name}.part"

    try:
        # 6. Download using streaming
        with requests.get(url, timeout=30, stream=True) as response:
            response.raise_for_status()

            content_length = response.headers.get("Content-Length")

            if content_length and int(content_length) > max_file_size:
                raise ValueError("PDF exceeds the 50 MB size limit")

            total_size = 0
            first_chunk = True

            with temp_path.open("wb") as file:
                for chunk in response.iter_content(chunk_size=8192):
                    if not chunk:
                        continue

                    total_size += len(chunk)

                    if total_size > max_file_size:
                        raise ValueError("PDF exceeds the 50 MB size limit")

                    if first_chunk:
                        if not chunk.startswith(b"%PDF-"):
                            raise ValueError("The URL did not return a valid PDF")

                        first_chunk = False

                    file.write(chunk)

        if first_chunk:
            raise ValueError("The downloaded PDF is empty")

        # 7. Calculate hash of downloaded PDF
        new_hash = calculate_file_hash(temp_path)

        # 8. Compare against existing PDFs
        for existing_file in raw_dir.glob("*.pdf"):
            existing_hash = calculate_file_hash(existing_file)

            if existing_hash == new_hash:
                temp_path.unlink()
                return str(existing_file)

        # 9. Save new, unique document
        temp_path.rename(file_path)

        return str(file_path)

    except Exception:
        temp_path.unlink(missing_ok=True)
        raise
