# 🖥️ **node01 - Enterprise Proxmox Host**

**Asset Classification:** Primary Cluster Node | **Service Tier:** Production | **Location:** Rack Position 1

This knowledge base article provides comprehensive hardware specifications, configuration details, and operational status for node01, a high-performance Intel i9-12900H based Proxmox VE host serving as a primary compute node in the 7-node enterprise astronomy research cluster. The node features advanced networking with LACP bonding, enterprise NVMe storage, and comprehensive VLAN segmentation supporting production DESI analysis workloads and distributed computing operations.

---

## **🎯 1. Purpose & Role**

### **1.1 Primary Function**

node01 serves as a foundational compute platform within the Proxmox Astronomy Lab's enterprise virtualization infrastructure, providing high-performance virtualization capabilities for research computing workloads, Kubernetes cluster hosting, and infrastructure services. The node operates as part of a 7-node highly available cluster supporting production DESI spectroscopic analysis, distributed machine learning operations, and collaborative research environments.

### **1.2 Service Classification**

**Production Tier:** Enterprise research computing platform supporting live scientific workloads and collaborative research operations requiring high availability, performance optimization, and systematic operational procedures.

**Workload Categories:**

- **Virtual Machine Hosting:** Primary platform for research VMs and infrastructure services
- **Kubernetes Integration:** RKE2 cluster node hosting for container orchestration
- **Network Infrastructure:** Advanced networking hub with LACP bonding and VLAN management
- **Storage Services:** High-performance NVMe storage supporting distributed research computing

### **1.3 Cluster Integration**

node01 operates as a critical component within the systematic 7-node cluster architecture, providing coordinated virtualization services, distributed storage capabilities, and high-availability failover support ensuring continuous operation of scientific computing workloads and research infrastructure services.

---

## **⚙️ 2. Hardware Specifications**

### **2.1 Compute Platform**

| **Component** | **Specification** | **Performance Characteristics** |
|---------------|------------------|--------------------------------|
| **Processor** | Intel i9-12900H (12th Gen) | 20 cores, hybrid architecture with P/E cores |
| **Socket Configuration** | Single socket installation | Optimized for high-performance virtualization |
| **Architecture** | Alder Lake hybrid design | Enhanced performance per watt for enterprise workloads |
| **Virtualization Support** | VT-x, VT-d enabled | Hardware-assisted virtualization with IOMMU |

### **2.2 Storage Infrastructure**

| **Storage Device** | **Specifications** | **Health Status** | **Performance Notes** |
|-------------------|-------------------|------------------|----------------------|
| **Primary NVMe** | Samsung MZ1LB1T9HALS-00007 | S.M.A.R.T.: PASSED | Enterprise-grade endurance rating |
| **Capacity** | 1.92 TB usable capacity | Wearout: 14% | Excellent remaining lifespan |
| **Serial Number** | S436NC0R484453 | Active monitoring | Systematic health validation |
| **Partition Layout** | GPT with EFI/LVM configuration | Optimized allocation | Enterprise boot and storage organization |

### **2.3 Storage Pool Configuration**

| **Pool Name** | **Type** | **Capacity** | **Usage** |
|--------------|----------|--------------|-----------|
| **data** | LVM Volume Group (pve) | 165.47 GiB | System and VM storage |
| **nvmethin01** | LVM Volume Group | 1.61 TiB | High-performance VM and data storage |

---

## **🌐 3. Network Architecture**

### **3.1 Physical Network Interfaces**

| **Interface** | **Type** | **Status** | **Configuration** |
|--------------|----------|------------|------------------|
| **eth0** | Physical Network Device | Active | Management network bridge member |
| **eth1** | Physical Network Device | Active | Available for additional connectivity |
| **spf0** | SFP+ Network Interface | Active | LACP bond member for high-bandwidth |
| **spf1** | SFP+ Network Interface | Active | LACP bond member for redundancy |

### **3.2 Bond and Bridge Configuration**

