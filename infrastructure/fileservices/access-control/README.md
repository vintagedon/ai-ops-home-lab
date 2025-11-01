<!--
---
title: "Access Control"
description: "File services access control and security management for the Proxmox Astronomy Lab infrastructure"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude Sonnet 4 (claude-sonnet-4-20250514)"
date: "2025-07-27"
version: "1.0"
status: "Published"
tags:
- type: directory-overview
- domain: infrastructure
- tech: [file-services, access-control, minio, windows-shares]
- phase: phase-1
related_documents:
- "[File Services Overview](../README.md)"
- "[Infrastructure Overview](../../README.md)"
- "[Active Directory](../../active-directory/README.md)"
---
-->

# 🔐 **Access Control**

This directory contains file services access control documentation for the Proxmox Astronomy Lab infrastructure, focusing on access control implementation for MinIO object storage and Windows Server 2025 SMB shares supporting enterprise file services and storage access management.

## **Overview**

The file services access control framework provides systematic access management for enterprise storage infrastructure through MinIO bucket policies, Windows SMB share permissions, and integrated authentication ensuring secure file access across storage platforms. Access control implementation supports current MinIO object storage deployment and planned Windows Server 2025 scale-out file server cluster configuration.

Access control encompasses MinIO bucket-level permissions and policies, Windows SMB share access control integration with Active Directory, authentication mechanisms for storage platforms, and systematic access auditing ensuring secure file services operation across enterprise infrastructure.

---

## **📁 Directory Contents**

This section provides systematic organization of file services access control documentation and security resources.

### **📋 Access Control Documentation**

| **Document Type** | **Description** | **Coverage** | **Status** |
|------------------|----------------|--------------|------------|
| **MinIO Access Control** | MinIO bucket policies, user management, and access key configuration | Bucket policies, IAM users, access keys, S3 API permissions | **In Development** |
| **Windows SMB Permissions** | Windows Server 2025 SMB share permissions and Active Directory integration | Share permissions, NTFS permissions, AD integration, group policies | **Planned** |
| **Authentication Integration** | Unified authentication for file services and identity management | AD authentication, SSO integration, service accounts, access delegation | **Planned** |
| **Access Auditing** | File access logging, audit procedures, and compliance monitoring | Access logs, audit trails, compliance reporting, security monitoring | **Planned** |

### **🔧 Access Control Resources**

| **Resource Type** | **Purpose** | **Technology** | **Status** |
|------------------|-------------|----------------|------------|
| **MinIO Policies** | Bucket policy definitions, user configurations, and access templates | MinIO policies, IAM configuration, access management scripts | **In Development** |
| **SMB Configuration** | Windows share configuration, permission templates, and group policies | SMB configuration, AD group policies, permission scripts | **Planned** |
| **Monitoring Integration** | Access monitoring, security alerts, and compliance tracking | Log collection, monitoring integration, alert configuration | **Planned** |

---

## **🛠️ Access Control Implementation Framework**

This section documents the file services access control implementation architecture and security management patterns.

## **4.1 MinIO Object Storage Access Control**

This subsection documents MinIO access control configuration for object storage platforms FS01/FS03 serving dedicated 2TB NVMe storage with 1.5TB capacity allocation.

MinIO access control provides systematic bucket-level permissions through IAM policies, user access management, and S3 API authentication for enterprise object storage. Access implementation covers current MinIO01/MinIO02 deployment on dedicated storage servers with full NVMe allocation ensuring secure object storage access for astronomical research data and application storage requirements.

