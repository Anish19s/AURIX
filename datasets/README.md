# AURIX seed dataset — v0.1

## What's included
- companies.csv: 50 starter technology-company records.
- Empty CSV templates for people, products, locations and relationship types.

## Important data-quality note
The 50-company selection is based on the company list shown in the 2024 global Top 50 technology-company graphic reproduced in the DGAP report:
https://dgap.org/system/files/article_pdfs/EuropeanWay_DE_0406.pdf

The `industry` field is a broad working classification added for AURIX's initial ontology; it is not a formal industry taxonomy and should be reviewed/normalized later.
The source URL supports the company selection, not every detailed company attribute.
No executive, product, investment, partnership, competitor or headquarters facts have been fabricated. Their templates are intentionally empty until we add source-verified records.

## Import plan
1. Import companies.csv as nodes with label Company.
2. Map `company_id` as the node identifier / unique key.
3. Map `name` and `industry` as properties.
4. Do not import the empty templates yet.
5. Add source-verified location/person/product records and relationships in subsequent batches.

## CSV encoding
UTF-8, comma-delimited, header row included.
