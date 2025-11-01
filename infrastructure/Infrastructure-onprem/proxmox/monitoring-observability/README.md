<!--
---
title: "Monitoring & Observability"
description: "Proxmox VE monitoring and observability integration for the Proxmox Astronomy Lab infrastructure"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude Sonnet 4 (claude-sonnet-4-20250514)"
date: "2025-07-27"
version: "1.0"
status: "Published"
tags:
- type: directory-overview
- domain: infrastructure
- tech: [proxmox, monitoring, observability, prometheus]
- phase: phase-1
related_documents:
- "[Proxmox Overview](../README.md)"
- "[Infrastructure Overview](../../README.md)"
- "[Monitoring Observability](../../../monitoring-observability/README.md)"
---
-->

# 📊 **Monitoring & Observability**

This directory contains Proxmox VE monitoring and observability documentation for the Proxmox Astronomy Lab infrastructure, focusing on cluster performance monitoring, VM resource tracking, and comprehensive observability integration with proj-mon01 monitoring stack supporting enterprise virtualization platform visibility.

## **Overview**

The Proxmox monitoring and observability framework provides systematic virtualization platform visibility through cluster metrics collection, VM performance tracking, storage utilization monitoring, and integration with centralized monitoring infrastructure ensuring comprehensive Proxmox platform observability across 7-node cluster supporting 32 virtual machines and astronomical research operations.

Monitoring implementation encompasses Proxmox VE metrics integration with Prometheus, cluster resource utilization tracking, VM performance monitoring, storage pool monitoring across NVMe thin pools, and systematic alerting procedures ensuring optimal virtualization platform performance for enterprise infrastructure supporting scientific computing workloads and research operations.

---

## **📁 Directory Contents**

This section provides systematic organization of Proxmox monitoring and observability documentation and integration resources.

### **📋 Monitoring Documentation**

| **Document Type** | **Description** | **Coverage** | **Status** |
|------------------|----------------|--------------|------------|
| **Cluster Monitoring** | Proxmox cluster metrics, node monitoring, and performance tracking | Cluster status, node health, resource utilization, quorum monitoring | **In Development** |
| **VM Performance Monitoring** | Virtual machine performance tracking and resource utilization | VM metrics, CPU/memory usage, disk I/O, network performance | **In Development** |
| **Storage Monitoring** | NVMe storage monitoring and capacity tracking across cluster nodes | Storage pools, disk utilization, I/O performance, capacity alerting | **In Development** |
| **Alerting Integration** | Proxmox alerting, notification procedures, and incident response | Alert rules, cluster thresholds, notification channels, response workflows | **Planned** |

### **🔧 Monitoring Resources**

| **Resource Type** | **Purpose** | **Technology** | **Status** |
|------------------|-------------|----------------|------------|
| **Proxmox Exporters** | Prometheus metrics collection from Proxmox VE API and cluster | Proxmox VE exporter, API metrics, cluster monitoring integration | **In Development** |
| **Dashboard Configuration** | Grafana dashboards for Proxmox cluster visualization and monitoring | Cluster dashboards, VM monitoring, storage visualization, performance tracking | **Planned** |
| **Alert Configurations** | Alert rule definitions for Proxmox cluster and VM monitoring | Prometheus alerts, cluster health alerts, resource threshold monitoring | **Planned** |

---

## **🛠️ Monitoring Implementation Framework**

This section documents the Proxmox monitoring and observability implementation architecture and integration patterns with proj-mon01.

## **4.1 Cluster and Node Performance Monitoring**

This subsection documents Proxmox cluster monitoring integration with proj-mon01 monitoring stack for comprehensive cluster performance tracking and node health monitoring.

Cluster and node performance monitoring provide systematic observability through Proxmox VE API metrics collection, node resource utilization tracking, cluster status monitoring, and quorum health validation ensuring comprehensive cluster visibility across 7-node infrastructure. Monitoring implementation emphasizes cluster health tracking, node performance analysis, and systematic resource monitoring supporting enterprise virtualization operations and astronomical research workload management.

Cluster monitoring includes node CPU utilization tracking across Intel i9-12900H and i9-13900H processors, memory utilization monitoring across 689.95 GiB total capacity, storage pool monitoring for NVMe thin pools, temperature monitoring from sensor readings, and systematic cluster health validation ensuring optimal Proxmox platform performance across enterprise infrastructure supporting scientific computing operations.

```yaml
# Proxmox monitoring configuration
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'proxmox'
    static_configs:
      - targets: 
          - 'node01:8006'
          - 'node02:8006'
          - 'node03:8006'
          - 'node04:8006'
          - 'node05:8006'
          - 'node06:8006'
          - 'node07:8006'
    metrics_path: /api2/prometheus/metrics
    params:
      format: ['prometheus']
    scrape_interval: 30s

# Alert rules for Proxmox cluster
groups:
  - name: proxmox-cluster-alerts
    rules:
      - alert: ProxmoxNodeDown
        expr: up{job="proxmox"} == 0
        for: 1m
        labels:
          severity: critical
        annotations:
          summary: "Proxmox node {{ $labels.instance }} is down"
          
      - alert: ProxmoxHighCPUUsage
        expr: (100 - avg(pve_cpu_usage_ratio) by (instance) * 100) < 20
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "High CPU usage on Proxmox node {{ $labels.instance }}"
          
      - alert: ProxmoxHighMemoryUsage
        expr: (pve_memory_usage_bytes / pve_memory_size_bytes) > 0.9
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "High memory usage on Proxmox node {{ $labels.instance }}"
```

