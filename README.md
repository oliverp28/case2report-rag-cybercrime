# Case2Report – RAG-System zur Cybercrime-Analyse

**Case2Report** ist ein prototypisches KI-gestütztes System zur Unterstützung der polizeilichen Erstbewertung von Cybercrime-Fällen. Es kombiniert ein **Large Language Model (LLM)** mit einem **domänenspezifischen Knowledge Graph** im Rahmen eines **Retrieval-Augmented Generation (RAG)**-Ansatzes.

---

## Projektüberblick

Ziel des Projekts ist die **strukturierte und nachvollziehbare Analyse** von Cybercrime-Fällen auf Basis verifizierter Wissensquellen. Das System analysiert Fallbeschreibungen, ruft relevante Informationen aus einem Knowledge Graph ab und generiert einen **strukturierten Ermittlungsbericht** in englischer Sprache.

Das Projekt wurde im Rahmen meiner Bachelorarbeit an der DHBW Heilbronn in Kooperation mit dem Landeskriminalamt Baden-Württemberg entwickelt.

---

## Technologien & Architektur

- **Python**
- **Neo4j** als Graphdatenbank
- **OpenAI GPT-4** zur Sprachverarbeitung
- **Cypher** zur Abfrage des Knowledge Graph
- **RAGAS** zur systematischen Evaluierung der Modellleistung
- **Vektorbasierte Embedding-Suche** zur semantischen Analyse

---

## System-Komponenten

1. **Input**: Cybercrime-Fallbeschreibung im CSV-Format  
2. **LLM-Analyse**: Extraktion von Phänomen & Ermittlungsansätzen  
3. **Graph Retrieval**: Dynamische Cypher-Anfragen an Neo4j  
4. **Report Generation**: Strukturierte Berichterstellung durch das LLM  
5. **Evaluation**: Qualitätsbewertung über RAGAS (Faithfulness, Relevanz, etc.)

---

## Projektstruktur

```plaintext
.
├── data/
│   └── Cybercrime_Cases.csv        # Testdatensatz mit 50 Cybercrime-Fällen
├── graph/
│   ├── Cypher_Query.pages          # Beispiel-Cypher-Abfragen zur Graph-Nutzung
│   └── graph.svg                   # Visualisierung des Knowledge Graphen
├── src/
│   └── opt_police_KG_LLM.ipynb     # Notebook zur RAG-Logik & Evaluation
├── README.md                       # Diese Projektbeschreibung
└── LICENSE                       