| **Virtual Interface** | **Configuration** | **Members** | **Purpose** |
|---------------------|------------------|-------------|-------------|
| **bond0** | LACP (802.3ad) Active-Active | spf0, spf1 | High-bandwidth redundant connectivity |
| **vmbr0** | Linux Bridge | eth0 | Management network (10.16.207.61/24) |
| **vmbr1** | Linux Bridge | bond0 | High-performance VM networking |

### **3.3 VLAN Segmentation**

| **VLAN Interface** | **Network Range** | **Purpose** |
|-------------------|------------------|-------------|
| **vmbr1.10** | 10.25.10.231/24 | Management services and infrastructure |
| **vmbr1.20** | 10.25.20.231/24 | Project and research computing |
| **vmbr1.30** | 10.25.30.231/24 | Development and testing |
| **vmbr1.40** | 10.25.40.231/24 | Reserved for expansion |
| **vmbr1.50** | 10.25.50.231/24 | Reserved for expansion |
| **vmbr1.60** | 10.25.60.231/24 | Reserved for expansion |

---

## **🌡️ 4. Thermal & Environmental Status**

### **4.1 CPU Temperature Profile (Idle)**

| **Sensor Location** | **Temperature** | **Status** | **Notes** |
|--------------------|----------------|------------|-----------|
| **Package ID 0** | 46.0°C | Normal | Overall CPU package temperature |
| **Core 0** | 44.0°C | Excellent | P-core primary |
| **Core 4** | 42.0°C | Excellent | P-core secondary |
| **Core 8** | 46.0°C | Normal | P-core tertiary |
| **Core 12** | 42.0°C | Excellent | P-core quaternary |
| **Core 16-31** | 41.0°C - 46.0°C | Normal | E-core cluster temperatures |

### **4.2 System Environmental Sensors**

| **Component** | **Temperature** | **Status** | **Function** |
|--------------|----------------|------------|--------------|
| **ACPI Thermal Zone** | 27.8°C | Excellent | System ambient monitoring |
| **WiFi Module (mt7921)** | 46.0°C | Normal | Wireless interface thermal |
| **NVMe Controller** | 48.9°C | Normal | Storage controller baseline |
| **NVMe Sensor 1** | 48.9°C | Normal | Primary storage sensor |
| **NVMe Sensor 2** | 58.9°C | Normal | Secondary storage monitoring |
| **NVMe Sensor 3** | 69.8°C | Acceptable | High-performance operation |

### **4.3 Thermal Analysis**

**Operational Status:** All thermal sensors report within acceptable operational ranges for enterprise workloads. CPU temperatures indicate efficient cooling with hybrid core architecture maintaining optimal thermal distribution. NVMe storage operates within manufacturer specifications with Sensor 3 approaching upper normal range under enterprise usage patterns.

---

## **💻 5. System Configuration**

### **5.1 Operating System & Kernel**

| **Component** | **Version** | **Status** |
|--------------|-------------|------------|
| **Proxmox VE** | pve-manager/8.4.5/57892e8e6cb35b | Current enterprise release |
| **Linux Kernel** | 6.8.12-12-pve (2025-07-14T13:20Z) | Latest stable kernel |
| **Boot Mode** | EFI with Secure Boot enabled | Enhanced security configuration |

### **5.2 Repository Configuration**

| **Repository Type** | **Status** | **Update Policy** |
|-------------------|------------|-------------------|
| **Proxmox VE Updates** | Enabled | Systematic enterprise updates |
| **Non-production Repository** | Enabled | Testing and development features |

**Note:** Non-production repository enables access to testing features and development updates while maintaining production stability for core operations.

---

## **🔧 6. Operational Procedures**

### **6.1 Maintenance Schedule**

