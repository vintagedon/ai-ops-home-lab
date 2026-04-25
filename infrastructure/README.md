<!--
---
title: "Infrastructure"
description: "Platform-layer infrastructure documentation including networking, storage, DNS, DHCP, and VM inventory"
author: "VintageDon"
date: "2026-03-22"
version: "1.0"
status: "Active"
tags:
  - type: directory-readme
  - domain: [infrastructure, networking, storage]
related_documents:
  - "[Root README](../README.md)"
  - "[Hardware](../hardware/README.md)"
  - "[Applications and Services](../applications-and-services/README.md)"
---
-->

# Infrastructure

Platform-layer infrastructure documentation covering networking, storage, DNS, DHCP, file services, and the authoritative VM inventory. This directory documents the platform that services run on, distinct from `applications-and-services/` which documents the services themselves, and `hardware/` which documents the physical nodes.

---

## 1. Contents

### Files

| File | Description |
|------|-------------|
| `README.md` | This file |
| `virtual-machine-infrastructure-table.md` | **Authoritative VM inventory** (March 2026) |

### Active Subdirectories

| Directory | Description | Documentation |
|-----------|-------------|---------------|
| `dns/` | DNS infrastructure and implementation guide | [README](dns/README.md) |
| `dhcp/` | DHCP infrastructure and implementation guide | [README](dhcp/README.md) |
| `storage/` | Storage architecture - NVMe pools, backup systems, monitoring | [README](storage/README.md) |
| `fileservices/` | File sharing and distributed storage (old format, needs conversion) | [README](fileservices/README.md) |

### Legacy Subdirectories (old format, needs Phase 1 conversion)

| Directory | Description | Status |
|-----------|-------------|--------|
| `Infrastructure-onprem/` | Old taxonomy - Proxmox cluster config, monitoring, storage architecture | Old-format content, restructure during conversion |

### Directories to Delete (empty stubs, now covered elsewhere)

<!-- These directories contain only empty README-pending.md files and duplicate content that now lives in applications-and-services/ -->

| Directory | Superseded By |
|-----------|---------------|
| `active-directory/` | `applications-and-services/active-directory/` |
| `cloud-aws/` | `applications-and-services/identity-and-cloud/aws.md` |
| `cloud-azure/` | `applications-and-services/identity-and-cloud/microsoft-azure.md` |
| `cloud-google-cloud/` | `applications-and-services/identity-and-cloud/` |
| `cloud-google-workspace/` | `applications-and-services/identity-and-cloud/google-workspace-enterprise.md` |
| `file-shares-dsf/` | Empty, likely duplicates `fileservices/` |
| `network/` | Empty, networking docs live in `dns/`, `dhcp/`, and `hardware/networking/` |

---

## 2. Structure

```
infrastructure/
+-- README.md
+-- virtual-machine-infrastructure-table.md
+-- dns/
|   +-- README.md
|   +-- dns-infrastructure-implementation-guide.md
+-- dhcp/
|   +-- README.md
|   +-- dhcp-infrastructure-implementation-guide.md
+-- storage/
|   +-- README.md
|   +-- backup-systems/
|   +-- kubernetes-storage/          # STALE - K8s decommissioned
|   +-- monitoring/
|   +-- nvme-storage/
+-- fileservices/
|   +-- README.md
|   +-- access-control/
|   +-- monitoring/
|   +-- network-shares/
+-- Infrastructure-onprem/           # Old taxonomy, needs restructure
|   +-- proxmox/
+-- active-directory/                # DELETE
+-- cloud-aws/                       # DELETE
+-- cloud-azure/                     # DELETE
+-- cloud-google-cloud/              # DELETE
+-- cloud-google-workspace/          # DELETE
+-- file-shares-dsf/                 # DELETE
+-- network/                         # DELETE
```

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [Root README](../README.md) | Parent directory |
| [Hardware](../hardware/README.md) | Physical nodes and network equipment |
| [Applications and Services](../applications-and-services/README.md) | Services running on this infrastructure |
| [Identity and Cloud](../applications-and-services/identity-and-cloud/README.md) | Cloud provider documentation (moved from here) |