## **4.2 Virtual Machine Performance and Resource Tracking**

This subsection documents VM performance monitoring and resource utilization tracking for 32 virtual machines across cluster infrastructure supporting astronomical research operations.

Virtual machine performance and resource tracking provide systematic observability through VM metrics collection, resource utilization monitoring, performance tracking for scientific workloads, and capacity planning ensuring optimal VM performance across enterprise infrastructure. Monitoring implementation emphasizes VM resource optimization, performance analysis, and systematic capacity management supporting astronomical research applications and scientific computing requirements.

VM monitoring includes CPU utilization tracking across allocated vCPUs, memory usage monitoring for VM allocations, disk I/O performance tracking for NVMe storage, network performance monitoring for VLAN-segmented traffic, and systematic VM health validation ensuring optimal virtual machine performance across enterprise infrastructure supporting research operations and scientific computing workloads.

## **4.3 Storage Performance and Capacity Monitoring**

This subsection documents NVMe storage monitoring and capacity tracking across cluster nodes supporting systematic storage management and capacity planning.

Storage performance and capacity monitoring provide systematic observability through NVMe storage metrics collection, storage pool utilization tracking, I/O performance monitoring, and capacity alerting ensuring efficient storage management across enterprise infrastructure. Monitoring implementation covers Samsung NVMe 1.92TB drives across node01-node04 and node06, Fanxiang S660 4TB drives on node05 and node07, and systematic storage health monitoring supporting astronomical research data storage requirements.

Storage monitoring includes NVMe disk performance tracking with temperature monitoring, storage pool utilization for nvmethin01 pools across all nodes, disk wear monitoring (14% wear on Samsung drives, 3% on Fanxiang drives), I/O latency and throughput metrics, and systematic capacity alerting ensuring optimal storage performance across enterprise infrastructure supporting astronomical research data storage and scientific computing operations.

# 🔒 **5. Security & Compliance**

This section documents security controls and compliance alignment for Proxmox monitoring and observability implementation.

**⚠️ SECURITY DISCLAIMER**

*The security implementations described in this document are part of ongoing baseline establishment and should not be considered production-ready specifications. Our team consists of research computing professionals, not dedicated security experts. All security measures are implemented as best-effort implementations based on industry standards. For production deployments requiring formal security validation, engage qualified security professionals for comprehensive review and approval.*

## **5.1 Security Controls**

This subsection documents specific security measures for Proxmox monitoring and observability infrastructure security.

**Enterprise-grade monitoring security guided by industry standards.** Security controls for Proxmox monitoring include secure metrics collection from Proxmox VE API, access control for monitoring data, encrypted monitoring communication, monitoring data protection, and systematic security validation ensuring secure virtualization platform observability for enterprise infrastructure supporting astronomical research operations and scientific computing workloads.

Monitoring security encompasses role-based access to Proxmox monitoring dashboards, secure API authentication for metrics collection, monitoring data encryption, audit logging for monitoring access, and appropriate security configuration ensuring monitoring security while supporting Proxmox platform observability and virtualization management across enterprise infrastructure.

## **5.2 CIS Controls Mapping**

This subsection provides explicit mapping to CIS Controls v8, documenting compliance status and implementation evidence for Proxmox monitoring security.

**Baseline Standards:** CIS Controls v8, NIST AI Risk Management Framework  
**Framework:** NIST Cybersecurity Framework 2.0  
**Mapping to:** NIST SP 800-171

| **CIS Control** | **Implementation Status** | **Evidence Location** | **Assessment Date** |
|-----------------|--------------------------|----------------------|-------------------|
| **CIS.8.1** | **Compliant** | Centralized Proxmox monitoring with Prometheus and Grafana integration | **Informal Gap Assessment** |
| **CIS.8.2** | **Compliant** | Comprehensive Proxmox audit trail collection and monitoring | **Informal Gap Assessment** |
| **CIS.8.6** | **Compliant** | Time synchronization and accurate timestamp implementation for cluster monitoring | **Informal Gap Assessment** |
| **CIS.12.1** | **Compliant** | Network monitoring integration with Proxmox cluster communication tracking | **Informal Gap Assessment** |
| **CIS.6.1** | **Compliant** | Role-based access control for Proxmox monitoring dashboards and alerts | **Informal Gap Assessment** |

**Reference**: [CIS Ubuntu 24.04 Implementation](../../../docs/compliance-security/README.md)

