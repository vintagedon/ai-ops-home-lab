<!--
---
title: "Storage Architecture"
description: "Proxmox VE storage architecture and NVMe optimization for the Proxmox Astronomy Lab infrastructure"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude Sonnet 4 (claude-sonnet-4-20250514)"
date: "2025-07-27"
version: "1.0"
status: "Published"
tags:
- type: directory-overview
- domain: infrastructure
- tech: [proxmox, storage-architecture, nvme, lvm]
- phase: phase-1
related_documents:
- "[Proxmox Overview](../README.md)"
- "[Infrastructure Overview](../../README.md)"
- "[Storage Overview](../../storage/README.md)"
---
-->

# 💾 **Storage Architecture**

This directory contains Proxmox VE storage architecture documentation for the Proxmox Astronomy Lab infrastructure, focusing on NVMe storage optimization, LVM thin provisioning, and systematic storage management across 7-node cluster supporting enterprise astronomical computing and scientific data storage requirements.

## **Overview**

The Proxmox storage architecture framework provides enterprise-grade storage management through NVMe-based thin provisioning, distributed storage pools, and systematic capacity management across cluster nodes totaling 20.38 TiB available storage with 4% current utilization supporting astronomical research data storage and virtual machine deployment requirements.

Storage implementation encompasses Samsung NVMe 1.92TB drives across node01-node04 and node06, Fanxiang S660 4TB drives on node05 and node07, LVM thin pool configuration with nvmethin01 pools across all nodes, and systematic storage optimization ensuring optimal performance for enterprise virtualization infrastructure supporting scientific computing workloads and research operations.

---

## **📁 Directory Contents**

This section provides systematic organization of Proxmox storage architecture documentation and optimization resources.

### **📋 Storage Documentation**

| **Document Type** | **Description** | **Coverage** | **Status** |
|------------------|----------------|--------------|------------|
| **NVMe Architecture** | NVMe storage configuration, optimization, and performance tuning | NVMe drives, thin provisioning, LVM configuration, performance optimization | **In Development** |
| **Storage Pool Management** | LVM thin pool configuration and distributed storage management | Storage pools, capacity planning, allocation strategies, pool optimization | **In Development** |
| **Performance Optimization** | Storage performance tuning and I/O optimization strategies | I/O scheduling, cache configuration, performance monitoring, optimization procedures | **In Development** |
| **Capacity Planning** | Storage capacity management and expansion procedures | Capacity monitoring, growth planning, storage allocation, expansion strategies | **Planned** |

### **🔧 Storage Resources**

| **Resource Type** | **Purpose** | **Technology** | **Status** |
|------------------|-------------|----------------|------------|
| **Storage Scripts** | Automated storage management, pool creation, and optimization procedures | LVM commands, storage automation, management scripts | **In Development** |
| **Monitoring Integration** | Storage monitoring, performance tracking, and capacity alerting | Storage metrics, monitoring integration, alert configuration | **Planned** |
| **Optimization Tools** | Storage performance tuning, I/O optimization, and maintenance utilities | Performance tools, optimization scripts, maintenance automation | **Planned** |

---

## **🛠️ Storage Architecture Framework**

This section documents the Proxmox storage architecture implementation and NVMe optimization strategies for enterprise astronomical computing.

## **4.1 NVMe Storage Configuration and Optimization**

This subsection documents NVMe storage architecture across cluster nodes with Samsung and Fanxiang drives supporting enterprise storage performance and reliability requirements.

NVMe storage configuration provides enterprise-grade storage performance through Samsung MZ1LB1T9HALS-00007 1.92TB drives across node01-node04 and node06 with 14% wear levels, Fanxiang S660 4TB drives on node05 and node07 with 3% wear levels, and systematic NVMe optimization ensuring optimal storage performance for astronomical research data storage and virtual machine deployment across enterprise infrastructure.

Storage optimization includes NVMe drive configuration with discard support, iothread optimization for performance, GPT partitioning with EFI and LVM partitions, temperature monitoring with sensor integration, and systematic wear leveling monitoring ensuring optimal NVMe performance across enterprise infrastructure supporting scientific computing workloads and astronomical research data storage requirements.

```bash
# NVMe storage configuration examples
# Node storage layout (Samsung NVMe 1.92TB)
/dev/nvme0n1: 1.92TB Samsung MZ1LB1T9HALS-00007
├── /dev/nvme0n1p1: 1.03MB BIOS boot partition
├── /dev/nvme0n1p2: 1.07GB EFI partition  
├── /dev/nvme0n1p3: 273.80GB LVM (pve volume group)
└── /dev/nvme0n1p4: 1.65TB LVM (nvmethin01 volume group)

# LVM thin pool configuration
lvcreate -L 1.61T -T nvmethin01/data
lvchange --addtag nvme nvmethin01/data

# Storage pool verification
pvdisplay nvmethin01
# Physical volume "/dev/nvme0n1p4"
# VG Name: nvmethin01
# PV Size: 1.65TB
# Allocatable: yes
# PE Size: 4.00MB
# Total PE: 431616
# Free PE: 41984

# Node06 additional NVMe configuration (3x Samsung drives)
# nvmethin04: 1.86TiB (/dev/nvme1n1)
# nvmethin05: 1.86TiB (/dev/nvme2n1)
```

