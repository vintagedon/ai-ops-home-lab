<!--
---
title: "proj-pgsql02 - PostgreSQL General-Purpose Database Platform Infrastructure"
description: "Comprehensive PostgreSQL 16 general-purpose database platform documentation for application workloads, development databases, and infrastructure services with optimized configuration and containerized monitoring"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude Sonnet 4 (claude-sonnet-4-20250514)"
date: "2025-07-20"
version: "1.0"
status: "Published"
tags:
- type: infrastructure-database-platform
- domain: postgresql-general-purpose-database
- tech: [postgresql-16, ubuntu-24-04, docker-monitoring]
- phase: production-database-deployment
- dataset: application-databases-gitea-infrastructure
related_documents:
- "[VM Asset Documentation](../../virtual-machines/vm-2012-proj-pgsql02.md)"
- "[Database Infrastructure Overview](../README.md)"
- "[Primary PostgreSQL Platform](./proj-pg01.md)"
- "[Security Framework](../../../security/README.md)"
scientific_context:
  objective: "General-purpose database services"
  dataset: "Application databases, development workloads"
  methods: ["application-support", "infrastructure-services", "development-databases"]
---
-->

# 🗄️ **proj-pgsql02 - PostgreSQL General-Purpose Database Platform Infrastructure**

Enterprise-grade PostgreSQL 16 database platform optimized for general-purpose application workloads, development databases, and infrastructure services. This platform serves as the secondary database infrastructure supporting Gitea source control, application databases, and development workloads with enterprise security, containerized monitoring, and operational procedures designed for diverse application requirements.

## **🎯 1. Purpose & Scope**

### **1.1 Primary Function**

proj-pgsql02 serves as the enterprise general-purpose PostgreSQL database platform providing scalable database services for application workloads, development environments, infrastructure services, and source control systems with enterprise-grade reliability, security, and operational procedures optimized for diverse application requirements and development workflows.

### **1.2 Service Classification**

**Production Tier:** Mission-critical general-purpose database platform optimized for application database services, development workloads, infrastructure service databases, and enterprise application support with comprehensive security, containerized monitoring, and backup procedures supporting application development and infrastructure coordination requirements.

### **1.3 Application Integration**

Database foundation enabling Gitea source control database services, application development databases, infrastructure service data storage, and general-purpose database support while maintaining enterprise-grade security standards and providing scalable database services for application workloads and infrastructure service coordination.

---

## **⚙️ 2. Dependencies & Prerequisites**

### **2.1 Infrastructure Dependencies**

| **Dependency** | **Requirement** | **Purpose** |
|---------------|-----------------|-------------|
| **VM Platform** | proj-pgsql02 (4 vCPU, 16GB RAM, 100GB NVMe) | General-purpose database server foundation |
| **Network Infrastructure** | VLAN 20 (Project workloads) | Database connectivity |
| **Storage Backend** | High-performance NVMe storage | Database performance optimization |
| **Security Framework** | CIS Controls v8 Level 2 | Enterprise security baseline |

### **2.2 Service Dependencies**

| **Service** | **Provider** | **Integration** |
|-------------|--------------|-----------------|
| **Application Services** | Gitea, development platforms, infrastructure services | Database client connectivity |
| **Container Platform** | Docker engine for monitoring services | Containerized monitoring integration |
| **Backup Services** | pbs01 enterprise backup | Database protection |
| **Monitoring Services** | Prometheus/Grafana monitoring stack | Database performance monitoring |

### **2.3 PostgreSQL Database Prerequisites**

| **Requirement** | **Implementation** | **Validation** |
|----------------|-------------------|----------------|
| **PostgreSQL 16** | Latest enterprise database version | Application workload optimization |
| **Security Baseline** | CIS L2 implementation | Enterprise security compliance |
| **Performance Tuning** | Application workload optimization | 4-core, 16GB RAM configuration |
| **Data Directory** | /mnt/data/pg_main (NVMe storage) | High-performance data storage |
| **Monitoring Integration** | Docker-based postgres-exporter and cAdvisor | Containerized monitoring |

---

## **🏗️ 3. Technical Implementation**

### **3.1 PostgreSQL 16 Configuration**

#### **3.1.1 Performance Optimization**

| **Configuration Parameter** | **Value** | **Purpose** |
|---------------------------|-----------|-------------|
| **shared_buffers** | 4GB (25% of RAM) | Database cache optimization |
| **effective_cache_size** | 12GB (75% of RAM) | Query planner optimization |
| **maintenance_work_mem** | 1GB | Index and maintenance operations |
| **work_mem** | 128MB | Sort and hash operations |
| **max_connections** | 200 | Concurrent connection support |

