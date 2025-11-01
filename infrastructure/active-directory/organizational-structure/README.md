# 🏢 Active Directory Organizational Structure Documentation

## Proxmox Astronomy Lab Enterprise Identity and Access Management

This directory contains comprehensive documentation for the Active Directory organizational structure supporting the Proxmox Astronomy Lab platform. The organizational framework provides structured identity management, role-based access control, and hybrid cloud integration through comprehensive OU hierarchy, standardized security groups, and Azure AD Connect synchronization supporting enterprise identity governance and automated access management.

---

## 📁 Directory Contents

### **Implementation Documentation**

| **Document** | **Purpose** | **Audience** | **Content Focus** |
|--------------|-------------|--------------|------------------|
| **[Active Directory Organizational Implementation Guide](active-directory-organizational-implementation-guide.md)** | Complete AD structure deployment and organizational framework | Engineering, Operations | Technical implementation, OU structure, security groups, hybrid identity |

### **Configuration Reference**

| **Component** | **Description** | **Documentation Status** | **Integration Points** |
|---------------|-----------------|-------------------------|------------------------|
| **Organizational Unit Structure** | Enterprise OU hierarchy with functional organization | ✅ Documented | Computer placement, user organization, GPO targeting |
| **SGAD_* Security Group Framework** | 41 standardized security groups with role-based access | ✅ Documented | Azure AD sync, RBAC implementation |
| **User Account Organization** | Staff accounts with organizational attributes and AI agents | ✅ Documented | Hybrid identity, attribute-based automation |
| **Computer Object Management** | Server and workstation organization by function | ✅ Documented | Asset management, policy targeting |
| **Azure AD Connect Integration** | Hybrid identity synchronization and cloud integration | ✅ Documented | Cloud services, SSO, conditional access |

---

## 🏗️ Infrastructure Architecture Overview

```markdown
Active Directory Organizational Structure

radioastronomy.io Domain
┌─────────────────────────────────────────────────────────────┐
│                    Domain Root                              │
│            (Forest: Windows Server 2025)                   │
└─────────────────────────────────────────────────────────────┘
                            │
            ┌───────────────┼───────────────┐
            │               │               │
    ┌───────▼────────┐ ┌───▼───────┐ ┌────▼──────┐
    │ Domain Controllers │ │ Built-in │ │   ORG/    │
    │  radio-dc01      │ │ Containers │ │(Enterprise│
    │  radio-dc02      │ │           │ │Structure) │
    └──────────────────┘ └───────────┘ └───────────┘
                                           │
        ┌──────────────┬─────────────────┼─────────────────┬──────────────┐
        │              │                 │                 │              │
    ┌───▼───┐     ┌────▼────┐      ┌────▼────┐      ┌────▼───┐    ┌────▼──────┐
    │Groups/│     │ Users/  │      │Servers/ │      │Workstations││ServiceAccounts│
    │Permissions│ │Privileged│      │ByFunction│     │  Linux/    ││          │
    │ Roles  │     │Engineering│    │ControlPlane│   │ Windows/   ││          │
    └────────┘     │Operations│     │ Research   │   └────────────┘└───────────┘
                   │ Helpdesk │     │ Infra      │
                   │ AIML     │     │ Apps       │
                   └──────────┘     └────────────┘
```

---

## 🔗 Related Infrastructure Categories

### **Direct Dependencies**

| **Category** | **Relationship** | **Integration Points** | **Documentation** |
|--------------|------------------|------------------------|-------------------|
| **[DNS Infrastructure](../dns/README.md)** | **Name Resolution Foundation** | Domain controller location, service records | DNS zone integration |
| **[Network Infrastructure](../network/README.md)** | **Connectivity Platform** | Cross-VLAN DC communication, site topology | Network configuration |
| **[Windows Infrastructure](../windows/README.md)** | **Platform Foundation** | Windows Server 2025 DCs, server management | Server platform |
| **[Security Framework](../../security/README.md)** | **Security Controls** | CIS Controls implementation, access governance | Enterprise security |

### **Operational Integration**

| **Category** | **Integration Type** | **Connection Points** | **Documentation** |
|--------------|---------------------|----------------------|-------------------|
| **[Monitoring Systems](../monitoring/README.md)** | **Identity Monitoring** | AD health, replication status, group membership | Service monitoring |
| **[Backup Systems](../backup/README.md)** | **Identity Protection** | System state backup, directory recovery | Data protection |
| **[Group Policy Management](../README.md)** | **Policy Targeting** | OU-based GPO application, security group targeting | Policy framework |

---

## 🚀 Getting Started

### **For Identity Administrators**

1. **Start Here:** [Active Directory Organizational Implementation Guide](active-directory-organizational-implementation-guide.md)
2. **Group Policy Integration:** [GPO Naming Conventions Guide](../gpo-naming-conventions-guide.md)
3. **Security Framework:** [Enterprise Security Controls](../../security/README.md)
4. **Monitoring Setup:** [AD Health Monitoring](../monitoring/README.md)

### **For System Administrators**

1. **OU Structure:** Understanding organizational unit hierarchy and computer placement
2. **Security Groups:** SGAD_* framework for role-based access control
3. **User Management:** Staff account organization and attribute management
4. **Hybrid Identity:** Azure AD Connect integration and cloud synchronization

### **Common Tasks**

- **User Account Management:** Creating accounts with proper OU placement and attributes
- **Computer Object Management:** Placing servers and workstations in appropriate OUs
- **Security Group Administration:** Managing SGAD_* group membership and access
- **Hybrid Identity Operations:** Azure AD Connect monitoring and troubleshooting

---

## 📊 Organizational Structure Overview

### **Organizational Unit Hierarchy**

