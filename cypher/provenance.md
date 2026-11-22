
# AURIX - Provenance Model

## 1. Overview

AURIX uses an evidence-backed provenance layer to track where
knowledge graph claims originate and what evidence supports them.

The provenance layer helps AURIX:

- Track the origin of factual claims.
- Connect claims to supporting evidence.
- Identify contradictory evidence.
- Reuse sources across multiple claims.
- Maintain traceability and accountability.
- Support reliable GraphRAG responses with citations.

The provenance model consists of three primary node types:

1. Source
2. Evidence
3. Claim

---

## 2. Node Types

### 2.1 Source

A Source represents an external document or information resource
from which evidence is obtained.

Examples:
- Company announcements
- Annual reports
- Government publications
- Research papers
- Regulatory filings
- News articles

Properties:

| Property | Description |
|---|---|
| source_id | Unique source identifier |
| url | Original source URL |
| title | Document title |
| publisher | Organization or publisher |
| source_type | Type of source |
| published_at | Publication date |
| accessed_at | Date AURIX accessed the source |

Example:

    (:source {
        source_id: "SRC001",
        publisher: "Anthropic",
        source_type: "company_announcement"
    })

A single source can support multiple claims.

---

### 2.2 Evidence

Evidence represents a specific passage or piece of
information extracted from a source.

Properties:

| Property | Description |
|---|---|
| evidence_id | Unique evidence identifier |
| text | Extracted passage |
| section | Document section |
| page_number | Page number, when applicable |
| evidence_type | direct_quote or paraphrase |
| confidence | Extraction confidence, when available |

Evidence types:

- direct_quote: Exact wording from the source.
- paraphrase: Information rewritten in our own words.

A direct quote establishes what the source says.
It does not automatically establish that the statement is true.

---

### 2.3 Claim

A Claim represents an assertion about entities in the knowledge graph.

Examples:

- Anthropic partners with Microsoft.
- Microsoft partners with Mistral AI.
- OpenAI partners with Amazon.

Properties:

| Property | Description |
|---|---|
| claim_id | Unique claim identifier |
| predicate | Relationship being asserted |
| description | Human-readable claim |
| status | Verification state |
| valid_from | Date the relationship or assertion became valid |
| valid_to | End date, if known |
| created_at | Date the claim was recorded |

The predicate describes the relationship:

- PARTNERS_WITH
- COMPETES_WITH
- INVESTED_IN
- ACQUIRED
- DEVELOPS

The subject and object are represented by connections
to existing knowledge graph entities.

---

## 3. Relationship Design

The provenance layer uses five relationship types.

### 3.1 SUBJECT_OF

Connects an entity to a claim.

    (Company)-[:SUBJECT_OF]->(Claim)

Example:

    (Anthropic)-[:SUBJECT_OF]->(CLM001)

### 3.2 OBJECT_OF

Connects a claim to the entity it refers to.

    (Claim)-[:OBJECT_OF]->(Company)

Example:

    (CLM001)-[:OBJECT_OF]->(Microsoft)

### 3.3 SUPPORTS

Connects evidence that supports a claim.

    (Evidence)-[:SUPPORTS]->(Claim)

### 3.4 CONTRADICTS

Connects evidence that contradicts a claim.

    (Evidence)-[:CONTRADICTS]->(Claim)

This allows AURIX to represent conflicting information
rather than silently ignoring it.

### 3.5 EXTRACTED_FROM

Connects evidence to its original source.

    (Evidence)-[:EXTRACTED_FROM]->(Source)

This preserves the origin of every evidence record.

---

## 4. Complete Provenance Structure

The complete structure is:

    (Subject Entity)
          |
      SUBJECT_OF
          |
        (Claim)
          |
       OBJECT_OF
          |
    (Object Entity)

    (Evidence)
          |
        SUPPORTS
          |
        (Claim)

    (Evidence)
          |
     EXTRACTED_FROM
          |
       (Source)

Contradictory evidence can connect through:

    (Evidence)-[:CONTRADICTS]->(Claim)

---

## 5. Claim Status Definitions

AURIX uses application-defined claim statuses.

### source_supported

The available evidence appears to support the claim,
but a manual source audit has not yet been completed.

### source_verified

A human reviewer has checked the cited source and confirmed
that it supports the claim as represented.

This does not mean the claim has been independently
corroborated by multiple sources.

### disputed

Conflicting evidence exists and requires further review.

### rejected

The claim was found to be unsupported or incorrect.

### pending_review

The claim has been extracted but has not yet been reviewed.

These statuses are controlled by AURIX application logic.
They are not built-in Neo4j properties or verification features.

---

## 6. Multiple Sources and Claims

A source can support multiple claims.

Example:

One Anthropic announcement can contain information about
both its Microsoft partnership and its NVIDIA partnership.

Therefore:

    SRC001
      |
      +-- EVD001 --> CLM001
      |
      +-- EVD002 --> CLM002

Likewise, one claim can have multiple evidence records
from different sources.

This supports cross-source corroboration and contradiction
analysis in future versions.

---

## 7. Current Seed Dataset

The initial provenance dataset contains:

| Node Type | Count |
|---|---:|
| Claim | 7 |
| Evidence | 7 |
| Source | 6 |

The seven initial claims cover:

1. Anthropic - Microsoft
2. Anthropic - NVIDIA
3. Anthropic - Amazon
4. Microsoft - Mistral AI
5. OpenAI - Google
6. OpenAI - Microsoft
7. OpenAI - Amazon

All seven claims were manually checked against their
cited company announcements.

The initial dataset passed the structural verification
queries implemented for this phase.

This is a small seed dataset, not a complete or exhaustive
representation of these companies' relationships.

---

## 8. Data Integrity

The provenance schema uses uniqueness constraints:

    source_id_unique
    evidence_id_unique
    claim_id_unique

These prevent duplicate IDs for the corresponding node labels.

Verification queries check:

- Claims with missing subjects.
- Claims with missing objects.
- Evidence without a source.
- Evidence without a claim relationship.
- Claims without supporting or contradicting evidence.
- Claim status distribution.
- Source reuse across claims.

The verification queries are stored in:

    database/cypher/provenance-verification.cypher

The schema is stored in:

    database/cypher/provenance-schema.cypher

The seed data is stored in:

    database/cypher/provenance-seed.cypher

---

## 9. Current Limitations

The current implementation is a manually populated
provenance layer.

It does not yet include:

- Automated document ingestion.
- Automated claim extraction.
- Automated evidence extraction.
- Automated source reliability scoring.
- Automated claim verification.
- Entity resolution for extracted claims.
- Full relationship event history.
- Automated contradiction detection.

These capabilities will be introduced in later phases.

---

## 10. Future Integration

The provenance layer will eventually integrate with:

1. Document ingestion pipeline.
2. Entity extraction and resolution.
3. Claim extraction pipeline.
4. Evidence validation.
5. Graph retrieval engine.
6. GraphRAG.
7. Research and verification agents.

The intended workflow is:

    Document
       |
    Extraction
       |
    Entity Resolution
       |
    Claim Extraction
       |
    Evidence Linking
       |
    Source Linking
       |
    Claim Validation
       |
    Neo4j Knowledge Graph

The goal is to ensure that every important factual
assertion generated by AURIX can be traced back to
its supporting evidence and original source.
