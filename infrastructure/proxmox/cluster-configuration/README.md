<!--
---
title: "Cluster Configuration"
description: "Proxmox VE cluster configuration and management for the Proxmox Astronomy Lab infrastructure"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude Sonnet 4 (claude-sonnet-4-20250514)"
date: "2025-07-27"
version: "1.0"
status: "Published"
tags:
- type: directory-overview
- domain: infrastructure
- tech: [proxmox, cluster-configuration, virtualization]
- phase: phase-1
related_documents:
- "[Proxmox Overview](../README.md)"
- "[Infrastructure Overview](../../README.md)"
- "[Storage Architecture](../storage-architecture/README.md)"
---
-->

# ⚙️ **Cluster Configuration**

This directory contains Proxmox VE cluster configuration documentation for the Proxmox Astronomy Lab infrastructure, focusing on 7-node cluster management, VM deployment strategies, and enterprise virtualization configuration supporting astronomical research operations and scientific computing workloads.

## **Overview**

The Proxmox cluster configuration framework provides systematic virtualization management through enterprise cluster architecture, standardized VM deployment, and comprehensive resource management across 7 nodes supporting 32 virtual machines with 144 CPU cores and 689.95 GiB memory capacity for astronomical research operations.

Cluster implementation encompasses radioastronomy cluster with quorum-based high availability, CISv8 Level 2 hardened Ubuntu 24.04 LTS templates achieving Lynis Hardening Index of 86/100, LACP bonding across all nodes, and systematic VLAN segmentation supporting enterprise security and performance requirements for scientific computing infrastructure.

---

## **📁 Directory Contents**

This section provides systematic organization of Proxmox cluster configuration documentation and management resources.

### **📋 Cluster Documentation**

| **Document Type** | **Description** | **Coverage** | **Status** |
|------------------|----------------|--------------|------------|
| **Cluster Architecture** | 7-node cluster design, quorum configuration, and high availability setup | Node topology, quorum management, HA configuration, cluster networking | **In Development** |
| **VM Template Management** | Standardized VM templates, CISv8 hardening, and deployment automation | Ubuntu 24.04 LTS templates, security baseline, automated provisioning | **In Development** |
| **Network Configuration** | VLAN segmentation, LACP bonding, and network architecture | VLAN 10-60 configuration, bond0 LACP setup, bridge configuration | **In Development** |
| **Resource Management** | CPU allocation, memory management, and storage optimization | Resource pools, VM sizing, performance optimization, capacity planning | **Planned** |

### **🔧 Cluster Resources**

| **Resource Type** | **Purpose** | **Technology** | **Status** |
|------------------|-------------|----------------|------------|
| **Cluster Scripts** | Automated cluster management, VM deployment, and maintenance procedures | Proxmox CLI, automation scripts, deployment tools | **In Development** |
| **Template Images** | Hardened VM templates, security baselines, and deployment automation | Ubuntu 24.04 LTS CISv8, security configurations, template management | **Planned** |
| **Monitoring Integration** | Cluster monitoring, performance tracking, and health management | Prometheus integration, cluster metrics, performance monitoring | **Planned** |

---

## **🛠️ Cluster Configuration Framework**

This section documents the Proxmox cluster configuration implementation and virtualization management patterns.

## **4.1 Cluster Architecture and High Availability**

This subsection documents the 7-node Proxmox VE cluster architecture with radioastronomy cluster name, quorum configuration, and high availability implementation.

Cluster architecture provides enterprise virtualization through 7-node configuration with automatic quorum management, distributed storage via NVMe thin pools, and systematic resource allocation across Intel i9-12900H and i9-13900H processors totaling 144 CPU cores. Architecture implementation emphasizes fault tolerance, performance optimization, and systematic resource management supporting astronomical research operations and scientific computing workloads.

Cluster configuration includes node01-node07 deployment with consistent hardware specifications, LACP bonding for network redundancy, distributed storage with nvmethin01 pools across all nodes, and systematic VM placement ensuring optimal resource utilization and fault tolerance for enterprise virtualization supporting astronomical research infrastructure.