#### **3.1.2 Storage and I/O Configuration**

| **Storage Parameter** | **Value** | **Purpose** |
|---------------------|-----------|-------------|
| **data_directory** | /mnt/data/pg_main | NVMe storage location |
| **random_page_cost** | 1.1 | NVMe storage optimization |
| **min_wal_size** | 1GB | Write-ahead log management |
| **max_wal_size** | 4GB | Checkpoint frequency optimization |
| **checkpoint_completion_target** | 0.9 | I/O smoothing |

#### **3.1.3 Parallel Processing Configuration**

| **Parallel Parameter** | **Value** | **Purpose** |
|-----------------------|-----------|-------------|
| **max_worker_processes** | 4 | Matches CPU core count |
| **max_parallel_workers_per_gather** | 2 | Query parallelization |
| **max_parallel_maintenance_workers** | 2 | Index creation optimization |
| **max_parallel_workers** | 4 | System-wide parallel workers |

### **3.2 Database Architecture**

#### **3.2.1 Role-Based Security Model**

| **Role** | **Privileges** | **Purpose** |
|----------|---------------|-------------|
| **postgres** | Superuser | Database administration |
| **clusteradmin_pg01** | Full database access | Application data management |
| **postgres_exporter** | Monitoring access | Performance monitoring |
| **iperius_backup_pg01** | Read-only backup access | Database backup operations |

#### **3.2.2 Database Structure**

| **Database** | **Template** | **Purpose** |
|--------------|--------------|-------------|
| **template_desi** | Custom template | Application project template |
| **desi_void_desivast** | template_desi | Development and testing databases |
| **desi_void_fastspecfit** | template_desi | Application-specific data |

### **3.3 Containerized Monitoring Implementation**

#### **3.3.1 PostgreSQL Monitoring**

| **Monitoring Component** | **Implementation** | **Purpose** |
|-------------------------|-------------------|-------------|
| **postgres-exporter** | Prometheus PostgreSQL exporter container | Database metrics collection |
| **Container Configuration** | Docker Compose with host networking | Prometheus integration |
| **Metrics Endpoint** | Default PostgreSQL exporter port | Monitoring data exposure |

#### **3.3.2 Host Monitoring**

| **Monitoring Component** | **Implementation** | **Purpose** |
|-------------------------|-------------------|-------------|
| **cAdvisor** | Container resource monitoring | System resource metrics |
| **WhatsUpDocker** | Container update monitoring | Container lifecycle management |
| **Host Integration** | System volume mounts | Comprehensive host monitoring |

---

## **🔧 4. Management & Operations**

### **4.1 Database Services**

| **Service** | **Function** | **Coverage** |
|-------------|--------------|--------------|
| **Application Database Management** | Gitea and infrastructure service databases | Source control and application data |
| **Development Database Services** | Development and testing database environments | Application development support |
| **Infrastructure Data Storage** | Infrastructure service database coordination | Service configuration and state management |
| **General-Purpose Database Support** | Diverse application database requirements | Flexible application data management |

### **4.2 Operational Procedures**

| **Procedure Type** | **Frequency** | **Implementation** |
|-------------------|---------------|-------------------|
| **Performance Monitoring** | Continuous | Containerized postgres-exporter metrics |
| **Application Database Health** | Daily | Application connectivity and service validation |
| **Security Updates** | Weekly | PostgreSQL, Docker, and system updates |
| **Backup Verification** | Daily | Database backup integrity validation |

### **4.3 Monitoring & Alerting**

| **Monitoring Domain** | **Tool** | **Scope** |
|----------------------|----------|-----------|
| **Database Performance** | postgres-exporter + Prometheus | Query performance and resource utilization |
| **Container Monitoring** | cAdvisor + Prometheus | Container resource monitoring |
| **Application Connectivity** | Database connection monitoring | Application service validation |
| **System Resources** | Host monitoring + container metrics | Comprehensive system oversight |

---

## **🔒 5. Security & Compliance**

⚠️ SECURITY DISCLAIMER

*The security implementations described in this document are part of ongoing baseline establishment and should not be considered production-ready specifications. Our team consists of research computing professionals, not dedicated security experts. All security measures are implemented as best-effort implementations based on industry standards. For production deployments requiring formal security validation, engage qualified security professionals for comprehensive review and approval.*

### **5.1 CIS Controls v8 Level 2 Implementation**

