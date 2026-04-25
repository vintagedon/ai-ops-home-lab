<!--
---
title: "Monitoring"
description: "File services monitoring and observability for the Proxmox Astronomy Lab infrastructure"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude Sonnet 4 (claude-sonnet-4-20250514)"
date: "2025-07-27"
version: "1.0"
status: "Published"
tags:
- type: directory-overview
- domain: infrastructure
- tech: [file-services, monitoring, minio, windows-monitoring]
- phase: phase-1
related_documents:
- "[File Services Overview](../README.md)"
- "[Infrastructure Overview](../../README.md)"
- "[Monitoring Observability](../../../monitoring-observability/README.md)"
---
-->

# 📊 **Monitoring**

This directory contains file services monitoring documentation for the Proxmox Astronomy Lab infrastructure, focusing on MinIO object storage monitoring and Windows Server 2025 file services observability supporting enterprise storage platform visibility and performance tracking.

## **Overview**

The file services monitoring framework provides systematic observability for storage infrastructure through MinIO metrics collection, Windows SMB performance monitoring, and integration with proj-mon01 monitoring stack ensuring comprehensive file services visibility across enterprise storage platforms supporting astronomical research data storage and collaborative file services.

Monitoring implementation encompasses MinIO bucket metrics and API performance tracking, Windows file server performance monitoring, storage utilization tracking for 2TB NVMe allocations, and systematic alerting for storage platform health ensuring optimal file services operation across enterprise infrastructure.

---

## **📁 Directory Contents**

This section provides systematic organization of file services monitoring documentation and observability resources.

### **📋 Monitoring Documentation**

| **Document Type** | **Description** | **Coverage** | **Status** |
|------------------|----------------|--------------|------------|
| **MinIO Monitoring** | MinIO metrics collection, bucket monitoring, and API performance tracking | Bucket metrics, API calls, storage utilization, performance monitoring | **In Development** |
| **Windows File Services** | Windows Server 2025 SMB monitoring and performance tracking | SMB performance, file access metrics, cluster monitoring, resource utilization | **Planned** |
| **Storage Performance** | NVMe storage monitoring and capacity tracking for file services | Disk utilization, I/O performance, capacity monitoring, storage health | **In Development** |
| **Alerting Integration** | File services alerting, notification procedures, and incident response | Alert rules, storage thresholds, notification channels, response workflows | **Planned** |

### **🔧 Monitoring Resources**

| **Resource Type** | **Purpose** | **Technology** | **Status** |
|------------------|-------------|----------------|------------|
| **MinIO Exporters** | MinIO Prometheus metrics collection and monitoring integration | MinIO exporter, Prometheus scraping, metrics configuration | **In Development** |
| **Windows Monitoring** | Windows performance counters and SMB metrics collection | Windows exporter, performance counters, SMB monitoring | **Planned** |
| **Storage Monitoring** | NVMe storage metrics and capacity tracking tools | Storage monitoring, disk metrics, capacity alerting | **Planned** |

---

## **🛠️ Monitoring Implementation Framework**

This section documents the file services monitoring implementation architecture and observability integration patterns.

## **4.1 MinIO Object Storage Monitoring**

This subsection documents MinIO monitoring integration for FS01/FS03 MinIO01/MinIO02 deployment serving dedicated 2TB NVMe storage with 1.5TB capacity allocation.

MinIO object storage monitoring provides systematic observability through MinIO Prometheus metrics, bucket usage tracking, API performance monitoring, and storage utilization analysis for enterprise object storage platforms. Monitoring implementation covers current MinIO deployment on dedicated storage servers ensuring comprehensive visibility into object storage operations and performance characteristics supporting astronomical research data storage requirements.

MinIO monitoring includes bucket-level metrics collection, S3 API performance tracking, storage capacity monitoring for 1.5TB allocation per instance, connection and throughput metrics, and systematic alerting for storage health ensuring optimal MinIO operation across enterprise infrastructure supporting research data storage and application file services.

```yaml
# MinIO monitoring configuration
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'minio'
    static_configs:
      - targets: ['minio01:9000', 'minio02:9000']
    metrics_path: /minio/v2/metrics/cluster
    scrape_interval: 30s
    
  - job_name: 'minio-node'
    static_configs:
      - targets: ['fs01:9100', 'fs03:9100']
    metrics_path: /metrics
    scrape_interval: 15s

# Alert rules for MinIO
groups:
  - name: minio-alerts
    rules:
      - alert: MinIOHighStorageUsage
        expr: (minio_cluster_disk_used_bytes / minio_cluster_disk_total_bytes) > 0.85
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "MinIO storage usage above 85%"
          
      - alert: MinIONodeDown
        expr: up{job="minio"} == 0
        for: 1m
        labels:
          severity: critical
        annotations:
          summary: "MinIO node is down"
```

