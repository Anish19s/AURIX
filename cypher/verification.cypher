
// ============================================================
// AURIX - GRAPH VERIFICATION & DATA QUALITY
// ============================================================


// SECTION 1: GRAPH OVERVIEW

// 1. Count nodes by label
MATCH (n)
UNWIND labels(n) AS NodeType
RETURN NodeType, count(*) AS Total
ORDER BY NodeType;


// 2. Count relationships by type
MATCH ()-[r]->()
RETURN type(r) AS Relationship, count(r) AS Total
ORDER BY Relationship;


// SECTION 2: ENTITY INSPECTION

// 3. Inspect all investments
MATCH (investor)-[:MADE]->(i:investment)-[:INTO]->(company)
RETURN
    coalesce(investor.name, investor.company_id, investor.person_id) AS Investor,
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
RETURN
    a.name AS Company,
    b.name AS Competitor,
    r.evidence_note AS Evidence,
    r.source_url AS SourceURL;


// 7. Inspect partnerships
MATCH (a:company)-[r:PARTNERS_WITH]->(b:company)
RETURN
    a.name AS Company,
    b.name AS Partner,
    r.partnership_type AS Type,
    r.date AS Date,
    r.evidence_note AS Evidence,
    r.source_url AS SourceURL;


// 8. Inspect headquarters
MATCH (c:company)-[:HEADQUATERED_IN]->(l:location)
RETURN c.name AS Company, l.city AS City, l.country AS Country;


// 9. Inspect complete investment paths
MATCH (investor)-[m:MADE]->(i:investment)-[t:INTO]->(company)
RETURN investor, m, i, t, company;


// SECTION 3: INVESTMENT INTEGRITY

// 10. Verify every investment has exactly one investor
//     and exactly one recipient
MATCH (i:investment)
OPTIONAL MATCH (investor)-[:MADE]->(i)
OPTIONAL MATCH (i)-[:INTO]->(recipient)
RETURN
    i.investment_id AS InvestmentID,
    count(DISTINCT investor) AS Investors,
    count(DISTINCT recipient) AS Recipients
ORDER BY InvestmentID;


// SECTION 4: NODE DATA QUALITY

// 11. Check for duplicate node IDs
MATCH (n)
WHERE
    (n:company AND n.company_id IS NOT NULL) OR
    (n:person AND n.person_id IS NOT NULL) OR
    (n:product AND n.product_id IS NOT NULL) OR
    (n:location AND n.location_id IS NOT NULL) OR
    (n:investment AND n.investment_id IS NOT NULL)
WITH
    labels(n) AS NodeLabels,
    coalesce(n.company_id, n.person_id, n.product_id,
             n.location_id, n.investment_id) AS NodeID
WITH NodeLabels, NodeID, count(*) AS Total
WHERE Total > 1
RETURN NodeLabels, NodeID, Total;


// 12. Check for missing node IDs
MATCH (n)
WHERE
    (n:company AND n.company_id IS NULL) OR
    (n:person AND n.person_id IS NULL) OR
    (n:product AND n.product_id IS NULL) OR
    (n:location AND n.location_id IS NULL) OR
    (n:investment AND n.investment_id IS NULL)
RETURN labels(n) AS NodeType, n;


// 13. Check required node properties
MATCH (n)
WITH labels(n) AS NodeType, n
UNWIND CASE
    WHEN NodeType = ["company"]
        THEN ["company_id", "name", "industry"]
    WHEN NodeType = ["person"]
        THEN ["person_id", "name", "title"]
    WHEN NodeType = ["product"]
        THEN ["product_id", "name", "type"]
    WHEN NodeType = ["location"]
        THEN ["location_id", "city", "country"]
    WHEN NodeType = ["investment"]
        THEN ["investment_id", "investor_type", "investment_type"]
    ELSE []
END AS RequiredProperty
WITH NodeType, RequiredProperty, n
WHERE n[RequiredProperty] IS NULL
   OR trim(toString(n[RequiredProperty])) = ""
RETURN
    NodeType,
    RequiredProperty,
    count(*) AS MissingCount
ORDER BY NodeType, RequiredProperty;


// 14. Check for duplicate company names
MATCH (c:company)
WITH
    toLower(trim(c.name)) AS NormalizedName,
    collect(c.company_id) AS CompanyIDs,
    count(*) AS Total
WHERE Total > 1
RETURN NormalizedName, CompanyIDs, Total;


// 15. Check company names for accidental whitespace
MATCH (c:company)
WHERE c.name <> trim(c.name)
RETURN c.company_id, c.name;


// SECTION 5: CONNECTIVITY

// 16. Check disconnected people, products and locations
MATCH (n)
WHERE
    (n:product OR n:person OR n:location)
    AND NOT (n)--()
RETURN labels(n) AS NodeType, n;


// 17. Check disconnected companies
//     Disconnected companies are not automatically errors.
MATCH (c:company)
WHERE NOT (c)--()
RETURN c.company_id AS CompanyID, c.name AS CompanyName;


// SECTION 6: RELATIONSHIP INTEGRITY

// 18. Validate relationship directions and endpoint labels
MATCH (a)-[r]->(b)
RETURN
    type(r) AS Relationship,
    labels(a) AS SourceNode,
    labels(b) AS TargetNode,
    count(*) AS Total
ORDER BY Relationship;


// 19. Inspect relationship property completeness
MATCH ()-[r]->()
RETURN
    type(r) AS Relationship,
    count(r) AS Total,
    count(r.source_url) AS WithSourceURL,
    count(r.evidence_note) AS WithEvidence,
    count(r.date) AS WithDate
ORDER BY Relationship;


// 20. Check duplicate relationships between the same nodes
MATCH (a)-[r]->(b)
WITH a, b, type(r) AS Relationship, count(r) AS Total
WHERE Total > 1
RETURN
    labels(a) AS SourceType,
    coalesce(a.company_id, a.person_id, a.investment_id) AS SourceID,
    Relationship,
    labels(b) AS TargetType,
    coalesce(b.company_id, b.product_id, b.location_id,
             b.investment_id) AS TargetID,
    Total
ORDER BY Total DESC;


// ============================================================
// END OF VERIFICATION QUERIES
// ============================================================


// CLEANUP COMMANDS
// These are historical corrective operations.
// Execute only when the specific issue is confirmed.


// A. Delete accidental CSV-header location node
// MATCH (l:location {
//     location_id: "location_id",
//     city: "city",
//     country: "country"
// })
// DELETE l;


// B. Remove leading/trailing whitespace from company names
// MATCH (c:company)
// WHERE c.name <> trim(c.name)
// SET c.name = trim(c.name);
