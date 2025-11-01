# ☁️ Cloud Identity Infrastructure Documentation

## Proxmox Astronomy Lab Enterprise Hybrid Identity and Cloud Integration

This directory contains comprehensive documentation for the cloud identity infrastructure supporting the Proxmox Astronomy Lab platform. The hybrid identity system provides seamless integration between on-premises Active Directory and Microsoft Azure AD through Azure AD Connect synchronization, custom Azure RBAC roles, dual authorization architecture, and enterprise application integration supporting cloud services and Zero Trust Network Access.

---

## 📁 Directory Contents

### **Implementation Documentation**

| **Document** | **Purpose** | **Audience** | **Content Focus** |
|--------------|-------------|--------------|------------------|
| **[Azure AD Connect Implementation Guide](azure-ad-connect-implementation-guide.md)** | Complete hybrid identity deployment and cloud integration procedures | Engineering, Operations | Technical implementation, RBAC roles, enterprise applications, ZTNA integration |

### **Configuration Reference**

| **Component** | **Description** | **Documentation Status** | **Integration Points** |
|---------------|-----------------|-------------------------|------------------------|
| **Azure AD Connect Sync** | Hybrid identity synchronization from on-premises AD | ✅ Documented | User accounts, security groups, organizational attributes |
| **Custom Azure RBAC Roles** | 6 tiered infrastructure management roles | ✅ Documented | Subscription access, resource management |
| **SGC_* Security Groups** | Cloud-hybrid groups with dual authorization | ✅ Documented | Azure RBAC and Entra ID role assignments |
| **Cloudflare ZTNA Integration** | SCIM sync and access policy framework | ✅ Documented | Zero Trust Network Access, enterprise applications |
| **Enterprise Applications** | SAML SSO and OIDC integration | ✅ Documented | Single sign-on, group claims, application access |

---

## 🏗️ Infrastructure Architecture Overview

```markdown
Cloud Identity Infrastructure Layout

On-Premises Active Directory          Microsoft Azure AD
┌─────────────────────────────┐      ┌─────────────────────────────┐
│  radioastronomy.io Domain   │      │   radioastronomy.io Tenant  │
│  • Users with attributes    │◄────►│   • Synchronized identities │
│  • SGAD_* security groups   │ Sync │   • SGC_* cloud groups     │
│  • Organizational structure │      │   • Custom RBAC roles      │
└─────────────────────────────┘      └─────────────────────────────┘
           │                                    │
           ▼                                    ▼
┌─────────────────────────────┐      ┌─────────────────────────────┐
│    Azure AD Connect         │      │   Dual Authorization        │
│  • Password Hash Sync       │      │   • Azure RBAC (Infrastructure)│
│  • Seamless SSO             │      │   • Entra ID Roles (Identity) │
│  • 30-minute sync cycle     │      │   • Tiered access control   │
└─────────────────────────────┘      └─────────────────────────────┘
                                                │
                                                ▼
                                     ┌─────────────────────────────┐
                                     │  Enterprise Applications    │
                                     │  • Cloudflare ZTNA (SCIM)  │
                                     │  • SAML SSO integration     │
                                     │  • Group claims mapping     │
                                     └─────────────────────────────┘
```

---

## 🔗 Related Infrastructure Categories

### **Direct Dependencies**

| **Category** | **Relationship** | **Integration Points** | **Documentation** |
|--------------|------------------|------------------------|-------------------|
| **[Active Directory](../active-directory/README.md)** | **Identity Source Foundation** | User synchronization, group membership, organizational attributes | On-premises identity platform |
| **[Network Infrastructure](../network/README.md)** | **Connectivity Platform** | Internet connectivity, hybrid network access | Network services |
| **[Security Framework](../../security/README.md)** | **Security Controls** | CIS Controls implementation, access governance | Enterprise security |
| **[Monitoring Systems](../monitoring/README.md)** | **Identity Monitoring** | Azure AD audit logs, sync status monitoring | Observability integration |

### **Cloud Service Integration**

| **Category** | **Integration Type** | **Connection Points** | **Documentation** |
|--------------|---------------------|----------------------|-------------------|
| **[Azure Infrastructure](../azure/README.md)** | **Resource Management** | Azure RBAC roles, subscription access control | Cloud resource management |
| **[Zero Trust Network Access](../ztna/README.md)** | **Access Control** | Cloudflare integration, SCIM synchronization | Network access policies |
| **[Enterprise Applications](../applications/README.md)** | **SSO Integration** | SAML/OIDC authentication, group claims | Application access |

