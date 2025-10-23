---
description: Manage translations for SurrealDB page_text records in nc-leptos projects
---

Use the translation-manager agent to handle translations for page_text records in the current nc-leptos project.

## Usage

Run this command from your nc-leptos project directory that contains a `translation-config.json` file.

**Syntax:**
```
/translate-page-text [mode]
```

**Modes:**
- `translate` (default): Add missing translations for target languages
- `verify`: Check if existing translations still match the source language semantically
- `sync`: Add missing translations AND verify existing ones

**Examples:**
```bash
# From project directory, translate missing entries
cd ~/projects/leptos/bordeauxwinepilgrim
/translate-page-text

# Verify existing translations
/translate-page-text verify

# Add missing and verify existing
/translate-page-text sync
```

## What the agent will do:

1. Read `translation-config.json` from the current directory
2. Fetch SurrealDB credentials from `/run/secrets/` (requires sudo)
3. Query all page_text records from the database
4. Based on the mode:
   - **translate**: Add translations only for missing target languages
   - **verify**: Check existing translations match source semantically
   - **sync**: Do both - add missing and verify existing
5. Process records in batches (configurable in config)
6. Update the database with new/corrected translations
7. Provide a detailed summary report

## Requirements:

- Must run from a project directory containing `translation-config.json`
- SurrealDB credentials must be configured in NixOS sops (/run/secrets/user and /run/secrets/password)
- Network access to SurrealDB instance

## Config File Format:

Your `translation-config.json` should look like:
```json
{
  "project_name": "bordeauxwinepilgrim",
  "connection": {
    "url": "http://surrealdb.service.consul:8000/sql",
    "namespace": "bordeauxwinepilgrim",
    "database": "website-staging"
  },
  "translation": {
    "source_language": "en",
    "target_languages": ["fr", "es"],
    "batch_size": 15
  }
}
```

Invoke the translation-manager agent to handle this task. Pass the current working directory and the mode (defaulting to "translate" if not specified).
