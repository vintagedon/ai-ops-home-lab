# Agent Instructions

## Repository Identity

proxmox-astronomy-lab is the public documentation repository for the RadioAstronomy.io Proxmox cluster. This is where infrastructure documentation, hardware specs, service catalogs, compliance artifacts, and research project context live. The cluster itself: 6 Proxmox nodes, 21 active VMs, and ML01 bare metal (5950X/128G/A4000) running ML inference and agent compute.

This repo publishes operational documentation without sanitization. The security boundary is "authenticates or authorizes" (credentials stay out; topology, IPs, VLANs, hostnames are public). ZTNA architecture makes topology exposure low-risk.

**Current status:** Active documentation rewrite. Phase 1 (data migration, template alignment, stub frameout) scaffolding is partially complete. Phase 2 (content hydration via spec-driven agent workflow) has not started.

**Organization context:** RadioAstronomy.io is a volunteer-run organization (6 members) pursuing non-profit status. CrainBramp (VintageDon) is effectively the sole full-time contributor; the rest of the team contributes on a volunteer basis. This shapes infrastructure decisions: tools must be maintainable by one person, automation is a necessity not a luxury, and documentation must be thorough enough for asynchronous collaboration.

## Ecosystem Position

| Repo | Role | Relationship |
|------|------|-------------|
| **proxmox-astronomy-lab** (this repo) | Public cluster documentation | Hardware, services, compliance, research context |
| **ml01-agentic-ops** (private) | Operational monorepo | Ansible, specs, infra docs, agent framework, project management |
| **ethops** (public) | Autonomous IT ops framework | Architecture spec, governance templates, ITIL coordination model |
| **agent-crate** (public) | Portable agent reference architecture | Patterns proven on single box, adapted for cluster reuse |
| **project-template-repository** (public) | Base scaffolding | Canonical templates, tagging strategy, writing style guide |

Template authority flows from project-template-repository (universal) through ethops (governance additions) to this repo (domain-specific additions like asset sheets, frontmatter vocabulary).

## Context Loading

1. This file (`AGENTS.md`) for repository identity and constraints
2. `infrastructure/virtual-machine-infrastructure-table-2026-04-25.md` for live cluster inventory
3. `docs/documentation-standards/` for templates and controlled vocabulary
4. `README.md` for project overview (note: currently stale, pending rewrite)

## Architectural Constraints

### What This Repo Contains

- Hardware asset sheets (Proxmox nodes, networking equipment, bare metal hosts)
- VM inventory and service documentation
- Application/service configuration docs (public-safe portions)
- Compliance artifacts (AI governance, risk scenarios, CIS controls mapping)
- Research project context and model card registry
- Infrastructure topology (network, storage, DHCP, DNS)

### What This Repo Does NOT Contain

- Credentials, API keys, or anything that authenticates or authorizes
- Ansible playbooks, operational scripts, or deployment specs (those live in ml01-agentic-ops)
- Agent framework implementation (ml01-agentic-ops)
- Architecture concepts or framework design (ethops)
- Active work-in-progress specs (ml01-agentic-ops `spec/` directory)

### Infrastructure Facts

- 6 active Proxmox nodes (node01 through node06); node07 decommissioned, became bare-metal ML01
- 21 active VMs across two VLANs: management (10.16.207.x) and project (10.25.20.x)
- Kubernetes decommissioned (RKE2 cluster deleted, all references are stale)
- Hostnames use `radio-` prefix only for Windows domain-joined VMs (DCs, MSSQL, file servers); Linux VMs dropped the prefix
- Monitoring stack: Prometheus, Grafana, Loki on mon01. Most Linux and PostgreSQL targets UP. Gaps: Windows exporters, NVIDIA GPU exporter, a few specialty exporters. AlertManager running but no rules configured.
- Docker01 runs 12 containers via Compose (Traefik, RabbitMQ, PGAdmin, AnythingLLM, Qdrant, Uptime Kuma, Miniflux, CISO Assistant, Homelable)
- Agent coordination: spec-driven workflow with RabbitMQ task queue, action register in PostgreSQL

### Documentation Phase Context

Phase 1 work converts legacy documentation into standardized templates and frames out stub files for planned documentation. This is data migration plus scaffolding, not new conceptual writing.

