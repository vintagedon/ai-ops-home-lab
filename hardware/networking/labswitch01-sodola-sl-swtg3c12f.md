# 🌐 **labswitch01 - Enterprise 10G Network Switch**

**Asset Classification:** Core Network Infrastructure | **Service Tier:** Production | **Location:** Rack Position - Core Network

This knowledge base article provides comprehensive hardware specifications, configuration details, and operational status for labswitch01, a Sodola SL-SWTG3C12F 12-port 10G SFP+ enterprise network switch serving as the primary network backbone for the 7-node Proxmox astronomy research cluster with hybrid Kubernetes and VM architecture.

---

## **🎯 1. Purpose & Role**

### **1.1 Primary Function**

labswitch01 serves as the core network infrastructure backbone providing enterprise-grade 10G connectivity, LACP link aggregation, VLAN segmentation, and QoS traffic management for the entire 7-node cluster supporting high-performance computing workloads, astronomical data processing, and distributed container orchestration.

### **1.2 Service Classification**

**Production Tier:** Mission-critical network infrastructure providing enterprise-grade connectivity with 240G backplane capacity, supporting hybrid RKE2 Kubernetes orchestration, strategic VM deployments, and high-bandwidth astronomical data processing workflows.

### **1.3 Cluster Integration**

Primary network backbone enabling seamless connectivity between all cluster nodes through LACP bonded connections, providing the foundation for hybrid infrastructure architecture with containerized workloads, virtualized services, and distributed computing operations.

---

## **⚙️ 2. Hardware Specifications**

### **2.1 Network Platform**

| **Component** | **Specification** | **Performance Characteristics** |
|---------------|------------------|--------------------------------|
| **Model** | Sodola SL-SWTG3C12F | Enterprise 10G SFP+ switch |
| **Port Configuration** | 8x 10G SFP+ + 4x 10GBase-T RJ45 | Hybrid port flexibility |
| **Backplane Capacity** | 240 Gbps | High-performance switching fabric |
| **Form Factor** | 1U Rack-Mount | Enterprise datacenter design |

### **2.2 Port Specifications**

| **Port Type** | **Count** | **Capabilities** | **Standards** |
|--------------|-----------|------------------|---------------|
| **SFP+ Ports** | 8 ports | 10G fiber connectivity | IEEE 802.3ae |
| **RJ45 Ports** | 4 ports | 10G/5G/2.5G/1G/100M auto-negotiation | Auto-MDI/MDIX |
| **Total Ports** | 12 ports | Flexible connectivity options | Enterprise standards |

### **2.3 Enterprise Features**

| **Feature** | **Capability** | **Implementation** |
|-------------|---------------|-------------------|
| **LACP Support** | IEEE 802.3ad link aggregation | Dual-link bonding per node |
| **VLAN Support** | IEEE 802.1Q segmentation | Multi-tenant network isolation |
| **QoS Management** | Traffic prioritization | Research workload optimization |
| **SNMP Monitoring** | Enterprise network management | Comprehensive monitoring integration |

---

## **🌐 3. Network Configuration**

### **3.1 Management Access**

| **Access Method** | **Configuration** | **Purpose** |
|------------------|------------------|-------------|
| **Web Interface** | <http://labswitch01> | Primary management access |
| **SNMP** | Enabled | Network monitoring integration |
| **HTTP Management** | Enabled | Web-based configuration |

### **3.2 Port Mapping & LACP Configuration**

