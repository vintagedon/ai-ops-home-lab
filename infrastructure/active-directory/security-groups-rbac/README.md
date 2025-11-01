<!--
---
title: "Active Directory Security Groups & RBAC"
description: "Azure AD security groups, role-based access control, and enterprise permission management for the Proxmox Astronomy Lab infrastructure"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude Sonnet 4 (claude-sonnet-4-20250514)"
date: "2025-07-27"
version: "1.0"
status: "Published"
tags:
- type: directory-overview
- domain: infrastructure
- tech: [azure-ad, rbac, security-groups]
- phase: phase-1
related_documents:
- "[Active Directory Overview](../README.md)"
- "[Infrastructure Overview](../../README.md)"
- "[Operational Procedures](../operational-procedures/README.md)"
---
-->

# 🛡️ **Active Directory Security Groups & RBAC**

This directory contains security group architecture and role-based access control documentation for Azure AD within the Proxmox Astronomy Lab infrastructure, focusing on enterprise permission management, group hierarchy, and systematic access control across the 7-node hybrid Kubernetes and VM environment.

## **Overview**

The security groups and RBAC framework provides comprehensive access control through Azure AD security groups, supporting three-tier staff model, role-based permissions, and systematic access management for astronomical research computing operations.

Security group architecture encompasses enterprise role definitions, permission matrices, group hierarchy design, access control patterns, and systematic RBAC implementation ensuring appropriate access control for enterprise computing resources supporting astronomical research operations.

---

## **📁 Directory Contents**

This section provides systematic organization of security group architecture and RBAC documentation.

### **🏗️ RBAC Architecture Documentation**

| **Document Type** | **Description** | **Coverage** | **Status** |
|------------------|----------------|--------------|------------|
| **Security Group Architecture** | Group hierarchy design, role definitions, and permission structure | Three-tier staff model, role hierarchy, group organization | **In Development** |
| **Permission Matrix Documentation** | Role-based permissions, access control mapping, and privilege assignment | Service permissions, application access, infrastructure privileges | **In Development** |
| **Group Lifecycle Procedures** | Group creation, modification, and management procedures | Group provisioning, membership management, lifecycle workflows | **In Development** |
| **Access Control Validation** | Permission auditing, access review, and compliance validation procedures | Access certification, privilege validation, compliance reporting | **Planned** |

### **🔧 Implementation Resources**

| **Resource Type** | **Purpose** | **Technology** | **Status** |
|------------------|-------------|----------------|------------|
| **Group Templates** | Standardized group configurations, role definitions, and permission sets | Azure AD groups, role assignments, permission templates | **In Development** |
| **Automation Scripts** | Group provisioning, membership management, and access validation | PowerShell, Azure CLI, Microsoft Graph API | **Planned** |
| **Compliance Reports** | Access review reports, privilege auditing, and compliance validation | Azure AD reporting, access review automation, compliance dashboards | **Planned** |

---

## **🛠️ RBAC Implementation Framework**

This section documents the role-based access control implementation and security group architecture.

## **4.1 Three-Tier Staff Model**

This subsection documents the enterprise three-tier staff model and role-based access control implementation.

Three-tier staff model provides systematic role hierarchy through HelpDesk (Tier 1), SysOps (Tier 2), and Engineering (Tier 3) classifications, supporting graduated access control, privilege escalation procedures, and systematic access management ensuring appropriate permissions for astronomical research computing operations.

Staff model implementation includes role definitions, access control matrices, privilege boundaries, escalation procedures, and systematic validation ensuring comprehensive access control across enterprise infrastructure supporting astronomical research operations and security requirements.

## **4.2 Security Group Hierarchy**

This subsection documents Azure AD security group hierarchy and organizational structure for enterprise access control.

Security group hierarchy provides systematic group organization through functional roles, service access groups, administrative privilege groups, and application-specific permissions, supporting role-based access control, permission inheritance, and systematic group management ensuring effective access control for enterprise computing resources.

Group hierarchy includes functional groups (HelpDesk, SysOps, Engineering), service groups (Infrastructure, Applications, Databases), administrative groups (Privileged Access, Security), and systematic group relationships ensuring comprehensive access control across hybrid infrastructure supporting astronomical research operations.

## **4.3 Permission Management**

This subsection documents permission assignment, access control validation, and privilege management procedures.

Permission management provides systematic approaches for access control through role-based assignments, principle of least privilege, permission validation, and systematic access governance ensuring appropriate access control for enterprise computing resources supporting astronomical research operations.

Management procedures include permission matrices, access control validation, privilege assignment workflows, access review procedures, and systematic compliance validation ensuring effective permission management across infrastructure supporting astronomical research operations and compliance requirements.

# 🔒 **5. Security & Compliance**

This section documents security controls and compliance alignment for security groups and RBAC implementation.

**⚠️ SECURITY DISCLAIMER**

*The security implementations described in this document are part of ongoing baseline establishment and should not be considered production-ready specifications. Our team consists of research computing professionals, not dedicated security experts. All security measures are implemented as best-effort implementations based on industry standards. For production deployments requiring formal security validation, engage qualified security professionals for comprehensive review and approval.*

## **5.1 Security Controls**

This subsection documents specific security measures for security groups and role-based access control.

**Enterprise-grade access control security guided by industry standards.** Security controls for security groups and RBAC include principle of least privilege, segregation of duties, privileged access management, access monitoring, and systematic security validation ensuring secure access control for enterprise computing resources.

Access control security encompasses group-based permissions, role validation, privilege monitoring, access certification, and appropriate security configuration ensuring access control security while supporting enterprise permission requirements and astronomical research operations.

## **5.2 CIS Controls Mapping**

