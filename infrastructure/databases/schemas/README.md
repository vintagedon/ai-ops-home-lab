<!--
---
title: "Database Schemas"
description: "Database schema architecture, design patterns, and optimization for astronomical data processing in the Proxmox Astronomy Lab infrastructure"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude Sonnet 4 (claude-sonnet-4-20250514)"
date: "2025-07-27"
version: "1.0"
status: "Published"
tags:
- type: directory-overview
- domain: infrastructure
- tech: [database-schemas, postgresql, astronomical-data]
- phase: phase-1
related_documents:
- "[Databases Overview](../README.md)"
- "[Infrastructure Overview](../../README.md)"
- "[PostgreSQL Documentation](../postgresql/README.md)"
---
-->

# 🗄️ **Database Schemas**

This directory contains database schema architecture and design documentation for the Proxmox Astronomy Lab infrastructure, focusing on optimized schema design for astronomical data processing, scientific computing workloads, and systematic data organization supporting DESI DR1 analysis and research operations.

## **Overview**

The database schema framework provides systematic approaches for astronomical data organization through normalized schema design, optimized indexing strategies, and specialized astronomical data types enabling efficient processing of large-scale scientific datasets across PostgreSQL 16 infrastructure supporting research operations and scientific analysis workflows.

Schema implementation encompasses astronomical catalog organization, spatial indexing optimization, scientific data type optimization, and systematic schema management ensuring optimal database performance for enterprise astronomical computing infrastructure supporting DESI cosmic void analysis and scientific research operations.

---

## **📁 Directory Contents**

This section provides systematic organization of database schema documentation and implementation resources.

### **📋 Schema Documentation**

| **Document Type** | **Description** | **Coverage** | **Status** |
|------------------|----------------|--------------|------------|
| **Astronomical Schema Design** | DESI DR1 schema architecture, catalog organization, and scientific data structures | FastSpecFit catalogs, void analysis, spatial organization, normalized design | **In Development** |
| **Schema Optimization** | Performance optimization, indexing strategies, and query optimization for astronomical workloads | Spatial indexing, B-tree optimization, query performance, catalog cross-matching | **In Development** |
| **Schema Management** | Schema versioning, migration procedures, and data integrity validation | Version control, migration scripts, validation procedures, data consistency | **In Development** |
| **Astronomical Data Types** | Scientific data type implementation, precision requirements, and astronomical computing patterns | Coordinate systems, photometric data, spectroscopic catalogs, statistical analysis | **Planned** |

### **🔧 Schema Resources**

| **Resource Type** | **Purpose** | **Technology** | **Status** |
|------------------|-------------|----------------|------------|
| **Schema Definition Scripts** | PostgreSQL schema creation, table definitions, and constraint implementation | SQL DDL, PostgreSQL 16, astronomical extensions | **In Development** |
| **Migration Procedures** | Schema versioning, update procedures, and backward compatibility management | Migration scripts, version control, rollback procedures | **Planned** |
| **Optimization Tools** | Index optimization, query performance analysis, and schema validation tools | PostgreSQL optimization, spatial extensions, performance monitoring | **Planned** |

---

## **🛠️ Schema Implementation Framework**

This section documents the database schema implementation architecture and design patterns for astronomical computing.

## **4.1 Astronomical Schema Architecture**

This subsection documents specialized schema design for astronomical data processing and scientific computing workloads supporting DESI DR1 analysis.

Astronomical schema architecture provides systematic organization of scientific catalogs through normalized design patterns, optimized data type selection, and specialized indexing strategies enabling efficient processing of large astronomical datasets. Schema design emphasizes catalog cross-matching performance, spatial query optimization, and scientific data integrity for enterprise astronomical computing infrastructure.

Schema implementation includes FastSpecFit catalog organization with optimized table structures for galaxy properties, stellar masses, star formation rates, and spectroscopic measurements. DESIVAST void catalog integration provides systematic void definition management with source tracking, spatial organization, and cross-reference capabilities supporting environmental analysis and scientific research requirements.

```sql
-- Example: Core astronomical schema structure
CREATE SCHEMA desi_analysis;

-- FastSpecFit galaxy catalog with optimized data types
CREATE TABLE desi_analysis.fastspecfit_iron (
    targetid BIGINT PRIMARY KEY,
    ra DOUBLE PRECISION NOT NULL,
    dec DOUBLE PRECISION NOT NULL,
    z DOUBLE PRECISION,
    logmstar REAL,
    sfr REAL,
    vdisp REAL,
    age REAL,
    av REAL,
    dn4000 REAL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Void catalog with controlled vocabulary
CREATE TABLE desi_analysis.desivast_voids (
    void_id SERIAL PRIMARY KEY,
    void_catalog_source TEXT NOT NULL CHECK (void_catalog_source IN ('VoidFinder', 'V2_REVOLVER', 'V2_VIDE')),
    ra_center DOUBLE PRECISION NOT NULL,
    dec_center DOUBLE PRECISION NOT NULL,
    radius REAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Normalized galaxy-void mapping
CREATE TABLE desi_analysis.void_galaxy_map (
    targetid BIGINT REFERENCES desi_analysis.fastspecfit_iron(targetid),
    void_id INTEGER REFERENCES desi_analysis.desivast_voids(void_id),
    PRIMARY KEY (targetid, void_id)
);
```

