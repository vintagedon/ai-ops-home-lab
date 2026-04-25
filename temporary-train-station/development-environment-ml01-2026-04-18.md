---
title: ML01 Development Environment Reference
version: "1.0"
updated: 2026-04-18
location: /opt/agents/ML01-ENVIRONMENT.md
purpose: Cross-project context document for AI agents and human operator
tags: [infrastructure, environment, reference]
---

# ML01 Development Environment Reference

radio-ml01 is a bare metal workstation serving as the primary compute and orchestration node for the radioastronomy.io research cluster. This document describes the development environment available on ML01. It is intended to be referenced from any project context so that specs, agents, and planning sessions can target ML01's capabilities without reconstructing them from scratch.

This is not AGENTS.md (which lives per-repo and defines project identity and constraints). This is the environment capability sheet: what is installed, where it lives, how to use it.

## Identity and Access

| Property | Value |
|----------|-------|
| Hostname | radio-ml01 |
| Project VLAN IP | 10.25.20.10 (bond0.20) |
| Management VLAN IP | 10.16.207.67 |
| OS | Ubuntu 24.04 LTS |
| Role | Primary compute, agent orchestration, Ansible control node |

Windows access via Samba: shares are available on the management VLAN IP only. Cross-VLAN SMB via 10.25.20.10 does not work.

| Share | UNC Path |
|-------|----------|
| Public repos | `\\10.16.207.67\repos\` |
| Private repos | `\\10.16.207.67\repos-internal\` |

SMB user: `crainbramp`

## Python Environment

| Property | Value |
|----------|-------|
| Python | 3.12.3 |
| Venv path | `/opt/agents/venv/` |
| Activation | `source /opt/agents/venv/bin/activate` |
| Package count | ~288 |

The venv auto-activates for `agents` group members on login. All Python work on ML01 uses this venv. Do not install packages outside it.

Installed package categories:

| Category | Key packages |
|----------|-------------|
| ML/Deep Learning | torch, transformers, accelerate, huggingface-hub, stable-baselines3, gymnasium, tensorboard |
| Astronomy | astropy, astroquery, pyvo |
| Data | pandas, numpy, scipy, scikit-learn, duckdb, pyarrow |
| NLP | spacy, presidio-analyzer, presidio-anonymizer |
| Database clients | psycopg (PostgreSQL), neo4j, pgvector, SQLAlchemy, pymongo |
| Web/API | fastapi, uvicorn, httpx, requests, mcp |
| Document processing | pdfminer, pdfplumber, pypdf, PyMuPDF, beautifulsoup4, lxml |
| Dev tools | black, ruff, pytest, pre-commit, uv, hypothesis |
| Cloud | boto3, botocore |
| Browser automation | playwright 1.58.0 |

Load environment variables: `set -a && source /opt/agents/.env && set +a`

## Headless Browser (Playwright)

Playwright is installed via both npm (1.59.1) and pip (1.58.0). Chromium headless is confirmed working. Firefox and WebKit browsers are downloaded but missing system dependencies; they are not needed for current use cases.

| Property | Value |
|----------|-------|
| npm version | 1.59.1 |
| pip version | 1.58.0 |
| Browser cache | `~/.cache/ms-playwright/` |
| Chromium | 145.0.7632.6 (headless confirmed) |
| Node.js | 22.22.2 |
| npm | 10.9.7 |

Python usage:

```python
from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)
    page = browser.new_page()
    page.goto("https://example.com")
    # work with page
    browser.close()
```

Node usage: `npx playwright` is available globally.

Spec note: when writing specs that involve browser automation, target Chromium headless only. Do not assume Firefox or WebKit are functional on this host.

## GPU and ML Inference

| Property | Value |
|----------|-------|
| GPU | NVIDIA RTX A4000 |
| VRAM | 16 GB |
| Driver | 595.58.03 |
| CUDA runtime | Bundled with PyTorch (no system nvcc) |
| Ollama | Running on port 11434 |

System `nvcc` is not installed. PyTorch bundles its own CUDA runtime, which is sufficient for training and inference. Custom CUDA kernel compilation would require `nvidia-cuda-toolkit`, but no current workload needs it.

Ollama is running as a system service and serves models from `/mnt/nvme02`. Use `ollama list` to see currently available models.

## Storage Layout

| Mount | Device/Source | Purpose | Write policy |
|-------|--------------|---------|-------------|
| `/mnt/nvme01` | Local NVMe | Write-heavy workloads, Docker data | Primary write target |
| `/mnt/nvme02` | Local NVMe | Read-heavy data, Ollama models | Read-preferred, avoid heavy writes |
| `/mnt/fs02/astronomy-rag` | SMB (10.25.20.15) | Astronomy RAG data | Via fs02 |
| `/mnt/fs02/it-department` | SMB (10.25.20.15) | IT department data | Via fs02 |
| `/mnt/fs02/ml-datasets` | SMB (10.25.20.15) | ML training datasets | Via fs02 |

## Directory Structure

```
/opt/agents/                    # Agent workspace root
├── venv/                       # Shared Python virtual environment
├── .env                        # Environment variables (secrets, 640 perms)
├── config/                     # Agent configuration files
├── logs/                       # Setup logs and operational records
├── work-logs/                  # Centralized agent work logs (YAML frontmatter)
├── AGENTS.md                   # ML01 agent context file
├── ML01-ENVIRONMENT.md         # This document
├── requirements-cuda.txt       # CUDA Python package manifest
└── requirements-base.txt       # Base Python package manifest

