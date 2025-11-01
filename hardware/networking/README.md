<!--
---
title: "Network Infrastructure Hardware"
description: "Comprehensive documentation of Proxmox Astronomy Lab network infrastructure including switches, firewall, VLAN configuration, and connectivity supporting enterprise astronomical computing platform operations"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Anthropic Claude 4 Sonnet (claude-4-sonnet-20250514)"
date: "2025-07-20"
version: "1.0"
status: "Published"
tags:
- type: directory-overview
- domain: network-infrastructure
- tech: switches
- tech: firewall
- tech: vlan-configuration
- phase: phase-1
related_documents:
- "[Hardware Overview](../README.md)"
- "[Infrastructure Diagrams](../../assets/diagrams/README.md)"
- "[Cluster Configuration](../proxmox-astronomy-lab-cluster-config-v2-2025-07-20.md)"
---
-->

# 🌐 **Network Infrastructure Hardware**

This directory contains comprehensive documentation of the Proxmox Astronomy Lab network infrastructure hardware, including managed switches, firewall configuration, VLAN segmentation, and connectivity architecture supporting our enterprise astronomical computing platform. The network infrastructure enables secure, high-performance communication across the 7-node cluster while providing appropriate segmentation for different workload types.

## **Overview**

The network infrastructure hardware provides the foundation for our enterprise-grade astronomical computing platform, implementing sophisticated VLAN segmentation, high-speed interconnects, and security controls that support both operational requirements and research workload demands. Our network design enables dual-homed connectivity with management and data plane separation while supporting the hybrid RKE2 Kubernetes and static VM architecture.

The network implementation encompasses managed switching infrastructure with LACP bonding capabilities, enterprise firewall providing security controls and traffic management, comprehensive VLAN segmentation supporting workload isolation, and high-speed SFP+ connectivity enabling efficient data movement across cluster nodes. This infrastructure supports real DESI DR1 analysis workloads, distributed ML processing, and enterprise-grade operational management while maintaining appropriate security boundaries.

---

## **📂 Directory Contents**

This section provides systematic navigation to all network infrastructure documentation within this category, ensuring complete coverage for network hardware understanding and configuration management.

### **Network Equipment Documentation**

| **Device** | **Purpose** | **Documentation Status** |
|------------|-------------|-------------------------|
| **[fw01-fortigate-40f.md](fw01-fortigate-40f.md)** | Enterprise firewall providing security controls and traffic management | Configuration Pending |
| **[labswitch01-sodola-sl-swtg3c12f.md](labswitch01-sodola-sl-swtg3c12f)** | Core managed switch with SFP+ uplinks and VLAN capabilities | Configuration Pending |
| **[labswitch02-mokerlink-2g16210gsm.md](labswitch02-mokerlink-2g16210gsm.md)** | Secondary managed switch for network expansion and redundancy | Configuration Pending |
| **[labswitch03-sodola-sl-swtgw2c48ns.md](labswitch03-sodola-sl-swtgw2c48ns.md)** | Access layer switch providing additional port density | Configuration Pending |

### **Configuration Repository**

| **Directory** | **Purpose** | **Documentation** |
|---------------|-------------|-------------------|
| **[configs/](configs/)** | Network device configuration files and backup procedures | Configuration management repository |

### **Core Documentation**

| **Document** | **Purpose** | **Link** |
|--------------|-------------|----------|
| **[README.md](README.md)** | This file - network infrastructure organization and overview | [README.md](README.md) |

---

## **📁 Repository Structure**

```markdown
hardware/networking/
├── 🔥 fw01-fortigate-40f.md           # Enterprise firewall documentation
├── 🔗 labswitch01-sodola-sl-swtg3c12f.md  # Core managed switch
├── 📡 labswitch02-mokerlink-2g16210gsm.md # Secondary switch
├── 🌐 labswitch03-sodola-sl-swtgw2c48ns.md # Access layer switch
├── ⚙️ configs/                                # Configuration repository
│   ├── fw01-fortigate-40f.md         # Firewall configuration
│   ├── labswitch01-sodola-sl-swtg3c12f.md # Core switch config
│   ├── labswitch02-mokerlink-2g16210gsm.md # Secondary switch config
│   └── labswitch03-sodola-sl-swtgw2c48ns.md # Access switch config
└── 📝 README.md                              # This file
```

### **Navigation Guide:**

