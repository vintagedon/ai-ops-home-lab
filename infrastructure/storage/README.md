<!--
---
title: "Storage Infrastructure"
description: "Enterprise-grade storage systems providing high-performance persistent storage, backup solutions, and data management for the Proxmox Astronomy Lab hybrid infrastructure"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude Sonnet 4"
date: "2025-07-20"
version: "1.0"
status: "Published"
tags:
- type: [directory-overview/storage-infrastructure/data-management]
- domain: [storage/nvme/backup/data-persistence]
- tech: [proxmox-storage/nvme/backup-systems/csi]
- phase: [phase-2]
related_documents:
- "[Infrastructure Overview](../README.md)"
- "[Database Infrastructure](../databases/README.md)"
- "[RKE2 Kubernetes](../k8s-rke2/README.md)"
---
-->

# 💾 **Storage Infrastructure**

Enterprise-grade storage systems providing high-performance persistent storage, comprehensive backup solutions, and advanced data management capabilities for the Proxmox Astronomy Lab's hybrid infrastructure. This directory encompasses NVMe storage clusters, backup infrastructure, and data lifecycle management supporting astronomical research computing across our 7-node cluster.

## **Overview**

Storage infrastructure forms the foundational data persistence layer enabling all astronomical research activities within our hybrid architecture. Our enterprise-grade storage solution combines high-performance NVMe storage pools with comprehensive backup and disaster recovery capabilities, specifically optimized for the demanding I/O requirements of astronomical data processing and large-scale scientific computing.

The storage architecture integrates seamlessly across VM-based services and Kubernetes persistent volumes, providing consistent high-performance data access while maintaining enterprise-grade data protection and compliance standards. This approach ensures optimal performance for diverse astronomical workloads while supporting long-term data preservation requirements.

---

## **📂 Directory Contents**

This section provides systematic navigation to all storage infrastructure documentation and operational procedures.

### **Storage Categories**

| **Category** | **Purpose** | **Documentation Status** |
|--------------|-------------|-------------------------|
| **NVMe Storage Pools** | High-performance primary storage for active workloads | In Production |
| **Backup Infrastructure** | Comprehensive backup systems and disaster recovery | In Production |
| **Persistent Volume Management** | Kubernetes CSI integration and volume lifecycle | In Development |
| **Data Lifecycle Management** | Archival, retention, and data movement policies | In Development |
| **Performance Optimization** | Storage tuning and I/O optimization strategies | In Development |
| **Monitoring & Alerting** | Storage monitoring, capacity planning, and alerting | Planned |
| **Disaster Recovery** | Cross-site backup and recovery procedures | Planned |

### **Key Procedures**

| **Procedure** | **Purpose** | **Status** |
|---------------|-------------|------------|
| **Storage Pool Management** | NVMe pool creation, expansion, and maintenance | Pending |
| **Backup Configuration Guide** | Comprehensive backup setup and scheduling | Pending |
| **Persistent Volume Provisioning** | Kubernetes storage class and PV management | Pending |
| **Data Migration Procedures** | Storage migration and data movement workflows | Pending |

---

## **📁 Repository Structure**

``` markdown
storage/
├── 📚 nvme-storage/           # High-performance NVMe storage systems
│   ├── storage-pools/        # Proxmox storage pool configuration
│   ├── performance-tuning/   # I/O optimization and tuning procedures
│   ├── capacity-planning/    # Storage capacity management and expansion
│   └── maintenance/          # Storage maintenance and health monitoring
├── 🏗️ backup-systems/        # Backup infrastructure and procedures
│   ├── proxmox-backup/       # Proxmox Backup Server configuration
│   ├── iperius-enterprise/   # Iperius backup software integration
│   ├── retention-policies/   # Backup retention and lifecycle management
│   └── recovery-procedures/  # Disaster recovery and restoration workflows
├── ☸️ kubernetes-storage/    # Kubernetes persistent volume management
│   ├── csi-drivers/          # Container Storage Interface configuration
│   ├── storage-classes/      # Kubernetes storage class definitions
│   ├── pv-management/        # Persistent volume lifecycle management
│   └── volume-snapshots/     # Kubernetes volume snapshot management
├── 📋 data-management/       # Data lifecycle and governance
│   ├── archival-strategies/  # Long-term data archival and preservation
│   ├── migration-tools/      # Data movement and migration utilities
│   ├── retention-policies/   # Data retention and cleanup procedures
│   └── compliance/           # Data governance and compliance frameworks
├── 🔍 monitoring/            # Storage monitoring and alerting
│   ├── performance-metrics/  # I/O performance and utilization monitoring
│   ├── capacity-monitoring/  # Storage capacity tracking and alerting
│   ├── health-checks/        # Storage system health and diagnostics
│   └── alerting-rules/       # Storage-specific alert definitions
├── 📝 README.md              # This file
└── 📄 troubleshooting.md     # Common storage issues and resolution procedures
```

