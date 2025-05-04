# Case2Report – RAG-System zur Cybercrime-Analyse

**Case2Report** ist ein prototypisches KI-gestütztes System zur Unterstützung der polizeilichen Erstbewertung von Cybercrime-Fällen. Es kombiniert ein **Large Language Model (LLM)** mit einem **domänenspezifischen Knowledge Graph** im Rahmen eines **Retrieval-Augmented Generation (RAG)**-Ansatzes.

---

## Projektüberblick

Ziel des Projekts ist die **strukturierte und nachvollziehbare Analyse** von Cybercrime-Fällen auf Basis verifizierter Wissensquellen. Das System analysiert Fallbeschreibungen, ruft relevante Informationen aus einem Knowledge Graph ab und generiert einen **strukturierten Ermittlungsbericht** in englischer Sprache.

Das Projekt wurde im Rahmen meiner Bachelorarbeit an der DHBW Heilbronn in Kooperation mit dem Landeskriminalamt Baden-Württemberg entwickelt.

---

## Technologien & Architektur

- Python
- Neo4j als Graphdatenbank
- OpenAI GPT-4 zur Sprachverarbeitung
- Cypher zur Abfrage des Knowledge Graph
- RAGAS zur systematischen Evaluierung der Modellleistung
- Vektorbasierte Embedding-Suche zur semantischen Analyse

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
│   ├── Cybercrime_Cases.csv        # Testdatensatz mit 50 Cybercrime-Fällen
│   └── README.md                   # Beschreibung des Datensatzes
├── graph/
│   ├── graph.svg                   # Visualisierung des Knowledge Graphen
│   ├── graph.json                  # JSON-Export des gesamten Graphen
│   ├── case2report_query.cypher   # Zentrale Cypher-Abfrage
│   └── README.md                   # Beschreibung des Graphen & Abfragen
├── src/
│   ├── opt_police_KG_LLM.ipynb     # Notebook zur RAG-Logik & Evaluation
│   ├── Fall_11.md                  # Beispielbericht (gute RAGAS-Bewertung)
│   ├── Fall_36.md                  # Beispielbericht (niedrige Faithfulness)
│   └── README.md                   # Beschreibung der Analysekomponenten
├── README.md                       # Diese Projektbeschreibung
└── LICENSE                         # Lizenzinformation

---

## Hinweise

- Das System basiert auf öffentlich dokumentierten Cybercrime-Vorfällen (keine personenbezogenen Daten).
- Alle generierten Berichte werden evaluiert nach Faithfulness, Relevanz, Recall und Korrektheit.
- Die Fallauswahl für Beispielberichte erfolgte gezielt zur Demonstration von Qualitätsspannen innerhalb des Systems:
  - **Fall 11**: Hohe Bewertungsqualität in allen Metriken
  - **Fall 36**: Geringe Faithfulness trotz inhaltlicher Korrektheit
             
