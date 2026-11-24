
import json
from pathlib import Path


REGISTRY_PATH = Path("datasets/processed/document_registry.json")


def load_registry() -> list:
    """
    Load existing document records from the JSON registry.
    """

    if not REGISTRY_PATH.exists():
        return []

    with REGISTRY_PATH.open("r", encoding="utf-8") as file:
        return json.load(file)


def save_registry(documents: list) -> None:
    """
    Save document records to the JSON registry.
    """

    # 1. Ensure the parent directory exists
    REGISTRY_PATH.parent.mkdir(parents=True, exist_ok=True)

    # 2. Write document records as JSON
    with REGISTRY_PATH.open("w", encoding="utf-8") as file:
        json.dump(documents, file, indent=4, ensure_ascii=False)



def register_document(document: dict) -> None:
    """
    Add a new document record to the registry.
    """

    documents = load_registry()

    # Check whether document is already registered
    for existing_document in documents:
        if existing_document["document_id"] == document["document_id"]:
            raise ValueError("Document is already registered")

    # Add new document
    documents.append(document)

    # Persist updated registry
    save_registry(documents)
