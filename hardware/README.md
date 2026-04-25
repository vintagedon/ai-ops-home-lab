<!--
---
title: "Hardware"
description: "Physical hardware documentation for the Proxmox Astronomy Lab cluster"
author: "VintageDon"
date: "2026-03-22"
version: "1.0"
status: "Active"
tags:
  - type: directory-readme
  - domain: infrastructure
related_documents:
  - "[Root README](../README.md)"
  - "[Infrastructure](../infrastructure/README.md)"
---
-->

# Hardware

Physical hardware documentation for the Proxmox Astronomy Lab cluster. Covers compute nodes, networking equipment, and cluster-level configuration.

<!-- STALE DATA: astronomy-cluster-config files (v2/v3 from July 2025) predate hostname migration to radio-* and K8s decommission. Use VM inventory table as authoritative source. -->

---

## 1. Contents

### Files

| File | Description |
|------|-------------|
| `README.md` | This file |
| `astronomy-cluster-config-v2-2025-07-20.md` | Legacy cluster config - **stale** |
| `astronomy-cluster-config-v3-2025-07-26.md` | Legacy cluster config - **stale** |

### Subdirectories

| Directory | Description | Documentation |
|-----------|-------------|---------------|
| `proxmox-nodes/` | Per-node asset sheets for the 6 active Proxmox nodes + ML01 | [README](proxmox-nodes/README.md) |
| `networking/` | Network equipment asset sheets (firewall, switches) | [README](networking/README.md) |

---

## 2. Structure

```
hardware/
+-- README.md
+-- astronomy-cluster-config-v2-2025-07-20.md
+-- astronomy-cluster-config-v3-2025-07-26.md
+-- proxmox-nodes/
|   +-- node01-minisforum-ms-a1-12900h.md
|   +-- node02-minisforum-ms-a1-12600h.md
|   +-- node03-minisforum-ms-a1-12900h.md
|   +-- node04-minisforum-ms-a1-12900h.md
|   +-- node05-minisforum-ms-a1-12600h.md
|   +-- node06-minisforum-ms-a1-13900h.md
|   +-- node07-whitebox-gpu-node-5950x.md
+-- networking/
    +-- fw01-fortigate-40f.md
    +-- labswitch01-sodola-sl-swtg3c12f.md
    +-- labswitch02-mokerlink-2g16210gsm.md
    +-- labswitch03-sodola-sl-swtgw2c48ns.md
```

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [Root README](../README.md) | Parent directory |
| [Infrastructure](../infrastructure/README.md) | VM inventory, storage, and logical infrastructure |
| [VM Infrastructure Table](../infrastructure/virtual-machine-infrastructure-table.md) | Authoritative VM specs (March 2026) |
