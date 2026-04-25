<!--
---
title: "Frontmatter Tagging Vocabulary"
description: "Concrete tag values for the Proxmox Astronomy Lab repository"
author: "VintageDon"
date: "2026-03-22"
version: "2.0"
status: "Active"
tags:
  - type: reference
  - domain: documentation
related_documents:
  - "[Tagging Strategy Guide](tagging-strategy.md)"
  - "[General KB Template](general-kb-template.md)"
  - "[Interior README Template](interior-readme-template.md)"
  - "[Asset Sheet Template](asset-sheet-template.md)"
  - "[WU Spec Template](wu-spec-template.md)"
---
-->

# Frontmatter Tagging Vocabulary

This document defines the concrete tag values for the Proxmox Astronomy Lab repository. It implements the methodology described in the [Tagging Strategy Guide](tagging-strategy.md). Add new values here as domains expand; consult the strategy guide for design principles.

---

## 1. Required Frontmatter Fields

Every document must include these fields:

| Field | Format | Description |
|-------|--------|-------------|
| `title` | String | Document title (clear, descriptive) |
| `description` | String | One-sentence summary of content and value |
| `author` | String | Primary author identifier |
| `date` | YYYY-MM-DD | Last significant update |
| `version` | X.Y | Semantic version |
| `status` | Enum | Document lifecycle state |
| `tags` | List | Classification tags (see below) |
| `related_documents` | List | Links to related content |

---

## 2. Tag Categories

### 2.1 Type (Required — exactly one)

Document classification. Every document has exactly one type.

| Value | Use For | Template |
|-------|---------|----------|
| `project-root` | Repository root README | `primary-readme-template.md` |
| `directory-readme` | Interior README files for directory navigation | `interior-readme-template.md` |
| `kb-article` | General knowledge base articles | `general-kb-template.md` |
| `asset-sheet` | Hardware, VM, service, database, or license documentation | `asset-sheet-template.md` |
| `wu-spec` | Work unit specifications for agent execution | `wu-spec-template.md` |
| `runbook` | Tactical operational procedures with commands | `runbook-template.md` |
| `procedure` | Governance SOPs with RACI and compliance mapping | `procedure-template.md` |
| `policy` | Governance commitments and principles | `policy-template.md` |
| `worklog` | Milestone directory documentation | `worklog-readme-template.md` |
| `guide` | Step-by-step procedural guides (non-governance) | `general-kb-template.md` |
| `how-to` | Focused task walkthroughs | `general-kb-template.md` |
| `reference` | API, CLI, configuration, or data reference | `general-kb-template.md` |
| `standard` | Technical or documentation standards | `general-kb-template.md` |
| `architecture` | System design and architecture documentation | `general-kb-template.md` |
| `report` | Analysis, findings, summaries | `general-kb-template.md` |

### 2.2 Domain (Required — at least one)

Primary subject area. Documents may have multiple domains if genuinely cross-cutting.

| Value | Scope |
|-------|-------|
| `infrastructure` | Proxmox, networking, storage, physical hardware |
| `kubernetes` | RKE2 cluster, workloads, Helm, operators |
| `ai-ml` | Machine learning, LLMs, model inference |
| `astronomy` | DESI analysis, astronomical computing, research workflows |
| `databases` | PostgreSQL, Neo4j, Redis, pgvector |
| `monitoring` | Prometheus, Grafana, Loki, alerting |
| `networking` | VLANs, firewall, DNS, ZTNA, load balancing |
| `security` | Authentication, authorization, hardening |
| `compliance` | CIS controls, policies, evidence, auditing |
| `documentation` | Documentation standards, templates, methodology |
| `applications` | Deployed services and applications |
| `backup` | Backup, recovery, disaster recovery |
| `storage` | NFS, ZFS, Ceph, block storage, object storage |
| `identity` | Google Workspace, Entra ID, SSO, RBAC |
| `automation` | Ansible, Semaphore, n8n, Windmill, scheduled tasks |
| `agents` | Agent frameworks, orchestration, personas, model cards |

### 2.3 Tech (Optional — when document focuses on specific technologies)

