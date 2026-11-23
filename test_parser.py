from ingestion.parsers.pdf_parser import pdf_par
import json

result=pdf_par("datasets/raw/empty.pdf")

print(json.dumps(result,indent=4,default=str))