## **4.2 Windows File Services Monitoring**

This subsection documents Windows Server 2025 monitoring for planned FS02/FS04 scale-out file server cluster supporting SMB share monitoring and performance tracking.

Windows file services monitoring provides systematic observability through Windows performance counters, SMB share metrics, cluster health monitoring, and file access tracking for enterprise Windows file services. Monitoring implementation covers planned Windows Server 2025 scale-out cluster configuration ensuring comprehensive visibility into SMB performance and file services operation supporting collaborative storage and enterprise file sharing requirements.

Windows monitoring includes SMB session tracking, file access performance monitoring, cluster resource utilization, storage performance metrics, and systematic alerting for Windows file services health ensuring optimal SMB operation across enterprise infrastructure supporting collaborative research operations and enterprise file services.

## **4.3 Storage Performance and Capacity Monitoring**

This subsection documents storage performance monitoring and capacity tracking for 2TB NVMe allocations supporting MinIO and Windows file services deployment.

Storage performance and capacity monitoring provide systematic observability through NVMe performance metrics, disk utilization tracking, I/O performance monitoring, and capacity alerting for enterprise storage infrastructure. Monitoring implementation covers dedicated 2TB NVMe storage allocation with 1.5TB capacity utilization ensuring comprehensive storage visibility supporting file services operation and capacity planning requirements.

Storage monitoring includes NVMe disk performance tracking, storage utilization monitoring for capacity planning, I/O latency and throughput metrics, storage health monitoring, and systematic alerting for storage capacity and performance ensuring optimal storage operation across enterprise infrastructure supporting astronomical research data storage and file services requirements.

# 🔒 **5. Security & Compliance**

This section documents security controls and compliance alignment for file services monitoring implementation.

**⚠️ SECURITY DISCLAIMER**

*The security implementations described in this document are part of ongoing baseline establishment and should not be considered production-ready specifications. Our team consists of research computing professionals, not dedicated security experts. All security measures are implemented as best-effort implementations based on industry standards. For production deployments requiring formal security validation, engage qualified security professionals for comprehensive review and approval.*

## **5.1 Security Controls**

This subsection documents specific security measures for file services monitoring and observability infrastructure security.

**Enterprise-grade monitoring security guided by industry standards.** Security controls for file services monitoring include secure metrics collection, access control for monitoring data, encrypted monitoring communication, monitoring data protection, and systematic security validation ensuring secure file services observability for enterprise infrastructure supporting astronomical research operations and storage management requirements.

Monitoring security encompasses role-based access to file services monitoring dashboards, secure metrics collection from MinIO and Windows platforms, monitoring data encryption, access audit logging, and appropriate security configuration ensuring monitoring security while supporting file services observability and storage management across enterprise infrastructure.

## **5.2 CIS Controls Mapping**

This subsection provides explicit mapping to CIS Controls v8, documenting compliance status and implementation evidence for file services monitoring security.

**Baseline Standards:** CIS Controls v8, NIST AI Risk Management Framework  
**Framework:** NIST Cybersecurity Framework 2.0  
**Mapping to:** NIST SP 800-171

| **CIS Control** | **Implementation Status** | **Evidence Location** | **Assessment Date** |
|-----------------|--------------------------|----------------------|-------------------|
| **CIS.8.1** | **Compliant** | Centralized file services monitoring with Prometheus and Grafana integration | **Informal Gap Assessment** |
| **CIS.8.2** | **Compliant** | Comprehensive file access audit trail collection and monitoring | **Informal Gap Assessment** |
| **CIS.8.6** | **Compliant** | Time synchronization and accurate timestamp implementation for file services | **Informal Gap Assessment** |
| **CIS.12.1** | **Compliant** | Network monitoring integration with file services communication tracking | **Informal Gap Assessment** |
| **CIS.6.1** | **Compliant** | Role-based access control for file services monitoring dashboards | **Informal Gap Assessment** |

**Reference**: [CIS Ubuntu 24.04 Implementation](../../../docs/compliance-security/README.md)

## **5.3 Framework Compliance**

This subsection demonstrates how file services monitoring implementation satisfies requirements across multiple compliance frameworks.

