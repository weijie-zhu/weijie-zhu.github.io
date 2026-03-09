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
---

# PRD Visualization Skill: Why I Built a Fractal Thinking Tool

**Project**: PRD Visualization Skill  
**GitHub**: https://github.com/foyri/prd_visualization_skill  
**Install**: `clawhub install prd-visualization-skill` or `npx skills add foyri/prd_visualization_skill`


## The Realization: Ideas Don't Exist on a Flat Plane

I've been thinking a lot about how we visualize complex projects. The deeper I went into vibe-coding — working with AI agents to build software — the more I realized something was fundamentally broken about how we track and visualize our work.

**The problem isn't that we lack visualization tools. The problem is that they all treat ideas as if they exist on the same level.**

In reality, ideas and decisions have *weight*. Some are minor implementation details. Others are pivotal branching points that determine the entire future direction of a project. But when you look at most project management tools — Jira, Trello, even Git commit graphs — everything is flattened into uniform nodes.

This is a cognitive mismatch. Our brains don't think in flat lists. We think in **fractals** — structures where the same patterns repeat at different scales.


## The Speed Problem

As AI coding agents get faster, this mismatch becomes critical. Claude Code, Codex, and similar tools can generate hundreds of lines of code in seconds. They can explore multiple approaches, backtrack, pivot, and iterate faster than any human can track.

**Traditional visualization approaches fail because:**

1. **They treat all decisions as flat nodes** — A typo fix and an architectural pivot get the same visual weight
2. **They don't capture scale** — Some decisions are minor; others are structural
3. **They can't represent velocity** — The pace of agent action is invisible in static charts

I found myself returning to projects after a break and having no idea what had been explored, what had been abandoned, and why certain paths were taken. The context was lost in walls of text.


## The Insight: Fractal/Hierarchical Visualization

Here's the core insight that changed everything:

**Ideas and decisions are not the same size.**

When you're building software:
- Some choices are *leaf nodes* — small, local, self-contained
- Others are *branching points* — structural, influential, future-determining
- And some are *roots* — foundational assumptions that everything else builds on

In the pre-LLM era, creating visualizations that captured this hierarchy was cognitively demanding. You had to manually classify, rank, and structure your ideas before you could visualize them. The analysis itself was the bottleneck.

**But LLMs changed the economics.**

Semantic analysis — previously requiring human intelligence — is now effortless. An LLM can read a plan.md file and instantly understand:
- Which decisions are structural vs. cosmetic
- Which paths were explored vs. abandoned
- What the hierarchy of importance looks like

This means we can finally build **"full visualization"** — representations that match the true complexity of thought, not simplified versions constrained by human cognitive limits.


## The Philosophy: Mimicking Real-World Complexity

The visualization should mimic how complexity actually works in the real world:

- **Complex networks**, not simple trees
- **Weighted connections** — showing strength and influence, not just existence
- **Variable scale** — some nodes are small, others dominate the landscape
- **Temporal dynamics** — velocity, acceleration, momentum of work

This isn't just about making pretty charts. It's about **cognitive alignment** — creating tools that match how our minds actually work, rather than forcing our thinking into rigid structures.

My background in architecture and philosophy informs this. Architecture taught me that form follows function, but also that the *representation* of structure affects how we understand it. Philosophy taught me that the map is not the territory — but a better map helps us navigate the territory more effectively.


## The Implementation: Start Simple, Build Toward Fractals

This PRD Visualization Skill is the first step toward that vision.

Right now, it provides **three views** of hierarchical data:

1. **List View** — The traditional collapsible tree. Good for reading, bad for seeing patterns.
2. **Force-Directed** — Nodes and connections with physics. Good for exploring relationships.
3. **Radial Cluster** — Circular dendrogram. Good for seeing hierarchy at a glance.

These are intentionally simple. They're the foundation. The next step — which I'm actively working on — is the **Fractal Tree** view:

- Radial branching with physics-based layout
- Variable node sizes based on importance
- Visual weight that reflects decision significance
- Zoomable interfaces that let you drill from high-level architecture to implementation details

The skill reads hierarchical JSON (representing PRDs, plans, or any structured thinking) and renders it interactively. No complex setup. No dependencies. Just drop in your data and explore.


## Why a Skill, Not Just a Tool?

I packaged this as an **Agent Skill** because of a deeper belief about the future of software:

**AI-native tools should be context-aware and composable.**

When you tell your AI agent "visualize my PRD," it should automatically invoke the right tool. Skills are how we teach AI agents to recognize patterns and take appropriate action. They're the bridge between human intent and tool execution.

By making this a skill:
- It integrates into existing workflows (Claude Code, OpenClaw, Codex CLI)
- The AI can *decide* when visualization is appropriate
- It becomes part of a larger ecosystem of AI-native tools


## Real-World Impact

Since building this, I've noticed three immediate benefits:

**1. Faster Onboarding**
New team members can grasp project architecture in minutes by exploring the visualization, rather than reading 50 pages of documentation.

**2. Better Prioritization**
Visual patterns reveal bottlenecks. When you see a dense cluster of "processing" nodes in one area, you know where the risk is.

**3. Preserved Context**
Returning to a project after a break, the visualization immediately reminds me of what was explored, what was decided, and what's left to do. The cognitive load of context-switching is drastically reduced.


## The Bigger Picture: Toward Full Visualization

This project is part of a larger thesis:

**We're entering an era where "full visualization" — representations that match the true complexity of thought — becomes possible for the first time.**

Pre-LLM, all visualization was simplified because the analysis required to create rich representations was too cognitively expensive. Post-LLM, that constraint is gone.

The implications go far beyond PRDs:
- Decision journals that capture not just what was decided, but the full tree of options explored
- Knowledge graphs that show not just connections, but strength of relationships
- Strategic planning tools that represent uncertainty, velocity, and momentum
- Learning tools that adapt visual complexity to the learner's current understanding

I believe this is the start of a new category: **LLM-native visualization**. And I'm exploring whether this could be the foundation for something bigger — perhaps a startup focused on next-generation visualization patterns.


### Structure Your PRD as JSON

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

- ✅ **List View** — Collapsible hierarchical list
- ✅ **Force-Directed** — Draggable node-link diagram
- ✅ **Radial Cluster** — Circular dendrogram
- 🚧 **Fractal Tree** — Radial branching with physics-based layout, variable node weights (in development)

The Fractal Tree view is the one I'm most excited about. It's where this all comes together — where we move beyond simple hierarchies to representations that truly match the complexity of thought.


## Get Started

**Install via Clawhub:**
```bash
clawhub install prd-visualization-skill
```

**Or via Vercel Skills:**
```bash
npx skills add foyri/prd_visualization_skill
```

**View Source:** https://github.com/foyri/prd_visualization_skill


*Built with a belief that better representations lead to better thinking. That when we can see the true shape of our ideas, we can build better things.*

*And with the conviction that in the LLM era, we no longer have to accept simplified versions of reality. We can finally build tools that match the full complexity of how we think.*