| **Port** | **Connected Device** | **LACP Pair** | **Purpose** |
|----------|---------------------|---------------|-------------|
| **TE1** | node03 spf0 | TE1+TE2 | Infrastructure node bonded link |
| **TE2** | node03 spf1 | TE1+TE2 | Infrastructure node bonded link |
| **TE3** | node01 spf0 | TE3+TE4 | Compute node bonded link |
| **TE4** | node01 spf1 | TE3+TE4 | Compute node bonded link |
| **TE5** | node05 spf0 | TE5+TE6 | Infrastructure node bonded link |
| **TE6** | node05 spf1 | TE5+TE6 | Infrastructure node bonded link |
| **TE7** | node07 spf0 | TE7+TE8 | GPU flagship node bonded link |
| **TE8** | node07 spf1 | TE7+TE8 | GPU flagship node bonded link |
| **TE9** | node02 spf0 | TE9+TE10 | Storage node bonded link |
| **TE10** | node02 spf1 | TE9+TE10 | Storage node bonded link |
| **TE11** | Unused | - | Reserved expansion port |
| **TE12** | labswitch02 Port 18 | Inter-switch | Switch interconnection |

### **3.3 VLAN Configuration**

| **VLAN ID** | **Network Range** | **Purpose** | **Connected Services** |
|-------------|------------------|-------------|----------------------|
| **Native** | 10.16.207.0/24 | Management network | Proxmox hosts, switch management |
| **VLAN 10** | 10.25.10.0/24 | Infrastructure services | Monitoring, authentication, axis services |
| **VLAN 20** | 10.25.20.0/24 | Project workloads | DESI analysis, GPU computing, databases |
| **VLAN 30-60** | 10.25.30-60.0/24 | Reserved expansion | Future service segregation |

---

## **🌡️ 4. Environmental & Performance Status**

### **4.1 System Status**

| **Component** | **Status** | **Performance** |
|--------------|------------|-----------------|
| **Switch Fabric** | Operational | 240G backplane active |
| **Port Status** | 10/12 ports active | LACP bonds operational |
| **Cooling System** | Fan cooling operational | Normal thermal operation |
| **Power Consumption** | Within specifications | Enterprise power efficiency |

### **4.2 Link Status & Performance**

| **LACP Bond** | **Nodes** | **Aggregate Bandwidth** | **Status** |
|---------------|-----------|------------------------|------------|
| **Bond 1** | node03 (TE1+TE2) | 20 Gbps | Active |
| **Bond 2** | node01 (TE3+TE4) | 20 Gbps | Active |
| **Bond 3** | node05 (TE5+TE6) | 20 Gbps | Active |
| **Bond 4** | node07 (TE7+TE8) | 20 Gbps | Active |
| **Bond 5** | node02 (TE9+TE10) | 20 Gbps | Active |

### **4.3 Traffic Analysis**

**Enterprise Performance:** labswitch01 demonstrates excellent performance characteristics with full 20 Gbps aggregate bandwidth per node through LACP bonding, supporting high-bandwidth astronomical data processing and distributed computing workloads.

---

## **💻 5. System Configuration**

### **5.1 Management Interface**

| **Component** | **Configuration** | **Status** |
|--------------|------------------|------------|
| **Management IP** | Configured via DHCP/Static | Operational |
| **Web Interface** | HTTP enabled | Accessible |
| **SNMP Service** | v2c/v3 enabled | Monitoring active |

### **5.2 Enterprise Features Status**

| **Feature** | **Configuration** | **Status** |
|-------------|------------------|------------|
| **LACP Aggregation** | 5 active bonds | Operational |
| **VLAN Segmentation** | Multi-VLAN active | Configured |
| **QoS Management** | Traffic prioritization | Active |
| **SNMP Monitoring** | Enterprise monitoring | Enabled |

---

## **🔧 6. Operational Procedures**

### **6.1 Network Management**

| **Operation Type** | **Frequency** | **Focus Area** |
|-------------------|---------------|----------------|
| **Performance Monitoring** | Continuous | Bandwidth utilization and LACP status |
| **VLAN Management** | As needed | Network segmentation and service isolation |
| **Port Configuration** | Planned changes | LACP bond management and expansion |
| **Firmware Updates** | Quarterly | Enterprise feature enhancement |

### **6.2 High Availability Procedures**

