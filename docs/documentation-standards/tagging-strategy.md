<!--
---
title: "Tagging Strategy Guide"
description: "How to build a controlled vocabulary for document classification"
author: "VintageDon"
date: "2026-03-22"
version: "1.0"
status: "Active"
tags:
  - type: guide
  - domain: documentation
related_documents:
  - "[Frontmatter Tagging Vocabulary](frontmatter-tagging-vocabulary.md)"
  - "[Interior README Template](interior-readme-template.md)"
  - "[General KB Template](general-kb-template.md)"
---
-->

# Tagging Strategy Guide

## 1. Purpose

This guide explains how to build a controlled tag vocabulary for a repository or documentation system. Consistent tagging enables human navigation and RAG system retrieval.

---

## 2. Why Controlled Vocabulary

Uncontrolled tagging leads to:

- Synonyms fragmenting search (`database` vs `db` vs `databases`)
- Inconsistent granularity (`postgres` vs `relational-database`)
- Tag proliferation that reduces signal

A controlled vocabulary defines allowed values upfront, ensuring consistency across contributors and time.

---

## 3. Tag Category Design

Build your vocabulary around orthogonal dimensions. Each category answers a different question about the document.

### Recommended Categories

| Category | Question Answered | Example Values |
|----------|-------------------|----------------|
| `type` | What kind of document is this? | `guide`, `reference`, `specification`, `directory-readme` |
| `domain` | What subject area? | Project-specific: define based on your content |
| `status` | What's the lifecycle state? | `draft`, `active`, `deprecated`, `archived` |
| `tech` | What technologies involved? | `python`, `docker`, `postgres`, etc. |
| `audience` | Who is this for? | `beginners`, `intermediate`, `advanced`, `all` |

### Category Guidelines

- **Keep categories orthogonal** — each should capture a distinct dimension
- **Limit to 4-6 categories** — more becomes unwieldy
- **Define allowed values** — enumerated lists, not free-form
- **One value per category is typical** — multi-value only when genuinely needed

---

## 4. Building Domain Tags

Domain tags are project-specific. To build yours:

### Step 1: Inventory Content Types

What kinds of content does this repository contain? Group by function, not format.

### Step 2: Define Categories

Create 5-15 domain values that cover your content without excessive overlap.

### Step 3: Document Boundaries

For each domain tag, write a one-sentence definition clarifying what belongs and what doesn't.

### Example Domain Vocabulary

```yaml
# For a DevOps cookbook repository
domain:
  - databases        # Database deployments and management
  - networking       # VPNs, DNS, proxies, network infrastructure
  - monitoring       # Observability, metrics, log aggregation
  - automation       # Ansible, runbooks, workflow automation
  - ci-cd            # Git servers, CI/CD pipelines
  - security         # Auth, secrets, vulnerability scanning
```

---

## 5. Type Tags

Document types are usually universal across projects:

| Tag | Use For |
|-----|---------|
| `directory-readme` | README for a directory (interior READMEs) |
| `project-root` | Repository root README |
| `guide` | Step-by-step procedures |
| `reference` | Lookup information (data dictionary, schema, API) |
| `specification` | Formal requirements or standards |
| `worklog` | Work log milestone documentation |
| `report` | Analysis, findings, summaries |

---

## 6. Status Tags

Standard lifecycle states:

| Tag | Description |
|-----|-------------|
| `draft` | In development, not yet complete |
| `active` | Current, maintained |
| `deprecated` | Superseded, avoid for new work |
| `archived` | Historical reference only |

---

## 7. Implementation

### In YAML Frontmatter

```yaml
<!--
---
title: "Document Title"
description: "What this document covers"
tags:
  - type: guide
  - domain: networking
  - tech: [traefik, docker]
  - status: active
  - audience: intermediate
---
-->
```

### Conventions

- Use lowercase, hyphenated values (`ci-cd` not `CI/CD` or `cicd`)
- Tech tags use canonical names (`postgres` not `postgresql`)
- One value per line for readability, or array syntax for multi-value

---

## 8. Maintaining the Vocabulary

### Adding New Tags

1. Check if existing tag covers the concept
2. If not, propose new tag with definition
3. Update vocabulary document
4. Backfill existing documents if needed

### Governance

- Keep vocabulary in version control
- Review additions for overlap with existing tags
- Prefer broader tags over proliferating specific ones

---

## 9. Template

Use this structure to document your project's tagging vocabulary:

```markdown
# [Project] Tagging Vocabulary

## Domain Tags
| Tag | Description |
|-----|-------------|
| `value` | What it means, what belongs here |

## Type Tags
[Use standard types or customize]

## Tech Tags
[List technologies relevant to your project]

## Status Tags
[Use standard statuses]

## Audience Tags
[If applicable]
```

---

## 10. References

| Resource | Description |
|----------|-------------|
| [Frontmatter Tagging Vocabulary](frontmatter-tagging-vocabulary.md) | Concrete tag values for this repository |
| [Interior README Template](interior-readme-template.md) | Shows tag usage in frontmatter |
| [General KB Template](general-kb-template.md) | Shows tag usage for standalone docs |

<!--
TEMPLATE USAGE NOTES (remove when using):

This is a METHODOLOGY guide, not a vocabulary document. It teaches HOW to
build a tagging system. The actual tag values for a specific project belong
in a separate vocabulary document that implements this strategy.

Relationship:
  tagging-strategy.md (this file) = HOW to design tags
  frontmatter-tagging-vocabulary.md = WHAT tags exist for this repo
-->
