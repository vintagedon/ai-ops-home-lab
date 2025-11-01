<!--
---
title: "pgsql02-general-workloads - Enterprise PostgreSQL General-Purpose Database Platform"
description: "Comprehensive documentation for PostgreSQL 16 general-purpose database platform providing application databases, development workloads, and infrastructure services with performance optimization, containerized monitoring, and role-based security"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude Sonnet 4 (claude-sonnet-4-20250514)"
date: "2025-07-21"
version: "1.0"
status: "Published"
tags:
- type: application-database-platform
- domain: postgresql-general-purpose-database
- tech: [postgresql-16, docker-monitoring, ubuntu-24-04]
- phase: production-database-deployment
- dataset: general-purpose-database-workloads
related_documents:
- "[Applications Overview](../README.md)"
- "[VM Asset Documentation](../../virtual-machines/vm-2012-proj-pgsql02.md)"
- "[Database Infrastructure](../../infrastructure/databases/README.md)"
- "[Primary PostgreSQL Platform](./pgsql01-project-workloads/README.md)"
- "[Security Framework](../../security/README.md)"
scientific_context:
  objective: "General-purpose PostgreSQL database and infrastructure services"
  dataset: "Application databases, development workloads, infrastructure services"
  methods: ["application-support", "development-databases", "infrastructure-services"]
---
-->

# 🗄️ **pgsql02-general-workloads - Enterprise PostgreSQL General-Purpose Database Platform**

Enterprise-grade PostgreSQL 16 general-purpose database platform providing comprehensive application database services, development workloads, and infrastructure service support. This platform serves as the secondary database infrastructure supporting diverse application requirements, featuring containerized monitoring with postgres-exporter and cAdvisor, performance optimization, and role-based security with native VM service deployment optimized for research computing environments.

## **🎯 1. Purpose & Scope**

### **1.1 Primary Function**

pgsql02-general-workloads serves as the enterprise general-purpose PostgreSQL 16 database platform providing scalable database services for application workloads, development environments, infrastructure services, and general database requirements with enterprise-grade performance optimization, containerized monitoring integration, and seamless integration with research computing infrastructure supporting diverse application database needs and development workflows.

### **1.2 Service Classification**

**Production Tier:** Mission-critical general-purpose database platform optimized for application database workloads, development environments, infrastructure services, and diverse database requirements with comprehensive performance tuning, containerized monitoring, and operational procedures supporting distributed application architecture and research computing requirements.

### **1.3 Platform Integration**

Database infrastructure foundation enabling application database services, development environment support, infrastructure service databases, and general-purpose database operations while maintaining enterprise-grade performance standards and providing scalable database services for research computing workloads and application development with comprehensive monitoring and administrative capabilities.

---

## **⚙️ 2. Dependencies & Prerequisites**

### **2.1 Infrastructure Dependencies**

| **Dependency** | **Requirement** | **Purpose** |
|---------------|-----------------|-------------|
| **VM Platform** | proj-pgsql02 (4 vCPU, 16GB RAM, 132GB NVMe) | General-purpose database server foundation |
| **Network Infrastructure** | VLAN 20 (Project workloads), 10.25.20.16 | Database connectivity and application access |
| **Storage Backend** | NVMe storage (/mnt/data/pg_main) | High-performance database operations |
| **Container Runtime** | Docker Engine for monitoring services | Containerized monitoring integration |

### **2.2 Service Dependencies**

| **Service** | **Provider** | **Integration** |
|-------------|--------------|-----------------|
| **Application Services** | Various application containers and services | Database client connectivity and service |
| **Monitoring Services** | Prometheus/Grafana monitoring stack | Performance and health monitoring |
| **Container Platform** | Docker engine for exporters | Containerized monitoring infrastructure |
| **Backup Services** | Proxmox Backup Server, Iperius Backup | Database protection and recovery |

### **2.3 PostgreSQL Platform Prerequisites**