- **[🔥 Enterprise Firewall](fw01-fortigate-40f.md)** - Security controls and traffic management configuration
- **[🔗 Core Switch](labswitch01-sodola-sl-swtg3c12f.md)** - Primary switching infrastructure with SFP+ capabilities
- **[📡 Network Expansion](labswitch02-mokerlink-2g16210gsm.md)** - Secondary switching for redundancy and capacity
- **[⚙️ Configuration Management](configs/)** - Device configuration backup and management procedures

---

## **Network Architecture**

### **VLAN Segmentation**

Based on the cluster configuration, our network implements comprehensive VLAN segmentation:

- **VLAN 10**: Management and infrastructure services (10.25.10.x/24)
- **VLAN 20**: Project and database workloads (10.25.20.x/24)
- **VLAN 30**: Development and testing environments (10.25.30.x/24)
- **VLAN 40**: Specialized applications and services (10.25.40.x/24)
- **VLAN 50**: Research and analytical workloads (10.25.50.x/24)
- **VLAN 60**: Data migration and backup operations (10.25.60.x/24)

### **Connectivity Design**

- **Dual-Homed Nodes**: Management network (10.16.207.x/24) and data networks (10.25.x.x/24)
- **LACP Bonding**: High-availability connectivity with automated failover capabilities
- **SFP+ Uplinks**: High-speed interconnects supporting data-intensive astronomical workloads
- **Security Boundaries**: Firewall-enforced traffic control and access management

### **Performance Characteristics**

The network infrastructure supports high-bandwidth requirements for:

- **DESI DR1 Analysis**: Large-scale data movement and database operations
- **ML/AI Workloads**: Distributed computing and model training traffic
- **Container Orchestration**: RKE2 Kubernetes inter-node communication
- **Backup Operations**: Efficient data protection and recovery procedures

---

## **🔗 Related Categories**

This section establishes horizontal relationships within the knowledge graph, connecting network hardware to related platform domains.

| **Category** | **Relationship** | **Documentation** |
|--------------|------------------|-------------------|
| **[Hardware Overview](../README.md)** | Parent directory providing broader hardware context and cluster specifications | [../README.md](../README.md) |
| **[Infrastructure Diagrams](../../assets/diagrams/README.md)** | Visual documentation of network topology and connectivity patterns | [../../assets/diagrams/README.md](../../assets/diagrams/README.md) |
| **[Cluster Configuration](../proxmox-astronomy-lab-cluster-config-v2-2025-07-20.md)** | Detailed node network configuration and VLAN assignments | [../proxmox-astronomy-lab-cluster-config-v2-2025-07-20.md](../proxmox-astronomy-lab-cluster-config-v2-2025-07-20.md) |
| **[Infrastructure Services](../../infrastructure/README.md)** | Services and applications utilizing network infrastructure capabilities | [../../infrastructure/README.md](../../infrastructure/README.md) |

---

## **Implementation Status**

### **Current Deployment**

The network infrastructure is fully deployed and operational, supporting all 7 cluster nodes with comprehensive VLAN segmentation and high-availability connectivity. All nodes demonstrate proper network configuration with dual-homed connectivity and LACP bonding operational.

### **Configuration Management**

Network device configurations are managed through systematic backup procedures and version control, ensuring consistent configuration and rapid recovery capabilities. Configuration documentation is being developed to support operational procedures and change management.

### **Performance Monitoring**

Network infrastructure monitoring is integrated with the centralized mon01 monitoring stack, providing SNMP-based visibility into interface utilization, connectivity health, and performance metrics supporting operational excellence and capacity planning.

---

## **Getting Started**

For users approaching network infrastructure documentation:

1. **Start Here:** [Cluster Configuration](../proxmox-astronomy-lab-cluster-config-v2-2025-07-20.md) - Current network configuration and node connectivity details
2. **Background Reading:** [Infrastructure Diagrams](../../assets/diagrams/README.md) - Visual network topology and architectural understanding
3. **Implementation:** [Hardware Overview](../README.md) - Broader hardware context and cluster specifications
4. **Advanced Topics:** Network optimization for astronomical workloads and performance tuning

---

## **AI Transparency**

This document was collaboratively developed using AI assistance while maintaining complete human oversight and validation. All network infrastructure details reflect actual platform deployment and operational configuration. The human author retains full responsibility for accuracy and technical correctness.

---

## **Document Information**

| **Field** | **Value** |
|-----------|-----------|
| **Author** | VintageDon - <https://github.com/vintagedon> |
| **Created** | 2025-07-20 |
| **Last Updated** | 2025-07-20 |
| **Version** | 1.0 |

---
Tags: network-infrastructure, switches, firewall, vlan-configuration, enterprise-networking