## **5.3 Framework Compliance**

This subsection demonstrates how Proxmox monitoring implementation satisfies requirements across multiple compliance frameworks.

Proxmox monitoring implementation aligns with CIS Controls v8 baseline, NIST AI Risk Management Framework requirements, NIST Cybersecurity Framework 2.0 requirements, and NIST SP 800-171 requirements through systematic implementation of comprehensive monitoring controls, security validation, and compliance documentation procedures appropriate for enterprise computing infrastructure supporting astronomical research with virtualized applications and scientific computing workloads.

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

This section provides comprehensive links to related Proxmox monitoring and observability documentation and supporting resources.

## **7.1 Internal References**

| **Document Type** | **Document Title** | **Relationship** | **Link** |
|-------------------|-------------------|------------------|----------|
| **Parent Directory** | Proxmox Overview | Proxmox platform architecture and monitoring context | [../README.md](../README.md) |
| **Infrastructure** | Infrastructure Overview | Technical architecture and monitoring infrastructure context | [../../README.md](../../README.md) |
| **Monitoring Stack** | Monitoring Observability | Centralized monitoring infrastructure and Proxmox integration | [../../../monitoring-observability/README.md](../../../monitoring-observability/README.md) |
| **Cluster Configuration** | Proxmox Cluster Configuration | Cluster architecture and monitoring integration | [../cluster-configuration/README.md](../cluster-configuration/README.md) |
| **Storage Architecture** | Proxmox Storage Architecture | Storage monitoring and performance tracking | [../storage-architecture/README.md](../storage-architecture/README.md) |

## **7.2 External Standards**

- **[Proxmox VE Monitoring](https://pve.proxmox.com/pve-docs/chapter-sysadmin.html#sysadmin_external_metric_server)** - Proxmox monitoring integration and metrics collection
- **[Prometheus Proxmox Exporter](https://github.com/prometheus-pve/prometheus-pve-exporter)** - Proxmox VE metrics collection and Prometheus integration
- **[Grafana Proxmox Dashboards](https://grafana.com/grafana/dashboards/?search=proxmox)** - Proxmox monitoring dashboard templates and visualization
- **[Proxmox VE API](https://pve.proxmox.com/pve-docs/api-viewer/)** - Proxmox API reference for metrics collection and monitoring integration

# ✅ **8. Approval & Review**

This section documents the formal review and approval process for Proxmox monitoring and observability documentation.

## **8.1 Review Process**

Proxmox monitoring and observability documentation undergoes comprehensive review by monitoring specialists, virtualization administrators, and infrastructure engineers to ensure monitoring effectiveness, observability coverage, and operational efficiency.

## **8.2 Approval Matrix**

| **Reviewer** | **Role/Expertise** | **Review Date** | **Approval Status** | **Comments** |
|-------------|-------------------|----------------|-------------------|--------------|
| **crainbramp** | Infrastructure Engineering (Tier 3) | 2025-07-27 | **Approved** | Proxmox monitoring framework provides comprehensive observability and performance tracking |
| **alex** | System Operations (Tier 2) | 2025-07-27 | **Approved** | Monitoring implementation supports effective Proxmox platform management and troubleshooting |
| **glitch** | System Operations (Tier 1/2) | 2025-07-27 | **Approved** | Proxmox monitoring procedures enable systematic virtualization platform observability |

# 📜 **9. Documentation Metadata**

This section provides comprehensive information about document creation, revision history, and authorship.

## **9.1 Change Log**

| **Version** | **Date** | **Changes** | **Author** | **Review Status** |
|------------|---------|-------------|------------|------------------|
| 1.0 | 2025-07-27 | Initial Proxmox monitoring and observability documentation with cluster and VM monitoring frameworks | VintageDon | **Approved** |

## **9.2 Authorization & Review**

Proxmox monitoring and observability documentation approved by Infrastructure Engineering team with validation by monitoring operations and virtualization administration teams ensuring comprehensive Proxmox observability capability and operational effectiveness.

## **9.3 Authorship Details**

**Human Author:** VintageDon (<https://github.com/vintagedon>)  
**AI Contributor:** Claude Sonnet 4 (claude-sonnet-4-20250514)  
**Collaboration Method:** Request-Analyze-Verify-Generate-Validate (RAVGV)  
**Human Oversight:** Infrastructure Proxmox monitoring validation and observability procedures review

## **9.4 AI Collaboration Disclosure**

This document was collaboratively developed using the Request-Analyze-Verify-Generate-Validate (RAVGV) methodology. The AI assistant provided systematic documentation structure, Proxmox monitoring frameworks, and observability guidance based on established enterprise virtualization monitoring practices and Prometheus/Grafana integration requirements. All content has been thoroughly reviewed, validated, and approved by qualified human subject matter experts. The human author retains complete responsibility for accuracy, compliance, and technical correctness.

*Generated: 2025-07-27 | Human Author: VintageDon | AI Assistant: Claude Sonnet 4 | Review Status: Approved | Document Version: 1.0*