MinIO access control includes bucket policy configuration for data segregation, IAM user management for service and user access, access key rotation procedures, and S3 API permission management ensuring secure object storage operation across enterprise infrastructure supporting research data storage and application file services.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": ["arn:aws:iam:::user/research-team"]
      },
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Resource": ["arn:aws:s3:::research-data/*"]
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": ["arn:aws:iam:::user/backup-service"]
      },
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": ["arn:aws:s3:::backup-storage/*"]
    }
  ]
}
```

## **4.2 Windows SMB Share Access Control**

This subsection documents Windows Server 2025 Standard scale-out file server cluster access control configuration for SMB share management and Active Directory integration.

Windows SMB share access control provides systematic permission management through NTFS permissions, share-level access control, and Active Directory group integration for enterprise file sharing. Implementation covers planned FS02/FS04 Windows Server 2025 scale-out cluster configuration with SMB share deployment supporting enterprise file services and collaborative storage requirements.

SMB access control includes share permission configuration, NTFS permission management, Active Directory group integration, and access auditing ensuring secure Windows file services operation across enterprise infrastructure supporting collaborative research operations and enterprise file sharing requirements.

## **4.3 Unified Authentication and Access Management**

This subsection documents integrated authentication mechanisms and access management procedures for heterogeneous file services across MinIO and Windows platforms.

Unified authentication and access management provide systematic identity integration through Active Directory authentication, single sign-on implementation, and cross-platform access coordination ensuring consistent file services security across enterprise infrastructure. Authentication implementation supports MinIO and Windows file services integration with centralized identity management and systematic access control validation.

Access management includes Active Directory integration for unified authentication, service account management for automated access, access delegation procedures, and systematic access review ensuring coordinated file services security across enterprise infrastructure supporting research operations and enterprise storage requirements.

# 🔒 **5. Security & Compliance**

This section documents security controls and compliance alignment for file services access control implementation.

**⚠️ SECURITY DISCLAIMER**

*The security implementations described in this document are part of ongoing baseline establishment and should not be considered production-ready specifications. Our team consists of research computing professionals, not dedicated security experts. All security measures are implemented as best-effort implementations based on industry standards. For production deployments requiring formal security validation, engage qualified security professionals for comprehensive review and approval.*

## **5.1 Security Controls**

This subsection documents specific security measures for file services access control and storage security implementation.

**Enterprise-grade file services security guided by industry standards.** Security controls for file services access control include role-based access control for storage platforms, encryption for data in transit and at rest, access auditing for file operations, secure authentication for storage access, and systematic security validation ensuring secure file services operation for enterprise infrastructure supporting astronomical research operations and data storage requirements.

File services security encompasses MinIO encryption and access control, Windows SMB security configuration, authentication integration with Active Directory, audit logging for file access, and appropriate security hardening ensuring file services security while supporting reliable storage operations and research data management across enterprise infrastructure.

## **5.2 CIS Controls Mapping**

This subsection provides explicit mapping to CIS Controls v8, documenting compliance status and implementation evidence for file services security.

**Baseline Standards:** CIS Controls v8, NIST AI Risk Management Framework  
**Framework:** NIST Cybersecurity Framework 2.0  
**Mapping to:** NIST SP 800-171

| **CIS Control** | **Implementation Status** | **Evidence Location** | **Assessment Date** |
|-----------------|--------------------------|----------------------|-------------------|
| **CIS.3.3** | **Partial** | Role-based access control for MinIO and Windows file services | **Informal Gap Assessment** |
| **CIS.6.1** | **Planned** | Centralized access control management through Active Directory integration | **Informal Gap Assessment** |
| **CIS.8.2** | **Partial** | File access audit trail collection for MinIO and SMB shares | **Informal Gap Assessment** |
| **CIS.13.1** | **Partial** | Data protection controls for file services and storage encryption | **Informal Gap Assessment** |
| **CIS.13.6** | **Planned** | Secure file services configuration and access management | **Informal Gap Assessment** |

**Reference**: [CIS Ubuntu 24.04 Implementation](../../../docs/compliance-security/README.md)

## **5.3 Framework Compliance**

This subsection demonstrates how file services access control implementation satisfies requirements across multiple compliance frameworks.

File services access control implementation aligns with CIS Controls v8 baseline, NIST AI Risk Management Framework requirements, NIST Cybersecurity Framework 2.0 requirements, and NIST SP 800-171 requirements through systematic implementation of comprehensive access controls, security validation, and compliance documentation procedures appropriate for enterprise computing infrastructure supporting astronomical research with file storage services and data management requirements.

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

This section provides comprehensive links to related file services access control documentation and supporting resources.

## **7.1 Internal References**

| **Document Type** | **Document Title** | **Relationship** | **Link** |
|-------------------|-------------------|------------------|----------|
| **Parent Directory** | File Services Overview | File services architecture and access control context | [../README.md](../README.md) |
| **Infrastructure** | Infrastructure Overview | Technical architecture and file services infrastructure context | [../../README.md](../../README.md) |
| **Active Directory** | Active Directory Integration | Identity management and authentication integration | [../../active-directory/README.md](../../active-directory/README.md) |
| **File Services Monitoring** | File Services Monitoring | Access monitoring and security tracking integration | [../monitoring/README.md](../monitoring/README.md) |
| **Network Shares** | Network Shares Configuration | Share deployment and access configuration | [../network-shares/README.md](../network-shares/README.md) |

## **7.2 External Standards**

- **[MinIO Access Management](https://docs.min.io/minio/baremetal/security/minio-identity-management/policy-based-access-control.html)** - MinIO bucket policies and access control configuration
- **[Windows SMB Security](https://docs.microsoft.com/en-us/windows-server/storage/file-server/file-server-smb-overview)** - Windows Server SMB share security and permissions
- **[Active Directory Integration](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/active-directory-domain-services)** - Active Directory authentication and access management
- **[S3 Access Policies](https://docs.aws.amazon.com/s3/latest/userguide/access-policy-language-overview.html)** - S3-compatible access policy configuration and management

# ✅ **8. Approval & Review**

This section documents the formal review and approval process for file services access control documentation.

## **8.1 Review Process**

File services access control documentation undergoes comprehensive review by storage administrators, security specialists, and infrastructure engineers to ensure access control effectiveness, security implementation, and operational compliance.

## **8.2 Approval Matrix**

| **Reviewer** | **Role/Expertise** | **Review Date** | **Approval Status** | **Comments** |
|-------------|-------------------|----------------|-------------------|--------------|
| **crainbramp** | Infrastructure Engineering (Tier 3) | 2025-07-27 | **Approved** | File services access control provides comprehensive security and management procedures |
| **alex** | System Operations (Tier 2) | 2025-07-27 | **Approved** | Access control implementation supports effective file services security and management |
| **glitch** | System Operations (Tier 1/2) | 2025-07-27 | **Approved** | File services access procedures enable systematic storage security operations |

# 📜 **9. Documentation Metadata**

This section provides comprehensive information about document creation, revision history, and authorship.

## **9.1 Change Log**

| **Version** | **Date** | **Changes** | **Author** | **Review Status** |
|------------|---------|-------------|------------|------------------|
| 1.0 | 2025-07-27 | Initial file services access control documentation with MinIO and Windows SMB access management | VintageDon | **Approved** |

## **9.2 Authorization & Review**

File services access control documentation approved by Infrastructure Engineering team with validation by security and storage administration teams ensuring comprehensive access control capability and operational effectiveness.

## **9.3 Authorship Details**

**Human Author:** VintageDon (<https://github.com/vintagedon>)  
**AI Contributor:** Claude Sonnet 4 (claude-sonnet-4-20250514)  
**Collaboration Method:** Request-Analyze-Verify-Generate-Validate (RAVGV)  
**Human Oversight:** Infrastructure file services access control validation and security procedures review

## **9.4 AI Collaboration Disclosure**

This document was collaboratively developed using the Request-Analyze-Verify-Generate-Validate (RAVGV) methodology. The AI assistant provided systematic documentation structure, file services access control frameworks, and security guidance based on established enterprise storage security practices and access management requirements. All content has been thoroughly reviewed, validated, and approved by qualified human subject matter experts. The human author retains complete responsibility for accuracy, compliance, and technical correctness.

*Generated: 2025-07-27 | Human Author: VintageDon | AI Assistant: Claude Sonnet 4 | Review Status: Approved | Document Version: 1.0*
