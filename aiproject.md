# 1. The resources I'd actually use

Don't collect 30 different tutorials. Use a small set of high-quality resources, and work through them in the order below.

[Neo4j Fundamentals Certificate | GraphAcademy](https://images.openai.com/static-rsc-4/VtHj31CA3CDGzgHCrJpUZ9tPVCWWgBTO_wb6x2gdZuo5bCgCfIKCq-nteQF_zASuYITfLyP9XTMEc1OsDtSfVqC6iV5jPcsjtK3RgyAqkLX7-jTPIymU60RzNV7E6Z9P1FiJJXF5zjl5IwGR7fjN-Hlqyjk6WDkHlSZwE101b3U?purpose=inline)

Resource 1 — Neo4j GraphAcademy

Mandatory

Free, hands-on courses for graph databases, Cypher, data modeling, and GraphRAG. Start with the essentials rather than completing every course.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://graphacademy.neo4j.com\&sz=32)

GraphAcademy+2



[Neo4j Fundamentals](https://graphacademy.neo4j.com/courses/neo4j-fundamentals?utm_source=chatgpt.com)

[Cypher Fundamentals](https://graphacademy.neo4j.com/courses/cypher-fundamentals?utm_source=chatgpt.com)

[All courses](https://graphacademy.neo4j.com/courses?utm_source=chatgpt.com)

[Constructing Knowledge Graphs with Neo4j GraphRAG for Python Certificate | GraphAcademy](https://images.openai.com/static-rsc-4/RsMaeiQFBMwBSIEXKkrRNU78_I6Kupkv8HCmOT33r4SfUfTbwduHAr1xAIUnWKCb4A95wOfgorHJ2zkVCAx03bC74hSKhjmeI7K-YnM6eBfCKBUcH6NmEk097Vg6rPeIHduhrY87gUgSLIEFw6t0Lj4MLaUErB6j8pqozk263Jw?purpose=inline)

Resource 2 — Neo4j GraphRAG for Python

Mandatory

This is your practical reference for retrievers, graph/vector search integration, and implementing a GraphRAG application. Read the concepts, then implement the underlying retrieval logic yourself before relying on its abstractions.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://neo4j.com\&sz=32)

neo4j-graphrag-python documentation+1



[Python documentation](https://neo4j.com/docs/neo4j-graphrag-python/current/index.html?utm_source=chatgpt.com)

[RAG user guide](https://neo4j.com/docs/neo4j-graphrag-python/current/user_guide_rag.html?utm_source=chatgpt.com)

[7 Microsoft’s GraphRAG implementation · Essential GraphRAG](https://images.openai.com/static-rsc-4/bBqTRaGBFND9U45KNtb8jxcTgPnG1uyM_D_lsvSd1ms6ECoUz7-p3K700_Oy6kJ43qJnUKeAtGFyVmAHSlGsUp-PRr3NU6hD3Tjps8x3yWCt-VnqI8k7R8ARI9rRz8MprAJalzGpPJZIi1k3LrH8CjDeP6yxjRgDMrXOqeJ5bjg?purpose=inline)

Resource 3 — Microsoft's GraphRAG

Study selectively

Study its indexing pipeline, entity graph, community summaries, and Local, Global, and DRIFT Search. These illustrate a different approach to GraphRAG, especially for questions about themes across an entire corpus. Don't try to reproduce the whole framework as your first implementation.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://github.com\&sz=32)

GitHub+1



[Official documentation and repository](https://github.com/microsoft/graphrag?utm_source=chatgpt.com)

[Building a Graph RAG Pipeline for Medical Records: From Theory to Production](https://images.openai.com/static-rsc-4/GTpljKhyw_FfROz45_Vxt7OP_isiDRxXCNl-5cHOLyYdcsRyNOcM93mg264_gbeZoKN-8u-hEu64SIdhaBO1yo6nSkCwaBduLkmVeeHdqTOfFSSY__kQN1krCPM9l_UDy1NUBQj1NzDrcDBzOAeKcHtWOy46n7w6WDsShevH7_Y?purpose=inline)

Resource 4 — Graph traversal and hybrid retrieval examples

Mandatory for implementation

Use Neo4j's examples to understand how vector retrieval can be enriched with graph traversal and how hybrid retrieval can combine different sources of context.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://github.com\&sz=32)

GitHub+1



[Enriching vector search with graph traversal](https://neo4j.com/blog/developer/?utm_source=chatgpt.com)

[Neo4j GraphRAG Python repository](https://github.com/neo4j/neo4j-graphrag-python?utm_source=chatgpt.com)

One note: Microsoft GraphRAG and Neo4j-based GraphRAG are related approaches, not identical algorithms. We'll study both, but build TRACE using Neo4j and our own Python retrieval pipeline first.


## Week 1 — Knowledge graphs and graph data modeling

Mandatory

Goal: Learn to represent real-world information as a graph and design a schema based on questions users need answered.

| Session | Exact concepts and task                                                                                       |
| ------- | ------------------------------------------------------------------------------------------------------------- |
| Day 1   | Property graphs: nodes, directed edges, labels, properties, paths, degree and neighborhoods.                  |
| Day 2   | Knowledge graphs vs relational databases vs vector databases. Understand when graph representation is useful. |
| Day 3   | Schema design: entity types, relationship types, directionality and cardinality.                              |
| Day 4   | Entity vs mention vs fact vs relationship. Understand why these aren't interchangeable.                       |
| Day 5   | Provenance: attach source document, page, passage, extraction method and confidence to claims.                |
| Day 6   | Design TRACE's schema around companies, investors, people, products, documents and partnerships.              |
| Day 7   | Model a small ecosystem manually and answer five questions using your schema.                                 |

Resources

- [Neo4j Fundamentals](https://graphacademy.neo4j.com/courses/neo4j-fundamentals?utm_source=chatgpt.com)
- [Graph Data Modeling Fundamentals](https://graphacademy.neo4j.com/courses/graph-data-modeling-fundamentals?utm_source=chatgpt.com)

The first course is a quick introduction; spend most of the week on modeling and applying the concepts to your own domain. Neo4j's official curriculum recommends graph modeling as a foundational skill.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://graphacademy.neo4j.com\&sz=32)

GraphAcademy+1



You must be able to explain: Why should `(:Investor)-[:INVESTED_IN]->(:Company)` be modeled as an explicit relationship rather than simply storing the investor's name in a company text field?

## Week 2 — Cypher, graph databases and graph construction

Mandatory

Goal: Query and populate a graph yourself before introducing an LLM.

| Session | Exact concepts and task                                                                            |
| ------- | -------------------------------------------------------------------------------------------------- |
| Day 1   | Neo4j setup, nodes, relationships and properties.                                                  |
| Day 2   | Cypher `MATCH`, `RETURN`, `WHERE` and aliases.                                                     |
| Day 3   | `CREATE`, `MERGE`, `SET` and avoiding duplicate entities.                                          |
| Day 4   | Variable-length paths, relationship direction and filtering.                                       |
| Day 5   | Aggregation, `WITH`, `UNWIND` and basic query parameters.                                          |
| Day 6   | Load sample entities and relationships from structured data. Add uniqueness constraints.           |
| Day 7   | Write ten queries, including investors backing multiple companies and paths between two companies. |

Resources

- [Cypher Fundamentals](https://graphacademy.neo4j.com/courses/cypher-fundamentals?utm_source=chatgpt.com)
- [Intermediate Cypher Queries](https://graphacademy.neo4j.com/courses/intermediate-cypher?utm_source=chatgpt.com)

Both are available through the official [Neo4j course catalog](https://graphacademy.neo4j.com/courses?utm_source=chatgpt.com).&#x20;

[image](https://www.google.com/s2/favicons?domain=https://graphacademy.neo4j.com\&sz=32)

GraphAcademy+1



You must be able to explain: How does graph traversal work? How is finding a two-hop relationship different from searching document passages for similar text?

## Week 3 — Turning unstructured documents into knowledge graphs

Mandatory

Goal: Build the ingestion pipeline that turns source documents into a trustworthy graph.

| Session | Exact concepts and task                                                                      |
| ------- | -------------------------------------------------------------------------------------------- |
| Day 1   | Document-to-graph pipelines: text extraction, chunking and graph construction.               |
| Day 2   | Entity extraction, relation extraction and structured LLM outputs.                           |
| Day 3   | Define a Pydantic schema for entities and relationships; validate Gemini outputs.            |
| Day 4   | Entity resolution: aliases, duplicate names, canonical IDs and ambiguous matches.            |
| Day 5   | Relationship provenance, source passages, page numbers and extraction confidence.            |
| Day 6   | Write an ingestion pipeline that loads extracted relationships into Neo4j.                   |
| Day 7   | Inspect graph quality manually; record missed entities, false relations and duplicate nodes. |

Resources

- [Constructing Knowledge Graphs with Neo4j GraphRAG for Python](https://graphacademy.neo4j.com/courses/genai-graphrag-python?utm_source=chatgpt.com)
- [Neo4j GraphRAG documentation](https://neo4j.com/docs/neo4j-graphrag-python/current/index.html?utm_source=chatgpt.com)

The GraphAcademy course covers schema-guided extraction, building a graph from unstructured data, and tuning the pipeline. Use it to learn the process, but implement and inspect your own version.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://graphacademy.neo4j.com\&sz=32)

graphacademy.neo4j.com+1



You must be able to explain: Why can an LLM-generated graph contain incorrect relationships even if every output conforms to a valid JSON schema?

## Week 4 — Graph retrieval and multi-hop reasoning

Mandatory

Goal: Retrieve useful evidence from the graph in response to natural-language questions.

| Session | Exact concepts and task                                                              |
| ------- | ------------------------------------------------------------------------------------ |
| Day 1   | One-hop neighbors, multi-hop paths, graph neighborhoods and traversal limits.        |
| Day 2   | Entity linking: map company and person mentions in a query to graph entities.        |
| Day 3   | Write bounded Cypher queries for two-hop and three-hop paths.                        |
| Day 4   | Understand path explosion, cycles, irrelevant connections and query efficiency.      |
| Day 5   | Convert graph paths into readable relationship chains with provenance.               |
| Day 6   | Build a Python graph retriever that accepts entity IDs and returns relevant paths.   |
| Day 7   | Test ten relationship questions, including questions where no supported path exists. |

Resources

- [Intermediate Cypher Queries](https://graphacademy.neo4j.com/courses/intermediate-cypher?utm_source=chatgpt.com)
- [Neo4j GraphRAG Python documentation](https://neo4j.com/docs/neo4j-graphrag-python/current/index.html?utm_source=chatgpt.com)

You must be able to explain: How do you decide which paths are useful? Why can unrestricted multi-hop traversal overwhelm the LLM with irrelevant context?

## Week 5 — Graph RAG architectures

Highest priority

Goal: Understand the major approaches called Graph RAG, rather than treating them as one algorithm.

| Session | Exact concepts and task                                                                                                |
| ------- | ---------------------------------------------------------------------------------------------------------------------- |
| Day 1   | Compare vanilla vector RAG, graph-assisted retrieval and graph-native retrieval.                                       |
| Day 2   | Understand graph-enhanced vector retrieval: retrieve relevant passages, then traverse their connected graph.           |
| Day 3   | Study Text-to-Cypher retrieval: natural-language questions converted into graph queries.                               |
| Day 4   | Study entity-centered or local graph retrieval and the role of connected entities and source chunks.                   |
| Day 5   | Study Microsoft's GraphRAG: entity extraction, graph communities, community summaries, Local Search and Global Search. |
| Day 6   | Implement one graph-enhanced retrieval strategy in TRACE.                                                              |
| Day 7   | Compare the strategies on different questions and document their trade-offs.                                           |

Resources

- [Neo4j & GenerativeAI Fundamentals](https://graphacademy.neo4j.com/courses/genai-fundamentals?utm_source=chatgpt.com)
- [Neo4j's graph traversal tutorial](https://neo4j.com/blog/developer/graph-traversal-graphrag-python-package/?utm_source=chatgpt.com)
- [Microsoft GraphRAG overview](https://microsoft.github.io/graphrag/?utm_source=chatgpt.com)
- [Microsoft GraphRAG Local Search](https://microsoft.github.io/graphrag/query/local_search/?utm_source=chatgpt.com)

Neo4j's course specifically covers graph-enhanced vector retrieval and Text-to-Cypher retrieval. Microsoft's approach also uses graph communities and summaries for corpus-wide questions.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://graphacademy.neo4j.com\&sz=32)

GraphAcademy+3



You must be able to explain: What is the difference between retrieving connected facts from a knowledge graph and using community summaries to answer a question about an entire corpus?

Do not try to reproduce Microsoft's complete indexing and community-detection pipeline yet. Understand the architecture first.

## Week 6 — Hybrid Graph RAG: build the core TRACE engine

Highest priority

Goal: Combine vector retrieval, graph traversal and evidence-backed answer generation.

| Session | Exact concepts and task                                                                 |
| ------- | --------------------------------------------------------------------------------------- |
| Day 1   | Decide when to use vector retrieval, graph retrieval or both for a query.               |
| Day 2   | Retrieve graph entry points using entity matching or semantic retrieval.                |
| Day 3   | Traverse the graph from those entry points with bounded, relevant paths.                |
| Day 4   | Retrieve supporting passages for graph relationships and related claims.                |
| Day 5   | Fuse, deduplicate and rank graph results and vector results.                            |
| Day 6   | Generate an answer from the combined evidence, with citations and explicit uncertainty. |
| Day 7   | Implement the end-to-end `research(query)` pipeline.                                    |

Resource

[Neo4j: Enhancing hybrid retrieval with graph traversal](https://neo4j.com/blog/developer/enhancing-hybrid-retrieval-graphrag-python-package/?utm_source=chatgpt.com)

This tutorial examines combining vector search and graph traversal, which is closely aligned with the architecture we're building.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://neo4j.com\&sz=32)

Neo4j Graph Intelligence Platform+1



You must be able to explain: Why is adding a graph to RAG not automatically an improvement? What happens if the graph contains incorrect relationships, or the retrieval engine selects irrelevant paths?

End-of-week milestone: TRACE can answer a question requiring multiple relationships and show the graph path and source passages supporting the answer.

## Week 7 — Advanced retrieval and reliability

Mandatory

Goal: Improve the research engine rather than merely making it return an answer.

| Session | Exact concepts and task                                                                    |
| ------- | ------------------------------------------------------------------------------------------ |
| Day 1   | Query decomposition: split a complex question into entities, constraints and subquestions. |
| Day 2   | Retrieval planning: decide which graph patterns or passages are needed.                    |
| Day 3   | Ranking and filtering graph paths; limit irrelevant neighbors and overly broad searches.   |
| Day 4   | Entity ambiguity, missing entities and unsupported graph connections.                      |
| Day 5   | Conflicting claims, time-sensitive relationships and source-specific evidence.             |
| Day 6   | Implement better retrieval filtering and abstention when evidence is insufficient.         |
| Day 7   | Run an error-analysis session and fix the three most common failure modes.                 |

Resources

- Revisit the [Neo4j GraphRAG Python documentation](https://neo4j.com/docs/neo4j-graphrag-python/current/index.html?utm_source=chatgpt.com).
- Use the [Microsoft GraphRAG query documentation](https://microsoft.github.io/graphrag/query/overview/?utm_source=chatgpt.com) to compare local and global retrieval strategies.&#x20;

  [image](https://www.google.com/s2/favicons?domain=https://neo4j.com\&sz=32)

  neo4j-graphrag-python documentation+1



You must be able to explain: How can two individually valid relationships form a misleading path? How should the system handle a relationship that was true in 2023 but may no longer be true?

## Week 8 — Evaluation: does Graph RAG actually help?

Mandatory

Goal: Evaluate the system instead of relying on a few impressive demonstrations.

| Session | Exact concepts and task                                                                          |
| ------- | ------------------------------------------------------------------------------------------------ |
| Day 1   | Create a test set of 15–25 questions with verified answers and source evidence.                  |
| Day 2   | Evaluate vanilla RAG on the same test set.                                                       |
| Day 3   | Evaluate graph retrieval and the hybrid system.                                                  |
| Day 4   | Measure retrieval quality: relevant evidence retrieved, missing evidence and irrelevant context. |
| Day 5   | Evaluate answer correctness, relationship-path correctness and citation support.                 |
| Day 6   | Compare errors, cost and latency where practical.                                                |
| Day 7   | Document the results and identify when each retrieval strategy performs best.                    |

Resource: [Microsoft GraphRAG documentation](https://microsoft.github.io/graphrag/?utm_source=chatgpt.com) for understanding its retrieval approaches, alongside your own test set.

You must be able to explain: Which types of questions benefit from graph retrieval? Which are already handled well by vanilla RAG? What evidence supports your conclusion?

Do not invent metrics or assume Graph RAG wins. A measured result showing no improvement on a particular question type is still a useful finding.

## Week 9 — backend && frontend

Goal: Turn the research engine into an application someone else can use.

| Session | Exact concepts and task                                                |
| ------- | ---------------------------------------------------------------------- |
| Day 1   | Streamlit architecture and application flow.                           |
| Day 2   | Document upload and ingestion status.                                  |
| Day 3   | Research query interface and answer display.                           |
| Day 4   | Citation display with source document and page.                        |
| Day 5   | Interactive graph visualization and relevant subgraph display.         |
| Day 6   | Entity details, edge inspection and supporting evidence.               |
| Day 7   | Test the full workflow using a fresh session and additional documents. |

Resources: [Streamlit documentation](https://docs.streamlit.io/?utm_source=chatgpt.com) and the graph visualization library you select. Keep this week focused on usability; the main technical work is already in the retrieval engine.

## Week 10 — Finish, document and demonstrate TRACE

Goal: Complete a portfolio-ready project that you can explain technically.

| Session | Exact concepts and task                                                                                               |
| ------- | --------------------------------------------------------------------------------------------------------------------- |
| Day 1   | Fix the most important graph construction errors.                                                                     |
| Day 2   | Fix retrieval and citation failures.                                                                                  |
| Day 3   | Run the final baseline and hybrid evaluation.                                                                         |
| Day 4   | Document the architecture, design decisions and trade-offs.                                                           |
| Day 5   | Write installation instructions, configuration and reproducible setup steps.                                          |
| Day 6   | Prepare a demo with multi-hop questions, graph paths and source evidence.                                             |
| Day 7   | Explain the entire pipeline from document ingestion through retrieval and answer generation without reading the code. |

Deliverable: A working TRACE demo, a readable GitHub repository, evaluation results and a technical explanation you can confidently defend.

# 3. What is fully mandatory vs optional?

Use this checklist to keep yourself from getting distracted by advanced topics.

## Mandatory — master these

Knowledge graph modeling

Entity types, relationship types, schema design and provenance.

Neo4j and Cypher

MATCH, MERGE, aggregation, variable-length paths and bounded traversal.

Graph construction

LLM extraction, structured schemas, entity resolution and extraction quality.

Graph retrieval

Entity linking, neighborhood retrieval, multi-hop paths and relevant context selection.

Graph RAG architectures

Graph-enhanced vector retrieval, Text-to-Cypher, and Microsoft's Local vs Global Search.

Hybrid retrieval

Combine graph paths and vector passages; rank and fuse evidence.

Grounding and provenance

Trace claims to source passages and abstain when evidence is insufficient.

Evaluation

Compare against vanilla RAG using verified questions and error analysis.

End-to-end implementation

Ingestion, persistent storage, research engine, graph visualization and documentation.

## Optional — postpone these

Graph neural networks and graph machine learning

Knowledge graph embeddings and link prediction

Advanced community detection and Leiden algorithm internals

Reproducing the full Microsoft GraphRAG pipeline

Multi-agent orchestration and LangGraph

Live web crawling and automated monitoring

Fine-tuning an LLM or training a custom embedding model

One distinction worth remembering: graph machine learning is not a prerequisite for Graph RAG. Your immediate focus is knowledge graphs as a representation and retrieval mechanism for LLM applications, not training models directly on graph structures.

# 4. Your first week: start here

Don't attempt to read all the resources at once. Start with these first seven sessions and build something small.

## Week 1 checklist

0 of 7

Day 1

Complete Neo4j Fundamentals; sketch a graph with five companies and three investors.

Day 2

Learn property graphs and compare a graph model with relational tables.

Day 3

Complete Cypher Fundamentals and write MATCH queries.

Day 4

Design entity and relationship types for TRACE.

Day 5

Model source documents and evidence provenance.

Day 6

Write Cypher queries for investor overlap and multi-hop connections.

Day 7

Answer five research questions using your graph and explain the schema choices.

My recommendation: spend your first two weeks learning graph modeling and querying, but devote Weeks 3–8 to graph construction, graph retrieval, Graph RAG architectures, and evaluation. That is where most of your new technical understanding will come from.

And remember the core principle throughout this project: we aren't adding a knowledge graph just because it sounds advanced. We're learning when relationships provide useful retrieval context that a conventional RAG pipeline would miss.
