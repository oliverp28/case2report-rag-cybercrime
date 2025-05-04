# data/

Dieser Ordner enthält den Testdatensatz, der für die Evaluierung des KI-Systems *Case2Report* im Rahmen der Bachelorarbeit verwendet wurde.

## Cybercrime_Cases.csv

Die Datei basiert auf **50 dokumentierten Cybercrime-Fällen**, die aus der **Sicherheitsvorfall-Datenbank von [dsgvo-portal.de](https://www.dsgvo-portal.de/sicherheitsvorfall-datenbank/)** extrahiert wurden. Sie dient als Grundlage zur simulativen Bewertung eines Retrieval-Augmented Generation (RAG)-Systems zur Analyse digitaler Straftaten.

---

## Entstehung & Auswahlkriterien

Die Auswahl der Fälle erfolgte nach festen Kriterien:

- **Zeitraum**: Nur Vorfälle aus den Jahren **2024 und 2025**
- **Ort**: Ausschließlich Ereignisse innerhalb **Deutschlands**
- **Phänomene**: Nur Fälle, die eindeutig einem der folgenden Typen zuordenbar sind:
  - Phishing
  - Ransomware
  - Hacking
  - DDoS-Angriff
  - Malware

Diese Auswahl stützt sich auf aktuelle Bedrohungslagen, die im **BSI-Lagebericht 2024** und der **Bitkom-Wirtschaftsschutz-Studie 2024** identifiziert wurden.

---

## Inhalt & Struktur der Datei

Die CSV enthält strukturierte Informationen pro Fall:

- `case_id`: Eindeutige ID des Falls
- `date_time`: Zeitpunkt des Vorfalls
- `location`: Region oder Bundesland
- `description`: Beschreibung des Ereignisses aus Betroffenenperspektive
- `indicators`: Hinweise auf Angriffsart oder Täter (z. B. E-Mail, IP, Domain)
- `damage`: Geschätzter materieller Schaden

---

## Zweck

Die Fallbeschreibungen bilden die **Eingabe** für das RAG-System, das daraufhin relevante Informationen aus einem domänenspezifischen **Knowledge Graph** abruft und automatisiert strukturierte Ermittlungsberichte erstellt.

---

## Hinweis zur Datenethik

Die Daten wurden **nicht manuell verändert oder anonymisiert**, sondern entsprechen inhaltlich der offenen Darstellung auf der Quellplattform. Es wurden jedoch **ausschließlich öffentlich dokumentierte Fälle verwendet**, die keine identifizierenden personenbezogenen Daten enthalten.

---