Phase 2 work will use the spec-driven agent workflow (Claude Code on Sonnet) to hydrate stubs with content. Specs define deliverables, validation criteria, and execution environment; agents consume specs and write to the repo.

### Pattern Pipeline

agent-crate (single-box reference architecture) serves as the proving ground for infrastructure and agent workflow patterns. Patterns are developed and validated there, then adapted for ML01 and the cluster. This repo documents the cluster-side results, not the experimentation process. When documenting services or infrastructure patterns, note whether they originated from agent-crate proving or were developed directly on the cluster.

### Service Status Granularity

A VM being provisioned is not the same as a service being operational. Documentation must distinguish between:

- **VM provisioned, service operational** (e.g., auto01 running n8n + Nginx Proxy Manager; repo01 running Gitea)
- **VM provisioned, service installed but not active** (e.g., itop01 has iTop installed, not yet in use for ethops coordination)
- **VM provisioned, awaiting service standup** (e.g., ch01 has the fleet baseline but ClickHouse is not installed)
- **VM provisioned, service offline** (e.g., neo4j01 provisioned, needs permanent configuration decision)

The fleet-wide baseline for every VM is: OS installed and updated, ansible01 user with ed25519 key and passwordless sudo, Prometheus node_exporter scraping (most Linux targets UP, Windows exporters pending). This baseline is complete across the fleet. No Ansible workflows are deployed yet, but the access layer is in place.

## Documentation Conventions

- All Markdown files require YAML frontmatter in HTML comment blocks (see `docs/documentation-standards/frontmatter-tagging-vocabulary.md`)
- New directories require an interior README (see `docs/documentation-standards/interior-readme-template.md`)
- Script files require language-appropriate headers (see `docs/documentation-standards/script-header-*.md`)
- Follow dual-audience commenting for code (see `docs/documentation-standards/code-commenting-dual-audience.md`)
- Suppress em dashes, negation parallelism, inflated significance language, and AI writing tells in all output
- Template selection: use the tree in `docs/documentation-standards/` to pick the correct template for each document type
- Semantic numbering with preserved gaps: if section 4 is omitted, numbering goes 1, 2, 3, 5

### Stale Content Markers

The repository contains legacy content from earlier architectural visions. Known stale references:

- Any mention of RKE2, Kubernetes, or K8s (cluster decommissioned)
- References to 7 nodes (node07 is now bare-metal ML01)
- "Enterprise-grade" framing (simplified to research computing platform)
- Cloudflare references for zero-trust (replaced by Netbird ZTNA)
- Services not in current inventory: Kasm Workspaces, NetBox

### Identity and Communication (In Flux)

The primary IdP and collaboration stack is currently unsettled. As of April 2026:

- **Current state:** Google Workspace Enterprise is primary IdP. Azure Entra tenancy is alive but licenses removed (except one). Netbird for ZTNA.
- **Entra investment:** The Azure tenancy is substantial: conditional access policies, resource groups, Copilot, hybrid on-prem AD with the cluster's domain controllers, Intune Suite. Google Workspace was a cost optimization (carrying E5/E3 + Intune Suite for a volunteer org was unsustainable), not a preference. The tenancy infrastructure is intact; only the per-seat licenses were removed.
- **Under discussion:** Work (MSP4) may sponsor M365 licenses for the team (6 members; E5 for CrainBramp, E3/G3 for volunteers). If cost is fully covered, reverting to Microsoft as primary IdP is straightforward: re-enable licenses, repoint MX records. This conversation is days old (late April 2026) with no timeline.
- **Agent communication:** Slack is the likely platform due to better integration with agentic workflows. This may coexist with either IdP choice.
- **Copilot:** One Copilot license is active for copilot toolkit development work.

Do not assume Google Workspace or Microsoft is the permanent answer. Both paths remain open. Documents referencing either should note the current state without implying permanence.

### Branch Hygiene

The `temporary-train-station/` directory at repo root holds stale files preserved for potential data mining before permanent deletion. This directory and its contents must be deleted and removed from git cache before merging the current branch to main.

## Commit Messages

- Present tense, imperative mood
- 72-character first line limit
- Reference issues after first line

## Session Pattern

1. Load context (this file + VM inventory)
2. Check `docs/documentation-standards/` for applicable templates
3. Work within defined scope
4. Document changes appropriately
5. Flag stale content with `<!-- STALE: [description] -->` review comments