| Category | Values |
|----------|--------|
| **Virtualization** | `proxmox`, `qemu`, `lxc` |
| **Kubernetes** | `rke2`, `helm`, `argocd`, `longhorn`, `cilium` |
| **Databases** | `postgresql`, `neo4j`, `redis`, `pgvector` |
| **Monitoring** | `prometheus`, `grafana`, `loki`, `alertmanager` |
| **AI/ML** | `ollama`, `pytorch`, `huggingface`, `transformers`, `langchain` |
| **Identity** | `google-workspace`, `entra-id`, `keycloak` |
| **Networking** | `pfsense`, `vlan`, `netbird`, `haproxy` |
| **Storage** | `nfs`, `ceph`, `zfs`, `minio` |
| **Automation** | `ansible`, `semaphore`, `n8n`, `windmill` |
| **OS** | `ubuntu`, `debian`, `rocky` |
| **Languages** | `python`, `bash`, `powershell`, `go`, `typescript` |
| **Agents** | `claude-code`, `opencode`, `greptile` |

Add new tech values as needed. Keep granular (specific tools, not categories).

### 2.4 Status (Required — exactly one)

Document lifecycle state.

| Value | Meaning |
|-------|---------|
| `Draft` | Work in progress, not ready for use |
| `Stub` | Placeholder with frontmatter and section headings, content not yet written |
| `Active` | Current, approved, ready for use |
| `Deprecated` | Superseded or outdated, retained for reference |
| `Archived` | Historical, no longer maintained |

### 2.5 Framework (Optional — when document maps to compliance controls)

| Value | Framework |
|-------|-----------|
| `cisv8` | CIS Controls v8 (IG1 baseline — 56 safeguards) |
| `nist-ai-rmf` | NIST AI Risk Management Framework |
| `pacific-ai` | Pacific AI Governance Policy Suite |
| `cis-ram` | CIS Risk Assessment Method |

---

## 3. Examples

### Directory README

```yaml
tags:
  - type: directory-readme
  - domain: infrastructure
```

### VM Asset Sheet

```yaml
tags:
  - type: asset-sheet
  - domain: [infrastructure, monitoring]
  - tech: [ubuntu, prometheus, grafana, loki, alertmanager]
```

### Work Unit Spec

```yaml
tags:
  - type: wu-spec
  - domain: [infrastructure, monitoring]
  - tech: [prometheus, ansible]
```

### Runbook

```yaml
tags:
  - type: runbook
  - domain: databases
  - tech: postgresql
```

### CIS Compliance Policy

```yaml
tags:
  - type: policy
  - domain: [compliance, security]
  - framework: [cisv8, cis-ram]
```

### Stub File

```yaml
tags:
  - type: kb-article
  - domain: networking
  - status: Stub
```

---

## 4. Governance

### Adding New Tag Values

1. Check if existing value covers the concept
2. If new value needed, add to this document with scope definition
3. Use lowercase, hyphenated format
4. Backfill existing documents if the new value applies retroactively

### Avoiding Tag Sprawl

- Prefer existing values over new ones
- Don't create tags for one-off uses
- Consolidate similar concepts under single values
- Review and prune unused tags quarterly

---

## 5. References

| Resource | Relationship |
|----------|--------------|
| [Tagging Strategy Guide](tagging-strategy.md) | Methodology this vocabulary implements |
| [General KB Template](general-kb-template.md) | Template using these tags |
| [Interior README Template](interior-readme-template.md) | Template using these tags |
| [Asset Sheet Template](asset-sheet-template.md) | Template using these tags |
| [WU Spec Template](wu-spec-template.md) | Template using these tags |
| [Runbook Template](runbook-template.md) | Template using these tags |
| [Policy Template](policy-template.md) | Template using these tags |
| [Procedure Template](procedure-template.md) | Template using these tags |

---

## 6. Change Log

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 2.0 | 2026-03-22 | VintageDon | Restructured as vocabulary implementing tagging-strategy. Added type values (wu-spec, runbook, procedure, policy, worklog, project-root). Added domain values (automation, agents, networking, storage). Added framework category. Added Stub status. Aligned date field convention. |
| 1.0 | 2025-12-24 | VintageDon | Initial creation as frontmatter-tagging-standards.md |
