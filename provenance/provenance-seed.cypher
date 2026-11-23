
// ============================================================
// AURIX - Provenance Seed Data
// Initial dataset: 7 claims, 7 evidence records, 6 sources
// ============================================================


// ------------------------------------------------------------
// CLM001 - Anthropic and Microsoft
// ------------------------------------------------------------

MATCH (anthropic:company {company_id: "C002"})
MATCH (microsoft:company {company_id: "C004"})

MERGE (s:source {source_id: "SRC001"})
SET
    s.url = "https://www.anthropic.com/news/microsoft-nvidia-anthropic-announce-strategic-partnerships",
    s.title = "Microsoft, NVIDIA, and Anthropic announce strategic partnerships",
    s.publisher = "Anthropic",
    s.source_type = "company_announcement",
    s.published_at = "2025-11-18",
    s.accessed_at = "2026-11-22"

MERGE (e:evidence {evidence_id: "EVD001"})
SET
    e.text = "Microsoft and Anthropic are also expanding their existing partnership to provide broader access to Claude for businesses.",
    e.section = "Partnership announcement",
    e.evidence_type = "direct_quote"

MERGE (c:claim {claim_id: "CLM001"})
SET
    c.predicate = "PARTNERS_WITH",
    c.description = "Microsoft and Anthropic expanded their existing partnership.",
    c.status = "source_verified",
    c.valid_from = "2025-11-18",
    c.created_at = "2026-11-22"

MERGE (anthropic)-[:SUBJECT_OF]->(c)
MERGE (c)-[:OBJECT_OF]->(microsoft)
MERGE (e)-[:SUPPORTS]->(c)
MERGE (e)-[:EXTRACTED_FROM]->(s);


// ------------------------------------------------------------
// CLM002 - Anthropic and NVIDIA
// ------------------------------------------------------------

MATCH (anthropic:company {company_id: "C002"})
MATCH (nvidia:company {company_id: "C005"})

MERGE (s:source {source_id: "SRC001"})

MERGE (e:evidence {evidence_id: "EVD002"})
SET
    e.text = "For the first time, NVIDIA and Anthropic are establishing a deep technology partnership to support Anthropic’s future growth.",
    e.section = "Partnership announcement",
    e.evidence_type = "direct_quote"

MERGE (c:claim {claim_id: "CLM002"})
SET
    c.predicate = "PARTNERS_WITH",
    c.description = "Anthropic and NVIDIA announced a collaboration on model and hardware optimization.",
    c.status = "source_verified",
    c.valid_from = "2025-11-18",
    c.created_at = "2026-11-22"

MERGE (anthropic)-[:SUBJECT_OF]->(c)
MERGE (c)-[:OBJECT_OF]->(nvidia)
MERGE (e)-[:SUPPORTS]->(c)
MERGE (e)-[:EXTRACTED_FROM]->(s);


// ------------------------------------------------------------
// CLM003 - Anthropic and Amazon
// ------------------------------------------------------------

MATCH (anthropic:company {company_id: "C002"})
MATCH (amazon:company {company_id: "C007"})

MERGE (s:source {source_id: "SRC002"})
SET
    s.url = "https://www.anthropic.com/news/anthropic-amazon-compute",
    s.title = "Anthropic and Amazon compute collaboration announcement",
    s.publisher = "Anthropic",
    s.source_type = "company_announcement",
    s.published_at = "2026-04-20",
    s.accessed_at = "2026-11-22"

MERGE (e:evidence {evidence_id: "EVD003"})
SET
    e.text = "We have signed a new agreement with Amazon that will deepen our existing partnership and secure up to 5 gigawatts (GW) of capacity for training and deploying Claude.",
    e.section = "Partnership announcement",
    e.evidence_type = "direct_quote"

MERGE (c:claim {claim_id: "CLM003"})
SET
    c.predicate = "PARTNERS_WITH",
    c.description = "Anthropic and Amazon expanded their collaboration for AI training and deployment compute capacity.",
    c.status = "source_verified",
    c.valid_from = "2026-04-20",
    c.created_at = "2026-11-22"

MERGE (anthropic)-[:SUBJECT_OF]->(c)
MERGE (c)-[:OBJECT_OF]->(amazon)
MERGE (e)-[:SUPPORTS]->(c)
MERGE (e)-[:EXTRACTED_FROM]->(s);


// ------------------------------------------------------------
// CLM004 - Microsoft and Mistral AI
// ------------------------------------------------------------

MATCH (microsoft:company {company_id: "C004"})
MATCH (mistral:company {company_id: "C009"})

MERGE (s:source {source_id: "SRC003"})
SET
    s.url = "https://news.microsoft.com/source/2026/07/21/microsoft-and-mistral-expand-strategic-partnership-to-give-enterprises-and-regulated-industries-frontier-ai-they-can-control/",
    s.title = "Microsoft and Mistral expand strategic partnership",
    s.publisher = "Microsoft",
    s.source_type = "company_announcement",
    s.published_at = "2026-07-21",
    s.accessed_at = "2026-11-22"

MERGE (e:evidence {evidence_id: "EVD004"})
SET
    e.text = "Microsoft Corp. and Mistral on Tuesday announced a significant expansion of their strategic partnership to help enterprises and regulated industries adopt frontier AI with greater choice, control and operational consistency.",
    e.section = "Partnership announcement",
    e.evidence_type = "direct_quote"

