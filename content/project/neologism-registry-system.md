---
title: "Neologism Registry System"
date: 2026-03-09
description: "A system for minting new words to prevent AI context drift — enabling precise definitions for AI-native concepts."
status: "In Progress"
start: 2026-03-09
role: "Designer"
year: "2026"
stack: ["GitHub", "API Design", "Agent Integration", "MCP", "TypeScript"]
summary: "A public registry for creating, evaluating, and distributing neologisms — new words that AI agents can discover and follow precisely, solving the context drift problem in long conversations."
---

# Neologism Registry System: Creating Words for AI-Native Concepts

**Project**: Neologism Registry System  
**GitHub**: https://github.com/foyri/neologism-registry  
**Concept**: Mint new words to prevent AI context drift


## The Problem: Context Drift in Long Conversations

I discovered a serious flaw in how we communicate with AI agents. When we use common terms like "PRD" to represent new AI-native concepts, something breaks as conversations lengthen.

**Here's what happens:**
1. I define what an "AI-native PRD" means in my system
2. The agent understands initially
3. Context grows — 10k, 20k, 50k tokens
4. The agent drifts back to training data definitions
5. My special definition is lost

The agent becomes "笨" (clumsy) — unable to adapt to new methods because it's trapped in pre-trained associations.

**This is a fundamental limitation of using common vocabulary for novel concepts.**


## The Insight: Untrained Known Words

The solution emerged from a simple observation:

> When an AI encounters an unknown word, it searches for a definition. When it encounters a known word, it uses its training.

**So create words that are:**
- **Unknown enough** — Not in common training data
- **Discoverable** — Agents can search and find definitions
- **Precise** — One definition, no ambiguity

I call these **"untrained known words"** — words that don't trigger pre-trained associations, forcing agents to look up and follow explicit definitions.


## Example Transformations

| Common Term | Neologism | Definition |
|-------------|-----------|------------|
| AI-native PRD | `speciment` | Structured intent document for AI agents, not humans |
| Agent Task | `tasklet` | Atomic unit of agent work with I/O schema |
| Human Approval | `governcheck` | Required human validation checkpoint |

When an agent sees `speciment`, it won't default to "Product Requirements Document" from training data. It will search, find the definition, and follow it precisely.


## System Architecture

The Neologism Registry System has five core components:

### 1. Minting Service
Generates unique neologisms that:
- Don't exist in common vocabulary
- Are memorable and pronounceable
- Pass collision checks against existing registry

### 2. Definition Registry
A public, searchable database with:
- Word, definition, creator, version
- Usage examples and related terms
- API for agent queries
- Git-based for transparency

### 3. Evaluation Engine
Measures effectiveness through:
- Drift reduction metrics (<5% in 10k token contexts)
- Usage analytics across agent frameworks
- A/B testing neologisms vs common terms

### 4. Distribution Layer
Agent integration via:
- MCP (Model Context Protocol) server
- Auto-inject definitions into context
- Fallback search mechanism

### 5. Discovery Portal
Public interface featuring:
- Browse and search neologisms
- RSS/API feeds for agents
- Community submissions


## Why This Matters

**For AI-Native Workflows:**
- Precise communication without drift
- Self-documenting concepts
- Versioned definitions that evolve

**For Multi-Agent Systems:**
- Shared vocabulary across agents
- Consistent interpretation
- Reduced coordination overhead

**For the Future:**
- Language evolves to match new capabilities
- Agents teach agents through shared definitions
- Human-AI communication becomes more precise


## Technical Approach

- **Registry Backend**: GitHub (transparency) + CDN (speed)
- **API**: REST/GraphQL for agent queries
- **Agent Integration**: MCP server for OpenClaw/Codex/Claude
- **Evaluation**: Analytics pipeline tracking usage and drift


## Current Status

**Phase 1: Core Registry** (In Progress)
- ✅ Problem identified and articulated
- ✅ System architecture designed
- ✅ GitHub repository created
- 🚧 First 10 neologisms for PM Agent workflow
- 🚧 Basic API implementation

**Phase 2: Agent Integration** (Planned)
- MCP server development
- Auto-discovery mechanism
- Evaluation metrics

**Phase 3: Public Launch** (Planned)
- Discovery portal
- Community submissions
- External agent support


## Success Criteria

- **Drift Reduction**: <5% definition deviation in 10k token contexts
- **Adoption**: 100+ neologisms registered in first month
- **Agent Compliance**: >90% correct usage when definition provided


## The Bigger Vision

This isn't just about preventing drift. It's about **evolving language for the AI era**.

As AI agents become primary actors in workflows, we need vocabulary that:
- Reflects agent-native concepts
- Enables precise, unambiguous communication
- Evolves as capabilities expand

The Neologism Registry System is infrastructure for that evolution — a way to mint, validate, and distribute the words we'll need to build the future.


## Get Involved

**View the Plan**: https://github.com/foyri/neologism-registry/blob/main/PLAN_v2026-03-09.md

**Contribute**: Submit neologism proposals via GitHub issues

**Use It**: Integrate the MCP server into your agent workflows


*Built with the conviction that precise language enables precise action. That when we name things correctly, agents can understand and execute correctly. And that the words we create today will shape how AI agents think tomorrow.*