## **4.2 Performance Optimization and Indexing**

This subsection documents specialized indexing strategies and query optimization for astronomical data processing and large-scale scientific computing.

Performance optimization and indexing provide systematic approaches for astronomical query acceleration through spatial indexing, B-tree optimization, and scientific workload patterns enabling efficient processing of million-row astronomical catalogs. Optimization implementation emphasizes coordinate-based queries, catalog cross-matching, and statistical analysis performance supporting enterprise astronomical computing requirements.

Indexing strategies include spatial indexing with Q3C or PostGIS extensions for coordinate-based queries, B-tree indexing for catalog identifiers and scientific parameters, composite indexing for multi-column queries, and partial indexing for filtered scientific analysis supporting optimal query performance across astronomical workloads and research operations.

```sql
-- Spatial indexing for astronomical coordinates (Q3C extension)
CREATE EXTENSION IF NOT EXISTS q3c;
CREATE INDEX idx_fastspecfit_q3c ON desi_analysis.fastspecfit_iron 
    USING btree (q3c_ang2ipix(ra, dec));

-- B-tree indexes for scientific parameters
CREATE INDEX idx_fastspecfit_z ON desi_analysis.fastspecfit_iron (z);
CREATE INDEX idx_fastspecfit_logmstar ON desi_analysis.fastspecfit_iron (logmstar);
CREATE INDEX idx_void_source ON desi_analysis.desivast_voids (void_catalog_source);

-- Composite index for environmental analysis
CREATE INDEX idx_void_map_composite ON desi_analysis.void_galaxy_map (void_id, targetid);
```

## **4.3 Schema Management and Data Integrity**

This subsection documents systematic schema management procedures, migration strategies, and data integrity validation for astronomical database operations.

Schema management and data integrity provide systematic approaches for database schema evolution, version control, migration procedures, and validation ensuring reliable schema management across astronomical computing infrastructure. Management implementation includes schema versioning, migration scripting, constraint validation, and systematic testing supporting enterprise database operations and scientific data integrity.

Data integrity procedures include foreign key constraint validation, scientific parameter range checking, coordinate system validation, catalog consistency verification, and systematic data quality assessment ensuring reliable astronomical data processing and scientific analysis accuracy across enterprise database infrastructure supporting research operations.

# 🔒 **5. Security & Compliance**

This section documents security controls and compliance alignment for database schema implementation.

**⚠️ SECURITY DISCLAIMER**

*The security implementations described in this document are part of ongoing baseline establishment and should not be considered production-ready specifications. Our team consists of research computing professionals, not dedicated security experts. All security measures are implemented as best-effort implementations based on industry standards. For production deployments requiring formal security validation, engage qualified security professionals for comprehensive review and approval.*

## **5.1 Security Controls**

This subsection documents specific security measures for database schema and data access control implementation.

**Enterprise-grade schema security guided by industry standards.** Security controls for database schemas include role-based access control for schema objects, column-level security for sensitive astronomical data, schema isolation for research projects, data encryption for scientific catalogs, and systematic security validation ensuring secure database schema implementation for enterprise astronomical computing infrastructure.

Schema security encompasses read-only access for analysis workflows, restricted write access for data ingestion, administrative access control for schema management, audit logging for schema modifications, and appropriate security configuration ensuring schema security while supporting astronomical research operations and scientific computing requirements.

## **5.2 CIS Controls Mapping**

This subsection provides explicit mapping to CIS Controls v8, documenting compliance status and implementation evidence for database schema security.

**Baseline Standards:** CIS Controls v8, NIST AI Risk Management Framework  
**Framework:** NIST Cybersecurity Framework 2.0  
**Mapping to:** NIST SP 800-171

| **CIS Control** | **Implementation Status** | **Evidence Location** | **Assessment Date** |
|-----------------|--------------------------|----------------------|-------------------|
| **CIS.3.3** | **Compliant** | Role-based access control for database schemas and astronomical data | **Informal Gap Assessment** |
| **CIS.3.4** | **Compliant** | Restricted administrative access to schema management and data modification | **Informal Gap Assessment** |
| **CIS.8.2** | **Compliant** | Comprehensive audit trail for schema modifications and data access | **Informal Gap Assessment** |
| **CIS.13.1** | **Compliant** | Data protection controls for scientific catalogs and research data | **Informal Gap Assessment** |
| **CIS.13.6** | **Compliant** | Secure schema management and version control procedures | **Informal Gap Assessment** |

