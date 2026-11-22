
 // AURIX - Provenance Layer Schema

 // Unique IDs
CREATE CONSTRAINT source_id_unique IF NOT EXISTS
FOR (s:source)
REQUIRE s.source_id IS UNIQUE;

CREATE CONSTRAINT evidence_id_unique IF NOT EXISTS
FOR (e:evidence)
REQUIRE e.evidence_id IS UNIQUE;

CREATE CONSTRAINT claim_id_unique IF NOT EXISTS
FOR (c:claim)
REQUIRE c.claim_id IS UNIQUE;

// Provenance relationship patterns:
//
// (subject)-[:SUBJECT_OF]->(claim)
// (claim)-[:OBJECT_OF]->(object)
//
// (evidence)-[:SUPPORTS]->(claim)
// (evidence)-[:CONTRADICTS]->(claim)
//
// (evidence)-[:EXTRACTED_FROM]->(source)