```bash
# Cluster status and configuration
pvecm status
# Cluster Information
# Quorum information
# Cluster name: radioastronomy
# Config version: 7
# Ring ID: 1/8540
# Member information
# Nodeid      Votes Name
#      1          1 node01 (local)
#      2          1 node02
#      3          1 node03
#      4          1 node04
#      5          1 node05
#      6          1 node06
#      7          1 node07

# Node hardware summary
pvesh get /nodes
# node01: 20 cores, Samsung NVMe 1.92TB, 14% wear
# node02: 20 cores, Samsung NVMe 1.92TB, 14% wear  
# node03: 20 cores, Samsung NVMe 1.92TB, 14% wear
# node04: 20 cores, Samsung NVMe 1.92TB, 14% wear
# node05: 20 cores, Fanxiang NVMe 4.00TB, 3% wear
# node06: 20 cores, Samsung NVMe 1.92TB x3, 14% wear
# node07: 20 cores, Fanxiang NVMe 4.00TB, 3% wear
```

## **4.2 Standardized VM Templates and Security Baseline**

This subsection documents CISv8 Level 2 hardened Ubuntu 24.04 LTS templates achieving Lynis Hardening Index of 86/100 with comprehensive security controls and automated deployment.

Standardized VM templates provide enterprise-grade security baseline through CIS Benchmark Implementation Group 2 (IG2) control coverage, multi-layer security validation including AIDE file integrity monitoring, RKHunter malware detection, and auditd with MITRE ATT&CK framework mapping. Template implementation ensures consistent security posture across all 32 virtual machines with systematic hardening and automated security controls.

Security baseline includes AppArmor MAC enforcement, Fail2ban intrusion prevention, kernel hardening, automated patching pipeline, and continuous monitoring with six-month image lifecycle ensuring comprehensive threat detection and prevention capabilities built into infrastructure layer supporting astronomical research operations with enterprise security requirements.

## **4.3 Network Architecture and VLAN Segmentation**

This subsection documents comprehensive network architecture with LACP bonding, VLAN segmentation across 10.25.x.0/24 networks, and systematic network isolation for enterprise security.

Network architecture provides systematic network segmentation through VLAN 10-60 configuration, LACP 802.3ad bonding on all nodes via bond0 (spf0 + spf1), and comprehensive bridge configuration supporting management, project, and specialized network requirements. Network implementation emphasizes security isolation, performance optimization, and systematic traffic management for enterprise virtualization infrastructure.

VLAN configuration includes management network 10.16.207.0/24 via vmbr0, internal VLANs 10.25.10.0/24 through 10.25.60.0/24 via vmbr1 with VLAN tagging, LACP bonding for network redundancy and performance, and systematic network isolation ensuring secure inter-VM communication and enterprise network security for astronomical research operations.

# 🔒 **5. Security & Compliance**

This section documents security controls and compliance alignment for Proxmox cluster configuration implementation.

**⚠️ SECURITY DISCLAIMER**

*The security implementations described in this document are part of ongoing baseline establishment and should not be considered production-ready specifications. Our team consists of research computing professionals, not dedicated security experts. All security measures are implemented as best-effort implementations based on industry standards. For production deployments requiring formal security validation, engage qualified security professionals for comprehensive review and approval.*

## **5.1 Security Controls**

This subsection documents specific security measures for Proxmox cluster configuration and virtualization security implementation.

**Enterprise-grade cluster security guided by industry standards.** Security controls for Proxmox cluster configuration include CISv8 Level 2 hardened VM templates, comprehensive security baseline with Lynis Hardening Index of 86/100, systematic access control for cluster management, secure network segmentation, and continuous security monitoring ensuring secure virtualization infrastructure for enterprise astronomical computing operations.

Cluster security encompasses role-based access control for Proxmox management, VM template security baseline with CIS Implementation Group 2 controls, network isolation through VLAN segmentation, secure cluster communication, and comprehensive audit logging ensuring cluster security while supporting reliable virtualization operations and astronomical research applications across enterprise infrastructure.

## **5.2 CIS Controls Mapping**

This subsection provides explicit mapping to CIS Controls v8, documenting compliance status and implementation evidence for Proxmox cluster security.

**Baseline Standards:** CIS Controls v8, NIST AI Risk Management Framework  
**Framework:** NIST Cybersecurity Framework 2.0  
**Mapping to:** NIST SP 800-171

