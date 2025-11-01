# 🌐 DHCP Infrastructure Documentation

## Proxmox Astronomy Lab Enterprise Dynamic Host Configuration Protocol

This directory contains comprehensive documentation for the enterprise DHCP infrastructure supporting the Proxmox Astronomy Lab platform. The DHCP system provides automated IP address allocation across both VLAN 10 (Control Plane) and VLAN 20 (Projects) networks through dual Windows Server 2025 domain controllers with Active Directory integration and DNS dynamic updates.

---

## 📁 Directory Contents

### **Implementation Documentation**

| **Document** | **Purpose** | **Audience** | **Content Focus** |
|--------------|-------------|--------------|------------------|
| **[DHCP Infrastructure Implementation Guide](dhcp-infrastructure-implementation-guide.md)** | Complete DHCP server deployment and scope configuration procedures | Engineering, Operations | Technical implementation, scope management, DNS integration |

### **Configuration Reference**

| **Component** | **Description** | **Documentation Status** | **Integration Points** |
|---------------|-----------------|-------------------------|------------------------|
| **Primary DHCP Server (radio-dc01)** | VLAN 10 scope management and DHCP services | ✅ Documented | Active Directory, DNS, Control Plane |
| **Secondary DHCP Server (radio-dc02)** | VLAN 20 scope management and DHCP services | ✅ Documented | Active Directory, DNS, Projects Network |
| **DNS Integration** | Dynamic DNS updates and hostname registration | ✅ Documented | DNS zones, A/PTR records |
| **Active Directory Authorization** | DHCP server authorization and security | ✅ Documented | Domain membership, security groups |
| **Scope Configuration** | IP address pools and lease management | ✅ Documented | Network topology, VLAN separation |

---

## 🏗️ Infrastructure Architecture Overview

```markdown
DHCP Infrastructure Layout

VLAN 10 (Control Plane)          VLAN 20 (Projects)
┌─────────────────────────┐      ┌─────────────────────────┐
│  radio-dc01.radioastronomy.io  │      │  radio-dc02.radioastronomy.io  │
│  IP: 10.25.10.2         │      │  IP: 10.25.20.2         │
│  Role: DHCP Server      │      │  Role: DHCP Server      │
│  VM ID: 1003 (node01)   │      │  VM ID: 2003 (node03)   │
└─────────────────────────┘      └─────────────────────────┘
           │                                    │
           ▼                                    ▼
┌─────────────────────────┐      ┌─────────────────────────┐
│ VLAN 10 DHCP Scope      │      │ VLAN 20 DHCP Scope      │
│ Pool: 10.25.10.100-150  │      │ Pool: 10.25.20.100-150  │
│ Gateway: 10.25.10.1     │      │ Gateway: 10.25.20.1     │
│ DNS: 10.25.10.2,        │      │ DNS: 10.25.10.2,        │
│      10.25.20.2         │      │      10.25.20.2         │
│ Lease: 24 hours         │      │ Lease: 24 hours         │
└─────────────────────────┘      └─────────────────────────┘
           │                                    │
           └──────────┬─────────────────────────┘
                      │
              ┌───────▼────────┐
              │ DNS Integration │
              │ Dynamic Updates │
              │ A/PTR Records   │
              └─────────────────┘
```

---

## 🔗 Related Infrastructure Categories

### **Direct Dependencies**

| **Category** | **Relationship** | **Integration Points** | **Documentation** |
|--------------|------------------|------------------------|-------------------|
| **[DNS Infrastructure](../dns/README.md)** | **Core Integration** | Dynamic DNS updates, hostname registration, PTR records | DNS zone management |
| **[Active Directory](../active-directory/README.md)** | **Authorization Platform** | DHCP server authorization, security groups, domain integration | Domain services |
| **[Network Infrastructure](../network/README.md)** | **Foundation Dependency** | VLAN configuration, routing, gateway services | Network topology |
| **[Windows Infrastructure](../windows/README.md)** | **Platform Dependency** | Windows Server 2025 platform, domain controller roles | Server configuration |

### **Operational Integration**

