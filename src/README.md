# src/

Dieser Ordner enthält die zentrale Systemlogik des Projekts *Case2Report*. Dazu gehören:

- das Jupyter-Notebook `opt_police_KG_LLM.ipynb` zur Ausführung der vollständigen Analysepipeline,
- sowie zwei Beispielausgaben generierter Ermittlungsberichte mit zugehöriger Evaluation (`Fall_11.md` und `Fall_36.md`).

## Dateien in diesem Ordner

| Datei                         | Beschreibung                                                                 |
|------------------------------|------------------------------------------------------------------------------|
| `opt_police_KG_LLM.ipynb`    | Notebook zur Umsetzung des Retrieval-Augmented Generation (RAG)-Prototyps   |
| `Fall_11.md`                 | Beispielbericht für einen Phishing-Vorfall inklusive Bewertungsmetriken     |
| `Fall_36.md`                 | Beispielbericht für einen Ransomware-Fall inklusive Bewertungsmetriken      |

## Funktionalität des Notebooks

Das Notebook `opt_police_KG_LLM.ipynb` führt folgende Schritte aus:

1. Einlesen eines Cybercrime-Falls aus `Cybercrime_Cases.csv`
2. Extraktion relevanter Informationen (Phänomen, Ermittlungsmaßnahmen) mithilfe eines LLM
3. Dynamische Generierung einer Cypher-Abfrage für den Knowledge Graph
4. Abruf relevanter Entitäten mittels Vektorvergleich und semantischer Subgraph-Analyse
5. Generierung eines strukturierten Ermittlungsberichts durch das LLM
6. Bewertung der Ausgabequalität mithilfe des RAGAS-Frameworks (Faithfulness, Relevanz, Recall, Korrektheit)

## Beispielausgaben

Die beiden Markdown-Dateien dokumentieren vollständige Ergebnisberichte aus der Systemanalyse. **Die Auswahl dieser Fälle erfolgte gezielt anhand der RAGAS-Metriken:**

- **Fall 11** wurde ausgewählt, weil er eine **sehr hohe Bewertungsqualität** in allen Metriken aufweist.
- **Fall 36** hingegen zeigt eine **vergleichsweise geringe Faithfulness**, obwohl andere Metriken gut abschneiden. Dieser Fall dient als Beispiel für ein Modellverhalten mit Verbesserungspotenzial.

### Fall 11: Phishing
- Kategorie: Cybercrime im engeren Sinne
- Juristische Bewertung: §§ 202a, 263a, 269 StGB u. a.
- Ermittlungsstrategie: E-Mail-Header-Analyse, Domainrecherche, ISP-Anfragen
- RAGAS-Scores:
  - Faithfulness: 0.9744
  - Relevanz: 0.8016
  - Recall: 1.0
  - Korrektheit: 0.9524

### Fall 36: Ransomware
- Kategorie: Cybercrime im engeren Sinne
- Juristische Bewertung: §§ 253, 303b StGB
- Ermittlungsstrategie: Geräteanalyse, Malwareverhalten, IP- & Domainverfolgung
- RAGAS-Scores:
  - Faithfulness: 0.0968
  - Relevanz: 0.7958
  - Recall: 1.0
  - Korrektheit: 0.9503

## Technologische Voraussetzungen

- Python 3.11+
- Jupyter Notebook
- LangChain (OpenAI, Experimental, Graph Modules)
- OpenAI GPT-4 API-Zugang
- Neo4j (mit aktiviertem APOC- und GDS-Plugin)
- Optional: Langfuse für LLM-Monitoring

## Hinweis

Die Eingabedaten liegen in `../data/`, während der zugehörige Knowledge Graph im Verzeichnis `../graph/` strukturiert ist. Für eine erfolgreiche Ausführung des Notebooks sind alle Komponenten erforderlich.