### **Navigation Guide:**

- **[📚 NVMe Storage](nvme-storage/)** - High-performance primary storage systems and optimization
- **[🏗️ Backup Systems](backup-systems/)** - Comprehensive backup infrastructure and procedures
- **[☸️ Kubernetes Storage](kubernetes-storage/)** - Container persistent volume management and CSI integration
- **[📋 Data Management](data-management/)** - Data lifecycle, governance, and compliance procedures

---

## **🔗 Related Categories**

This section establishes horizontal relationships within the infrastructure knowledge graph.

| **Category** | **Relationship** | **Documentation** |
|--------------|------------------|-------------------|
| **[Database Infrastructure](../databases/README.md)** | Primary consumer of high-performance storage for astronomical datasets | [../databases/README.md](../databases/README.md) |
| **[RKE2 Kubernetes](../k8s-rke2/README.md)** | Kubernetes persistent volume provisioning and container storage | [../k8s-rke2/README.md](../k8s-rke2/README.md) |
| **[AI & Machine Learning](../../ai-and-machine-learning/README.md)** | High-throughput storage for ML datasets and model training | [../../ai-and-machine-learning/README.md](../../ai-and-machine-learning/README.md) |
| **[Backup Management Policies](../../policies-and-procedures/backup-management/README.md)** | Enterprise backup policies and data protection procedures | [../../policies-and-procedures/backup-management/README.md](../../policies-and-procedures/backup-management/README.md) |
| **[Monitoring & Observability](../../docs/monitoring-observability/README.md)** | Storage monitoring integration with centralized observability stack | [../../docs/monitoring-observability/README.md](../../docs/monitoring-observability/README.md) |

---

## **Getting Started**

For new administrators approaching storage infrastructure:

1. **Start Here:** [NVMe Storage Pools](nvme-storage/storage-pools/) - Understanding primary storage architecture
2. **Backup Setup:** [Backup Systems](backup-systems/) - Configuring comprehensive data protection
3. **Kubernetes Integration:** [CSI Drivers](kubernetes-storage/csi-drivers/) - Container storage provisioning
4. **Advanced Management:** [Data Lifecycle](data-management/) - Data governance and archival strategies

---

## **🏗️ Storage Architecture**

### **High-Performance NVMe Storage**

Our enterprise storage infrastructure is built on high-performance NVMe storage distributed across the 7-node cluster:

**Primary Storage Pools:**

- **nvmethin01** - Primary NVMe pool for active workloads and databases
- **nvmethin02** - Secondary NVMe pool for distributed storage and redundancy
- **nvmethin03** - Tertiary NVMe pool for specialized workloads and expansion
- **nvmethin04** - Quaternary NVMe pool for backup and archival systems

**Total Cluster Storage:** ~13.27 TiB of high-performance NVMe storage

### **Storage Distribution**

| **Node** | **Storage Role** | **Capacity** | **Workload Type** |
|----------|------------------|--------------|-------------------|
| **node01-node07** | Distributed Storage | ~1.9 TiB each | VM disks, databases, container volumes |
| **Backup Nodes** | Backup Storage | 4TB+ dedicated | Backup repositories and archival |

### **Performance Characteristics**

- **High IOPS** - Optimized for database and analytical workload I/O patterns
- **Low Latency** - Sub-millisecond latency for real-time astronomical data processing
- **High Throughput** - Multi-GB/s sequential performance for large dataset operations
- **Concurrent Access** - Optimized for multiple simultaneous research applications

---

## **💾 Backup Infrastructure**

### **Multi-Tier Backup Strategy**

Comprehensive backup infrastructure ensuring enterprise-grade data protection:

**Proxmox Backup Server (pbs01):**

- **Dedicated backup appliance** with 4TB+ storage capacity
- **Automated VM snapshots** with configurable retention policies
- **Incremental backups** for efficient storage utilization
- **Cross-node replication** for disaster recovery capabilities

**Iperius Enterprise Integration:**

- **Advanced backup software** for comprehensive data protection
- **Database-aware backups** for PostgreSQL and application data
- **Cloud integration** for off-site backup and archival
- **Automated scheduling** with enterprise reporting and alerting