| **Category** | **Integration Type** | **Connection Points** | **Documentation** |
|--------------|---------------------|----------------------|-------------------|
| **[Monitoring](../monitoring/README.md)** | **Observability** | DHCP scope utilization, lease tracking, service health | Integration with proj-mon01 |
| **[Security](../security/README.md)** | **Security Controls** | Authorization management, audit logging, access control | CIS Controls compliance |
| **[Backup Systems](../backup/README.md)** | **Data Protection** | DHCP database backup, configuration protection | Recovery procedures |

---

## 🚀 Getting Started

### **For System Administrators**

1. **Start Here:** [DHCP Infrastructure Implementation Guide](dhcp-infrastructure-implementation-guide.md)
2. **Background Reading:** [DNS Infrastructure Overview](../dns/README.md)
3. **Network Context:** [VLAN Configuration Guide](../network/README.md)
4. **Security Framework:** [Active Directory Integration](../active-directory/README.md)

### **For Network Operations**

1. **Implementation Reference:** Complete DHCP server configuration and scope management
2. **Integration Guide:** DNS dynamic updates and hostname registration procedures
3. **Security Configuration:** Active Directory authorization and security group management
4. **Monitoring Setup:** Integration with centralized monitoring and alerting infrastructure

### **Common Tasks**

- **DHCP Server Configuration:** Follow implementation guide for server role setup and authorization
- **Scope Management:** Use scope configuration procedures for IP address pool management
- **DNS Integration:** Configure dynamic DNS updates for automatic hostname registration
- **Security Setup:** Implement Active Directory authorization and security groups

---

## 📊 Service Coverage

### **Network Scope Management**

| **Network Segment** | **DHCP Server** | **IP Pool Range** | **Gateway** | **DNS Servers** |
|---------------------|-----------------|-------------------|-------------|-----------------|
| **VLAN 10 (Control)** | radio-dc01 (10.25.10.2) | 10.25.10.100-150 | 10.25.10.1 | 10.25.10.2, 10.25.20.2 |
| **VLAN 20 (Projects)** | radio-dc02 (10.25.20.2) | 10.25.20.100-150 | 10.25.20.1 | 10.25.10.2, 10.25.20.2 |

### **Lease Management**

| **Configuration** | **VLAN 10** | **VLAN 20** | **Management** | **Integration** |
|-------------------|-------------|-------------|----------------|-----------------|
| **Lease Duration** | 24 hours | 24 hours | Client renewal at 50% | Dynamic adjustment capability |
| **Address Pool** | 51 addresses | 51 addresses | Expandable ranges | Growth accommodation |
| **Static Range** | .1-.99 reserved | .1-.99 reserved | Infrastructure protection | Static IP management |
| **DNS Updates** | Automatic | Automatic | A/PTR record management | DNS zone integration |

---

## 📈 Scope Utilization Overview

### **Current Address Allocation**

| **VLAN** | **Total Pool** | **Available** | **Reserved** | **Infrastructure** | **Utilization** |
|----------|----------------|---------------|--------------|-------------------|-----------------|
| **VLAN 10** | 51 addresses | 51 addresses | 0 leases | 99 static addresses | 0% (Initial deployment) |
| **VLAN 20** | 51 addresses | 51 addresses | 0 leases | 99 static addresses | 0% (Initial deployment) |

### **Growth Capacity**

| **Expansion Option** | **Additional Capacity** | **Implementation** | **Impact** |
|---------------------|------------------------|-------------------|------------|
| **Extend Pool Range** | Up to 50 additional addresses per VLAN | Scope modification | Minimal service disruption |
| **Reduce Static Range** | Convert static to DHCP reservations | Infrastructure migration | Centralized management benefit |
| **Optimize Lease Duration** | Improved address turnover | Configuration adjustment | Enhanced efficiency |

---

## **Document Information**

| **Field** | **Value** |
|-----------|-----------|
| **Author** | VintageDon - <https://github.com/vintagedon> |
| **Created** | 2025-07-28 |
| **Last Updated** | 2025-07-28 |
| **Version** | 1.0 |

---
Tags: dhcp, infrastructure, active-directory, network, windows-server, ip-management, enterprise
