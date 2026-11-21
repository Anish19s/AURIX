// AURIX: verify company import after using Aura's Import tool
MATCH (c:Company)
RETURN count(c) AS company_count;

// Inspect a sample
MATCH (c:Company)
RETURN c.company_id, c.name, c.industry
ORDER BY c.company_id
LIMIT 10;

// Check duplicate IDs (should return zero rows)
MATCH (c:Company)
WITH c.company_id AS id, count(*) AS copies
WHERE id IS NOT NULL AND copies > 1
RETURN id, copies;
