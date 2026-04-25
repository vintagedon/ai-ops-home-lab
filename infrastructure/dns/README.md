# 🌐 DNS Infrastructure Documentation

## Proxmox Astronomy Lab Enterprise Domain Name System

This directory contains comprehensive documentation for the enterprise DNS infrastructure supporting the Proxmox Astronomy Lab platform. The DNS system provides name resolution services across both VLAN 10 (Control Plane) and VLAN 20 (Projects) networks through dual Windows Server 2025 domain controllers with Active Directory-integrated zones and DNSSEC security.

---

## 📁 Directory Contents

### **Implementation Documentation**

| **Document** | **Purpose** | **Audience** | **Content Focus** |
|--------------|-------------|--------------|------------------|
| **[DNS Infrastructure Implementation Guide](dns-infrastructure-implementation-guide.md)** | Complete DNS server deployment and configuration procedures | Engineering, Operations | Technical implementation, configuration procedures, integration setup |

### **Configuration Reference**

| **Component** | **Description** | **Documentation Status** | **Integration Points** |
|---------------|-----------------|-------------------------|------------------------|
| **Primary DNS Server (radio-dc01)** | Windows Server 2025 DNS role on PDC emulator | ✅ Documented | Active Directory, DHCP, VLAN 10 |
| **Secondary DNS Server (radio-dc02)** | Windows Server 2025 DNS role on secondary DC | ✅ Documented | Active Directory, DHCP, VLAN 20 |
| **DNSSEC Implementation** | Security extensions with trust anchors | ✅ Documented | Zone security, external validation |
| **External Forwarders** | Quad9 secure DNS resolution | ✅ Documented | Internet resolution, security filtering |
| **DHCP Integration** | Dynamic DNS updates across VLANs | ✅ Documented | VM registration, name resolution |

---

## 🏗️ Infrastructure Architecture Overview

```markdown
DNS Infrastructure Layout

VLAN 10 (Control Plane)          VLAN 20 (Projects)
┌─────────────────────────┐      ┌─────────────────────────┐
│  radio-dc01.radioastronomy.io  │      │  radio-dc02.radioastronomy.io  │
│  IP: 10.25.10.2         │      │  IP: 10.25.20.2         │
│  Role: Primary DNS      │◄────►│  Role: Secondary DNS    │
│  VM ID: 1003 (node01)   │      │  VM ID: 2003 (node03)   │
│  DNSSEC: Enabled        │      │  DNSSEC: Enabled        │
└─────────────────────────┘      └─────────────────────────┘
           │                                    │
           └──────────┬─────────────────────────┘
                      │
              ┌───────▼────────┐
              │ AD-Integrated  │
              │ Zone Storage   │
              │ DNSSEC Enabled │
              └────────────────┘
                      │
              External Resolution
                      │
              ┌───────▼────────┐
              │ Quad9 Forwarders│
              │ 9.9.9.9         │
              │ 149.112.112.112 │
              └─────────────────┘
```

---

## 🔗 Related Infrastructure Categories

### **Direct Dependencies**

| **Category** | **Relationship** | **Integration Points** | **Documentation** |
|--------------|------------------|------------------------|-------------------|
| **[Active Directory](../active-directory/README.md)** | **Core Integration** | AD-integrated zones, domain services, authentication | Domain controller DNS roles |
| **[Network Infrastructure](../network/README.md)** | **Foundation** | VLAN configuration, cross-VLAN resolution, network topology | DNS listener configuration |
| **[DHCP Services](../dhcp/README.md)** | **Dynamic Integration** | Automatic DNS registration, IP address management | Dynamic update policies |
| **[Windows Infrastructure](../windows/README.md)** | **Platform Dependency** | Windows Server 2025 platform, domain controller roles | Server configuration |

### **Operational Integration**

| **Category** | **Integration Type** | **Connection Points** | **Documentation** |
|--------------|---------------------|----------------------|-------------------|
| **[Monitoring](../monitoring/README.md)** | **Observability** | DNS performance metrics, service health monitoring | Integration with proj-mon01 |
| **[Security](../security/README.md)** | **Security Controls** | DNSSEC implementation, secure dynamic updates | CIS Controls compliance |
| **[Backup Systems](../backup/README.md)** | **Data Protection** | Zone data backup via AD replication | Recovery procedures |

---

## 🚀 Getting Started

### **For System Administrators**

1. **Start Here:** [DNS Infrastructure Implementation Guide](dns-infrastructure-implementation-guide.md)
2. **Background Reading:** [Active Directory Integration Overview](../active-directory/README.md)
3. **Network Context:** [VLAN Configuration Guide](../network/README.md)
4. **Security Framework:** [Windows Security Baseline](../security/README.md)

### **For DNS Operations**

1. **Implementation Reference:** Complete configuration procedures and zone setup
2. **Integration Guide:** DHCP dynamic updates and cross-VLAN resolution
3. **Security Configuration:** DNSSEC implementation and trust anchor management
4. **Monitoring Setup:** Integration with centralized monitoring infrastructure

### **Common Tasks**

- **DNS Server Configuration:** Follow implementation guide for server role setup
- **Zone Management:** Use AD-integrated zone procedures for new domain zones
- **DNSSEC Management:** Reference security configuration for key management
- **Dynamic Updates:** Configure DHCP integration for automatic VM registration

---

## 📊 Service Coverage

### **Network Resolution Scope**

| **Network Segment** | **Primary DNS** | **Secondary DNS** | **Resolution Coverage** | **Dynamic Updates** |
|---------------------|-----------------|-------------------|------------------------|-------------------|
| **VLAN 10 (Control)** | 10.25.10.2 | 10.25.20.2 | Complete infrastructure | DHCP integrated |
| **VLAN 20 (Projects)** | 10.25.10.2 | 10.25.20.2 | Complete infrastructure | DHCP integrated |
| **External Resolution** | Quad9 Forwarders | Root Hints Fallback | Internet domains | N/A |

### **Zone Management**

| **Zone Type** | **Implementation** | **Security** | **Replication** | **Management** |
|---------------|-------------------|--------------|-----------------|----------------|
| **Forward Zones** | AD-integrated | DNSSEC enabled | Multi-master | Dynamic updates |
| **Reverse Zones** | Standard primary | DNSSEC enabled | Zone transfers | Static management |
| **External Resolution** | Forwarders | DNSSEC validation | N/A | Configuration-based |

---

## **Document Information**

| **Field** | **Value** |
|-----------|-----------|
| **Author** | VintageDon - <https://github.com/vintagedon> |
| **Created** | 2025-07-28 |
| **Last Updated** | 2025-07-28 |
| **Version** | 1.0 |

---
Tags: dns, infrastructure, active-directory, network, windows-server, dnssec, enterprise
