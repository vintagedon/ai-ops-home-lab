<!--
---
title: "Proxmox Nodes"
description: "Per-node asset sheets for the Proxmox Astronomy Lab compute cluster"
author: "VintageDon"
date: "2026-03-22"
version: "1.0"
status: "Active"
tags:
  - type: directory-readme
  - domain: infrastructure
  - tech: proxmox
related_documents:
  - "[Hardware](../README.md)"
  - "[VM Infrastructure Table](../../infrastructure/virtual-machine-infrastructure-table.md)"
---
-->

# Proxmox Nodes

Per-node asset sheets for the 6 active Proxmox nodes and ML01 bare-metal server. Node07 was decommissioned from Proxmox and repurposed as bare-metal ML01.

---

## 1. Contents

### Files

| File | Description |
|------|-------------|
| `README.md` | This file |
| `node01-minisforum-ms-a1-12900h.md` | Node01 - i9-12900H (radio-node01) |
| `node02-minisforum-ms-a1-12600h.md` | Node02 - i5-12600H (radio-node02) |
| `node03-minisforum-ms-a1-12900h.md` | Node03 - i9-12900H (radio-node03) |
| `node04-minisforum-ms-a1-12900h.md` | Node04 - i9-12900H (radio-node04, new service tier) |
| `node05-minisforum-ms-a1-12600h.md` | Node05 - i5-12600H (radio-node05, oversubscribed 138% vCPU) |
| `node06-minisforum-ms-a1-13900h.md` | Node06 - i9-13900H (radio-node06) |
| `node07-whitebox-gpu-node-5950x.md` | ML01 - Ryzen 5950X/128G/A4000 (bare metal, no longer Proxmox) |

---

## 2. Structure

```
proxmox-nodes/
+-- README.md
+-- node01-minisforum-ms-a1-12900h.md
+-- node02-minisforum-ms-a1-12600h.md
+-- node03-minisforum-ms-a1-12900h.md
+-- node04-minisforum-ms-a1-12900h.md
+-- node05-minisforum-ms-a1-12600h.md
+-- node06-minisforum-ms-a1-13900h.md
+-- node07-whitebox-gpu-node-5950x.md
```

---

## 3. Related

| Resource | Relationship |
|----------|--------------|
| [Hardware](../README.md) | Parent directory |
| [VM Infrastructure Table](../../infrastructure/virtual-machine-infrastructure-table.md) | VM placement per node |
| [Networking](../networking/README.md) | Network equipment connecting these nodes |