| **OU Path** | **Purpose** | **Object Types** | **Policy Application** |
|-------------|-------------|------------------|----------------------|
| **ORG/Users/Privileged/** | Staff user accounts organized by department | User accounts with organizational attributes | User policies, security controls |
| **ORG/Groups/** | Security group organization and management | Universal Security groups, distribution groups | Group policy targeting |
| **ORG/Servers/** | Server organization by function and location | Computer objects, service accounts | Server policies, security baselines |
| **ORG/Workstations/** | Workstation organization by platform | Desktop and laptop computer objects | Workstation policies, user controls |

### **Security Group Framework (41 SGAD_* Groups)**

| **Group Category** | **Group Count** | **Purpose** | **Azure AD Sync** |
|-------------------|-----------------|-------------|-------------------|
| **Administrative Groups** | 5 groups | Enterprise administration and break-glass access | Synchronized |
| **Kubernetes RBAC Groups** | 4 groups | RKE2 cluster access and container orchestration | Synchronized |
| **Tiered Support Structure** | 7 groups | L1/L2/L3 support and security operations | Synchronized |
| **Resource Pool Groups** | 10 groups | Functional access to infrastructure and research resources | Synchronized |
| **Proxmox Platform Groups** | 7 groups | Virtualization platform access and management | Synchronized |
| **Service Account Groups** | 3 groups | Service account organization and access control | On-premises only |
| **ZTNA Groups** | 5 groups | Zero Trust Network Access and Cloudflare integration | Cloud-only |

---

## 👥 User Organization Strategy

### **Departmental Structure**

| **Department** | **OU Location** | **Staff Members** | **AI Agents** | **Access Patterns** |
|----------------|-----------------|-------------------|---------------|-------------------|
| **Engineering** | ORG/Users/Privileged/Engineering/ | crainbramp, greg | N/A | L3 access, infrastructure administration |
| **Operations** | ORG/Users/Privileged/Operations/ | alex | N/A | L2 access, system and database operations |
| **Helpdesk** | ORG/Users/Privileged/Helpdesk/ | glitch | N/A | L1 access, user support and monitoring |
| **AIML** | ORG/Users/Privileged/AIML/ | N/A | claude_agent01, claude_agent02, claude_agent03 | Automated system access, research workflows |

### **Organizational Attributes Implementation**

| **Attribute** | **Purpose** | **Automation Capability** | **Compliance Benefit** |
|---------------|-------------|---------------------------|------------------------|
| **Title** | Role identification and tier assignment | Dynamic group membership based on tier level | Clear role definition for audit |
| **Department** | Functional area and access scope | Automatic group assignment and policy targeting | Organizational alignment validation |
| **Manager** | Approval hierarchy and delegation | Workflow routing and access request approval | Clear accountability chain |
| **Company** | Enterprise-wide policy consistency | Universal policy application and identity validation | Consistent governance framework |

---

## 🔄 Hybrid Identity Integration

### **Azure AD Connect Configuration**

| **Sync Component** | **Configuration** | **Sync Scope** | **Security Consideration** |
|-------------------|-------------------|----------------|---------------------------|
| **User Accounts** | Password Hash Sync + Seamless SSO | All users in ORG/Users/Privileged/ | Cloud authentication capability |
| **Security Groups** | Full group membership sync | All Universal Security groups | RBAC enforcement in cloud |
| **Computer Objects** | Server-only synchronization | Servers from ORG/Servers/ | Asset inventory without workstation exposure |
| **AI Agent Accounts** | Individual identity sync | All claude_agent accounts | Automated system authentication with audit trail |

### **Identity Flow Architecture**

| **Authentication Scenario** | **Identity Source** | **Authorization Method** | **Access Control** |
|----------------------------|--------------------|-----------------------|-------------------|
| **On-Premises Resources** | Local AD authentication | SGAD_* group membership | Direct AD group evaluation |
| **Cloud Services** | Azure AD with password hash sync | Synced group membership | Cloud-based conditional access |
| **Hybrid Applications** | Seamless SSO with cloud claims | Combined on-prem and cloud groups | Unified access control |
| **AI Agent Access** | Individual identity authentication | Attribute-based access control | Automated workflow authorization |

---

## 📈 Management and Governance

### **Identity Lifecycle Management**

| **Lifecycle Phase** | **Process** | **Automation Level** | **Compliance Controls** |
|-------------------|-------------|---------------------|------------------------|
| **User Onboarding** | Account creation with organizational attributes | Manual with standardized procedures | Attribute validation and proper OU placement |
| **Role Changes** | Attribute updates with group membership adjustment | Semi-automated through dynamic groups | Change approval and audit trail |
| **Access Reviews** | Regular group membership and attribute validation | Automated reporting with manual review | Periodic access certification |
| **User Offboarding** | Account disabling with access revocation | Manual with comprehensive checklist | Complete access removal validation |

### **AI Agent Identity Management**

| **AI Agent** | **Identity Purpose** | **Access Scope** | **Monitoring Requirements** |
|--------------|--------------------|-----------------|-----------------------------|
| **claude_agent01** | Research and analysis workflows | SGAD_Pool_AIML_Users, research resources | Comprehensive activity logging |
| **claude_agent02** | Computational and data processing | SGAD_Pool_AIML_Admin, infrastructure access | Enhanced security monitoring |
| **claude_agent03** | Knowledge management and collaboration | SGAD_Pool_AIML_Users, documentation systems | Content access tracking |

---

## **Document Information**

| **Field** | **Value** |
|-----------|-----------|
| **Author** | VintageDon - <https://github.com/vintagedon> |
| **Created** | 2025-07-28 |
| **Last Updated** | 2025-07-28 |
| **Version** | 1.0 |

---
Tags: active-directory, organizational-structure, security-groups, hybrid-identity, azure-ad-connect, enterprise-identity
