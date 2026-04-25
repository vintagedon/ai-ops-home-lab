<!--
---
title: "Applications and Services"
description: "Service documentation for all deployed and planned applications on the Proxmox Astronomy Lab"
author: "VintageDon"
date: "2026-03-22"
version: "2.0"
status: "Active"
tags:
  - type: directory-readme
  - domain: [applications, infrastructure]
related_documents:
  - "[Root README](../README.md)"
  - "[Infrastructure](../infrastructure/README.md)"
  - "[Hardware](../hardware/README.md)"
---
-->

# Applications and Services

Service documentation for all deployed and planned applications on the Proxmox Astronomy Lab cluster. Each service directory contains an overview README, instance-level asset sheets, and operational runbooks following the Diataxis documentation pattern.

---

## 1. Service Inventory

### Active Services

| Service | Description | Domain |
|---------|-------------|--------|
| [PostgreSQL](postgresql/README.md) | Relational database engine for research data and application workloads | databases |
| [Neo4j](neo4j/README.md) | Graph database for relationship-heavy astronomical data | databases |
| [DragonflyDB](dragonflydb/README.md) | Redis-compatible in-memory data store | databases |
| [Prometheus](prometheus/README.md) | Metrics collection and time-series database | monitoring |
| [Grafana](grafana/README.md) | Visualization and dashboarding for metrics and logs | monitoring |
| [Loki](loki/README.md) | Log aggregation and querying | monitoring |
| [Alertmanager](alertmanager/README.md) | Alert routing, grouping, and notification | monitoring |
| [Wazuh](wazuh/README.md) | SIEM, EDR, and security compliance monitoring | security |
| [Active Directory](active-directory/README.md) | Windows AD domain services, secondary to Google Workspace | identity, security |
| [Docker](docker/README.md) | Container runtime hosting multiple services | infrastructure |
| [Proxmox](proxmox/README.md) | Hypervisor platform managing cluster virtualization | infrastructure |
| [Nginx Proxy Manager](nginx-proxy-manager/README.md) | Reverse proxy and SSL termination | networking |
| [Netbird](netbird/README.md) | Zero-trust network access for remote connectivity | networking, security |
| [Ollama](ollama/README.md) | Local LLM inference server on ML01 | ai-ml, agents |
| [Open WebUI](openwebui/README.md) | Web interface for Ollama and local LLM interaction | ai-ml |
| [Kasm Workspaces](kasm-workspaces/README.md) | Browser-based VDI and containerized desktop access | applications |
| [pgAdmin 4](pgadmin4/README.md) | Web-based PostgreSQL administration interface | databases |
| [NetBox](netbox/README.md) | IP address management and data center infrastructure management | networking, infrastructure |

### Planned Services

| Service | Description | Domain |
|---------|-------------|--------|
| [Gitea](gitea/README.md) | Self-hosted Git server, planned for repo01 on node04 | applications, automation |
| [Semaphore](semaphore/README.md) | Ansible UI and task runner, planned for auto01 on node04 | automation |
| [n8n](n8n/README.md) | Workflow automation platform, planned for auto01 on node04 | automation |
| [Windmill](windmill/README.md) | Developer-focused workflow and script automation, planned for auto01 | automation |

### Status Unknown - Review Required

<!-- Delete these directories if the service is confirmed decommissioned -->

| Service | Description | Domain |
|---------|-------------|--------|
| [MongoDB](mongodb/README.md) | Document database | databases |
| [MSSQL](mssql/README.md) | Microsoft SQL Server | databases |
| [RabbitMQ](rabbitmq/README.md) | Message broker | applications |
| [Redis Commander](redis-commander/README.md) | Web-based Redis management UI | databases |
| [LLM Studio](llmstudio/README.md) | Local LLM experimentation interface | ai-ml |

### Identity and Cloud Providers

Documented as KB articles rather than service directories - these are platform decisions, not instances.

| Provider | Documentation |
|----------|---------------|
| Google Workspace Enterprise | [google-workspace-enterprise.md](identity-and-cloud/google-workspace-enterprise.md) |
| Microsoft Azure | [microsoft-azure.md](identity-and-cloud/microsoft-azure.md) |
| AWS | [aws.md](identity-and-cloud/aws.md) |
| Atlassian | [atlassian.md](identity-and-cloud/atlassian.md) |

---

## 2. Document Types per Service

Each service directory follows the Diataxis documentation pattern through template selection:

| Document Type | Template | Diataxis Mode | Example |
|---------------|----------|---------------|---------|
| Service README | interior-readme-template | Explanation | Architecture decisions, configuration philosophy |
| Instance Asset Sheet | asset-sheet-template | Reference | pgsql01 specs, resource allocation, CIS controls |
| Runbook | runbook-template | How-To | Backup procedure, failover steps, scaling |
| KB Article | general-kb-template | Explanation | Technology overview, integration patterns |

---

## 3. Structure

```
applications-and-services/
+-- README.md
+-- active-directory/
+-- alertmanager/
+-- docker/
+-- dragonflydb/
+-- gitea/
+-- grafana/
+-- identity-and-cloud/
|   +-- google-workspace-enterprise.md
|   +-- microsoft-azure.md
|   +-- aws.md
|   +-- atlassian.md
+-- kasm-workspaces/
+-- loki/
+-- mongodb/
+-- mssql/
+-- n8n/
+-- neo4j/
+-- netbird/
+-- netbox/
+-- nginx-proxy-manager/
+-- ollama/
+-- openwebui/
+-- pgadmin4/
+-- postgresql/
+-- prometheus/
+-- proxmox/
+-- rabbitmq/
+-- redis-commander/
+-- semaphore/
+-- wazuh/
+-- windmill/
```

---

## 4. Related

| Resource | Relationship |
|----------|--------------|
| [Root README](../README.md) | Parent directory |
| [Infrastructure](../infrastructure/README.md) | VM specs and network configuration |
| [Hardware](../hardware/README.md) | Physical node documentation |
| [AI Ops](../ai-ops/README.md) | Agent tooling that interacts with these services |
| [Compliance](../compliance/README.md) | CISv8 IG1 controls applied to these services |