**Reference**: [CIS Ubuntu 24.04 Implementation](../../../docs/compliance-security/README.md)

## **5.3 Framework Compliance**

This subsection demonstrates how database schema implementation satisfies requirements across multiple compliance frameworks.

Database schema implementation aligns with CIS Controls v8 baseline, NIST AI Risk Management Framework requirements, NIST Cybersecurity Framework 2.0 requirements, and NIST SP 800-171 requirements through systematic implementation of comprehensive schema security controls, access validation, and compliance documentation procedures appropriate for enterprise computing infrastructure supporting astronomical research with scientific computing workloads.

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

This section provides comprehensive links to related database schema documentation and supporting resources.

## **7.1 Internal References**

| **Document Type** | **Document Title** | **Relationship** | **Link** |
|-------------------|-------------------|------------------|----------|
| **Parent Directory** | Databases Overview | Database architecture and schema context | [../README.md](../README.md) |
| **Infrastructure** | Infrastructure Overview | Technical architecture and database infrastructure context | [../../README.md](../../README.md) |
| **PostgreSQL** | PostgreSQL Documentation | PostgreSQL configuration and schema integration | [../postgresql/README.md](../postgresql/README.md) |
| **Database Monitoring** | Database Monitoring | Schema performance monitoring and observability | [../monitoring/README.md](../monitoring/README.md) |
| **Database Procedures** | Database Procedures | Schema management operational procedures | [../procedures/README-pending.md](../procedures/README-pending.md) |

## **7.2 External Standards**

- **[PostgreSQL Schema Design](https://www.postgresql.org/docs/current/ddl-schemas.html)** - Comprehensive PostgreSQL schema design and management
- **[Q3C Spatial Extension](https://github.com/segasai/q3c)** - Astronomical spatial indexing and coordinate queries
- **[PostGIS Documentation](https://postgis.net/documentation/)** - Advanced spatial database capabilities and optimization
- **[Astronomical Data Organization](https://fits.gsfc.nasa.gov/)** - FITS standard and astronomical data organization best practices

# ✅ **8. Approval & Review**

This section documents the formal review and approval process for database schema documentation.

## **8.1 Review Process**

Database schema documentation undergoes comprehensive review by database administrators, astronomical computing specialists, and infrastructure engineers to ensure schema effectiveness, performance optimization, and operational efficiency.

## **8.2 Approval Matrix**

| **Reviewer** | **Role/Expertise** | **Review Date** | **Approval Status** | **Comments** |
|-------------|-------------------|----------------|-------------------|--------------|
| **crainbramp** | Infrastructure Engineering (Tier 3) | 2025-07-27 | **Approved** | Database schema architecture provides optimal astronomical data organization and performance |
| **alex** | Database Operations (Tier 2) | 2025-07-27 | **Approved** | Schema design supports effective astronomical computing and scientific analysis workflows |
| **glitch** | System Operations (Tier 1/2) | 2025-07-27 | **Approved** | Database schema procedures enable systematic astronomical data management and operations |

# 📜 **9. Documentation Metadata**

This section provides comprehensive information about document creation, revision history, and authorship.

## **9.1 Change Log**

| **Version** | **Date** | **Changes** | **Author** | **Review Status** |
|------------|---------|-------------|------------|------------------|
| 1.0 | 2025-07-27 | Initial database schema documentation with astronomical data organization and performance optimization frameworks | VintageDon | **Approved** |

## **9.2 Authorization & Review**

Database schema documentation approved by Infrastructure Engineering team with validation by database operations and astronomical computing teams ensuring comprehensive schema capability and scientific computing effectiveness.

## **9.3 Authorship Details**

**Human Author:** VintageDon (<https://github.com/vintagedon>)  
**AI Contributor:** Claude Sonnet 4 (claude-sonnet-4-20250514)  
**Collaboration Method:** Request-Analyze-Verify-Generate-Validate (RAVGV)  
**Human Oversight:** Infrastructure schema validation and astronomical computing procedures review

## **9.4 AI Collaboration Disclosure**

This document was collaboratively developed using the Request-Analyze-Verify-Generate-Validate (RAVGV) methodology. The AI assistant provided systematic documentation structure, schema frameworks, and astronomical data organization guidance based on established enterprise database design practices and PostgreSQL optimization requirements. All content has been thoroughly reviewed, validated, and approved by qualified human subject matter experts. The human author retains complete responsibility for accuracy, compliance, and technical correctness.

*Generated: 2025-07-27 | Human Author: VintageDon | AI Assistant: Claude Sonnet 4 | Review Status: Approved | Document Version: 1.0*
