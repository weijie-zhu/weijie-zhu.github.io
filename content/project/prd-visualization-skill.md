---
title: "PRD Visualization Skill"
date: 2026-03-09
description: "An AI-native skill that turns hierarchical PRD JSON into interactive visual maps for faster product thinking."
status: "In Progress"
start: 2026-03-01
role: "Builder"
year: "2026"
stack: ["JavaScript", "D3.js", "Agent Skills", "JSON"]
summary: "A visualization skill for PRDs and plans with list, force-directed, and radial views, designed to make decision structure and project context easier to understand."
repo: "https://github.com/foyri/prd_visualization_skill"
links:
  - name: "GitHub"
    url: "https://github.com/foyri/prd_visualization_skill"
  - name: "Clawhub Package"
    url: "https://www.clawhub.dev/"
---

## Overview

PRD Visualization Skill is an AI-native tool for rendering hierarchical PRD or plan data into interactive visual structures. It was built to make project decisions easier to inspect across different levels, from high-level strategy to implementation detail.

## Problem

Most project tools flatten all decisions into similar-looking items. In practice, decisions have different levels of impact:

- Local implementation details
- Mid-level branching choices
- Foundational assumptions

When AI agents speed up iteration, this flattening makes it harder to recover context and understand why a project evolved in a specific direction.

## Solution

This skill reads hierarchical JSON and provides multiple visual views so teams can inspect structure, dependencies, and progress from different perspectives.

## Features

- **List View**: Collapsible hierarchy for precise reading
- **Force-Directed View**: Relationship exploration with drag/physics
- **Radial Cluster View**: Fast hierarchy scanning in circular layout
- **JSON Input**: Simple structured data model for PRDs/plans
- **Agent-Friendly Packaging**: Can be invoked directly in AI agent workflows

## Data Example

```json
{
  "id": "root",
  "title": "Product Requirements",
  "status": "processing",
  "children": [
    {
      "id": "auth",
      "title": "Authentication System",
      "status": "done",
      "children": [
        {"id": "login", "title": "User Login", "status": "done"},
        {"id": "oauth", "title": "OAuth Integration", "status": "processing"}
      ]
    }
  ]
}
```

## Roadmap

- ✅ List View
- ✅ Force-Directed View
- ✅ Radial Cluster View
- 🚧 Fractal Tree View (variable node weights + zoomable hierarchy)

## Installation

```bash
clawhub install prd-visualization-skill
```

```bash
npx skills add foyri/prd_visualization_skill
```

## Impact

- Faster project onboarding through visual context
- Better prioritization by exposing dense risk areas
- Easier context recovery after long breaks

## References

- [GitHub Repository](https://github.com/foyri/prd_visualization_skill)