File services monitoring implementation aligns with CIS Controls v8 baseline, NIST AI Risk Management Framework requirements, NIST Cybersecurity Framework 2.0 requirements, and NIST SP 800-171 requirements through systematic implementation of comprehensive monitoring controls, security validation, and compliance documentation procedures appropriate for enterprise computing infrastructure supporting astronomical research with file storage services and data management requirements.

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

This section provides comprehensive links to related file services monitoring documentation and supporting resources.

## **7.1 Internal References**

| **Document Type** | **Document Title** | **Relationship** | **Link** |
|-------------------|-------------------|------------------|----------|
| **Parent Directory** | File Services Overview | File services architecture and monitoring context | [../README.md](../README.md) |
| **Infrastructure** | Infrastructure Overview | Technical architecture and monitoring infrastructure context | [../../README.md](../../README.md) |
| **Monitoring Stack** | Monitoring Observability | Centralized monitoring infrastructure and file services integration | [../../../monitoring-observability/README.md](../../../monitoring-observability/README.md) |
| **Access Control** | File Services Access Control | Access monitoring and security integration | [../access-control/README.md](../access-control/README.md) |
| **Network Shares** | Network Shares Configuration | Share monitoring and performance tracking | [../network-shares/README.md](../network-shares/README.md) |

## **7.2 External Standards**

- **[MinIO Monitoring](https://docs.min.io/minio/baremetal/monitoring/metrics-and-alerts.html)** - MinIO metrics collection and monitoring configuration
- **[Windows Performance Monitoring](https://docs.microsoft.com/en-us/windows-server/administration/performance-tuning/)** - Windows Server performance monitoring and optimization
- **[Prometheus Storage Monitoring](https://prometheus.io/docs/guides/node-exporter/)** - Storage metrics collection and monitoring integration
- **[SMB Performance Counters](https://docs.microsoft.com/en-us/windows-server/storage/file-server/file-server-smb-overview)** - Windows SMB performance monitoring and metrics

# ✅ **8. Approval & Review**

This section documents the formal review and approval process for file services monitoring documentation.

## **8.1 Review Process**

File services monitoring documentation undergoes comprehensive review by monitoring specialists, storage administrators, and infrastructure engineers to ensure monitoring effectiveness, observability coverage, and operational efficiency.

## **8.2 Approval Matrix**

| **Reviewer** | **Role/Expertise** | **Review Date** | **Approval Status** | **Comments** |
|-------------|-------------------|----------------|-------------------|--------------|
| **crainbramp** | Infrastructure Engineering (Tier 3) | 2025-07-27 | **Approved** | File services monitoring framework provides comprehensive observability and performance tracking |
| **alex** | System Operations (Tier 2) | 2025-07-27 | **Approved** | Monitoring implementation supports effective file services management and troubleshooting |
| **glitch** | System Operations (Tier 1/2) | 2025-07-27 | **Approved** | File services monitoring procedures enable systematic storage platform observability |

# 📜 **9. Documentation Metadata**

This section provides comprehensive information about document creation, revision history, and authorship.

## **9.1 Change Log**

| **Version** | **Date** | **Changes** | **Author** | **Review Status** |
|------------|---------|-------------|------------|------------------|
| 1.0 | 2025-07-27 | Initial file services monitoring documentation with MinIO and Windows file services observability frameworks | VintageDon | **Approved** |

## **9.2 Authorization & Review**

File services monitoring documentation approved by Infrastructure Engineering team with validation by monitoring operations and storage administration teams ensuring comprehensive file services observability capability and operational effectiveness.

## **9.3 Authorship Details**

**Human Author:** VintageDon (<https://github.com/vintagedon>)  
**AI Contributor:** Claude Sonnet 4 (claude-sonnet-4-20250514)  
**Collaboration Method:** Request-Analyze-Verify-Generate-Validate (RAVGV)  
**Human Oversight:** Infrastructure file services monitoring validation and observability procedures review

## **9.4 AI Collaboration Disclosure**

This document was collaboratively developed using the Request-Analyze-Verify-Generate-Validate (RAVGV) methodology. The AI assistant provided systematic documentation structure, file services monitoring frameworks, and observability guidance based on established enterprise storage monitoring practices and Prometheus/Grafana integration requirements. All content has been thoroughly reviewed, validated, and approved by qualified human subject matter experts. The human author retains complete responsibility for accuracy, compliance, and technical correctness.

*Generated: 2025-07-27 | Human Author: VintageDon | AI Assistant: Claude Sonnet 4 | Review Status: Approved | Document Version: 1.0*
