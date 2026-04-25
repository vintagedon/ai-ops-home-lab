<!--
---
title: "Data Science Infrastructure Reference"
description: "Cluster capability snapshot for agents, GDR prompts, and project context"
author: "VintageDon"
date: "2026-04-07"
version: "3.0"
status: "Active"
tags:
  - type: reference
  - domain: infrastructure
  - tech: [postgresql, neo4j, gpu, proxmox, ollama]
---
-->

# Data Science Infrastructure Reference

Portable cluster context for the radioastronomy.io research cluster. This document serves three audiences: GDR prompts (infrastructure capability and capacity are settled facts, not open questions), coding agents (connection patterns and env vars at the end of this document), and human operators.

Canonical VM inventory lives in `ml01-agentic-ops/docs/virtual-machine-infrastructure-table.md`. This document is a curated subset covering data science and agent infrastructure with proven performance baselines.

---

## Cluster Overview

Six Proxmox nodes (node01 through node06) running 19 active VMs, plus ML01 as a bare-metal compute lead. Total cluster capacity is 112 threads and 576G RAM across the hypervisor nodes. Current allocation is 66 vCPU and 248G vRAM, leaving substantial headroom on every node. Additional VMs can be provisioned from templates in minutes. Up to 1.5TB of enterprise NVMe storage can be added at any time.

---

## Data Science VM Group

These are the VMs relevant to data science, agent operations, and supporting services. Infrastructure VMs (domain controllers, ZTNA, security) are omitted.

| Hostname | IP | Node | vCPU | RAM | Storage | Role | Status |
|----------|-----|------|------|-----|---------|------|--------|
| pgsql01 | 10.25.20.8 | node06 | 8 | 32G | 250G NVMe | Primary research PostgreSQL (pgvector, postgis) | Active, proven |
| pgsql02 | 10.25.20.16 | node01 | 4 | 16G | 100G | Application PostgreSQL (Gitea, local apps) | Active |
| neo4j01 | 10.25.20.32 | node04 | 4 | 16G | 100G | Neo4j graph database | Provisioned, offline, pending permanent config |
| mongo01 | 10.25.20.18 | node03 | 2 | 4G | 100G | MongoDB | Available, unused |
| dfdb01 | 10.25.20.23 | node02 | 2 | 8G | 32G | DragonflyDB (agent caching) | Active |
| docker01 | 10.25.20.14 | node06 | 6 | 24G | 100G | Primary Docker host (Traefik, RabbitMQ, PGAdmin, more) | Active |
| auto01 | 10.25.20.33 | node04 | 4 | 16G | 100G | Automation (Semaphore, n8n, Windmill) | Active |
| mon01 | 10.25.20.9 | node05 | 4 | 12G | 500G | Prometheus, Grafana, Loki, AlertManager | Active |
| repo01 | 10.25.20.30 | node04 | 2 | 8G | 100G | Gitea git server (standalone, AD auth) | Active |
| itop01 | 10.25.20.31 | node04 | 2 | 8G | 100G | iTop ITSM | Installed, not yet active for ethops |
| radio-mssql01 | 10.25.20.3 | node01 | 4 | 32G | 125G+ | SQL Server 2022 (FleetInventory DB) | Active |
| radio-fs02 | 10.25.20.15 | node05 | 4 | 6G | 275G | Windows SMB (astronomy data, DESI Parquets) | Active |
| ml01 | 10.25.20.10 / 10.16.207.67 | Bare metal | 16C/32T | 128G | 4TB NVMe | ML inference, agent compute, Ansible control | Active |

ML01 has dual network interfaces: project VLAN (10.25.20.10) for service traffic and management VLAN (10.16.207.67) for Prometheus scraping, SMB access, and SSH. SMB connections must use the management IP; project VLAN SMB fails silently.

---

## Storage Performance

Database VMs on node06 (pgsql01, docker01) share a Samsung PM983 NVMe pool. Tested baselines:

| Metric | Specification | Current Utilization | Headroom |
|--------|---------------|---------------------|----------|
| Sequential Read | 3,000 MB/s | ~1.0 GiB/s | ~3x |
| Sequential Write | 1,400 MB/s | Minimal | Significant |
| Random Read IOPS | 480,000 | ~65,000 | 7-8x |
| Random Write IOPS | 42,000 | Minimal | Significant |

At current utilization levels, multiple VMs share this storage without performance degradation. Storage is not a bottleneck for any workload on this cluster.

ML01 bare-metal storage: Samsung PM983 2TB NVMe (/mnt/nvme01, write-heavy workloads) and ORICO 2TB NVMe (/mnt/nvme02, read-heavy workloads), plus a 512GB SATA boot drive.

---

## PostgreSQL Performance (pgsql01)

pgsql01 is PostgreSQL 16 with pgvector and postgis extensions. It has been extensively benchmarked and has never been saturated under any workload thrown at it.

| Workload | Throughput | Latency | Notes |
|----------|------------|---------|-------|
| Read-only (hot cache) | 205,000 TPS | 0.078ms | CPU-bound, not I/O limited |
| Durable writes | 20-22,000 TPS | 0.8-1.5ms | Optimal at 16-32 connections |
| Bulk ingestion | 2-4x improvement | Varies | Use `synchronous_commit = off` |

Performance is limited by WAL commit/flush, not storage bandwidth. Extensions installed: pg_stat_statements, plpgsql, pgvector, postgis. No pgvector-specific tuning has been done yet; default configuration handles current embedding workloads without issue.