| **CIS Control** | **Implementation Status** | **Evidence Location** | **Assessment Date** |
|-----------------|--------------------------|----------------------|-------------------|
| **CIS.1.1** | **Compliant** | Systematic VM inventory and cluster asset management | **Informal Gap Assessment** |
| **CIS.4.1** | **Compliant** | CISv8 Level 2 hardened VM templates with comprehensive security configuration | **Informal Gap Assessment** |
| **CIS.4.8** | **Compliant** | Disabled unnecessary services in VM templates and cluster configuration | **Informal Gap Assessment** |
| **CIS.6.1** | **Compliant** | Role-based access control for Proxmox cluster management | **Informal Gap Assessment** |
| **CIS.12.1** | **Compliant** | Network segmentation and monitoring through VLAN architecture | **Informal Gap Assessment** |

**Reference**: [CIS Ubuntu 24.04 Implementation](../../../docs/compliance-security/README.md)

## **5.3 Framework Compliance**

This subsection demonstrates how Proxmox cluster configuration implementation satisfies requirements across multiple compliance frameworks.

Proxmox cluster configuration implementation aligns with CIS Controls v8 baseline, NIST AI Risk Management Framework requirements, NIST Cybersecurity Framework 2.0 requirements, and NIST SP 800-171 requirements through systematic implementation of comprehensive virtualization security controls, template hardening, and compliance documentation procedures appropriate for enterprise computing infrastructure supporting astronomical research with virtualized applications and scientific computing workloads.

# 💾 **6. Backup & Recovery**

This section documents comprehensive data protection strategies and recovery processes across the 7-node Proxmox Astronomy Lab infrastructure.

## **6.1 Protection Strategy**

This subsection details backup approaches, schedules, and retention policies implemented across hybrid Kubernetes and VM infrastructure.

**Comprehensive Multi-Tier Backup Strategy:** Data protection encompasses systematic backup across all infrastructure layers with automated scheduling, retention management, and offsite replication ensuring comprehensive protection for virtual machines, databases, and configuration data supporting astronomical research operations and compliance requirements.

**Backup Implementation by Platform:**

| **Platform Type** | **Backup Solution** | **Schedule** | **Retention** | **Offsite Strategy** |
|------------------|-------------------|--------------|---------------|-------------------|
| **Linux VMs** | **Proxmox Backup Server (PBS)** | **Weekly: 4 backups, Monthly: 1 backup** | **30 days** | **Amazon S3 Glacier Flexible Retrieval** |
| **Windows VMs** | **Veeam Backup & Replication Community** | **Weekly: 4 backups, Monthly: 1 backup** | **30 days** | **Amazon S3 Glacier Flexible Retrieval** |
| **Database Systems** | **Iperius Backup** | **Weekly: 4 backups, Monthly: 1 backup** | **30 days** | **Amazon S3 Glacier Flexible Retrieval** |
| **Configuration Data** | **Git + Infrastructure Backup** | **Continuous + Weekly** | **30 days local, 12 months offsite** | **Repository replication + S3** |

All backup data encrypted at rest using AES-256 encryption with keys managed through centralized key management system.

## **6.2 Recovery Procedures**

This subsection provides recovery processes for different failure scenarios across the hybrid infrastructure.

**Tiered Recovery Strategy:** Recovery procedures are organized by scope and urgency, from individual service restoration to full infrastructure rebuild. All recovery operations are documented with step-by-step procedures and tested quarterly during scheduled maintenance windows.

**Recovery Scenarios:**

- **Individual VM Recovery:** Proxmox VE restore from PBS snapshots or Veeam backup with automated integrity verification
- **Database Point-in-Time Recovery:** Iperius backup restoration with transaction consistency validation  
- **Kubernetes Service Recovery:** PV snapshot restoration with pod recreation and service validation
- **Complete Site Recovery:** Infrastructure-as-Code deployment with automated service restoration and data synchronization
- **Configuration Rollback:** Git-based configuration management with automated rollback and validation testing

**Recovery Validation:** All recovery operations include automated validation testing to ensure data integrity, service functionality, and performance baseline compliance before declaring recovery complete.

# 📚 **7. References & Related Resources**

This section provides comprehensive links to related Proxmox cluster configuration documentation and supporting resources.

