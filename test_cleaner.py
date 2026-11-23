
from ingestion.cleaners.text_cleaner import clean_text

raw_text = """
Microsoft       Corporation


Microsoft
   partnered with NVIDIA in 2025.


Page 14
"""

cleaned_text = clean_text(raw_text)

print("BEFORE:")
print(repr(raw_text))

print("\nAFTER:")
print(repr(cleaned_text))