---

## 🚀 Getting Started

### **For Identity Administrators**

1. **Start Here:** [Azure AD Connect Implementation Guide](azure-ad-connect-implementation-guide.md)
2. **Active Directory Integration:** [AD Organizational Structure](../active-directory/organizational-structure/README.md)
3. **Security Framework:** [Enterprise Security Controls](../../security/README.md)
4. **Monitoring Setup:** [Cloud Identity Monitoring](../monitoring/README.md)

### **For Cloud Administrators**

1. **Azure RBAC Roles:** Understanding custom infrastructure management roles
2. **Security Groups:** SGC_* framework for dual authorization architecture
3. **Enterprise Applications:** SAML SSO and OIDC integration procedures
4. **Access Management:** Hybrid identity and cloud service integration

### **Common Tasks**

- **User Synchronization:** Monitoring Azure AD Connect sync status and troubleshooting
- **Role Management:** Assigning Azure RBAC roles and Entra ID roles through security groups
- **Application Integration:** Configuring enterprise applications with SSO and group claims
- **Access Policy Management:** Managing Zero Trust Network Access through Cloudflare integration

---

## 📊 Hybrid Identity Overview

### **Azure AD Connect Configuration**

| **Sync Component** | **Configuration** | **Sync Frequency** | **Security Implementation** |
|-------------------|-------------------|-------------------|---------------------------|
| **User Accounts** | Password Hash Sync + Seamless SSO | Every 30 minutes | Organizational attributes, MFA capable |
| **Security Groups** | Full group membership synchronization | Every 30 minutes | SGAD_* groups for hybrid access control |
| **Organizational Structure** | OU-based filtering and attribute sync | Every 30 minutes | Title, Department, Manager attributes |
| **Service Accounts** | Excluded from synchronization | N/A | Security isolation for sensitive accounts |

### **Dual Authorization Architecture**

| **Authorization System** | **Purpose** | **Scope** | **Management Interface** |
|-------------------------|-------------|-----------|-------------------------|
| **Azure RBAC** | Infrastructure and resource management | Subscription, Resource Group, Resource | Azure Portal, ARM APIs |
| **Microsoft Entra ID Roles** | Identity and M365 service administration | Tenant, Administrative Unit, Application | Azure AD Portal, Graph API |
| **Hybrid Security Groups** | Combined authorization through SGC_* groups | Cross-platform access control | Unified group membership |

---

## 🔐 Custom Azure RBAC Roles

### **Tiered Infrastructure Management Roles**

| **Role Name** | **Tier Level** | **Primary Purpose** | **Key Permissions** |
|---------------|----------------|-------------------|-------------------|
| **Platform Triage Operator** | L1 HelpDesk | Read-only monitoring and basic triage | VM read, metrics, support tickets, resource health |
| **Platform Operations Specialist** | L2 Operations | VM lifecycle and operational management | Full VM management, backup operations, network read |
| **Platform Engineer** | L3 Engineering | Comprehensive platform architecture | Full resource management, hybrid compute, Kubernetes |
| **Security Monitoring Analyst** | L1 Security | Security monitoring and compliance reporting | Security read access, log analytics, policy insights |
| **Incident Response Specialist** | L2 Security | Security incident response and investigation | Security management, Sentinel operations, logic apps |
| **Security Architect** | L3 Security | Security architecture and policy development | Full security management, operational insights, key vault |

### **CIS Controls Alignment**

| **RBAC Role** | **CIS Control Mapping** | **Implementation Evidence** | **Compliance Benefit** |
|---------------|------------------------|---------------------------|------------------------|
| **All Roles** | CIS 5.1 (Account Management) | Structured role-based access with least privilege | Clear access boundaries and audit trails |
| **All Roles** | CIS 6.1 (Access Control Management) | Granular permission sets with operational boundaries | Systematic access governance |
| **Security Roles** | CIS 8.1 (Audit Log Management) | Security monitoring and incident response capabilities | Comprehensive security oversight |
| **All Roles** | CIS 16.1 (Account Monitoring) | Azure AD audit integration and activity tracking | Complete administrative action visibility |

---

## 🌐 Enterprise Application Integration

### **Single Sign-On Implementation**

