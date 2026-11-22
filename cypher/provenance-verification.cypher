
 // AURIX - Provenance Verification

 // 1. Count provenance nodes
MATCH (n)
WHERE n:source OR n:evidence OR n:claim
RETURN labels(n)[0] AS NodeType, count(*) AS Total
ORDER BY NodeType;


// 2. Inspect all complete claims
MATCH (a:company)-[:SUBJECT_OF]->(c:claim)
      -[:OBJECT_OF]->(b:company)
MATCH (e:evidence)-[:SUPPORTS]->(c)
MATCH (e)-[:EXTRACTED_FROM]->(s:source)
RETURN c.claim_id AS ClaimID,
       a.name AS Subject,
       c.predicate AS Predicate,
       b.name AS Object,
       c.status AS Status,
       e.evidence_id AS EvidenceID,
       s.source_id AS SourceID
ORDER BY ClaimID;


// 3. Find claims without subjects or objects
MATCH (c:claim)
OPTIONAL MATCH (a:company)-[:SUBJECT_OF]->(c)
OPTIONAL MATCH (c)-[:OBJECT_OF]->(b:company)
WITH c, count(DISTINCT a) AS Subjects,
        count(DISTINCT b) AS Objects
WHERE Subjects <> 1 OR Objects <> 1
RETURN c.claim_id, Subjects, Objects;


// 4. Find evidence without a source
MATCH (e:evidence)
WHERE NOT (e)-[:EXTRACTED_FROM]->(:source)
RETURN e;


// 5. Find evidence without a claim
MATCH (e:evidence)
WHERE NOT (e)-[:SUPPORTS|CONTRADICTS]->(:claim)
RETURN e;


// 6. Find claims without evidence
MATCH (c:claim)
WHERE NOT (:evidence)-[:SUPPORTS|CONTRADICTS]->(c)
RETURN c;


// 7. Check source reuse
MATCH (s:source)<-[:EXTRACTED_FROM]-(e:evidence)
      -[:SUPPORTS]->(c:claim)
RETURN s.source_id AS SourceID,
       count(DISTINCT e) AS EvidenceCount,
       count(DISTINCT c) AS ClaimCount
ORDER BY SourceID;


// 8. Inspect claim statuses
MATCH (c:claim)
RETURN c.status AS Status, count(*) AS Total
ORDER BY Status;
