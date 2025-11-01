<!--
---
title: "Hardware Infrastructure"
description: "Complete hardware inventory, specifications, and infrastructure documentation for the 7-node Proxmox Astronomy Lab cluster"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Anthropic Claude 4 Sonnet (claude-4-sonnet-20250514)"
date: "2025-07-20"
version: "1.0"
status: "Published"
tags:
- type: directory-overview
- domain: hardware-infrastructure
- domain: cluster-architecture
- tech: proxmox-ve
- tech: intel-12th-13th-gen
- tech: nvme-storage
- phase: production-deployment
related_documents:
- "[Main Platform Overview](../README.md)"
- "[Infrastructure Services](../infrastructure/README.md)"
- "[Network Architecture](networking/README.md)"
- "[AI/ML Infrastructure](../ai/README.md)"
---
-->

# 🔧 **Hardware Infrastructure**

The hardware infrastructure directory contains comprehensive documentation of the physical computing platform that powers the Proxmox Astronomy Lab. This category covers the complete 7-node cluster specifications, network architecture, performance benchmarks, and physical infrastructure supporting enterprise-grade astronomical research workloads.

## **Overview**

The hardware infrastructure represents the foundation of our production-scale astronomical computing platform, built on a carefully architected 7-node cluster delivering approximately 140 CPU cores and 1TB of system memory. The platform combines modern Intel 12th and 13th generation processors with high-performance NVMe storage systems, enterprise networking, and specialized GPU acceleration to create a research computing environment capable of handling large-scale astronomical datasets and computationally intensive ML workloads.

Our hardware architecture emphasizes redundancy, performance, and scalability while maintaining cost-effectiveness for research applications. The cluster design supports hybrid workloads through strategic resource allocation, enabling both containerized Kubernetes applications and traditional virtual machine deployments. Each node is equipped with dual-link networking providing both management and high-bandwidth service connectivity, ensuring optimal data movement and cluster interconnect performance.

The infrastructure has been validated through extensive benchmarking and is currently supporting production workloads including 30GB+ PostgreSQL astronomical databases, distributed Ray ML clusters, and GPU-accelerated inference pipelines. All hardware specifications and performance characteristics are documented to enable reproducible infrastructure deployment and optimization.

---

## **📂 Directory Contents**

This section provides systematic navigation to all files and subdirectories within the hardware infrastructure category.

### **Subdirectories**

| **Directory** | **Purpose** | **Documentation** |
|--------------|-------------|-------------------|
| **[benchmarks/](benchmarks/)** | Performance testing results and optimization analysis | [benchmarks/README.md](benchmarks/README.md) |
| **[networking/](networking/)** | Network infrastructure architecture and configuration | [networking/README.md](networking/README.md) |
| **[nodes/](nodes/)** | Individual node specifications and configuration details | [nodes/README.md](nodes/README.md) |
| **[virtual-machines/](virtual-machines/)** | VM allocation, specifications, and deployment patterns | [virtual-machines/README.md](virtual-machines/README.md) |

### **Key Documents**

| **Document** | **Purpose** | **Link** |
|--------------|-------------|----------|
| **[proxmox-astronomy-lab-cluster-config-v2-2025-07-20.md](proxmox-astronomy-lab-cluster-config-v2-2025-07-20.md)** | Complete cluster configuration report with all node specifications | [proxmox-astronomy-lab-cluster-config-v2-2025-07-20.md](proxmox-astronomy-lab-cluster-config-v2-2025-07-20.md) |

---

## **📁 Repository Structure**

``` markdown
hardware/
├── 📊 benchmarks/              # Performance testing and optimization
│   ├── README.md              # Benchmarking overview and methodology
│   ├── cpu-performance.md     # Processor benchmarking results
│   ├── storage-io.md          # NVMe storage performance analysis
│   ├── network-throughput.md  # Network performance testing
│   └── gpu-acceleration.md    # RTX A4000 performance metrics
├── 🌐 networking/              # Network infrastructure
│   ├── README.md              # Network architecture overview
│   ├── cluster-topology.md    # Physical and logical network design
│   ├── vlan-configuration.md  # VLAN strategy and implementation
│   ├── switch-management.md   # Managed switch configuration
│   └── bonding-lacp.md        # LACP bonding and redundancy
├── 🖥️ nodes/                   # Individual node specifications
│   ├── README.md              # Node inventory overview
│   ├── node01-specifications.md # Primary cluster node details
│   ├── node02-specifications.md # Secondary cluster node details
│   ├── node03-specifications.md # Tertiary cluster node details
│   ├── node04-specifications.md # Quaternary cluster node details
│   ├── node05-specifications.md # Quinary cluster node details
│   ├── node06-specifications.md # Senary cluster node details
│   └── node07-specifications.md # Septenary cluster node details
├── 💻 virtual-machines/        # VM infrastructure and allocation
│   ├── README.md              # VM deployment overview
│   ├── vm-allocation-matrix.md # Resource allocation across nodes
│   ├── service-vm-specs.md    # Service VM specifications
│   ├── database-vm-config.md  # Database VM optimization
│   └── kubernetes-vm-setup.md # K8s node VM configuration
├── 📋 proxmox-astronomy-lab-cluster-config-v2-2025-07-20.md # Complete cluster report
├── 📝 README.md               # This file
└── 📄 cluster-architecture.md # High-level architecture documentation
```

