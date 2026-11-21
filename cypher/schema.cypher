
// AURIX - Schema and uniqueness constraints

CREATE CONSTRAINT company_id_unique IF NOT EXISTS
FOR (c:company)
REQUIRE c.company_id IS UNIQUE;

CREATE CONSTRAINT person_id_unique IF NOT EXISTS
FOR (p:person)
REQUIRE p.person_id IS UNIQUE;

CREATE CONSTRAINT product_id_unique IF NOT EXISTS
FOR (p:product)
REQUIRE p.product_id IS UNIQUE;

CREATE CONSTRAINT location_id_unique IF NOT EXISTS
FOR (l:location)
REQUIRE l.location_id IS UNIQUE;

CREATE CONSTRAINT investment_id_unique IF NOT EXISTS
FOR (i:investment)
REQUIRE i.investment_id IS UNIQUE;