MERGE (c:claim {claim_id: "CLM004"})
SET
    c.predicate = "PARTNERS_WITH",
    c.description = "Microsoft and Mistral expanded their partnership across AI infrastructure and enterprise model deployment.",
    c.status = "source_verified",
    c.valid_from = "2026-07-21",
    c.created_at = "2026-11-22"

MERGE (microsoft)-[:SUBJECT_OF]->(c)
MERGE (c)-[:OBJECT_OF]->(mistral)
MERGE (e)-[:SUPPORTS]->(c)
MERGE (e)-[:EXTRACTED_FROM]->(s);


// ------------------------------------------------------------
// CLM005 - OpenAI and Google
// ------------------------------------------------------------

MATCH (openai:company {company_id: "C001"})
MATCH (google:company {company_id: "C003"})

MERGE (s:source {source_id: "SRC004"})
SET
    s.url = "https://openai.com/index/openai-models-google-cloud/",
    s.title = "OpenAI models on Google Cloud",
    s.publisher = "OpenAI",
    s.source_type = "company_announcement",
    s.published_at = "2026-10-21",
    s.accessed_at = "2026-11-22"

MERGE (e:evidence {evidence_id: "EVD005"})
SET
    e.text = "OpenAI and Google Cloud are partnering to bring OpenAI’s frontier models and Codex agentic workflows into Google Cloud’s Model Garden.",
    e.section = "Partnership announcement",
    e.evidence_type = "direct_quote"

MERGE (c:claim {claim_id: "CLM005"})
SET
    c.predicate = "PARTNERS_WITH",
    c.description = "OpenAI models and Codex workflows are being integrated into Google Cloud Model Garden.",
    c.status = "source_verified",
    c.valid_from = "2026-10-21",
    c.created_at = "2026-11-22"

MERGE (openai)-[:SUBJECT_OF]->(c)
MERGE (c)-[:OBJECT_OF]->(google)
MERGE (e)-[:SUPPORTS]->(c)
MERGE (e)-[:EXTRACTED_FROM]->(s);


// ------------------------------------------------------------
// CLM006 - OpenAI and Microsoft
// ------------------------------------------------------------

MATCH (openai:company {company_id: "C001"})
MATCH (microsoft:company {company_id: "C004"})

MERGE (s:source {source_id: "SRC005"})
SET
    s.url = "https://openai.com/index/next-phase-of-microsoft-partnership/",
    s.title = "The next phase of the Microsoft partnership",
    s.publisher = "OpenAI",
    s.source_type = "company_announcement",
    s.published_at = "2026-04-27",
    s.accessed_at = "2026-11-22"

MERGE (e:evidence {evidence_id: "EVD006"})
SET
    e.text = "Today, we are announcing an amended agreement to simplify our partnership and the way we work together, grounded in flexibility, certainty, and a focus on delivering the benefits of AI broadly.",
    e.section = "Partnership announcement",
    e.evidence_type = "direct_quote"

MERGE (c:claim {claim_id: "CLM006"})
SET
    c.predicate = "PARTNERS_WITH",
    c.description = "OpenAI and Microsoft amended their long-term partnership covering cloud infrastructure and AI development.",
    c.status = "source_verified",
    c.valid_from = "2026-04-27",
    c.created_at = "2026-11-22"

MERGE (openai)-[:SUBJECT_OF]->(c)
MERGE (c)-[:OBJECT_OF]->(microsoft)
MERGE (e)-[:SUPPORTS]->(c)
MERGE (e)-[:EXTRACTED_FROM]->(s);


// ------------------------------------------------------------
// CLM007 - OpenAI and Amazon
// ------------------------------------------------------------

MATCH (openai:company {company_id: "C001"})
MATCH (amazon:company {company_id: "C007"})

MERGE (s:source {source_id: "SRC006"})
SET
    s.url = "https://openai.com/index/amazon-partnership/",
    s.title = "OpenAI and Amazon partnership announcement",
    s.publisher = "OpenAI",
    s.source_type = "company_announcement",
    s.published_at = "2026-02-27",
    s.accessed_at = "2026-11-22"

MERGE (e:evidence {evidence_id: "EVD007"})
SET
    e.text = "OpenAI and Amazon (NASDAQ: AMZN) today announced a multi-year strategic partnership to accelerate AI innovation for enterprises, startups, and end consumers around the world.",
    e.section = "Partnership announcement",
    e.evidence_type = "direct_quote"

MERGE (c:claim {claim_id: "CLM007"})
SET
    c.predicate = "PARTNERS_WITH",
    c.description = "OpenAI and Amazon announced collaboration on enterprise AI agents infrastructure and customized models.",
    c.status = "source_verified",
    c.valid_from = "2026-02-27",
    c.created_at = "2026-11-22"

MERGE (openai)-[:SUBJECT_OF]->(c)
MERGE (c)-[:OBJECT_OF]->(amazon)
MERGE (e)-[:SUPPORTS]->(c)
MERGE (e)-[:EXTRACTED_FROM]->(s);


// ------------------------------------------------------------
// FINAL COUNTS
// ------------------------------------------------------------

MATCH (c:claim)
WITH count(c) AS claims
MATCH (e:evidence)
WITH claims, count(e) AS evidence
MATCH (s:source)
RETURN
    claims AS total_claims,
    evidence AS total_evidence,
    count(s) AS total_sources;
