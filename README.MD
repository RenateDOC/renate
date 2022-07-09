# Application

## Intro

Es handelt sich um eine (ältere) "three-tier" Applikation mit frontend, api, database.
Für diesen Hackathon dient die Applikation nur als Mittel zum Zweck, und die Entwicklung an der Applikation steht hier **nicht** im Fokus. Aus DevOps Sicht ist es trotzdem relevant zu wissen, wie die Architektur der Applikation aussieht und welche Technologien eingesetzt werden, da ihr bei dem Deployment und den Operationstätigkeiten unterstützen sollt.

## Architektur und Verzeichnis Struktur

<img src="./application/docs/dobib.drawio.png">

Im `/application` Verzeichnis findet ihr drei Unterverzechnisse wieder.

- frontend - Das Web Frontend (Presentation Layer) in React geschrieben
- api - Die API (Logik Layer) in Node.js geschrieben
- db-seed - Eine Utility um die Datenbank zu befüllen

Die Datenbank selber ist wie ihr seht nicht als eigenes Verzechnis vorhanden, dass hat den Grund weil es aus Applikations Sicht egal ist wo die Datenbank ist. Gebräuchlich ist dass die Entwickler eine lokale Datenbank, in diesem Fall eine Mongo DB, hochfahren, als ein Container (wird in einer Challenge näher erläutert).

## Frontend

Die Applikation besteht im wesentlichen aus drei Seiten

- `/books` - Übersicht der Bücher und Verleihstatus
- `/books/:bookID` - Detail Seite eines Buches mit Button zum ausleihen und zurückgeben
- `/admin` - Admin Seite um Bücher zu verwalten

<img src="./application/docs/dobib.app.png">

# Documentation

> Ihr könnt hier eure Dokumentation zu den Herausforderungen hinzufügen oder euch im Team auf eine eigene Dokumentations Struktur einigen

```shell
# login
az login
az acr login --name renatemanual

# Frontend
docker tag application_frontend renatemanual.azurecr.io/application_frontend:latest
docker push renatemanual.azurecr.io/application_frontend:latest

# DB Seed
docker tag application_mongo-seed renatemanual.azurecr.io/application_mongo-seed:latest
docker push renatemanual.azurecr.io/application_mongo-seed:latest


# Backend
docker tag application_api renatemanual.azurecr.io/application_api:latest
docker push renatemanual.azurecr.io/application_api:latest

# pullen
docker pull renatemanual.azurecr.io/application_frontend:latest
docker pull renatemanual.azurecr.io/application_mongo-seed:latest
docker pull renatemanual.azurecr.io/application_api:latest
```


# Terraform

Terraform initialisieren: `terraform init`

Bei Azure Tenant einloggen (CLI) mit `az login --tenant kfwchallenge.onmicrosoft.com`. Als Resultat kommt ein JSON mit
der Subscription Id unter dem Feld Id. Diese Id muss mit dem Befehl `az account set --subscription SUBSCRIPTION_ID` gesetzt werden.

Terraform applyen: `terraform apply`

Um den lokalen State zu laden: `terraform refresh`