| **Security Control** | **Implementation** | **Compliance Status** |
|---------------------|-------------------|---------------------|
| **Database Security** | PostgreSQL access controls and encryption | ✅ CIS L2 database security |
| **Application Data Protection** | Role-based access and audit logging | ✅ CIS L2 data protection |
| **Container Security** | Docker security hardening and monitoring | ✅ CIS L2 container protection |
| **Access Controls** | SSH hardening + database authentication | ✅ CIS L2 Compliant |
| **Network Security** | Host firewall + VLAN segmentation | ✅ Layered security controls |

### **5.2 Framework Compliance**

**Baseline Standards:** CIS Controls v8 Level 2, NIST AI Risk Management Framework  
**Framework:** NIST Cybersecurity Framework 2.0  
**Mapping to:** NIST SP 800-171

| **CIS Control** | **Implementation Status** | **Evidence Location** | **Assessment Date** |
|-----------------|--------------------------|----------------------|-------------------|
| **CIS.3.3** | **Compliant** | Database access controls | **2025-07-20** |
| **CIS.13.1** | **Compliant** | Application data protection | **2025-07-20** |
| **CIS.14.1** | **Compliant** | Database security monitoring | **2025-07-20** |
| **CIS.16.1** | **Compliant** | Database incident response | **2025-07-20** |

---

## **💾 6. Backup & Recovery**

### **6.1 Database Protection Strategy**

This PostgreSQL platform is protected through integration with **pbs01** (Proxmox Backup Server) and **Iperius Backup** providing enterprise-grade backup and recovery capabilities with database-aware backup procedures ensuring application database consistency, point-in-time recovery, and rapid restoration supporting critical application data protection.

### **6.2 Backup Configuration**

| **Backup Component** | **Schedule** | **Retention** | **Method** |
|---------------------|--------------|---------------|------------|
| **Full Database Backup** | Daily at 02:30 | 30 days | Iperius database-consistent backup |
| **WAL Archiving** | Continuous | 7 days | Point-in-time recovery capability |
| **VM System Backup** | Daily at 03:30 | 30 days | pbs01 comprehensive backup |
| **Container Configuration** | Daily | 90 days | Docker Compose configuration backup |

### **6.3 Recovery Procedures**

| **Recovery Type** | **RTO** | **RPO** | **Procedure** |
|------------------|---------|---------|---------------|
| **Point-in-Time Recovery** | <30 minutes | <15 minutes | WAL replay to specific timestamp |
| **Application Database Restore** | <45 minutes | <24 hours | Selective application database restoration |
| **Container Service Recovery** | <10 minutes | <4 hours | Docker Compose service restoration |
| **VM System Recovery** | <90 minutes | <24 hours | Complete platform restoration |

---

## **📚 7. References & Documentation**

### **7.1 PostgreSQL Platform Standards**

