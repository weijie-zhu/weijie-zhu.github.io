---
title: "Dify Workflow: Apple Notes to Notion"
date: 2025-10-05
description: "A hybrid local + Dify workflow for migrating Apple Notes to Notion with AI-powered categorization."
status: "Completed"
start: 2025-10-01
role: "Workflow Developer"
year: "2025"
stack: ["Dify", "Python", "Notion API", "Dropbox API", "DeepSeek-V3"]
    summary: "An automated workflow for migrating Apple Notes to Notion, featuring AI-powered categorization, attachment handling via Dropbox, and metadata preservation."
---

## Overview

A hybrid local + Dify workflow for automating the migration of Apple Notes to Notion. This tool preserves original note creation dates, handles images and attachments via Dropbox, and uses AI (DeepSeek via Dify) for intelligent categorization.

## Why This Exists

Apple Notes lacks the organizational power and cross-platform accessibility of Notion. This workflow enables bulk migration while preserving metadata and intelligently categorizing notes using LLM.

## Features

- **Metadata Preservation**: Maintains original note creation dates from macOS metadata
- **Attachment Handling**: Uploads images and attachments to Dropbox for embedding in Notion
- **AI Categorization**: LLM-powered (DeepSeek via Dify) automatic note categorization
- **Rate-Limited API**: Handles 267+ notes with proper Notion API rate limiting
- **Privacy-First**: Sensitive files (.gitignore) excluded from version control

## Workflow Architecture

```
Apple Notes (Export) → Markdown Files → Dropbox Upload → Dify AI Processing → Notion Database
```

## Folder Structure

```
apple_notes_proj/
├── apple_notes/           # Exported notes (gitignored)
│   ├── *.md
│   ├── images/
│   └── attachments/
├── upload_to_dropbox.py   # Local Dropbox uploader
├── prepare_json.py        # JSON preparation script
├── dify_input.json        # Full dataset for Dify
├── input_test_to_dify.json # Test subset (5 notes)
├── attachment_mapping.json # UUID to Dropbox URL mapping
└── .gitignore             # Excludes personal data
```

## Usage

### 1. Export Apple Notes

Use Exporter (Mac App Store) to export notes to Markdown format with the expected structure:
- `apple_notes/*.md` - Note files
- `apple_notes/images/` - Image attachments
- `apple_notes/attachments/` - File attachments

### 2. Upload Attachments to Dropbox

```bash
# Install dependencies
pip install dropbox

# Configure Dropbox
cp upload_to_dropbox.py.example upload_to_dropbox.py
# Edit with your Dropbox access token

# Upload
python3 upload_to_dropbox.py
```

Creates:
- Dropbox folder `/Apple Notes Attachments`
- Local `attachment_mapping.json`

### 3. Prepare JSON for Dify

```bash
python3 prepare_json.py
```

Creates:
- `dify_input.json` - Full dataset (267 notes)
- `input_test_to_dify.json` - Test subset (5 notes)

### 4. Process in Dify

1. Upload `input_test_to_dify.json` for testing
2. After validation, upload full `dify_input.json`
3. AI categorization using DeepSeek-V3 model

### 5. Import to Notion

- Sync processed data to Notion database
- Requires `NOTION_TOKEN` and `NOTION_DATABASE_ID`

## Technical Specifications

- **Dify Workflow**: [View on Dify Cloud](https://cloud.dify.ai/app/6a97c493-eabc-44c0-ab1d-06f5d854fa62/workflow)
- **AI Model**: DeepSeek-V3.2 (via Siliconflow)
- **Output Format**: Structured JSON for Notion API
- **Batch Processing**: 267+ notes with rate limiting

## Files

| File | Purpose |
|------|---------|
| `upload_to_dropbox.py` | Uploads attachments to Dropbox |
| `prepare_json.py` | Prepares JSON input for Dify |
| `AI_summary.md` | Detailed Dify workflow configuration |
| `attachment_mapping.json` | Maps UUIDs to Dropbox share URLs |

## References

- [GitHub Repository](https://github.com/foyri/apple-notes-to-notion)
- [Dify Workflow](https://cloud.dify.ai/app/6a97c493-eabc-44c0-ab1d-06f5d854fa62/workflow)

## Related

Inspired by Grasshopper (node-based visual scripting for Rhino) - a low-code, node-type workflow tool driven by Python, used for architectural parametric design in undergraduate studies.
