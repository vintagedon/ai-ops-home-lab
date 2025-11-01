# 🏢 Active Directory Infrastructure Documentation

## Proxmox Astronomy Lab Enterprise Identity Management

This directory contains comprehensive documentation for the Active Directory infrastructure supporting the Proxmox Astronomy Lab platform. The Active Directory system provides centralized identity management, authentication services, and security group administration across both VLAN 10 (Control Plane) and VLAN 20 (Projects) networks through dual Windows Server 2025 domain controllers with integrated DNS and DHCP services.

---

## 📁 Directory Contents

### **Implementation Documentation**

| **Document** | **Purpose** | **Audience** | **Content Focus** |
|--------------|-------------|--------------|------------------|
| **[GPO Naming Conventions Guide](gpo-naming-conventions-guide.md)** | CIS Controls v8 aligned Group Policy naming framework | Engineering, Operations | GPO naming standards, compliance alignment, version control |

### **Subdirectory Structure**

| **Directory** | **Description** | **Documentation Status** | **Implementation Focus** |
|---------------|-----------------|-------------------------|------------------------|
| **hybrid-identity-architecture/** | Future hybrid identity design documentation | 📋 Planned | Azure AD Connect, hybrid authentication |
| **operational-procedures/** | AD operational and maintenance procedures | 📋 Planned | User lifecycle, access management |
| **security-groups-rbac/** | Security group design and RBAC implementation | 📋 Planned | Role-based access control, group management |

---

## 🏗️ Current Infrastructure Architecture

```markdown
Active Directory Infrastructure

VLAN 10 (Control Plane)          VLAN 20 (Projects)
┌─────────────────────────┐      ┌─────────────────────────┐
│  radio-dc01.radioastronomy.io  │      │  radio-dc02.radioastronomy.io  │
│  IP: 10.25.10.2         │      │  IP: 10.25.20.2         │
│  Role: PDC Emulator     │◄────►│  Role: Secondary DC     │
│  VM ID: 1003 (node01)   │      │  VM ID: 2003 (node03)   │
│  Services: AD DS, DNS,  │      │  Services: AD DS, DNS,  │
│           DHCP          │      │           DHCP          │
└─────────────────────────┘      └─────────────────────────┘
           │                                    │
           └──────────┬─────────────────────────┘
                      │
              ┌───────▼────────┐
              │ Domain Services │
              │   radioastronomy.io   │
              │ Forest Functional    │
              │ Level: Windows       │
              │ Server 2025          │
              └──────────────────────┘
```

---

## 🔗 Related Infrastructure Categories

### **Direct Integration**

| **Category** | **Relationship** | **Integration Points** | **Documentation** |
|--------------|------------------|------------------------|-------------------|
| **[DNS Infrastructure](../dns/README.md)** | **Core Service Integration** | AD-integrated zones, service location records | DNS zone management |
| **[DHCP Infrastructure](../dhcp/README.md)** | **Network Service Integration** | Dynamic DNS updates, computer account authentication | IP address management |
| **[Network Infrastructure](../network/README.md)** | **Foundation Dependency** | Domain controller network services, cross-VLAN authentication | Network topology |
| **[Windows Infrastructure](../windows/README.md)** | **Platform Foundation** | Windows Server 2025 domain controller platform | Server configuration |

### **Operational Integration**

| **Category** | **Integration Type** | **Connection Points** | **Documentation** |
|--------------|---------------------|----------------------|-------------------|
| **[Monitoring](../monitoring/README.md)** | **Service Monitoring** | Domain controller health, authentication metrics | Integration with proj-mon01 |
| **[Security](../security/README.md)** | **Security Controls** | CIS Controls implementation, Group Policy security | Enterprise security framework |
| **[Backup Systems](../backup/README.md)** | **Data Protection** | System state backup, AD database protection | Recovery procedures |

---

## 🚀 Getting Started

### **For System Administrators**

1. **Start Here:** [GPO Naming Conventions Guide](gpo-naming-conventions-guide.md)
2. **DNS Integration:** [DNS Infrastructure Overview](../dns/README.md)
3. **DHCP Integration:** [DHCP Infrastructure Overview](../dhcp/README.md)
4. **Security Framework:** [Windows Security Baseline](../security/README.md)

### **For Group Policy Management**

1. **Naming Standards:** Complete CIS Controls v8 aligned naming framework
2. **Implementation Guide:** GPO creation and management procedures
3. **Version Control:** Policy change management and version tracking
4. **Compliance Framework:** CIS Controls mapping and audit procedures

### **Common Tasks**

- **Group Policy Creation:** Follow CIS Controls v8 naming conventions
- **User Account Management:** Standard domain user lifecycle procedures
- **Security Group Management:** Role-based access control implementation
- **Domain Controller Management:** Dual-DC operational procedures

---

## 📊 Service Coverage

### **Domain Controller Services**

| **Domain Controller** | **Primary Services** | **Network Segment** | **Additional Roles** |
|----------------------|---------------------|-------------------|-------------------|
| **radio-dc01** | PDC Emulator, DNS Primary, DHCP | VLAN 10 (Control Plane) | Global Catalog, Schema Master |
| **radio-dc02** | Secondary DC, DNS Secondary, DHCP | VLAN 20 (Projects) | Global Catalog, Backup |

### **Forest and Domain Configuration**

| **Configuration** | **Implementation** | **Functional Level** | **Management** |
|-------------------|-------------------|-------------------|----------------|
| **Forest:** radioastronomy.io | Single forest, single domain | Windows Server 2025 | Centralized management |
| **Domain Controllers:** 2 | Cross-VLAN redundancy | Windows Server 2025 | Load distribution |
| **Sites and Services:** Single site | Default site configuration | Automatic replication | Standard topology |
| **Group Policy:** CIS Controls aligned | Naming convention framework | Version controlled | Compliance focused |

---

## 📈 Implementation Status

### **Current Deployment State**

| **Component** | **Status** | **Implementation Details** | **Next Steps** |
|---------------|------------|---------------------------|----------------|
| **Domain Controllers** | ✅ Operational | Dual Windows Server 2025 DCs with DNS/DHCP | Performance optimization |
| **GPO Naming Framework** | ✅ Documented | CIS Controls v8 aligned naming convention | Policy implementation |
| **DNS Integration** | ✅ Operational | AD-integrated zones with DNSSEC | Monitoring enhancement |
| **DHCP Integration** | ✅ Operational | Dynamic DNS updates configured | Scope optimization |

### **Planned Enhancements**

| **Enhancement** | **Priority** | **Implementation Scope** | **Documentation** |
|----------------|-------------|-------------------------|-------------------|
| **Hybrid Identity Architecture** | Medium | Azure AD Connect integration | Architecture documentation |
| **Security Group Framework** | High | RBAC implementation and documentation | Security group procedures |
| **Operational Procedures** | High | User lifecycle and access management | Process documentation |
| **Advanced Group Policy** | Medium | CIS Controls security baseline | Policy implementation guides |

---

## 💡 Architecture Evolution

### **Current Foundation**

The Active Directory infrastructure provides essential domain services with integrated DNS and DHCP across dual domain controllers supporting enterprise authentication and network services for the research computing platform.

### **Strategic Direction**

Future development will focus on hybrid identity integration, comprehensive security group management, and advanced Group Policy implementation aligned with CIS Controls v8 framework ensuring scalable identity management for research computing expansion.

### **Integration Roadmap**

Planned integration includes Azure AD Connect for hybrid identity, enhanced security group frameworks for research project access control, and comprehensive operational procedures for enterprise identity management supporting collaborative research workflows.

---

## **Document Information**

| **Field** | **Value** |
|-----------|-----------|
| **Author** | VintageDon - <https://github.com/vintagedon> |
| **Created** | 2025-07-28 |
| **Last Updated** | 2025-07-28 |
| **Version** | 2.0 |

---
Tags: active-directory, domain-controllers, group-policy, dns-integration, dhcp-integration, enterprise-identity