| **Application** | **Authentication Method** | **Group Claims** | **Integration Status** |
|----------------|---------------------------|------------------|----------------------|
| **Cloudflare Zero Trust** | SAML 2.0 with SCIM sync | SGAD_ZTNA_* groups | Active and operational |
| **Proxmox VE** | OIDC with group claims | SGAD_Proxmox_* groups | Planned implementation |
| **RKE2 Kubernetes** | OIDC with RBAC mapping | SGAD_K8s_* groups | Planned implementation |
| **Monitoring Stack** | OIDC integration | SGAD_Pool_* groups | Planned implementation |

### **Zero Trust Network Access Architecture**

| **Access Policy** | **Security Group** | **Resource Scope** | **Access Control** |
|-------------------|-------------------|-------------------|-------------------|
| **Basic Access** | SGAD_ZTNA_Basic | Development environments, project VMs | Standard user access |
| **Infrastructure Access** | SGAD_ZTNA_Infrastructure | Management systems, operational tools | System administrator access |
| **Administrative Access** | SGAD_ZTNA_Administrative | Full administrative systems | Privileged administrative access |
| **Database Access** | SGAD_ZTNA_Database | Database systems and interfaces | Data access with audit |
| **AI/ML Access** | SGAD_ZTNA_AI_ML | GPU resources, ML development platforms | Research computing access |

---

## 👥 User and Group Management

### **Staff Account Cloud Integration**

| **User Account** | **On-Premises Role** | **Cloud Group Assignment** | **Access Scope** |
|------------------|---------------------|---------------------------|------------------|
| **crainbramp** | Tier 3 Engineering Lead | SGC_Engineering_L3, SGC_Security_L3 | Full platform and security architecture |
| **alex** | Tier 2 SysOps + Database | SGC_Operations_L2 | System administration and database operations |
| **glitch** | Tier 1 HelpDesk + Training | SGC_HelpDesk_L1 | Support and monitoring with training progression |
| **greg** | Tier 3 Engineering + Billing | SGC_Engineering_L3 + Billing Admin | Infrastructure engineering and cost management |

### **Security Group Framework (SGC_* + SGAD_*)**

| **Group Category** | **Group Count** | **Authorization Scope** | **Synchronization** |
|-------------------|-----------------|------------------------|-------------------|
| **SGC_* Cloud-Hybrid Groups** | 6 groups | Azure RBAC + Entra ID roles | Native cloud groups |
| **SGAD_* Synchronized Groups** | 41 groups | On-premises + cloud applications | Azure AD Connect sync |
| **Service Account Groups** | 3 groups | On-premises infrastructure only | Excluded from sync |
| **ZTNA Access Groups** | 5 groups | Zero Trust Network Access policies | Synchronized for Cloudflare |

---

## 📈 Implementation Status and Roadmap

### **Current Deployment State**

| **Component** | **Status** | **Implementation Details** | **Next Steps** |
|---------------|------------|---------------------------|----------------|
| **Azure AD Connect** | ✅ Operational | 30-minute sync, password hash sync, seamless SSO | Monitoring enhancement |
| **Custom RBAC Roles** | ✅ Deployed | 6 roles with tiered access control | User assignments |
| **SGC_* Security Groups** | ✅ Created | Groups ready for role assignments | Staff account assignments |
| **Cloudflare ZTNA** | ✅ Operational | SCIM sync active, access policies functional | Policy refinement |

### **Planned Enhancements**

| **Enhancement** | **Priority** | **Implementation Scope** | **Business Impact** |
|----------------|-------------|-------------------------|-------------------|
| **Privileged Identity Management** | High | Entra ID role activation and approval workflows | Enhanced security governance |
| **Staff Group Assignments** | High | User assignments to SGC_* groups | Operational cloud access |
| **Additional SSO Integrations** | Medium | Proxmox, Kubernetes, monitoring stack | Unified authentication experience |
| **Automated Group Management** | Medium | Dynamic group assignment based on attributes | Reduced administrative overhead |

---

## **Document Information**

| **Field** | **Value** |
|-----------|-----------|
| **Author** | VintageDon - <https://github.com/vintagedon> |
| **Created** | 2025-07-28 |
| **Last Updated** | 2025-07-28 |
| **Version** | 1.0 |

---
Tags: cloud-identity, azure-ad-connect, hybrid-identity, azure-rbac, enterprise-applications, ztna-integration
