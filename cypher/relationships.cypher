
// AURIX - Relationship structures

// Company develops product
(company)-[:DEVELOPS]->(product)

// Person works for company
(person)-[:WORKS_FOR]->(company)

// Company competes with company
(company)-[:COMPETES_WITH]->(company)

// Company partners with company
(company)-[:PARTNERS_WITH]->(company)

// Company headquarters location
(company)-[:HEADQUATERED_IN]->(location)

// Company or person makes investment
(investor)-[:MADE]->(investment)

// Investment goes into recipient company
(investment)-[:INTO]->(company)