/opt/repos/                     # Public repositories (Samba-shared)
├── ethops/
├── proxmox-astronomy-lab/
├── project-template-repository/
├── cosmos2025-anomalies/
└── ...

/opt/repos-internal/            # Private repositories (Samba-shared)
└── ml01-agentic-ops/           # Operational monorepo
    ├── ansible-workflows/      # Ansible control (runs from here)
    ├── docs/                   # VM inventory, infra docs
    └── spec/                   # Spec files (private)
```

## Cluster Services

ML01 connects to cluster services over VLAN20 (10.25.20.x). Connection strings and credentials are in `/opt/agents/.env`. Key services:

| Service | Host | Port | Notes |
|---------|------|------|-------|
| PostgreSQL (primary) | pgsql01 (10.25.20.8) | 5432 | pgvector enabled, 205K TPS read-only baseline |
| PostgreSQL (secondary) | pgsql02 (10.25.20.23) | 5432 | Application databases |
| Neo4j | neo4j01 | 7687 | Graph database |
| DragonflyDB | dfdb01 (10.25.20.20) | 6379 | Redis-compatible cache |
| MongoDB | mongo01 | 27017 | Document store |
| SQL Server | radio-mssql01 (10.25.20.3) | 1433 | FleetInventory OSQuery data |
| Infisical | secrets01 (10.25.20.5) | 8443 | Infrastructure secrets vault |
| ClickHouse | ch01 (10.25.20.6) | 8123 | Langfuse telemetry backend |
| Gitea | repo01 (10.25.20.30) | 3000 | Self-hosted git |
| Prometheus | mon01 (10.25.20.9) | 9090 | Metrics |
| Loki | mon01 (10.25.20.9) | 3100 | Log aggregation |
| Grafana | mon01 (10.25.20.9) | 3000 | Dashboards |
| RabbitMQ | docker01 | 5672 | Message queue |

## Agent Tooling on ML01

| Tool | Purpose | Notes |
|------|---------|-------|
| OpenCode + aoe | Primary coding agent harness | tmux-managed, Z.ai GLM-5.1 via Kilo Gateway |
| Ansible | Fleet automation | Runs as ansible01 user, ed25519 keys, passwordless sudo |
| Grafana Alloy | Telemetry agent | Prometheus scrape + Loki log shipping |
| Ollama | Local inference | A4000, models on nvme02 |

Ansible workflows live at `/opt/repos-internal/ml01-agentic-ops/ansible-workflows/`. The service account is `ansible01` with an ed25519 key and passwordless sudo across the fleet.

## Constraints

These apply to all specs, agents, and manual work on ML01:

1. Venv only. Do not install Python packages outside `/opt/agents/venv/`. No `sudo pip install`, no system-level Python packages.
2. Write targets matter. Write-heavy workloads go to `/mnt/nvme01`. Do not put sustained write loads on `/mnt/nvme02`.
3. Network is hands-off. Do not modify network interfaces, bonds, or VLAN configuration without explicit human approval. Additive-only changes on headless servers; never touch existing interfaces carrying management traffic.
4. apt requires DEBIAN_FRONTEND=noninteractive. All apt operations in specs must set this to prevent interactive prompts on a headless server.
5. Headless Chromium only. Do not target Firefox or WebKit for browser automation on this host. System dependencies for those browsers are not installed.
6. Canonical VM inventory. The authoritative VM list is at `/opt/repos-internal/ml01-agentic-ops/docs/virtual-machine-infrastructure-table.md`. Do not infer fleet membership from other sources.
7. File writes require explicit instruction. Agents and assistants should present content for review before writing to disk.