| **Maintenance Type** | **Frequency** | **Procedure** |
|---------------------|---------------|---------------|
| **Health Monitoring** | Continuous | Automated sensor monitoring and alerting |
| **Storage Health** | Weekly | S.M.A.R.T. status validation and wear analysis |
| **Thermal Analysis** | Daily | Temperature trend analysis and cooling validation |
| **System Updates** | Monthly | Systematic Proxmox and kernel updates |

### **6.2 Performance Monitoring**

| **Metric Category** | **Monitoring Approach** | **Alert Thresholds** |
|--------------------|------------------------|---------------------|
| **CPU Utilization** | Real-time cluster monitoring | >85% sustained utilization |
| **Memory Usage** | Systematic memory allocation tracking | >90% physical memory |
| **Storage Performance** | NVMe performance analytics | IOPS degradation >20% |
| **Network Throughput** | Bond utilization and latency monitoring | Link utilization >80% |

---

## **🔒 7. Security & Compliance**

### **7.1 Security Configuration**

**Boot Security:** EFI Secure Boot enabled providing hardware-level boot integrity validation and protection against unauthorized system modifications.

**Network Security:** VLAN segmentation provides systematic network isolation with controlled inter-VLAN communication supporting enterprise security requirements and research data protection.

**Access Control:** Enterprise authentication integration with systematic access logging and audit capabilities supporting institutional compliance and research governance requirements.

### **7.2 Compliance Status**

| **Framework** | **Status** | **Implementation** |
|--------------|------------|-------------------|
| **CIS Controls v8** | Baseline Implemented | Ubuntu hardening with enterprise configuration |
| **NIST Cybersecurity Framework** | Aligned | Systematic security monitoring and validation |
| **Research Computing Standards** | Compliant | Institutional policy alignment and governance |

---

## **⚠️ 8. Known Issues & Limitations**

### **8.1 Current Operational Notes**

**Repository Configuration:** Non-production repository enabled for development access requires systematic validation of updates before production deployment.

**NVMe Thermal:** Sensor 3 operates at elevated temperature (69.8°C) within manufacturer specifications but approaching upper normal range during intensive workloads.

### **8.2 Planned Improvements**

| **Enhancement** | **Timeline** | **Benefit** |
|----------------|--------------|-------------|
| **Cooling Optimization** | Q4 2025 | Enhanced thermal headroom for sustained workloads |
| **Network Expansion** | Q1 2026 | Additional high-bandwidth connectivity |
| **Storage Monitoring** | Q3 2025 | Enhanced NVMe health analytics and predictive maintenance |

---

## **🔗 9. Related Assets**

| **Related System** | **Relationship** | **Documentation** |
|-------------------|------------------|-------------------|
| **[node02](node02-minisforum-ms-a1-12600h.md)** | Cluster peer with complementary workload distribution | Hardware specifications and configuration |
| **[node03](node03-minisforum-ms-a1-12900h.md)** | High-performance cluster node for computational workloads | Performance optimization and resource allocation |
| **[Cluster Overview](../README.md)** | Complete 7-node cluster architecture and coordination | Enterprise cluster management and operations |

---

## **📊 10. Asset Management**

| **Field** | **Value** |
|-----------|-----------|
| **Asset ID** | node01-px-cluster |
| **Acquisition Date** | 2024-Q2 |
| **Warranty Status** | Active manufacturer warranty |
| **Lifecycle Stage** | Production operation |
| **Next Review** | 2025-10-01 |
| **Responsible Team** | Infrastructure Engineering |

---

## **Document Information**

| **Field** | **Value** |
|-----------|-----------|
| **Document Type** | Hardware Asset Sheet |
| **Classification** | Enterprise Infrastructure |
| **Author** | VintageDon - <https://github.com/vintagedon> |
| **Created** | 2025-07-20 |
| **Last Updated** | 2025-07-20 |
| **Version** | 1.0 |
| **Review Cycle** | Quarterly |

---
Tags: node01, intel-i9-12900h, proxmox-host, enterprise-hardware, cluster-infrastructure, nvme-storage, lacp-networking, thermal-monitoring
