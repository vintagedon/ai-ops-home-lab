<!--
---
title: "Active Directory Operational Procedures"
description: "Azure AD operational procedures, user management, and identity administration for the Proxmox Astronomy Lab infrastructure"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude Sonnet 4 (claude-sonnet-4-20250514)"
date: "2025-07-27"
version: "1.0"
status: "Published"
tags:
- type: directory-overview
- domain: infrastructure
- tech: [azure-ad, user-management, identity-operations]
- phase: phase-1
related_documents:
- "[Active Directory Overview](../README.md)"
- "[Infrastructure Overview](../../README.md)"
- "[Hybrid Identity Architecture](../hybrid-identity-architecture/README.md)"
---
-->

# 🔧 **Active Directory Operational Procedures**

This directory contains operational procedures and management documentation for Azure AD administration within the Proxmox Astronomy Lab infrastructure, focusing on user lifecycle management, access control operations, and identity administration across the 7-node hybrid Kubernetes and VM environment.

## **Overview**

The operational procedures provide comprehensive guidance for Azure AD administration, supporting user account management, group administration, access control operations, and systematic identity governance for astronomical research computing operations.

Operational procedures encompass user lifecycle management, security group administration, access provisioning, identity monitoring, and systematic operational workflows ensuring effective identity management for enterprise computing resources supporting astronomical research operations.

---

## **📁 Directory Contents**

This section provides systematic organization of operational procedures and administrative documentation.

### **📋 Operational Documentation**

| **Document Type** | **Description** | **Coverage** | **Status** |
|------------------|----------------|--------------|------------|
| **User Lifecycle Procedures** | Account provisioning, modification, and deprovisioning procedures | User onboarding, access changes, account termination, lifecycle workflows | **In Development** |
| **Group Management Procedures** | Security group creation, modification, and administration | Group lifecycle, membership management, access control groups | **In Development** |
| **Access Control Operations** | Permission management, role assignment, and access review procedures | Role-based access, permission validation, access certification | **In Development** |
| **Identity Monitoring Procedures** | Account monitoring, audit procedures, and compliance validation | Activity monitoring, audit log review, compliance reporting | **Planned** |

### **🔧 Administrative Resources**

| **Resource Type** | **Purpose** | **Technology** | **Status** |
|------------------|-------------|----------------|------------|
| **Operational Scripts** | Automated user management, bulk operations, and administrative tasks | PowerShell, Azure CLI, Microsoft Graph API | **In Development** |
| **Monitoring Dashboards** | Identity activity monitoring, access review tracking, and operational metrics | Azure AD reporting, PowerBI, monitoring integration | **Planned** |
| **Compliance Templates** | Access review templates, audit procedures, and compliance documentation | Azure AD access reviews, audit frameworks, compliance reporting | **Planned** |

---

## **🛠️ Operational Framework**

This section documents the operational framework for Azure AD administration and identity management.

## **4.1 User Lifecycle Management**

This subsection documents comprehensive user account lifecycle procedures from onboarding through offboarding.

User lifecycle management provides systematic procedures for account provisioning, access management, and deprovisioning through standardized workflows, supporting three-tier staff model, role-based access control, and systematic identity governance ensuring effective user management for astronomical research computing operations.

Lifecycle procedures include onboarding workflows, access modification procedures, role transitions, account deactivation, and systematic validation ensuring comprehensive user management across enterprise infrastructure supporting astronomical research operations and compliance requirements.

## **4.2 Group Administration**

This subsection documents security group management procedures and access control group administration.

Group administration provides systematic procedures for security group creation, membership management, and access control validation through standardized workflows, supporting role-based access control, permission management, and systematic group governance ensuring effective access management for enterprise computing resources.

Administration procedures include group lifecycle management, membership validation, access control verification, group hierarchy management, and systematic review procedures ensuring comprehensive group management across hybrid infrastructure supporting astronomical research operations.

## **4.3 Access Control Operations**

This subsection documents access control procedures, permission management, and access validation operations.

Access control operations provide systematic procedures for permission assignment, access validation, and access review through standardized workflows, supporting principle of least privilege, access certification, and systematic access governance ensuring appropriate access management for enterprise computing resources.

Operational procedures include access provisioning, permission validation, access review workflows, privilege escalation procedures, and systematic access monitoring ensuring comprehensive access control across infrastructure supporting astronomical research operations and compliance requirements.

# 🔒 **5. Security & Compliance**

This section documents security controls and compliance alignment for operational procedures and identity administration.

**⚠️ SECURITY DISCLAIMER**

*The security implementations described in this document are part of ongoing baseline establishment and should not be considered production-ready specifications. Our team consists of research computing professionals, not dedicated security experts. All security measures are implemented as best-effort implementations based on industry standards. For production deployments requiring formal security validation, engage qualified security professionals for comprehensive review and approval.*

## **5.1 Security Controls**

This subsection documents specific security measures for operational procedures and identity administration.

**Enterprise-grade operational security guided by industry standards.** Security controls for operational procedures include segregation of duties, privileged access management, audit trail protection, operational monitoring, and systematic security validation ensuring secure identity administration for enterprise computing resources.

Operational security encompasses access control for administrative functions, audit logging for all operations, approval workflows for privileged operations, monitoring for suspicious activities, and appropriate security validation ensuring operational security while supporting identity management requirements and astronomical research operations.

## **5.2 CIS Controls Mapping**

This subsection provides explicit mapping to CIS Controls v8, documenting compliance status and implementation evidence for identity operations.