## **4.2 LVM Thin Provisioning and Pool Management**

This subsection documents LVM thin provisioning configuration and storage pool management across cluster nodes supporting efficient storage utilization and dynamic allocation.

LVM thin provisioning and pool management provide systematic storage allocation through thin pool configuration, dynamic storage allocation, and capacity management ensuring efficient storage utilization across enterprise infrastructure. Pool management implementation covers nvmethin01 pools across all nodes, additional nvmethin04 and nvmethin05 pools on node06, nvmethin02 pool on node05, and systematic pool optimization supporting astronomical research data storage and virtual machine deployment requirements.

Storage pool management includes thin provisioning for virtual machine disks, snapshot capabilities for backup and testing, storage overcommitment with monitoring, automatic pool expansion procedures, and systematic capacity management ensuring optimal storage utilization across enterprise infrastructure supporting scientific computing workloads and research operations.

## **4.3 Storage Performance and I/O Optimization**

This subsection documents storage performance optimization and I/O tuning strategies for NVMe storage supporting high-performance astronomical computing workloads.

Storage performance and I/O optimization provide systematic approaches for NVMe performance tuning through I/O scheduler optimization, cache configuration, storage queue depth tuning, and performance monitoring ensuring optimal storage performance for enterprise infrastructure. Optimization implementation emphasizes astronomical data processing requirements, virtual machine I/O performance, and systematic storage optimization supporting scientific computing workloads and research data management.

Performance optimization includes NVMe I/O scheduler configuration (none/mq-deadline), storage queue depth optimization for NVMe drives, cache configuration for optimal performance, discard/TRIM support for storage efficiency, and systematic performance monitoring ensuring optimal storage performance across enterprise infrastructure supporting astronomical research operations and scientific computing requirements.

# 🔒 **5. Security & Compliance**

This section documents security controls and compliance alignment for Proxmox storage architecture implementation.

**⚠️ SECURITY DISCLAIMER**

*The security implementations described in this document are part of ongoing baseline establishment and should not be considered production-ready specifications. Our team consists of research computing professionals, not dedicated security experts. All security measures are implemented as best-effort implementations based on industry standards. For production deployments requiring formal security validation, engage qualified security professionals for comprehensive review and approval.*

## **5.1 Security Controls**

This subsection documents specific security measures for Proxmox storage architecture and data protection implementation.

**Enterprise-grade storage security guided by industry standards.** Security controls for Proxmox storage architecture include storage encryption for data at rest, access control for storage management, secure storage configuration, backup encryption, and systematic security validation ensuring secure storage infrastructure for enterprise astronomical computing operations supporting research data protection and compliance requirements.

Storage security encompasses LVM access control for storage pools, encryption for sensitive research data, secure storage configuration with appropriate permissions, backup encryption for data protection, and systematic security monitoring ensuring storage security while supporting reliable data storage and astronomical research operations across enterprise infrastructure.

## **5.2 CIS Controls Mapping**

This subsection provides explicit mapping to CIS Controls v8, documenting compliance status and implementation evidence for Proxmox storage security.

**Baseline Standards:** CIS Controls v8, NIST AI Risk Management Framework  
**Framework:** NIST Cybersecurity Framework 2.0  
**Mapping to:** NIST SP 800-171

| **CIS Control** | **Implementation Status** | **Evidence Location** | **Assessment Date** |
|-----------------|--------------------------|----------------------|-------------------|
| **CIS.3.3** | **Compliant** | Role-based access control for storage management and data access | **Informal Gap Assessment** |
| **CIS.13.1** | **Compliant** | Data protection controls for storage encryption and backup security | **Informal Gap Assessment** |
| **CIS.13.6** | **Compliant** | Secure storage configuration and data handling procedures | **Informal Gap Assessment** |
| **CIS.8.1** | **Compliant** | Storage audit logging and access monitoring | **Informal Gap Assessment** |
| **CIS.11.1** | **Compliant** | Data recovery and backup procedures for storage protection | **Informal Gap Assessment** |

**Reference**: [CIS Ubuntu 24.04 Implementation](../../../docs/compliance-security/README.md)

## **5.3 Framework Compliance**

