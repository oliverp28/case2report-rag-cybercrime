// Cypher-Abfrage zur semantischen Fallanalyse im Case2Report-Projekt
// Nutzt OpenAI-Embeddings (APOC), um das passende Phänomen & Ermittlungsmaßnahmen zu identifizieren
// Autor: Oliver P. | Projekt: Case2Report | Stand: 2025

CALL apoc.ml.openai.embedding(
  ["{phenomenon}"],
  "{llm_key}"
)
YIELD index, text AS search_text, embedding

MATCH (p:Phenomenon)
WHERE p.embedding IS NOT NULL
WITH p, gds.similarity.cosine(p.embedding, embedding) AS score
ORDER BY score DESC
LIMIT 1

MATCH (c {id: "Cybercrime"})-[:INCLUDES_PHENOMENON]->(p)
MATCH (c)-[:HAS_CATEGORY]->(category:Category)
MATCH (category)
CALL apoc.path.subgraphAll(category, {
  relationshipFilter: ">",
  minLevel: 1,
  maxLevel: 3
}) YIELD nodes AS category_nodes

MATCH (p)
CALL apoc.path.subgraphAll(p, {
  relationshipFilter: ">",
  minLevel: 1,
  maxLevel: 5
}) YIELD nodes AS phenomenon_nodes, relationships AS phenomenon_relationships

MATCH (i {id: "Investigation"})-[:CONTAINS]->(q {id: "Investigation Questions"})
MATCH (q)-[:INCLUDES]->(question:Question)
WITH p, c, category, phenomenon_nodes, phenomenon_relationships, category_nodes, i, q, COLLECT(question) AS investigation_questions

CALL apoc.ml.openai.embedding(
  ["{measures}"],
  "{llm_key}"
)
YIELD index AS investigation_index, text AS investigation_search_text, embedding AS investigation_embedding

MATCH (m:Investigation_method)
WHERE m.embedding IS NOT NULL
WITH p, c, category, phenomenon_nodes, phenomenon_relationships, category_nodes, i, q, investigation_questions,
     m, gds.similarity.cosine(m.embedding, investigation_embedding) AS investigation_score

WITH p, c, category, phenomenon_nodes, phenomenon_relationships, category_nodes, i, q, investigation_questions,
     CASE WHEN investigation_score > 0.80 THEN m ELSE NULL END AS filtered_m,
     CASE WHEN investigation_score > 0.80 THEN investigation_score ELSE NULL END AS filtered_score

OPTIONAL MATCH (filtered_m)
CALL apoc.path.subgraphAll(filtered_m, {
  relationshipFilter: ">",
  minLevel: 1,
  maxLevel: 5
}) YIELD nodes AS investigation_method_nodes

RETURN DISTINCT
  apoc.convert.toJson(p) AS Identified_Phenomenon,
  apoc.convert.toJson(c) AS Related_Cybercrime,
  apoc.convert.toJson(category) AS Cybercrime_Category,
  apoc.convert.toJson(phenomenon_nodes) AS Phenomenon_Connected_Nodes,
  apoc.convert.toJson(phenomenon_relationships) AS Phenomenon_Connections,
  apoc.convert.toJson(category_nodes) AS Cybercrime_Category_Details_Nodes,
  apoc.convert.toJson(i) AS Investigation_Node,
  apoc.convert.toJson(q) AS Investigation_Questions_Node,
  apoc.convert.toJson(investigation_questions) AS Investigation_Questions,
  apoc.convert.toJson(COALESCE(COLLECT(filtered_m), [])) AS Most_Similar_Investigation_Methods,
  apoc.convert.toJson(COALESCE(COLLECT(investigation_method_nodes), [])) AS Investigation_Method_Details;