### **Backup Architecture**

| **Backup Type** | **Frequency** | **Retention** | **Storage Location** |
|-----------------|---------------|---------------|----------------------|
| **VM Snapshots** | Daily | 30 days | Proxmox Backup Server |
| **Database Backups** | Daily + Point-in-time | 90 days | Iperius + Cloud |
| **Application Data** | Daily | 60 days | Multi-tier storage |
| **Configuration Backup** | Weekly | 1 year | Version control + cloud |

### **Disaster Recovery**

- **RTO:** Recovery Time Objective < 4 hours for critical systems
- **RPO:** Recovery Point Objective < 1 hour for database systems
- **Cross-Site Backup** - Off-site replication for disaster scenarios
- **Automated Testing** - Regular recovery testing and validation

---

## **☸️ Kubernetes Storage Integration**

### **Container Storage Interface (CSI)**

Kubernetes storage integration through Proxmox CSI driver:

- **Dynamic Provisioning** - Automatic persistent volume creation for containers
- **Storage Classes** - Multiple performance tiers for different workload requirements
- **Volume Snapshots** - Kubernetes-native snapshot capabilities
- **Resize Support** - Dynamic volume expansion for growing workloads

### **Persistent Volume Management**

| **Storage Class** | **Performance** | **Use Case** | **Backup Policy** |
|-------------------|-----------------|--------------|-------------------|
| **nvme-high-perf** | High IOPS | Databases, ML training | Daily snapshots |
| **nvme-standard** | Balanced | Applications, services | Weekly snapshots |
| **nvme-bulk** | High throughput | Data processing, ETL | Monthly snapshots |

### **Volume Lifecycle**

- **Provisioning** - Automated PV creation through storage classes
- **Binding** - Dynamic binding to pod storage requirements
- **Expansion** - Online volume expansion for growing datasets
- **Cleanup** - Automated volume cleanup and reclamation

---

## **📊 Astronomical Data Optimization**

### **Workload-Specific Optimization**

Storage infrastructure optimized for astronomical computing patterns:

**Database Workloads:**

- **High random IOPS** for complex astronomical queries and spatial indexing
- **Optimized for PostgreSQL** with appropriate block sizes and allocation
- **Database-aware snapshots** preserving transaction consistency

**ML/AI Workloads:**

- **High sequential throughput** for large dataset loading and model training
- **GPU-accessible storage** for direct data access from compute accelerators
- **Distributed storage** supporting multi-node training and inference

**Data Processing:**

- **Bulk storage pools** for ETL operations and data transformation
- **Temporary storage** for intermediate processing results
- **High-bandwidth access** for streaming data processing pipelines

### **Astronomical Dataset Support**

Specialized storage configurations for astronomical data types:

- **FITS File Optimization** - Block size and allocation optimized for FITS data
- **Time-Series Storage** - Optimized for high-frequency observational data
- **Catalog Storage** - Efficient storage for large astronomical catalogs
- **Image Data** - Optimized for large astronomical image datasets and surveys

---

## **🔒 Enterprise Data Protection**

### **Security Framework**

Storage security implementation following enterprise standards:

- **Encryption at Rest** - Full disk encryption for all storage pools
- **Access Control** - Role-based storage access aligned with research projects
- **Network Security** - Secure storage network isolation and encryption
- **Audit Logging** - Comprehensive access and modification logging

### **Compliance and Governance**

Data storage aligned with research computing standards:

- **Data Classification** - Tiered storage based on data sensitivity and importance
- **Retention Policies** - Automated data lifecycle management and archival
- **Geographic Distribution** - Multi-site storage for disaster recovery
- **Regulatory Compliance** - Storage practices aligned with research data requirements

### **Monitoring and Alerting**

Comprehensive storage monitoring integrated with enterprise observability:

- **Performance Monitoring** - I/O metrics, latency, and throughput tracking
- **Capacity Alerting** - Proactive alerts for storage capacity and growth
- **Health Monitoring** - Storage system health and predictive failure detection
- **Backup Validation** - Automated backup success and integrity verification

---

## **Document Information**

| **Field** | **Value** |
|-----------|-----------|
| **Author** | VintageDon - <https://github.com/vintagedon> |
| **Created** | 2025-07-20 |
| **Last Updated** | 2025-07-20 |
| **Version** | 1.0 |

---
Tags: storage, nvme, backup, persistent-volumes, data-management, enterprise-infrastructure
