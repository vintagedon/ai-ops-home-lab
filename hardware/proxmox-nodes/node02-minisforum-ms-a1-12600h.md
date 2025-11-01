# 🖥️ **node02 - Enterprise Proxmox Host**

**Asset Classification:** Dual-Storage Cluster Node | **Service Tier:** Production | **Location:** Rack Position 2

This knowledge base article provides comprehensive hardware specifications, configuration details, and operational status for node02, an Intel i5-12600H based Proxmox VE host featuring dual high-performance NVMe storage configuration serving as a storage-optimized compute node in the 7-node enterprise astronomy research cluster.

---

## **🎯 1. Purpose & Role**

### **1.1 Primary Function**

node02 serves as a storage-optimized compute platform providing dual NVMe storage pools with 3.7TB total capacity for high-performance virtualization workloads, distributed storage services, and research data processing within the enterprise astronomy computing infrastructure.

### **1.2 Service Classification**

**Production Tier:** Enterprise research computing platform with emphasis on storage performance and capacity supporting live scientific workloads requiring high-speed data access and systematic storage redundancy.

### **1.3 Cluster Integration**

Critical storage node within the 7-node cluster architecture providing distributed storage capabilities, VM hosting services, and storage-intensive research computing workloads with dual NVMe configuration for enhanced performance and capacity.

---

## **⚙️ 2. Hardware Specifications**

### **2.1 Compute Platform**

| **Component** | **Specification** | **Performance Characteristics** |
|---------------|------------------|--------------------------------|
| **Processor** | Intel i5-12600H (12th Gen) | 16 cores, hybrid architecture optimized for balanced workloads |
| **Socket Configuration** | Single socket installation | Efficient performance per watt for storage operations |
| **Architecture** | Alder Lake hybrid design | Enhanced storage throughput and virtualization |
| **Virtualization Support** | VT-x, VT-d enabled | Hardware-assisted virtualization with IOMMU |

### **2.2 Storage Infrastructure**

| **Storage Device** | **Specifications** | **Health Status** | **Usage** |
|-------------------|-------------------|------------------|-----------|
| **Primary NVMe (nvme0n1)** | Samsung MZ1LB1T9HALS-00007 (1.92TB) | S.M.A.R.T.: PASSED, Wearout: 20% | Enterprise storage pool |
| **Secondary NVMe (nvme1n1)** | Samsung SSD 990 PRO 2TB | S.M.A.R.T.: PASSED, Wearout: 0% | High-performance consumer storage |
| **Serial Numbers** | S436NC0R433971, S7KHNU0Y522907V | Active monitoring | Systematic health validation |

### **2.3 Storage Pool Configuration**

| **Pool Name** | **Type** | **Capacity** | **Source Device** |
|--------------|----------|--------------|------------------|
| **data** | LVM Volume Group (pve) | 165.47 GiB | nvme1n1 (boot device) |
| **nvmethin01** | LVM Volume Group | 1.69 TiB | nvme1n1 (990 PRO) |
| **nvmethin02** | LVM Volume Group | 1.89 TiB | nvme0n1 (Enterprise) |

---

## **🌐 3. Network Architecture**

### **3.1 Physical Network Interfaces**

| **Interface** | **Type** | **Status** | **Configuration** |
|--------------|----------|------------|------------------|
| **eth0** | Physical Network Device | Active | Management network bridge member |
| **eth1** | Physical Network Device | Active | Available for additional connectivity |
| **spf0** | SFP+ Network Interface | Active | LACP bond member for high-bandwidth |
| **spf1** | SFP+ Network Interface | Active | LACP bond member for redundancy |

### **3.2 VLAN Segmentation**

| **VLAN Interface** | **Network Range** | **Purpose** |
|-------------------|------------------|-------------|
| **vmbr0** | 10.16.207.62/24 | Management network |
| **vmbr1.10** | 10.25.10.232/24 | Management services |
| **vmbr1.20** | 10.25.20.232/24 | Project and research computing |
| **vmbr1.30-60** | 10.25.30-60.232/24 | Reserved expansion VLANs |

---

