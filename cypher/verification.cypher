
// AURIX - Verification queries

// 1. Count nodes by label
MATCH (n)
RETURN labels(n) AS NodeType, count(n) AS Total;

// 2. Count relationships by type
MATCH ()-[r]->()
RETURN type(r) AS Relationship, count(r) AS Total;

// 3. Inspect all investments
MATCH (investor)-[:MADE]->(i:investment)-[:INTO]->(company)
RETURN investor.name AS Investor,
       i.investment_id AS InvestmentID,
       i.date AS Date,
       i.amount_usd AS Amount,
       company.name AS Recipient
ORDER BY i.investment_id;

// 4. Inspect company products
MATCH (c:company)-[:DEVELOPS]->(p:product)
RETURN c.name AS Company, p.name AS Product;

// 5. Inspect company leadership
MATCH (p:person)-[r:WORKS_FOR]->(c:company)
RETURN p.name AS Person, r.role AS Role, c.name AS Company;

// 6. Inspect competitors
MATCH (a:company)-[r:COMPETES_WITH]->(b:company)
RETURN a.name AS Company, b.name AS Competitor,
       r.evidence_note AS Evidence;

// 7. Inspect partnerships
MATCH (a:company)-[r:PARTNERS_WITH]->(b:company)
RETURN a.name AS Company, b.name AS Partner,
       r.partnership_type AS Type;

// 8. Inspect headquarters
MATCH (c:company)-[:HEADQUATERED_IN]->(l:location)
RETURN c.name AS Company, l.city AS City, l.country AS Country;

// 9. Inspect the complete investment paths
MATCH (investor)-[m:MADE]->(i:investment)-[t:INTO]->(company)
RETURN investor, m, i, t, company;