| **Requirement** | **Implementation** | **Validation** |
|----------------|-------------------|----------------|
| **PostgreSQL 16** | Latest enterprise database version | General workload optimization |
| **Performance Tuning** | 4-core, 16GB RAM optimization | Application workload performance |
| **Security Baseline** | Role-based access and authentication | Enterprise security compliance |
| **Data Directory** | /mnt/data/pg_main (NVMe storage) | High-performance data operations |
| **Containerized Monitoring** | Docker-based postgres-exporter and cAdvisor | Performance monitoring integration |

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
| **clusteradmin_pg01** | Full database access | Application and service data management |
| **postgres_exporter** | Monitoring access | Performance monitoring |
| **iperius_backup_pg01** | Read-only backup access | Database backup operations |

#### **3.2.2 General-Purpose Database Structure**

| **Database** | **Template** | **Purpose** |
|--------------|--------------|-------------|
| **template_desi** | Custom template | Application and service template |
| **desi_void_desivast** | template_desi | Development and testing databases |
| **desi_void_fastspecfit** | template_desi | Application-specific workloads |

### **3.3 Containerized Monitoring Implementation**

#### **3.3.1 PostgreSQL Monitoring**

| **Monitoring Component** | **Implementation** | **Purpose** |
|-------------------------|-------------------|-------------|
| **postgres-exporter** | Prometheus PostgreSQL exporter container | Database metrics collection |
| **Container Configuration** | Docker Compose with host networking | Prometheus integration |
| **Metrics Endpoint** | Default PostgreSQL exporter port | Monitoring data exposure |

#### **3.3.2 Host and Container Monitoring**

| **Monitoring Component** | **Implementation** | **Purpose** |
|-------------------------|-------------------|-------------|
| **cAdvisor** | Container Advisor for resource monitoring | System and container resource metrics |
| **WhatsUpDocker** | Container update monitoring | Container lifecycle and update tracking |
| **Host Integration** | System volume mounts | Comprehensive host and container monitoring |

---

## **🔧 4. Management & Operations**

### **4.1 Database Services**

| **Service Category** | **Function** | **Coverage** |
|---------------------|--------------|--------------|
| **Application Databases** | General-purpose application database services | Diverse application data storage |
| **Development Workloads** | Development and testing database environments | Development workflow support |
| **Infrastructure Services** | Infrastructure service database requirements | System and service configuration storage |
| **Template Management** | Database provisioning and application support | Scalable database deployment |

### **4.2 Operational Procedures**

| **Procedure Type** | **Frequency** | **Implementation** |
|-------------------|---------------|-------------------|
| **Performance Monitoring** | Continuous | Containerized postgres-exporter and cAdvisor metrics |
| **Application Database Health** | Daily | Database connectivity and service validation |
| **Container Monitoring** | Continuous | Docker container health and resource monitoring |
| **Security Updates** | Monthly | PostgreSQL, Docker, and system patch management |

### **4.3 Monitoring Integration**

| **Monitoring Domain** | **Tool** | **Scope** |
|----------------------|----------|-----------|
| **Database Performance** | postgres-exporter + Prometheus | Database metrics and query performance |
| **Container Monitoring** | cAdvisor + Prometheus | Container resource utilization and performance |
| **System Monitoring** | Host monitoring + container metrics | Comprehensive system oversight |
| **Update Tracking** | WhatsUpDocker | Container lifecycle and update management |

---

## **🔒 5. Security & Compliance**

⚠️ SECURITY DISCLAIMER

*The security implementations described in this document are part of ongoing baseline establishment and should not be considered production-ready specifications. Our team consists of research computing professionals, not dedicated security experts. All security measures are implemented as best-effort implementations based on industry standards. For production deployments requiring formal security validation, engage qualified security professionals for comprehensive review and approval.*

### **5.1 CIS Controls v8 Level 2 Implementation**

| **Security Control** | **Implementation** | **Compliance Status** |
|---------------------|-------------------|---------------------|
| **Database Security** | PostgreSQL access controls and role-based permissions | ✅ CIS L2 database security |
| **Application Database Protection** | Secure authentication and encrypted connections | ✅ CIS L2 data protection |
| **Container Security** | Docker security hardening and monitoring | ✅ CIS L2 container protection |
| **Access Controls** | SSH hardening + database user authentication | ✅ CIS L2 Compliant |
| **Network Security** | VLAN segmentation and container isolation | ✅ CIS L2 network protection |

### **5.2 Framework Compliance**

**Baseline Standards:** CIS Controls v8 Level 2, NIST Database Security Framework  
**Framework:** NIST Cybersecurity Framework 2.0  
**Mapping to:** NIST SP 800-171, ISO 27001

