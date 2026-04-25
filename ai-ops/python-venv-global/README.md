<!--
---
title: "Python Venv Global"
description: "Tiered Python virtual environment documentation for cluster research workloads"
author: "VintageDon"
date: "2026-03-22"
version: "1.0"
status: "Stub"
tags:
  - type: directory-readme
  - domain: [ai-ml, infrastructure]
  - tech: [python, pytorch]
related_documents:
  - "[AI Ops](../README.md)"
  - "[ML01 Agents Server](../ml01-agents-operational-server/README.md)"
---
-->

# Python Venv Global

Documentation for the tiered Python 3.12 virtual environment system shared across cluster VMs. Three tiers provide appropriate dependencies based on available hardware: GPU Full (ML01 with A4000), Desktop GPU (workstation), and CPU-only (cluster VMs without GPU access).

<!-- STUB: Populate with tier definitions, package manifests, installation procedures, and usage patterns for each tier. -->

---

## 1. Contents

### Files

| File | Description |
|------|-------------|
| `README.md` | This file |

---

## 2. Structure

```
python-venv-global/
└── README.md
```

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [AI Ops](../README.md) | Parent directory |
| [ML01 Agents Server](../ml01-agents-operational-server/README.md) | Primary host for GPU Full tier |