### **Navigation Guide:**

- **📊 [Performance Benchmarks](benchmarks/README.md)** - CPU, storage, network, and GPU performance analysis
- **🌐 [Network Architecture](networking/README.md)** - VLAN design, bonding, and network infrastructure
- **🖥️ [Node Specifications](nodes/README.md)** - Individual node hardware details and configurations
- **💻 [Virtual Machine Infrastructure](virtual-machines/README.md)** - VM deployment patterns and resource allocation
- **📋 [Cluster Configuration Report](proxmox-astronomy-lab-cluster-config-v2-2025-07-20.md)** - Complete system specifications and status

---

## **🔗 Related Categories**

This section establishes horizontal relationships within the knowledge graph, connecting hardware infrastructure to related platform domains.

| **Category** | **Relationship** | **Documentation** |
|--------------|------------------|-------------------|
| **[Infrastructure Services](../infrastructure/README.md)** | **Provides foundation for** - All platform services depend on hardware infrastructure | [../infrastructure/README.md](../infrastructure/README.md) |
| **[AI/ML Infrastructure](../ai/README.md)** | **Enables** - GPU acceleration and distributed computing capabilities | [../ai/README.md](../ai/README.md) |
| **[Monitoring Systems](../monitoring/README.md)** | **Monitored by** - Hardware metrics, temperature, and performance tracking | [../monitoring/README.md](../monitoring/README.md) |
| **[Security Framework](../security/README.md)** | **Secured by** - Hardware security controls and compliance implementation | [../security/README.md](../security/README.md) |
| **[Research Projects](../projects/README.md)** | **Supports** - Computational resources for astronomical research workloads | [../projects/README.md](../projects/README.md) |

---

## **Hardware Overview**

### **Cluster Architecture Summary**

| **Component** | **Specification** | **Total Capacity** |
|---------------|------------------|-------------------|
| **Compute Nodes** | 7 nodes (Intel 12th/13th gen) | ~140 CPU cores |
| **System Memory** | DDR4/DDR5 configurations | ~1TB total RAM |
| **Storage System** | NVMe SSD primary storage | 13+ TB cluster storage |
| **GPU Acceleration** | RTX A4000 (node allocation TBD) | Enterprise ML/AI acceleration |
| **Network Backbone** | 10G LACP bonding | Dual-link redundancy |
| **Management** | Proxmox VE 8.4.5 cluster | Enterprise virtualization |

### **Node Distribution**

| **Node** | **CPU** | **Memory** | **Storage** | **Role** |
|----------|---------|------------|-------------|----------|
| **node01** | i9-12900H (20 cores) | High-capacity | 1.92TB NVMe | Primary cluster node |
| **node02** | i5-12600H (16 cores) | Standard | 1.92TB + 2TB NVMe | Database workloads |
| **node03** | i9-12900H (20 cores) | High-capacity | 1.92TB NVMe | Kubernetes workloads |
| **node04** | i9-12900H (20 cores) | High-capacity | 1.92TB NVMe | Compute intensive |
| **node05** | Intel platform | Standard | NVMe configuration | Distributed services |
| **node06** | i9-13900H (20 cores) | High-capacity | 1.92TB NVMe | Latest generation node |
| **node07** | Intel platform | High-capacity | 4TB NVMe | Storage and compute |

### **Network Infrastructure**

- **Management Network**: 10.16.207.x/24 (vmbr0 - primary management)
- **Service Network**: 10.25.x.x/24 (vmbr1 + VLANs 10-60)
- **Bonding**: LACP 802.3ad on SFP+ ports for high-bandwidth interconnect
- **Redundancy**: Dual-link architecture ensuring network fault tolerance

---

## **Getting Started**

For new users approaching hardware infrastructure:

1. **Start Here:** [Cluster Configuration Report](proxmox-astronomy-lab-cluster-config-v2-2025-07-20.md) - Complete system overview
2. **Network Understanding:** [Network Architecture](networking/README.md) - VLAN design and connectivity
3. **Performance Baseline:** [Benchmarks Overview](benchmarks/README.md) - Performance characteristics and optimization
4. **Node Details:** [Node Specifications](nodes/README.md) - Individual hardware configurations
5. **VM Planning:** [Virtual Machine Infrastructure](virtual-machines/README.md) - Resource allocation and deployment

---

## **Document Information**

| **Field** | **Value** |
|-----------|-----------|
| **Author** | VintageDon - <https://github.com/vintagedon> |
| **Created** | 2025-07-20 |
| **Last Updated** | 2025-07-20 |
| **Version** | 1.0 |

---
Tags: hardware-infrastructure, cluster-architecture, proxmox-ve, networking, performance-benchmarking
