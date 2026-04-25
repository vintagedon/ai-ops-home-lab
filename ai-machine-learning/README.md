<!--
---
title: "AI & Machine Learning"
description: "AI governance, model documentation, and data science infrastructure for the Proxmox Astronomy Lab"
author: "VintageDon"
date: "2026-03-22"
version: "1.0"
status: "Active"
tags:
  - type: directory-readme
  - domain: [ai-ml, agents]
related_documents:
  - "[Root README](../README.md)"
  - "[Compliance — AI Model Registry](../compliance/ai-model-registry/README.md)"
  - "[NIST AI RMF Cookbook](https://github.com/vintagedon/nist-ai-rmf-cookbook)"
---
-->

# AI & Machine Learning

AI governance artifacts, deployed model documentation, and data science infrastructure reference for the Proxmox Astronomy Lab. This directory bridges the NIST AI RMF Cookbook (policy layer) with operational deployment on this cluster.

---

## 1. Contents

### Files

| File | Description |
|------|-------------|
| `README.md` | This file |

### Subdirectories

| Directory | Description | Documentation |
|-----------|-------------|---------------|
| `data-science-infrastructure/` | Connection details and usage patterns for cluster research VMs | [README](data-science-infrastructure/README.md) |
| `model-card-repository/` | Reference library of 130+ AI model cards in YAML (all vendors) | [README](model-card-repository/README.md) |
| `model-cards/` | Deployed model cards for models actively used on this cluster | [README](model-cards/README.md) |

---

## 2. Structure

```
ai-machine-learning/
├── README.md
├── data-science-infrastructure/
│   ├── README.md
│   └── data-science-infrastructure-v2-2025-12-28.md
├── model-card-repository/
│   ├── README.md
│   └── *.yaml (130+ model cards)
└── model-cards/
    ├── README.md
    ├── anthropic-claude-opus-42/
    ├── anthropic-claude-sonnet-45/
    ├── gemini-pro-25-deep-research/
    ├── google-gemini-pro-25/
    ├── google-gemini-pro-25-cli/
    ├── google-gemini-pro-25-cli-with-code-assist-standard/
    ├── google-gemini-pro-25-flash/
    └── zai-glm-46/
```

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [Root README](../README.md) | Parent directory |
| [Compliance](../compliance/README.md) | AI policies and standards that govern model deployment |
| [NIST AI RMF Cookbook](https://github.com/vintagedon/nist-ai-rmf-cookbook) | Policy stack source — Pacific AI Suite → Cookbook → CIS-RAM → CISv8 IG1 |
