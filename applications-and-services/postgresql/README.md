<!--
---
title: "PostgreSQL"
description: "Relational database engine for research data and application workloads"
author: "VintageDon"
date: "2026-03-22"
version: "1.0"
status: "Active"
tags:
  - type: directory-readme
  - domain: [databases]
  - tech: [postgresql, pgvector]
related_documents:
  - "[Applications and Services](../README.md)"
---
-->

# PostgreSQL

Relational database engine for research data and application workloads.

<!-- STUB: Populate with service overview, configuration philosophy, architecture decisions, and links to instance asset sheets and runbooks. -->

---

## 1. Contents

### Files

| File | Description |
|------|-------------|
| `README.md` | This file |

### Instances

| Instance | Description |
|----------|-------------|
| `pgsql01` | Research data [pgvector, DESI, 8 vCPU/32G] |
| `pgsql02` | Application workloads [Gitea, local apps, 4 vCPU/16G] |
---

## 2. Structure

```
postgresql/
+-- README.md
```

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [Applications and Services](../README.md) | Parent directory |
