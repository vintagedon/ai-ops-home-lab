# 🌐 **labswitch02 - Enterprise Distribution Switch**

**Asset Classification:** Primary Distribution Infrastructure | **Service Tier:** Production | **Location:** Rack Position - Distribution Layer

This knowledge base article provides comprehensive hardware specifications, configuration details, and operational status for labswitch02, a Mokerlink 2G16210GSM 16-port 2.5G RJ45 + 2x 10G SFP+ enterprise distribution switch serving as the primary management and distribution layer for the 7-node Proxmox astronomy research cluster with comprehensive node connectivity and internet uplink services.

---

## **🎯 1. Purpose & Role**

### **1.1 Primary Function**

labswitch02 serves as the primary distribution switch providing comprehensive management network connectivity for all cluster nodes through 2.5G RJ45 ports, inter-switch uplinks via 10G SFP+, and critical infrastructure services including internet gateway connectivity and Proxmox Backup Server integration for the enterprise astronomy research platform.

### **1.2 Service Classification**

**Production Tier:** Mission-critical distribution infrastructure providing enterprise-grade management connectivity, VLAN segmentation, and uplink services supporting comprehensive cluster management, backup operations, and internet gateway services for the hybrid Kubernetes and VM architecture.

### **1.3 Cluster Integration**

Primary distribution layer enabling complete cluster management connectivity through dedicated 2.5G management interfaces for all 7 nodes, providing the management plane foundation for Proxmox administration, backup services, and external connectivity while maintaining separation from high-performance data plane traffic.

---

## **⚙️ 2. Hardware Specifications**

### **2.1 Network Platform**

| **Component** | **Specification** | **Performance Characteristics** |
|---------------|------------------|--------------------------------|
| **Model** | Mokerlink 2G16210GSM | Enterprise distribution switch |
| **Port Configuration** | 16x 2.5G RJ45 + 2x 10G SFP+ | Hybrid management and uplink design |
| **Management Ports** | 16x 2.5GBase-T | Comprehensive node management |
| **Uplink Ports** | 2x 10G SFP+ | High-speed inter-switch connectivity |
| **Form Factor** | Enterprise rack-mount | Professional datacenter design |

### **2.2 Port Specifications**

| **Port Type** | **Count** | **Capabilities** | **Standards** |
|--------------|-----------|------------------|---------------|
| **MGE Ports** | 16 ports | 2.5G/1G/100M auto-negotiation | IEEE 802.3bz |
| **TE Ports** | 2 ports | 10G SFP+ fiber connectivity | IEEE 802.3ae |
| **Total Capacity** | 18 ports | Full management and uplink coverage | Enterprise standards |

### **2.3 System Information**

| **Component** | **Specification** | **Details** |
|--------------|------------------|-------------|
| **Serial Number** | 183112407080032 | Unique device identifier |
| **MAC Address** | 1C:2A:A3:1E:A6:9D | Primary management MAC |
| **Management IP** | 10.16.207.200 | Static management address |
| **System OID** | 1.3.6.1.4.1.27282.1.3 | SNMP device identification |

### **2.4 Firmware & Software**

| **Component** | **Version** | **Release Date** |
|--------------|-------------|------------------|
| **Loader Version** | 1.0.0.2 | Dec 16 2023 - 02:23:01 |
| **Firmware Version** | 1.1.1.20 | Dec 16 2023 - 02:24:42 |
| **HTTP Management** | Enabled | Web interface active |
| **SNMP Service** | Enabled | Network monitoring active |

---

## **🌐 3. Network Configuration**

### **3.1 Management Access**

| **Access Method** | **Configuration** | **Purpose** |
|------------------|------------------|-------------|
| **Web Interface** | <http://labswitch02> | Primary management access |
| **IPv4 Address** | 10.16.207.200 | Management network access |
| **System Contact** | <alerts@radioastronomy.io> | Operational contact |
| **System Location** | homelab | Physical location identifier |

### **3.2 Port Mapping - Management Connections (MGE)**