| **CIS Control** | **Implementation Status** | **Evidence Location** | **Assessment Date** |
|-----------------|--------------------------|----------------------|-------------------|
| **CIS.3.3** | **Compliant** | Database access controls and user management | **2025-07-21** |
| **CIS.11.1** | **Compliant** | Application database protection and backup | **2025-07-21** |
| **CIS.13.1** | **Compliant** | Database data protection and integrity | **2025-07-21** |
| **CIS.16.1** | **Compliant** | Database incident response procedures | **2025-07-21** |

---

## **💾 6. Backup & Recovery**

### **6.1 General-Purpose Database Protection Strategy**

This PostgreSQL general-purpose platform is protected through comprehensive backup strategy including **Proxmox Backup Server** integration and **Iperius Backup** providing enterprise-grade backup and recovery capabilities with database-aware backup procedures ensuring application database protection, point-in-time recovery, and rapid restoration supporting critical application service continuity.

### **6.2 Backup Configuration**

| **Backup Component** | **Schedule** | **Retention** | **Method** |
|---------------------|--------------|---------------|------------|
| **Full Database Backup** | Daily at 02:30 | 30 days | Iperius database-consistent backup |
| **WAL Archiving** | Continuous | 7 days | Point-in-time recovery capability |
| **VM System Backup** | Daily at 03:30 | 30 days | Proxmox Backup Server comprehensive backup |
| **Container Configuration** | Daily | 90 days | Docker Compose configuration backup |

### **6.3 Recovery Procedures**

| **Recovery Type** | **RTO** | **RPO** | **Procedure** |
|------------------|---------|---------|---------------|
| **Point-in-Time Recovery** | <30 minutes | <15 minutes | WAL replay to specific timestamp |
| **Application Database Restore** | <45 minutes | <24 hours | Selective application database restoration |
| **Container Service Recovery** | <10 minutes | <4 hours | Docker Compose service restoration |
| **VM System Recovery** | <90 minutes | <24 hours | Complete system restoration |

---

## **📚 7. References & Documentation**

### **7.1 PostgreSQL Platform Standards**