| **Procedure** | **Purpose** | **Implementation** |
|--------------|-------------|-------------------|
| **LACP Failover** | Link redundancy | Automatic within bonds |
| **Inter-switch Coordination** | Switch redundancy | Manual failover to labswitch02 |
| **VLAN Isolation** | Service protection | Automatic traffic segregation |

### **6.3 Maintenance Windows**

| **Maintenance Type** | **Schedule** | **Impact** |
|---------------------|--------------|------------|
| **Firmware Updates** | Quarterly | Planned service interruption |
| **Configuration Changes** | As needed | Minimal service impact |
| **Physical Inspection** | Monthly | No service impact |

---

## **🔒 7. Security & Compliance**

### **7.1 Network Security Configuration**

**Enterprise Network Security:** Implements VLAN segmentation for traffic isolation, SNMP v3 for secure monitoring, and managed access controls for configuration management supporting CIS Controls v8 network security requirements.

### **7.2 Access Control**

| **Security Layer** | **Implementation** | **Purpose** |
|-------------------|-------------------|-------------|
| **Management Access** | HTTP authentication | Secure configuration management |
| **SNMP Security** | Community string/v3 auth | Secure monitoring |
| **VLAN Isolation** | Traffic segregation | Service security boundaries |

### **7.3 Compliance Framework**

| **Standard** | **Implementation** | **Status** |
|-------------|-------------------|------------|
| **CIS Controls v8** | Network security controls | Implementing |
| **IEEE 802.1Q** | VLAN segmentation standards | Compliant |
| **IEEE 802.3ad** | LACP aggregation standards | Compliant |

---

## **⚠️ 8. Known Issues & Limitations**

### **8.1 Current Operational Notes**

**Port Utilization:** 10 of 12 ports currently active with 2 ports reserved for expansion and inter-switch connectivity.

**Performance Optimization:** LACP bonding provides 20 Gbps aggregate bandwidth per node, suitable for current astronomical workloads with capacity for expansion.

### **8.2 Expansion Planning**

**Future Capacity:** Remaining ports support additional nodes or enhanced inter-switch connectivity for scaling beyond current 7-node configuration.

**Bandwidth Scaling:** 240G backplane provides headroom for increased traffic demands from expanded research workloads.

---

## **🔗 9. Related Assets**

| **Related System** | **Relationship** | **Documentation** |
|-------------------|------------------|-------------------|
| **[labswitch02](labswitch02-mokerlink-2g16210gsm.md)** | Secondary switch | Redundant network infrastructure |
| **[fw01](fw01-fortigate-40f.md)** | Network security | Firewall and routing services |
| **[All Nodes](../hardware/)** | Connected devices | Node network connectivity |

---

## **📊 10. Asset Management**

| **Field** | **Value** |
|-----------|-----------|
| **Asset ID** | labswitch01-nx-cluster |
| **Network Classification** | Enterprise 10G backbone |
| **Service Tier** | Production core infrastructure |
| **Connectivity Type** | LACP bonded 10G SFP+ |

---

## **📈 11. Performance Metrics**

### **11.1 Network Capacity**

| **Metric** | **Specification** | **Utilization** |
|------------|------------------|-----------------|
| **Total Backplane** | 240 Gbps | ~42% utilized (100 Gbps aggregate) |
| **Per-Node Bandwidth** | 20 Gbps bonded | Optimal for current workloads |
| **Port Utilization** | 10/12 ports active | 83% utilized |
| **VLAN Capacity** | 4094 VLANs supported | <1% utilized |

### **11.2 Reliability Metrics**

| **Component** | **Availability** | **MTBF** |
|--------------|------------------|----------|
| **Switch Fabric** | 99.9%+ | Enterprise-grade |
| **LACP Bonds** | 99.95%+ | Redundant connectivity |
| **Management Interface** | 99.9%+ | Reliable access |

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
Tags: labswitch01, sodola-sl-swtg3c12f, 10g-switch, lacp-bonding, vlan-segmentation, enterprise-networking, core-infrastructure