| **Port** | **Connected Device** | **Interface** | **Purpose** |
|----------|---------------------|---------------|-------------|
| **MGE1** | node01 | eth0 | Management interface |
| **MGE2** | node01 | eth1 | Secondary management |
| **MGE3** | node02 | eth0 | Management interface |
| **MGE4** | node02 | eth1 | Secondary management |
| **MGE5** | node03 | eth0 | Management interface |
| **MGE6** | node03 | eth1 | Secondary management |
| **MGE7** | node04 | eth0 | Management interface |
| **MGE8** | node04 | eth1 | Secondary management |
| **MGE9** | node05 | eth0 | Management interface |
| **MGE10** | node05 | eth1 | Secondary management |
| **MGE11** | node06 | eth0 | Management interface |
| **MGE12** | node06 | eth1 | Secondary management |
| **MGE13** | node07 | eth0 | Management interface |
| **MGE14** | node07 | eth1 | Secondary management |
| **MGE15** | pbs01.radioastronomy.io | eth0 | Proxmox Backup Server |
| **MGE16** | Fortigate 40F Port 3 | uplink | Internet gateway (SNAT only) |

### **3.3 Port Mapping - Uplink Connections (TE)**

| **Port** | **Connected Device** | **Interface** | **Purpose** |
|----------|---------------------|---------------|-------------|
| **TE1 (Port 17)** | labswitch03 | Port 12 | Inter-switch uplink |
| **TE2 (Port 18)** | labswitch01 | Port 12 | Core switch uplink |

### **3.4 VLAN Configuration**

| **VLAN ID** | **Name** | **Purpose** | **Network Scope** |
|-------------|----------|-------------|-------------------|
| **VLAN 10** | Control Plane | Infrastructure management services | Kubernetes control plane, monitoring |
| **VLAN 20** | Project Work | Research workload traffic | DESI analysis, GPU computing |
| **VLAN 60** | Migration | VM migration and backup | Live migration, backup operations |

---

## **🌡️ 4. Environmental & Performance Status**

### **4.1 System Status**

| **Component** | **Status** | **Performance** |
|--------------|------------|-----------------|
| **System Uptime** | 8 day, 1 hr, 44 min, 26 sec | Stable operation |
| **Management Interface** | Operational | HTTP/SNMP active |
| **Port Status** | 16/16 MGE + 2/2 TE active | Full connectivity |
| **VLAN Services** | All VLANs operational | Traffic segmentation active |

### **4.2 Port Utilization**

| **Port Group** | **Utilization** | **Function** | **Status** |
|----------------|----------------|--------------|------------|
| **MGE 1-14** | 14/16 ports | Node management connectivity | Active |
| **MGE 15-16** | 2/16 ports | Infrastructure services | Active |
| **TE 1-2** | 2/2 ports | Inter-switch uplinks | Active |
| **Total** | 18/18 ports | Complete infrastructure coverage | Operational |

### **4.3 Traffic Analysis**

**Distribution Performance:** labswitch02 demonstrates excellent distribution layer performance with complete 2.5G management connectivity for all nodes, providing sufficient bandwidth for Proxmox management, monitoring, and backup operations while maintaining clear separation from high-performance data plane traffic.

---

## **💻 5. System Configuration**

### **5.1 Management Configuration**

| **Component** | **Configuration** | **Status** |
|--------------|------------------|------------|
| **System Name** | labswitch02 | Configured |
| **Management IP** | 10.16.207.200/24 | Static assignment |
| **HTTP Service** | Enabled | Web management active |
| **SNMP Service** | Enabled | Monitoring integration |

### **5.2 Network Services**

| **Service** | **Configuration** | **Purpose** |
|-------------|------------------|-------------|
| **VLAN Segmentation** | VLANs 10, 20, 60 | Traffic isolation |
| **Inter-switch Connectivity** | 10G SFP+ uplinks | High-speed backbone |
| **Internet Gateway** | FortiGate 40F connection | External connectivity |
| **Backup Integration** | Proxmox Backup Server | Data protection services |

---

## **🔧 6. Operational Procedures**

### **6.1 Distribution Layer Management**

| **Operation Type** | **Frequency** | **Focus Area** |
|-------------------|---------------|----------------|
| **Port Monitoring** | Continuous | Management interface status |
| **VLAN Management** | As needed | Traffic segmentation updates |
| **Uplink Monitoring** | Continuous | Inter-switch connectivity |
| **Backup Coordination** | Daily | Proxmox Backup Server connectivity |

### **6.2 Infrastructure Services**

| **Service** | **Management** | **Integration** |
|------------|----------------|-----------------|
| **Node Management** | 2.5G dedicated interfaces | Complete cluster coverage |
| **Internet Gateway** | FortiGate uplink | Controlled external access |
| **Backup Services** | PBS integration | Data protection workflow |
| **Inter-switch** | 10G uplinks | Network backbone coordination |

### **6.3 Maintenance Procedures**

| **Maintenance Type** | **Schedule** | **Impact** |
|---------------------|--------------|------------|
| **Firmware Updates** | Quarterly | Planned management interruption |
| **VLAN Configuration** | As needed | Minimal service impact |
| **Port Configuration** | Planned changes | Targeted interface impact |