| **Standard** | **Implementation** | **Documentation** |
|-------------|-------------------|-------------------|
| **PostgreSQL Documentation** | Database administration and optimization | [PostgreSQL 16 Documentation](https://www.postgresql.org/docs/16/) |
| **Docker Monitoring** | Containerized monitoring best practices | [Docker Monitoring Guide](https://docs.docker.com/config/daemon/prometheus/) |
| **CIS Controls v8 Level 2** | Database security baseline | [CIS Benchmarks](https://www.cisecurity.org/) |

### **7.2 Related Infrastructure**

| **Component** | **Relationship** | **Documentation** |
|--------------|------------------|-------------------|
| **[VM Platform](../../virtual-machines/vm-2012-proj-pgsql02.md)** | Database server hosting | VM asset specifications |
| **[Primary PostgreSQL Platform](./proj-pg01.md)** | Primary database for DESI research | Research database platform |
| **[Database Infrastructure](../README.md)** | Part of database ecosystem | Infrastructure overview |

---

## **✅ 8. Validation & Testing**

### **8.1 Database Platform Validation**

| **Test Type** | **Method** | **Expected Result** |
|--------------|------------|-------------------|
| **Performance Benchmarking** | pgbench and application-specific queries | >500 TPS, <2s application queries |
| **Connection Testing** | Multi-application concurrent connections | 200 concurrent connections supported |
| **Backup Validation** | Recovery testing procedures | <30 minute recovery times |
| **Monitoring Integration** | Prometheus metrics validation | Complete monitoring coverage |

### **8.2 Application Workload Testing**

| **Function** | **Validation Method** | **Success Criteria** |
|--------------|----------------------|---------------------|
| **Gitea Database Operations** | Source control database testing | <500ms typical operations |
| **Development Database Performance** | Application development workflows | Responsive development experience |
| **Infrastructure Service Integration** | Service database connectivity | Successful application integration |
| **Container Monitoring** | Metrics collection validation | Complete observability coverage |

### **8.3 Implementation Guide**

#### **8.3.1 Installation Commands**

```bash
#!/bin/bash
# PostgreSQL 16 & Monitoring Installation for General-Purpose Services
# Run as root or with sudo

# Phase 1: PostgreSQL Installation
apt-get update
apt-get install -y curl ca-certificates acl postgresql-16

# Phase 2: Data Directory Configuration
systemctl stop postgresql
mkdir -p /mnt/data/pg_main
chown -R postgres:postgres /mnt/data/pg_main
chmod 755 /mnt/data
mv /var/lib/postgresql/16/main/* /mnt/data/pg_main/

# Phase 3: AppArmor Configuration
tee /etc/apparmor.d/local/usr.sbin.postgres > /dev/null <<EOF
/mnt/data/pg_main/ r,
/mnt/data/pg_main/** rwk,
EOF
systemctl reload apparmor

# Phase 4: Docker Installation
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Phase 5: Monitoring Services Setup
mkdir -p /opt/docker/postgres-exporter /opt/docker/host-monitoring

# Deploy monitoring configurations and start services
systemctl start postgresql
systemctl enable postgresql
(cd /opt/docker/postgres-exporter && docker compose up -d)
(cd /opt/docker/host-monitoring && docker compose up -d)
```

#### **8.3.2 Database Configuration**

```sql
-- Role and Database Setup (Identical to proj-pg01)
ALTER USER postgres WITH PASSWORD 'Clay-Steer-Manage-Experience-Exercise-4';
CREATE ROLE postgres_exporter WITH LOGIN PASSWORD 'Care-Soil-Curtain-History-Without-5';
CREATE ROLE iperius_backup_pg01 WITH LOGIN PASSWORD 'Reputation-Congratulation-Interruption-Shut-Beauty-8';
CREATE ROLE clusteradmin_pg01 WITH LOGIN PASSWORD 'Guest-Need-Spoil-Deal-You-Curious-3';

-- Grant monitoring privileges
GRANT pg_monitor TO postgres_exporter;

-- Create template and application databases
CREATE DATABASE template_desi IS_TEMPLATE = true;
CREATE DATABASE desi_void_desivast TEMPLATE template_desi;
CREATE DATABASE desi_void_fastspecfit TEMPLATE template_desi;
```

---

## **📋 9. Conclusion**

### **9.1 Platform Summary**

proj-pgsql02 represents a comprehensive enterprise PostgreSQL 16 general-purpose database platform implementing application database services with CIS Controls v8 Level 2 security standards, providing scalable database support for Gitea, development workloads, and infrastructure services with containerized monitoring and robust operational procedures.

### **9.2 Key Capabilities**

| **Capability** | **Implementation** | **Value** |
|---------------|-------------------|-----------|
| **Application Database Services** | Optimized PostgreSQL 16 for general-purpose workloads | Scalable application data platform |
| **Containerized Monitoring** | Docker-based postgres-exporter and cAdvisor | Comprehensive observability |
| **Development Database Support** | Development and testing database environments | Application development enablement |
| **Enterprise Security** | Role-based access with CIS L2 baseline | Secure application data protection |

### **9.3 Operational Impact**

This PostgreSQL platform serves as the critical general-purpose database foundation enabling Gitea source control database services, application development databases, and infrastructure service data storage across the enterprise astronomy research platform while maintaining enterprise security standards and providing essential database services for application workloads and infrastructure coordination.

### **9.4 Future Considerations**

Planned enhancements include expanded application database optimization, enhanced container monitoring capabilities, and advanced development database features supporting the evolution toward comprehensive application database services and enterprise-grade development workflow support meeting the growing application database requirements of the astronomy platform.

---

## **📄 AI Collaboration Transparency**

**Human Author:** VintageDon - <https://github.com/vintagedon>  
**AI Contributor:** Claude (Anthropic)  
**Collaboration Method:** Request-Analyze-Verify-Generate-Validate (RAVGV)  
**Human Oversight:** Complete review and validation of all PostgreSQL configurations, containerized monitoring procedures, and application database integration  

This document was collaboratively developed using systematic human-AI partnership. All content has been thoroughly reviewed, validated, and approved by qualified human subject matter experts. The human author retains complete responsibility for accuracy, compliance, and technical correctness.

Generated: 2025-07-20 | Human Author: VintageDon | AI Assistant: Claude Sonnet 4 | Review Status: Approved | Document Version: 1.0
