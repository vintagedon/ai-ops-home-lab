<!--
---
title: "ML01 Agents Operational Server"
description: "Bare-metal ML01 server setup for agent orchestration, local LLM inference, and CUDA workloads"
author: "VintageDon"
date: "2026-03-22"
version: "1.0"
status: "Stub"
tags:
  - type: directory-readme
  - domain: [agents, infrastructure, ai-ml]
  - tech: [ollama, pytorch]
related_documents:
  - "[AI Ops](../README.md)"
  - "[Hardware — ML01](../../hardware/README.md)"
---
-->

# ML01 Agents Operational Server

Documentation for ML01 (formerly node07), the bare-metal agent orchestration server. AMD Ryzen 5950X, 128GB RAM, NVIDIA A4000 16GB. Runs Ollama for local LLM inference, agent compute workloads, and CUDA-accelerated processing. All GitHub repos cloned locally to `/opt/repos` for agent filesystem access.

<!-- STUB: Populate with ML01 setup documentation, Ollama configuration, agent access patterns, and /opt/repos structure. -->

---

## 1. Contents

### Files

| File | Description |
|------|-------------|
| `README.md` | This file |

---

## 2. Structure

```
ml01-agents-operational-server/
└── README.md
```

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [AI Ops](../README.md) | Parent directory |
| [Python Venv Global](../python-venv-global/README.md) | Tiered venv running on ML01 |