---

## **🔒 7. Security & Compliance**

### **7.1 Distribution Layer Security**

**Enterprise Management Security:** Implements VLAN-based traffic segmentation, secure SNMP monitoring, and controlled internet gateway access through FortiGate integration supporting comprehensive network security and management plane protection.

### **7.2 Access Control**

| **Security Layer** | **Implementation** | **Purpose** |
|-------------------|-------------------|-------------|
| **Management Access** | HTTP authentication | Secure switch configuration |
| **VLAN Isolation** | Traffic segregation | Service security boundaries |
| **Gateway Control** | FortiGate integration | Controlled external access |
| **SNMP Security** | Community/v3 authentication | Secure monitoring |

### **7.3 Network Segmentation**

| **VLAN** | **Security Purpose** | **Access Control** |
|----------|---------------------|-------------------|
| **VLAN 10** | Control plane isolation | Infrastructure services only |
| **VLAN 20** | Project workload isolation | Research traffic segmentation |
| **VLAN 60** | Migration traffic isolation | Backup and migration operations |

---

## **⚠️ 8. Known Issues & Limitations**

### **8.1 Current Operational Notes**

**Port Utilization:** All 18 ports currently active providing complete infrastructure coverage for 7-node cluster, backup services, and internet connectivity.

**Bandwidth Distribution:** 2.5G management interfaces provide sufficient bandwidth for current Proxmox management and monitoring requirements.

### **8.2 Performance Characteristics**

**Management Plane Optimization:** Dedicated 2.5G interfaces ensure management traffic separation from high-performance data plane operations handled by labswitch01.

**Uplink Capacity:** 10G SFP+ uplinks provide sufficient bandwidth for inter-switch communication and backbone connectivity.

---

## **🔗 9. Related Assets**

| **Related System** | **Relationship** | **Documentation** |
|-------------------|------------------|-------------------|
| **[labswitch01](labswitch01-sodola-sl-swtg3c12f.md)** | Core data switch | High-performance backbone |
| **[labswitch03](labswitch03-sodola-sl-swtgw2c48ns.md)** | Expansion switch | Network expansion layer |
| **[fw01](fw01-fortigate-40f.md)** | Internet gateway | External connectivity |
| **[pbs01](../infrastructure/backup/)** | Backup server | Data protection services |

---

## **📊 10. Asset Management**

| **Field** | **Value** |
|-----------|-----------|
| **Asset ID** | labswitch02-nx-cluster |
| **Network Classification** | Enterprise distribution layer |
| **Service Tier** | Production management infrastructure |
| **Connectivity Type** | 2.5G management + 10G uplinks |

---

## **📈 11. Performance Metrics**

### **11.1 Distribution Capacity**

| **Metric** | **Specification** | **Utilization** |
|------------|------------------|-----------------|
| **Management Bandwidth** | 16x 2.5G ports | 100% node coverage |
| **Uplink Bandwidth** | 2x 10G SFP+ | Inter-switch backbone |
| **Port Utilization** | 18/18 ports active | 100% utilized |
| **VLAN Capacity** | 3 active VLANs | Traffic segmentation |

### **11.2 Service Integration**

| **Service** | **Connectivity** | **Performance** |
|-------------|------------------|-----------------|
| **Node Management** | 14 nodes (dual-connected) | 2.5G per interface |
| **Backup Services** | PBS dedicated connection | 2.5G backup bandwidth |
| **Internet Gateway** | FortiGate uplink | Controlled external access |
| **Inter-switch** | 10G SFP+ uplinks | High-speed backbone |

### **11.3 Reliability Metrics**

| **Component** | **Availability** | **Uptime** |
|--------------|------------------|------------|
| **Switch Platform** | 99.9%+ | 8+ days current uptime |
| **Management Interfaces** | 99.95%+ | Dual-connected nodes |
| **Uplink Connectivity** | 99.9%+ | Redundant backbone |

---

## **Document Information**

| **Field** | **Value** |
|-----------|-----------|
| **Document Type** | Network Asset Sheet |
| **Classification** | Enterprise Infrastructure |
| **Author** | VintageDon - <https://github.com/vintagedon> |
| **Created** | 2025-07-20 |
| **Last Updated** | 2025-07-20 |
| **Version** | 1.0 |

---
Tags: labswitch02, mokerlink-2g16210gsm, distribution-switch, management-network, vlan-segmentation, enterprise-distribution, cluster-management
