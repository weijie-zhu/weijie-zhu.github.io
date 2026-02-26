---
title: "Film Scan Workflow"
date: 2025-09-02
description: "A repeatable workflow for scanning, naming, and color balancing film rolls."
status: "Maintenance"
start: 2025-03-01
role: "Workflow Design"
year: "2025"
stack: ["Negative Lab Pro", "Lightroom", "Shell Scripts"]
cover: "images/202312encu-胶片.jpg"
repo: "https://github.com/example/film-scan-workflow"
gallery:
  - "images/202312encu-胶片.jpg"
  - "images/20200606楼中剪影小幅.jpg"
  - "images/20220902铁马冰河入梦来.jpg"
---

## Why This Exists

Manual scanning was slow and inconsistent across rolls.  
This workflow defines one naming system, one color process, and one export structure.

## Folder Convention

```text
raw/
edited/
exports/web/
exports/print/
```

## Quality Rules

- Keep horizon corrections under 1.5 degrees when possible.
- Preserve highlight texture before pushing contrast.
- Export web JPG at balanced quality for fast loading.

## Notes

This page is a template-style project entry showing how code blocks and markdown content look inside the new project single layout.