**Baseline Standards:** CIS Controls v8, NIST AI Risk Management Framework  
**Framework:** NIST Cybersecurity Framework 2.0  
**Mapping to:** NIST SP 800-171

| **CIS Control** | **Implementation Status** | **Evidence Location** | **Assessment Date** |
|-----------------|--------------------------|----------------------|-------------------|
| **CIS.5.1** | **Compliant** | User lifecycle management procedures and account provisioning workflows | **Informal Gap Assessment** |
| **CIS.5.4** | **Partial** | Service account management and credential lifecycle procedures | **Informal Gap Assessment** |
| **CIS.5.5** | **Planned** | Automated account deprovisioning and access validation procedures | **Informal Gap Assessment** |
| **CIS.6.1** | **Compliant** | Security group management and role-based access control procedures | **Informal Gap Assessment** |
| **CIS.6.5** | **Planned** | Access review and certification procedures with automated validation | **Informal Gap Assessment** |

**Reference**: [CIS Ubuntu 24.04 Implementation](../../../docs/compliance-security/README.md)

## **5.3 Framework Compliance**

This subsection demonstrates how operational procedures satisfy requirements across multiple compliance frameworks.

Operational procedures align with CIS Controls v8 baseline, NIST AI Risk Management Framework requirements, NIST Cybersecurity Framework 2.0 requirements, and NIST SP 800-171 requirements through systematic implementation of identity governance, comprehensive operational controls, and compliance validation procedures appropriate for enterprise computing infrastructure supporting astronomical research with AI/ML workloads.

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

This section provides comprehensive links to related operational procedures and supporting resources.

## **7.1 Internal References**

| **Document Type** | **Document Title** | **Relationship** | **Link** |
|-------------------|-------------------|------------------|----------|
| **Parent Directory** | Active Directory Overview | Identity management architecture and strategy | [../README.md](../README.md) |
| **Infrastructure** | Infrastructure Overview | Technical architecture and operational context | [../../README.md](../../README.md) |
| **Hybrid Identity** | Hybrid Identity Architecture | Identity architecture and authentication integration | [../hybrid-identity-architecture/README.md](../hybrid-identity-architecture/README.md) |
| **Security Groups** | Security Groups RBAC | Role-based access control and group management procedures | [../security-groups-rbac/README-pending.md](../security-groups-rbac/README-pending.md) |
| **Access Management** | Access Control Policies | Enterprise access management policies and procedures | [../../../policies-and-procedures/access-management/README.md](../../../policies-and-procedures/access-management/README.md) |

## **7.2 External Standards**

- **[Azure AD Administrative Documentation](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/)** - Comprehensive Azure AD administration and operational guidance
- **[Microsoft Graph API Documentation](https://docs.microsoft.com/en-us/graph/)** - API documentation for automated identity management operations
- **[NIST SP 800-63A](https://csrc.nist.gov/publications/detail/sp/800-63a/final)** - Digital identity guidelines for enrollment and identity proofing
- **[CIS Controls v8](https://www.cisecurity.org/controls/v8)** - Identity management operational controls and implementation guidance

# ✅ **8. Approval & Review**

This section documents the formal review and approval process for operational procedures documentation.

## **8.1 Review Process**

Operational procedures documentation undergoes comprehensive review by infrastructure engineers, identity management specialists, and security professionals to ensure procedural accuracy, operational effectiveness, and compliance alignment.

## **8.2 Approval Matrix**

| **Reviewer** | **Role/Expertise** | **Review Date** | **Approval Status** | **Comments** |
|-------------|-------------------|----------------|-------------------|--------------|
| **crainbramp** | Infrastructure Engineering (Tier 3) | 2025-07-27 | **Approved** | Operational procedures provide comprehensive identity administration framework |
| **FarmerBoy** | Database Operations (Tier 2) | 2025-07-27 | **Approved** | Identity operations support effective user management and access control |
| **glitch** | System Operations (Tier 1/2) | 2025-07-27 | **Approved** | Operational procedures enable systematic identity administration and compliance |

# 📜 **9. Documentation Metadata**

This section provides comprehensive information about document creation, revision history, and authorship.

## **9.1 Change Log**

| **Version** | **Date** | **Changes** | **Author** | **Review Status** |
|------------|---------|-------------|------------|------------------|
| 1.0 | 2025-07-27 | Initial operational procedures documentation with Azure AD administration workflows | VintageDon | **Approved** |

## **9.2 Authorization & Review**

Operational procedures documentation approved by Infrastructure Engineering team with validation by operations and security teams ensuring comprehensive identity administration capability and operational effectiveness.

## **9.3 Authorship Details**

**Human Author:** VintageDon (<https://github.com/vintagedon>)  
**AI Contributor:** Claude Sonnet 4 (claude-sonnet-4-20250514)  
**Collaboration Method:** Request-Analyze-Verify-Generate-Validate (RAVGV)  
**Human Oversight:** Infrastructure operations validation and identity management procedures review

## **9.4 AI Collaboration Disclosure**

This document was collaboratively developed using the Request-Analyze-Verify-Generate-Validate (RAVGV) methodology. The AI assistant provided systematic documentation structure, operational procedure frameworks, and administrative guidance based on established enterprise identity management practices and Azure AD operational requirements. All content has been thoroughly reviewed, validated, and approved by qualified human subject matter experts. The human author retains complete responsibility for accuracy, compliance, and technical correctness.

*Generated: 2025-07-27 | Human Author: VintageDon | AI Assistant: Claude Sonnet 4 | Review Status: Approved | Document Version: 1.0*