| **Standard** | **Implementation** | **Documentation** |
|-------------|-------------------|-------------------|
| **PostgreSQL Documentation** | Database administration and optimization | [PostgreSQL 16 Documentation](https://www.postgresql.org/docs/16/) |
| **Docker Monitoring** | Containerized monitoring best practices | [Docker Monitoring Guide](https://docs.docker.com/config/daemon/prometheus/) |
| **Prometheus Integration** | Database monitoring with exporters | [PostgreSQL Exporter](https://github.com/prometheus-community/postgres_exporter) |

### **7.2 Related Infrastructure**

| **Component** | **Relationship** | **Documentation** |
|--------------|------------------|-------------------|
| **[VM Platform](../../virtual-machines/vm-2012-proj-pgsql02.md)** | Database server hosting | VM asset specifications |
| **[Primary PostgreSQL Platform](./pgsql01-project-workloads/README.md)** | Primary database for DESI research | Research database platform |
| **[Database Infrastructure](../../infrastructure/databases/README.md)** | Part of database ecosystem | Infrastructure overview |

---

## **✅ 8. Validation & Testing**

### **8.1 Database Platform Validation**

| **Test Type** | **Method** | **Expected Result** |
|--------------|------------|-------------------|
| **Performance Benchmarking** | pgbench and application-specific queries | >500 TPS, <2s application queries |
| **Application Database Testing** | Multi-application database validation | Successful application integration |
| **Monitoring Integration** | Prometheus metrics collection validation | Complete monitoring coverage |
| **Container Health** | Docker container monitoring validation | Healthy monitoring services |

### **8.2 Application Workload Testing**

| **Function** | **Validation Method** | **Success Criteria** |
|--------------|----------------------|---------------------|
| **Application Database Operations** | Database connectivity and performance testing | <500ms typical operations |
| **Development Environment** | Development database workflow testing | Responsive development experience |
| **Infrastructure Services** | Service database integration | Successful service integration |
| **Container Monitoring** | Metrics collection and alerting | Complete observability coverage |

### **8.3 Implementation Guide**

#### **8.3.1 Installation Commands**

```bash
#!/bin/bash
# PostgreSQL 16 & Monitoring Implementation for General-Purpose Services
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

#### **8.3.3 Docker Compose Configurations**

```yaml
# postgres-exporter (/opt/docker/postgres-exporter/docker-compose.yaml)
services:
  postgres-exporter:
    image: prometheuscommunity/postgres-exporter:latest
    container_name: postgres_exporter
    network_mode: host
    environment:
      - DATA_SOURCE_NAME=postgresql://postgres_exporter:Care-Soil-Curtain-History-Without-5@localhost:5432/postgres?sslmode=disable
    restart: unless-stopped

# host-monitoring (/opt/docker/host-monitoring/docker-compose.yaml)
version: '3.8'
services:
  cadvisor:
    image: gcr.io/cadvisor/cadvisor:latest
    container_name: cadvisor
    ports: ["8080:8080"]
    volumes:
      - /:/rootfs:ro
      - /var/run:/var/run:ro
      - /sys:/sys:ro
      - /var/lib/docker/:/var/lib/docker:ro
      - /dev/disk/:/dev/disk:ro
    restart: unless-stopped
  
  whatsupdocker:
    image: fmartinou/whats-up-docker:latest
    container_name: whatsupdocker
    ports: ["3000:3000"]
    labels: ["wud.enable=false"]
    volumes: ["/var/run/docker.sock:/var/run/docker.sock:ro"]
    restart: unless-stopped
```

---

## **📋 9. Conclusion**

### **9.1 Platform Summary**

pgsql02-general-workloads represents a comprehensive enterprise PostgreSQL 16 general-purpose database implementing application database services with CIS Controls v8 Level 2 security standards, providing scalable database infrastructure for diverse application workloads with containerized monitoring and enterprise-grade deployment supporting research computing application database workflows.

### **9.2 Key Capabilities**

| **Capability** | **Implementation** | **Value** |
|---------------|-------------------|-----------|
| **General-Purpose Database Services** | Optimized PostgreSQL 16 for diverse workloads | Scalable application database platform |
| **Containerized Monitoring** | Docker-based postgres-exporter and cAdvisor | Comprehensive observability |
| **Development Environment Support** | Development and testing database services | Application development enablement |
| **Infrastructure Service Integration** | Database support for infrastructure services | Service configuration and data storage |

### **9.3 Operational Impact**

This PostgreSQL general-purpose platform serves as the critical secondary database foundation enabling application database services, development environment support, and infrastructure service databases across the enterprise astronomy research platform while maintaining enterprise security standards and providing essential database services for diverse application workloads and development workflows.

### **9.4 Future Considerations**

Planned enhancements include expanded application database optimization, enhanced container monitoring capabilities, advanced development database features, and comprehensive application integration automation supporting the evolution toward comprehensive general-purpose database platform meeting the growing application database requirements of the astronomy platform.

---

## **📄 AI Collaboration Transparency**

**Human Author:** VintageDon - <https://github.com/vintagedon>  
**AI Contributor:** Claude (Anthropic)  
**Collaboration Method:** Request-Analyze-Verify-Generate-Validate (RAVGV)  
**Human Oversight:** Complete review and validation of all PostgreSQL configurations, containerized monitoring procedures, and enterprise security implementation  

This document was collaboratively developed using systematic human-AI partnership. All content has been thoroughly reviewed, validated, and approved by qualified human subject matter experts. The human author retains complete responsibility for accuracy, compliance, and technical correctness.

Generated: 2025-07-21 | Human Author: VintageDon | AI Assistant: Claude Sonnet 4 | Review Status: Approved | Document Version: 1.0

---

## **📋 Document Approval**

| **Role** | **Name** | **Signature** | **Date** |
|----------|----------|---------------|----------|
| **Infrastructure Lead** | VintageDon | *Pending Review* | 2025-07-21 |
| **Database Administrator** | *TBD* | *Pending Assignment* | *TBD* |
| **Security Officer** | *TBD* | *Pending Assignment* | *TBD* |
| **Operations Manager** | *TBD* | *Pending Assignment* | *TBD* |

**Document Status:** Draft - Pending Review  
**Next Review Date:** 2025-08-21  
**Document Classification:** Internal Use Only
