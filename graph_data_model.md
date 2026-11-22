# AURIX - Graph Data Model

## 1. Node Labels

- company
- person
- product
- location
- investment
- source
- evidence
- claim

## 2. Relationships

- company -[:DEVELOPS]-> product
- person -[:WORKS_FOR]-> company
- company -[:COMPETES_WITH]-> company
- company -[:PARTNERS_WITH]-> company
- company -[:HEADQUARTERED_IN]-> location
- investor -[:MADE]-> investment
- investment -[:INTO]-> company