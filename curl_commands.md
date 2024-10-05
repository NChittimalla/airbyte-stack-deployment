# Airbyte API Usage

This document provides `curl` commands to interact with the Airbyte API, including listing all source definitions, workspaces, and retrieving the source definition ID for a specific source.

## List All Source Definitions

To list all source definitions, use the following `curl` command:

```bash
curl --location --request POST 'http://localhost:8000/api/v1/source_definitions/list' \
--header 'Authorization: Basic YWlyYnl0ZTpwYXNzd29yZA==' \
--header 'accept: application/json' \
--header 'Content-Type: application/json' \
--data-raw '{}'

To list all workspaces, use the following curl command:

```bash
curl --location --request POST 'http://localhost:8000/api/v1/workspaces/list' \
--header 'Authorization: Basic YWlyYnl0ZTpwYXNzd29yZA==' \
--header 'accept: application/json' \
--header 'Content-Type: application/json' \
--data-raw '{}'

To get the source definition ID for a specific source (e.g., Google Sheets), use the following curl command combined with jq to filter the results:

```bash
curl --location --request POST 'http://localhost:8000/api/v1/source_definitions/list' \
--header 'Authorization: Basic YWlyYnl0ZTpwYXNzd29yZA==' \
--header 'accept: application/json' \
--header 'Content-Type: application/json' \
--data-raw '{}' | jq -r '.sourceDefinitions[] | select(.name == "Google Sheets") | .sourceDefinitionId'