## **7.1 Internal References**

| **Document Type** | **Document Title** | **Relationship** | **Link** |
|-------------------|-------------------|------------------|----------|
| **Parent Directory** | Proxmox Overview | Proxmox platform architecture and cluster context | [../README.md](../README.md) |
| **Infrastructure** | Infrastructure Overview | Technical architecture and virtualization infrastructure context | [../../README.md](../../README.md) |
| **Storage Architecture** | Proxmox Storage Architecture | Storage configuration and cluster integration | [../storage-architecture/README.md](../storage-architecture/README.md) |
| **Monitoring** | Proxmox Monitoring and Observability | Cluster monitoring and performance tracking | [../monitoring-observability/README.md](../monitoring-observability/README.md) |
| **Hardware** | Hardware Configuration | Physical infrastructure and cluster hardware | [../../../hardware/README.md](../../../hardware/README.md) |

## **7.2 External Standards**

- **[Proxmox VE Cluster](https://pve.proxmox.com/pve-docs/chapter-pvecm.html)** - Comprehensive Proxmox cluster configuration and management
- **[CIS Ubuntu 24.04 Benchmark](https://www.cisecurity.org/benchmark/ubuntu_linux)** - Ubuntu security hardening and CIS controls implementation
- **[Proxmox VE High Availability](https://pve.proxmox.com/pve-docs/chapter-ha-manager.html)** - High availability configuration and failover management
- **[VLAN Configuration](https://pve.proxmox.com/pve-docs/chapter-sysadmin.html#sysadmin_network_configuration)** - Network segmentation and VLAN implementation

# ✅ **8. Approval & Review**

This section documents the formal review and approval process for Proxmox cluster configuration documentation.

## **8.1 Review Process**

Proxmox cluster configuration documentation undergoes comprehensive review by virtualization specialists, system administrators, and infrastructure engineers to ensure cluster effectiveness, security implementation, and operational reliability.

## **8.2 Approval Matrix**

| **Reviewer** | **Role/Expertise** | **Review Date** | **Approval Status** | **Comments** |
|-------------|-------------------|----------------|-------------------|--------------|
| **crainbramp** | Infrastructure Engineering (Tier 3) | 2025-07-27 | **Approved** | Proxmox cluster configuration provides comprehensive virtualization and security procedures |
| **alex** | System Operations (Tier 2) | 2025-07-27 | **Approved** | Cluster configuration supports effective virtualization management and performance |
| **glitch** | System Operations (Tier 1/2) | 2025-07-27 | **Approved** | Proxmox cluster procedures enable systematic virtualization platform operations |

# 📜 **9. Documentation Metadata**

This section provides comprehensive information about document creation, revision history, and authorship.

## **9.1 Change Log**

| **Version** | **Date** | **Changes** | **Author** | **Review Status** |
|------------|---------|-------------|------------|------------------|
| 1.0 | 2025-07-27 | Initial Proxmox cluster configuration documentation with 7-node architecture and security baseline frameworks | VintageDon | **Approved** |

## **9.2 Authorization & Review**

Proxmox cluster configuration documentation approved by Infrastructure Engineering team with validation by virtualization operations and security teams ensuring comprehensive cluster capability and operational effectiveness.

## **9.3 Authorship Details**

**Human Author:** VintageDon (<https://github.com/vintagedon>)  
**AI Contributor:** Claude Sonnet 4 (claude-sonnet-4-20250514)  
**Collaboration Method:** Request-Analyze-Verify-Generate-Validate (RAVGV)  
**Human Oversight:** Infrastructure Proxmox cluster validation and virtualization procedures review

## **9.4 AI Collaboration Disclosure**

This document was collaboratively developed using the Request-Analyze-Verify-Generate-Validate (RAVGV) methodology. The AI assistant provided systematic documentation structure, Proxmox cluster frameworks, and virtualization guidance based on established enterprise virtualization practices and cluster configuration requirements. All content has been thoroughly reviewed, validated, and approved by qualified human subject matter experts. The human author retains complete responsibility for accuracy, compliance, and technical correctness.

*Generated: 2025-07-27 | Human Author: VintageDon | AI Assistant: Claude Sonnet 4 | Review Status: Approved | Document Version: 1.0*
