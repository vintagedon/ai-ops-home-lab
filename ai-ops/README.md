<!--
---
title: "AI Ops"
description: "Agent tooling, automation workflows, and operational infrastructure for AI-assisted development"
author: "VintageDon"
date: "2026-03-22"
version: "1.0"
status: "Stub"
tags:
  - type: directory-readme
  - domain: [agents, automation, ai-ml]
related_documents:
  - "[Root README](../README.md)"
  - "[AI & Machine Learning](../ai-machine-learning/README.md)"
---
-->

# AI Ops

Agent tooling, automation workflows, and operational infrastructure for AI-assisted development and operations across the Proxmox Astronomy Lab. This directory documents the tools, configurations, and patterns used for agentic coding (Claude Code, Gemini CLI, KiloCode), infrastructure automation (Ansible, n8n, Semaphore), and the ML01 bare-metal agent server.

---

## 1. Contents

### Subdirectories

| Directory | Description | Documentation |
|-----------|-------------|---------------|
| `ansible/` | Ansible playbooks and roles for cluster configuration management | [README](ansible/README.md) |
| `automation-workflows/` | Workflow automation (n8n, Semaphore, Windmill) | [README](automation-workflows/README.md) |
| `claude-code/` | Claude Code configuration, CLAUDE.md patterns, usage documentation | [README](claude-code/README.md) |
| `claude-desktop/` | Claude Desktop MCP configuration and skills | [README](claude-desktop/README.md) |
| `gemini-cli/` | Gemini CLI configuration and usage patterns | [README](gemini-cli/README.md) |
| `kilocli/` | KiloCode CLI configuration and agent setup | [README](kilocli/README.md) |
| `ml01-agents-operational-server/` | ML01 bare-metal server setup for agent orchestration and local inference | [README](ml01-agents-operational-server/README.md) |
| `python-venv-global/` | Tiered Python virtual environment documentation (GPU Full → Desktop GPU → CPU) | [README](python-venv-global/README.md) |
| `repository-project-structure/` | Project template scaffold reference | [README](repository-project-structure/README.md) |
| `vscode-with-kilocode/` | VS Code + KiloCode extension setup and configuration | [README](vscode-with-kilocode/README.md) |

---

## 2. Structure

```
ai-ops/
├── README.md
├── ansible/
├── automation-workflows/
├── claude-code/
├── claude-desktop/
├── gemini-cli/
├── kilocli/
├── ml01-agents-operational-server/
├── python-venv-global/
├── repository-project-structure/
└── vscode-with-kilocode/
```

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [Root README](../README.md) | Parent directory |
| [AI & Machine Learning](../ai-machine-learning/README.md) | Model cards and data science infrastructure |
| [Infrastructure](../infrastructure/README.md) | Cluster hardware and networking that these tools operate on |
| [ethops](https://github.com/radioastronomyio/ethops) | ITIL-driven autonomous DevOps framework — architectural reference for agent operations |