pgsql02 is strictly for application databases (Gitea, future local apps). No research data.

---

## GPU and Inference

ML01 provides all GPU inference for the cluster via Ollama on an NVIDIA RTX A4000 (16GB VRAM). The 16GB VRAM is the hard ceiling for model sizing. Current models loaded through Ollama serve linting, lightweight inference, and agent support tasks.

Agent runtimes on ML01: OpenCode (primary coding harness, Z.ai GLM Coding Plan), aoe (tmux session manager), Claude Code. Repos live at `/opt/repos/` (public) and `/opt/repos-internal/` (private). Global agent venv at `/opt/agents/venv/`. Worklogs written to `/opt/agents/work-logs/`.

Ollama endpoint: `http://10.25.20.10:11434` (project VLAN) or `http://10.16.207.67:11434` (management VLAN).

---

## Service Stack

### docker01 (Docker Compose)

Traefik v3 (reverse proxy, Cloudflare DNS challenge, wildcard TLS), RabbitMQ (AMQP 5672, agent task coordination), PGAdmin (pgsql01/pgsql02 management), AnythingLLM (RAG, Ollama backend on ML01), Qdrant (vector database), Uptime Kuma (availability monitoring), Miniflux (RSS aggregator), CISO Assistant (GRC platform), Homelable (lab dashboard).

### auto01 (Docker Compose)

Semaphore (Ansible UI), n8n (workflow automation), Windmill (script/workflow engine).

### Standalone Services

Gitea on repo01 (PostgreSQL backend on pgsql02, AD auth, agent accounts), iTop ITSM on itop01 (installed, pending ethops activation), Neo4j on neo4j01 (provisioned, offline, needs permanent configuration), Prometheus/Grafana/Loki on mon01 (Prometheus and Grafana operational; Loki needs global log shipping config).

---

## Monitoring

Prometheus on mon01 scrapes all data science VMs via node_exporter (Linux), windows_exporter (Windows VMs), cAdvisor (Docker hosts), PostgreSQL exporters (pgsql01/02), MongoDB exporter, and NVIDIA GPU exporter on ML01 (management VLAN, port 9835). Grafana dashboards cover cluster health, VM resource utilization, and database performance. Loki is deployed but global log shipping is not yet configured.

SNMP monitoring covers labswitch02 (operational) and labswitch03 (SNMP does not enable on this unit).

---

## Connection Patterns

All research VMs source credentials from `/opt/global-env/research.env`. Load this file rather than hardcoding connection details.

```bash
# Shell
set -a && source /opt/global-env/research.env && set +a
```

```python
# Python
from dotenv import load_dotenv
load_dotenv('/opt/global-env/research.env')
```

### Key Environment Variables

| Variable | Value | Description |
|----------|-------|-------------|
| `PGSQL01_HOST` | 10.25.20.8 | Research PostgreSQL |
| `PGSQL01_PORT` | 5432 | |
| `PGSQL01_ADMIN_USER` | clusteradmin_pg01 | Admin credentials (password in env) |
| `PGSQL02_HOST` | 10.25.20.16 | Application PostgreSQL |
| `PGSQL02_PORT` | 5432 | |
| `PGSQL02_ADMIN_USER` | clusteradmin_pg02 | Admin credentials (password in env) |
| `NEO4J_HOST` | 10.25.20.32 | Graph database (when online) |
| `NEO4J_PORT` | 7687 | |
| `NEO4J_USER` | neo4j | |
| `MONGO_HOST` | 10.25.20.18 | Document database (unused) |
| `MONGO_PORT` | 27017 | |
| `OLLAMA_ENDPOINT` | http://10.25.20.10:11434 | GPU inference |

### PostgreSQL Connection

```python
import os, psycopg2

conn = psycopg2.connect(
    host=os.getenv('PGSQL01_HOST'),
    port=os.getenv('PGSQL01_PORT'),
    user=os.getenv('PGSQL01_ADMIN_USER'),
    password=os.getenv('PGSQL01_ADMIN_PASSWORD'),
    database=os.getenv('PGSQL01_DESIVAST_DB')
)
```

Research databases on pgsql01: `PGSQL01_DESIVAST_DB` (DESI-VAST void catalog), `PGSQL01_FASTSPEC_DB` (FastSpecFit spectroscopic data), `PGSQL01_COSMICVOIDS_ARD_DB` (cosmic voids ARD), `PGSQL01_RBH1_DB` (RBH-1 validation data).

### Neo4j Connection

```python
from neo4j import GraphDatabase

driver = GraphDatabase.driver(
    f"bolt://{os.getenv('NEO4J_HOST')}:{os.getenv('NEO4J_PORT')}",
    auth=(os.getenv('NEO4J_USER'), os.getenv('NEO4J_PASSWORD'))
)
```

### Ollama Inference

```python
import requests

response = requests.post(
    f"{os.getenv('OLLAMA_ENDPOINT')}/api/generate",
    json={"model": "llama3", "prompt": "..."}
)
```

---

## Related

| Document | Relationship |
|----------|--------------|
| `ml01-agentic-ops/docs/virtual-machine-infrastructure-table.md` | Canonical VM inventory (full cluster) |
| [Proxmox Astronomy Lab](https://github.com/radioastronomyio/proxmox-astronomy-lab) | Full infrastructure documentation |