This subsection provides explicit mapping to CIS Controls v8, documenting compliance status and implementation evidence for access control.

**Baseline Standards:** CIS Controls v8, NIST AI Risk Management Framework  
**Framework:** NIST Cybersecurity Framework 2.0  
**Mapping to:** NIST SP 800-171

| **CIS Control** | **Implementation Status** | **Evidence Location** | **Assessment Date** |
|-----------------|--------------------------|----------------------|-------------------|
| **CIS.6.1** | **Compliant** | Azure AD security groups and role-based access control implementation | **Informal Gap Assessment** |
| **CIS.6.2** | **Compliant** | Three-tier staff model with graduated access control and privilege management | **Informal Gap Assessment** |
| **CIS.6.4** | **Partial** | Privileged access management with Azure AD PIM and access validation | **Informal Gap Assessment** |
| **CIS.6.5** | **Planned** | Automated access review and certification with compliance validation | **Informal Gap Assessment** |
| **CIS.6.6** | **Compliant** | Application-specific access controls through security group integration | **Informal Gap Assessment** |

**Reference**: [CIS Ubuntu 24.04 Implementation](../../../docs/compliance-security/README.md)

## **5.3 Framework Compliance**

This subsection demonstrates how security groups and RBAC satisfy requirements across multiple compliance frameworks.

Security groups and RBAC implementation aligns with CIS Controls v8 baseline, NIST AI Risk Management Framework requirements, NIST Cybersecurity Framework 2.0 requirements, and NIST SP 800-171 requirements through systematic implementation of comprehensive access control, role-based permissions, and compliance validation procedures appropriate for enterprise computing infrastructure supporting astronomical research with AI/ML workloads.

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

This section provides comprehensive links to related security groups and RBAC documentation and supporting resources.

## **7.1 Internal References**

| **Document Type** | **Document Title** | **Relationship** | **Link** |
|-------------------|-------------------|------------------|----------|
| **Parent Directory** | Active Directory Overview | Identity management architecture and access control strategy | [../README.md](../README.md) |
| **Infrastructure** | Infrastructure Overview | Technical architecture and access control context | [../../README.md](../../README.md) |
| **Operational Procedures** | AD Operations | Identity administration and group management procedures | [../operational-procedures/README.md](../operational-procedures/README.md) |
| **Hybrid Identity** | Hybrid Identity Architecture | Identity architecture and authentication integration | [../hybrid-identity-architecture/README.md](../hybrid-identity-architecture/README.md) |
| **Access Management** | Access Control Policies | Enterprise access management policies and RBAC implementation | [../../../policies-and-procedures/access-management/README.md](../../../policies-and-procedures/access-management/README.md) |

## **7.2 External Standards**

- **[Azure AD RBAC Documentation](https://docs.microsoft.com/en-us/azure/role-based-access-control/)** - Comprehensive Azure RBAC implementation and best practices
- **[Azure AD Security Groups Guide](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-manage-groups)** - Security group management and configuration guidance
- **[NIST SP 800-162](https://csrc.nist.gov/publications/detail/sp/800-162/final)** - Guide to Attribute Based Access Control (ABAC) definition and considerations
- **[CIS Controls v8](https://www.cisecurity.org/controls/v8)** - Access control management and implementation guidelines

# ✅ **8. Approval & Review**

This section documents the formal review and approval process for security groups and RBAC documentation.

## **8.1 Review Process**

Security groups and RBAC documentation undergoes comprehensive review by infrastructure engineers, security specialists, and access control professionals to ensure implementation accuracy, security compliance, and operational effectiveness.

## **8.2 Approval Matrix**

| **Reviewer** | **Role/Expertise** | **Review Date** | **Approval Status** | **Comments** |
|-------------|-------------------|----------------|-------------------|--------------|
| **crainbramp** | Infrastructure Engineering (Tier 3) | 2025-07-27 | **Approved** | Security groups and RBAC provide comprehensive enterprise access control framework |
| **FarmerBoy** | Database Operations (Tier 2) | 2025-07-27 | **Approved** | Access control implementation supports effective permission management and security |
| **glitch** | System Operations (Tier 1/2) | 2025-07-27 | **Approved** | RBAC framework enables systematic access control and compliance management |

# 📜 **9. Documentation Metadata**

This section provides comprehensive information about document creation, revision history, and authorship.

## **9.1 Change Log**

| **Version** | **Date** | **Changes** | **Author** | **Review Status** |
|------------|---------|-------------|------------|------------------|
| 1.0 | 2025-07-27 | Initial security groups and RBAC documentation with three-tier staff model implementation | VintageDon | **Approved** |

## **9.2 Authorization & Review**

Security groups and RBAC documentation approved by Infrastructure Engineering team with validation by security and operations teams ensuring comprehensive access control capability and enterprise permission management effectiveness.

## **9.3 Authorship Details**

**Human Author:** VintageDon (<https://github.com/vintagedon>)  
**AI Contributor:** Claude Sonnet 4 (claude-sonnet-4-20250514)  
**Collaboration Method:** Request-Analyze-Verify-Generate-Validate (RAVGV)  
**Human Oversight:** Infrastructure security validation and access control framework review

## **9.4 AI Collaboration Disclosure**

This document was collaboratively developed using the Request-Analyze-Verify-Generate-Validate (RAVGV) methodology. The AI assistant provided systematic documentation structure, RBAC frameworks, and access control patterns based on established enterprise access management practices and Azure AD security group requirements. All content has been thoroughly reviewed, validated, and approved by qualified human subject matter experts. The human author retains complete responsibility for accuracy, compliance, and technical correctness.

*Generated: 2025-07-27 | Human Author: VintageDon | AI Assistant: Claude Sonnet 4 | Review Status: Approved | Document Version: 1.0*
