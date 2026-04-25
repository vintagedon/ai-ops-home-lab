<!--
---
title: "Deployed Model Cards"
description: "AI governance documentation for models actively deployed on the Proxmox Astronomy Lab cluster"
author: "VintageDon"
date: "2026-03-22"
version: "1.0"
status: "Active"
tags:
  - type: directory-readme
  - domain: [ai-ml, compliance, agents]
related_documents:
  - "[AI & Machine Learning](../README.md)"
  - "[Model Card Repository](../model-card-repository/README.md)"
  - "[AI Model Registry](../../compliance/ai-model-registry/README.md)"
---
-->

# Deployed Model Cards

AI governance documentation for models actively deployed and used on the Proxmox Astronomy Lab cluster. Each subdirectory contains a YAML model card documenting capabilities, risk profiles, and compliance mappings for a specific model in operational use.

This is distinct from the [Model Card Repository](../model-card-repository/README.md), which is the broader reference library of 130+ models across all vendors. This directory tracks only what's running here.

---

## 1. Contents

### Deployed Models

| Directory | Model | Primary Use |
|-----------|-------|-------------|
| `anthropic-claude-opus-42/` | Claude Opus 4.2 | Research analysis, complex reasoning, documentation |
| `anthropic-claude-sonnet-45/` | Claude Sonnet 4.5 | Code generation, agent tasks, general assistance |
| `gemini-pro-25-deep-research/` | Gemini Pro 2.5 Deep Research | Literature review, landscape research |
| `google-gemini-pro-25/` | Gemini Pro 2.5 | Multimodal analysis, research tasks |
| `google-gemini-pro-25-cli/` | Gemini Pro 2.5 CLI | Command-line agent operations |
| `google-gemini-pro-25-cli-with-code-assist-standard/` | Gemini Pro 2.5 CLI + Code Assist | Assisted code generation with Google tooling |
| `google-gemini-pro-25-flash/` | Gemini Pro 2.5 Flash | Fast inference, lightweight tasks |
| `zai-glm-46/` | GLM 4.6 (Zhipu AI) | Local inference, KiloCode agent |

---

## 2. Structure

```
model-cards/
├── README.md
├── anthropic-claude-opus-42/
│   └── anthropic-claude-42-opus-model-card.yaml
├── anthropic-claude-sonnet-45/
│   └── *.yaml
├── gemini-pro-25-deep-research/
│   └── *.yaml
├── google-gemini-pro-25/
│   └── *.yaml
├── google-gemini-pro-25-cli/
│   └── *.yaml
├── google-gemini-pro-25-cli-with-code-assist-standard/
│   └── *.yaml
├── google-gemini-pro-25-flash/
│   └── *.yaml
└── zai-glm-46/
    └── *.yaml
```

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [AI & Machine Learning](../README.md) | Parent directory |
| [Model Card Repository](../model-card-repository/README.md) | Full reference library (130+ models, all vendors) |
| [AI Model Registry](../../compliance/ai-model-registry/README.md) | Compliance registry linking deployed models to governance |
| [AI Governance Policy](../../compliance/policies/01-ai-governance-policy.md) | Policy governing model deployment and use |