## **🌡️ 4. Thermal & Environmental Status**

### **4.1 CPU Temperature Profile (Idle)**

| **Sensor Location** | **Temperature** | **Status** |
|--------------------|----------------|------------|
| **Package ID 0** | 46.0°C | Normal |
| **Core 0** | 44.0°C | Excellent |
| **Core 4** | 46.0°C | Normal |
| **Core 8** | 42.0°C | Excellent |
| **Core 12** | 41.0°C | Excellent |
| **Cores 16-23** | 44.0°C | Normal (E-core cluster) |

### **4.2 Storage Thermal Monitoring**

| **NVMe Device** | **Controller** | **Sensor 1** | **Sensor 2** | **Sensor 3** |
|----------------|---------------|--------------|---------------|---------------|
| **nvme0n1 (Enterprise)** | 49.9°C | 49.9°C | 59.9°C | 69.8°C |
| **nvme1n1 (990 PRO)** | 48.9°C | 48.9°C | 56.9°C | N/A |

### **4.3 Environmental Sensors**

| **Component** | **Temperature** | **Status** |
|--------------|----------------|------------|
| **ACPI Thermal Zone** | 27.8°C | Excellent |
| **WiFi Module (mt7921)** | 44.0°C | Normal |

---

## **💻 5. System Configuration**

### **5.1 Operating System & Kernel**

| **Component** | **Version** | **Status** |
|--------------|-------------|------------|
| **Proxmox VE** | pve-manager/8.4.5/57892e8e6cb35b | Current enterprise release |
| **Linux Kernel** | 6.8.12-12-pve (2025-07-14T13:20Z) | Latest stable kernel |
| **Boot Mode** | EFI with Secure Boot enabled | Enhanced security configuration |

---

## **🔧 6. Operational Procedures**

### **6.1 Storage Management**

| **Maintenance Type** | **Frequency** | **Procedure** |
|---------------------|---------------|---------------|
| **Storage Health** | Weekly | Dual NVMe S.M.A.R.T. monitoring and wear analysis |
| **Pool Balancing** | Monthly | Storage pool utilization optimization |
| **Performance Analysis** | Daily | Storage throughput and latency monitoring |

### **6.2 Thermal Monitoring**

**Storage Focus:** Enhanced monitoring of dual NVMe thermal performance with Enterprise drive (nvme0n1) operating at higher thermal load and consumer 990 PRO (nvme1n1) maintaining optimal temperatures.

---

## **🔒 7. Security & Compliance**

### **7.1 Security Configuration**

**Boot Security:** EFI Secure Boot enabled providing hardware-level boot integrity validation.
**Storage Security:** Dual NVMe configuration provides storage redundancy and performance isolation.
**Network Security:** VLAN segmentation with LACP bonding for enhanced availability.

---

## **⚠️ 8. Known Issues & Limitations**

### **8.1 Current Operational Notes**

**Storage Wear:** Enterprise NVMe (nvme0n1) shows 20% wearout compared to 0% on consumer 990 PRO, indicating workload distribution optimization opportunities.

**Thermal Management:** Enterprise NVMe operates at elevated temperatures with Sensor 3 at 69.8°C within specifications.

---

## **🔗 9. Related Assets**

| **Related System** | **Relationship** | **Documentation** |
|-------------------|------------------|-------------------|
| **[node01](node01-minisforum-ms-a1-12900h.md)** | Primary cluster node with complementary storage | Hardware specifications |
| **[node03](node03-minisforum-ms-a1-12900h.md)** | Performance-matched cluster peer | Configuration details |
| **[Cluster Overview](../README.md)** | Complete 7-node cluster architecture | Enterprise cluster management |

---

## **📊 10. Asset Management**

| **Field** | **Value** |
|-----------|-----------|
| **Asset ID** | node02-px-cluster |
| **Dual Storage Config** | 3.7TB total NVMe capacity |
| **Lifecycle Stage** | Production operation |
| **Storage Specialty** | Dual NVMe performance optimization |

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

---
Tags: node02, intel-i5-12600h, dual-nvme-storage, proxmox-host, enterprise-hardware, storage-optimization