This subsection demonstrates how Proxmox storage architecture implementation satisfies requirements across multiple compliance frameworks.

Proxmox storage architecture implementation aligns with CIS Controls v8 baseline, NIST AI Risk Management Framework requirements, NIST Cybersecurity Framework 2.0 requirements, and NIST SP 800-171 requirements through systematic implementation of comprehensive storage security controls, data protection validation, and compliance documentation procedures appropriate for enterprise computing infrastructure supporting astronomical research with data storage services and scientific computing workloads.

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

This section provides comprehensive links to related Proxmox storage architecture documentation and supporting resources.

## **7.1 Internal References**

| **Document Type** | **Document Title** | **Relationship** | **Link** |
|-------------------|-------------------|------------------|----------|
| **Parent Directory** | Proxmox Overview | Proxmox platform architecture and storage context | [../README.md](../README.md) |
| **Infrastructure** | Infrastructure Overview | Technical architecture and storage infrastructure context | [../../README.md](../../README.md) |
| **Storage Overview** | Storage Infrastructure | Enterprise storage architecture and integration | [../../storage/README.md](../../storage/README.md) |
| **Cluster Configuration** | Proxmox Cluster Configuration | Cluster architecture and storage integration | [../cluster-configuration/README.md](../cluster-configuration/README.md) |
| **Monitoring** | Proxmox Monitoring and Observability | Storage monitoring and performance tracking | [../monitoring-observability/README.md](../monitoring-observability/README.md) |

## **7.2 External Standards**

- **[Proxmox VE Storage](https://pve.proxmox.com/pve-docs/chapter-pvesm.html)** - Comprehensive Proxmox storage configuration and management
- **[LVM Thin Provisioning](https://www.redhat.com/sysadmin/lvm-thin-provisioning)** - LVM thin provisioning configuration and optimization
- **[NVMe Optimization](https://wiki.archlinux.org/title/Solid_state_drive/NVMe)** - NVMe drive optimization and performance tuning
- **[Storage Performance Tuning](https://pve.proxmox.com/pve-docs/chapter-sysadmin.html#storage_performance_tuning)** - Proxmox storage performance optimization guidelines

# ✅ **8. Approval & Review**

This section documents the formal review and approval process for Proxmox storage architecture documentation.

## **8.1 Review Process**

Proxmox storage architecture documentation undergoes comprehensive review by storage specialists, virtualization administrators, and infrastructure engineers to ensure storage effectiveness, performance optimization, and operational reliability.

## **8.2 Approval Matrix**

| **Reviewer** | **Role/Expertise** | **Review Date** | **Approval Status** | **Comments** |
|-------------|-------------------|----------------|-------------------|--------------|
| **crainbramp** | Infrastructure Engineering (Tier 3) | 2025-07-27 | **Approved** | Proxmox storage architecture provides comprehensive NVMe optimization and storage management |
| **alex** | System Operations (Tier 2) | 2025-07-27 | **Approved** | Storage architecture supports effective virtualization storage and performance requirements |
| **glitch** | System Operations (Tier 1/2) | 2025-07-27 | **Approved** | Proxmox storage procedures enable systematic storage management and optimization |

# 📜 **9. Documentation Metadata**

This section provides comprehensive information about document creation, revision history, and authorship.

## **9.1 Change Log**

| **Version** | **Date** | **Changes** | **Author** | **Review Status** |
|------------|---------|-------------|------------|------------------|
| 1.0 | 2025-07-27 | Initial Proxmox storage architecture documentation with NVMe optimization and LVM thin provisioning frameworks | VintageDon | **Approved** |

## **9.2 Authorization & Review**

Proxmox storage architecture documentation approved by Infrastructure Engineering team with validation by storage administration and virtualization teams ensuring comprehensive storage capability and operational effectiveness.

## **9.3 Authorship Details**

**Human Author:** VintageDon (<https://github.com/vintagedon>)  
**AI Contributor:** Claude Sonnet 4 (claude-sonnet-4-20250514)  
**Collaboration Method:** Request-Analyze-Verify-Generate-Validate (RAVGV)  
**Human Oversight:** Infrastructure Proxmox storage validation and optimization procedures review

## **9.4 AI Collaboration Disclosure**

This document was collaboratively developed using the Request-Analyze-Verify-Generate-Validate (RAVGV) methodology. The AI assistant provided systematic documentation structure, Proxmox storage frameworks, and optimization guidance based on established enterprise storage practices and NVMe optimization requirements. All content has been thoroughly reviewed, validated, and approved by qualified human subject matter experts. The human author retains complete responsibility for accuracy, compliance, and technical correctness.

*Generated: 2025-07-27 | Human Author: VintageDon | AI Assistant: Claude Sonnet 4 | Review Status: Approved | Document Version: 1.0*
