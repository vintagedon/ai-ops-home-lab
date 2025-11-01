# 🖥️ **node05 - Enterprise Proxmox Host**

**Asset Classification:** Triple-NVMe Storage Node | **Service Tier:** Production | **Location:** Rack Position 5

This knowledge base article provides comprehensive hardware specifications, configuration details, and operational status for node05, an Intel i5-12600H based Proxmox VE host featuring triple NVMe storage configuration providing maximum storage capacity (7.3TB total) in the 7-node enterprise astronomy research cluster.

---

## **🎯 1. Purpose & Role**

### **1.1 Primary Function**

node05 serves as the primary storage platform providing triple NVMe storage pools with 7.3TB total capacity, hosting file services (proj-fs01, proj-fs02), monitoring infrastructure (proj-mon01), management services (mgmt-ansible01, mgmt-veeam01), and storage-intensive research workloads.

### **1.2 Service Classification**

**Production Tier:** Enterprise research computing platform optimized for maximum storage capacity and file services requiring high-capacity storage pools, distributed file systems, and systematic storage management for research data operations.

### **1.3 Cluster Integration**

Storage-specialized node within the 7-node cluster architecture providing maximum storage capacity, file service hosting, and distributed storage capabilities with triple NVMe configuration for enhanced storage performance and research data management.

---

## **⚙️ 2. Hardware Specifications**

### **2.1 Compute Platform**

| **Component** | **Specification** | **Performance Characteristics** |
|---------------|------------------|--------------------------------|
| **Processor** | Intel i5-12600H (12th Gen) | 16 cores, hybrid architecture optimized for storage operations |
| **Socket Configuration** | Single socket installation | Efficient performance for high-capacity storage management |
| **Architecture** | Alder Lake hybrid design | Enhanced I/O throughput for storage workloads |
| **Virtualization Support** | VT-x, VT-d enabled | Hardware-assisted virtualization with IOMMU |

### **2.2 Triple NVMe Storage Infrastructure**

| **Storage Device** | **Specifications** | **Health Status** | **Capacity** |
|-------------------|-------------------|------------------|--------------|
| **nvme0n1 (Primary)** | Samsung MZ1LB1T9HALS-00007 | S.M.A.R.T.: PASSED, Wearout: 14% | 1.92TB |
| **nvme1n1 (Secondary)** | Samsung MZALB3T8HALS-00003 | S.M.A.R.T.: PASSED, Wearout: 0% | 3.84TB |
| **nvme2n1 (Tertiary)** | Samsung MZ1LB1T9HBLS-000FB | S.M.A.R.T.: PASSED, Wearout: 11% | 1.88TB |
| **Total Capacity** | Triple NVMe Configuration | All devices healthy | **7.64TB Raw** |

### **2.3 Storage Pool Configuration**

| **Pool Name** | **Type** | **Capacity** | **Source Device** |
|--------------|----------|--------------|------------------|
| **data** | LVM Volume Group (pve) | 165.47 GiB | nvme0n1 (boot) |
| **nvmethin01** | LVM Volume Group | 1.61 TiB | nvme0n1 (primary) |
| **nvmethin02** | LVM Volume Group | 1.57 TiB | nvme2n1 (tertiary) |
| **nvmethin04** | LVM Volume Group | 3.81 TiB | nvme1n1 (secondary) |
| **Total Usable** | Combined Storage Pools | **7.15 TiB** | Triple NVMe aggregate |

---

## **🌐 3. Network Architecture**

### **3.1 VLAN Segmentation**

| **VLAN Interface** | **Network Range** | **Purpose** |
|-------------------|------------------|-------------|
| **vmbr0** | 10.16.207.65/24 | Management network |
| **vmbr1.10** | 10.25.10.235/24 | Management services |
| **vmbr1.20** | 10.25.20.235/24 | Project and file services |
| **vmbr1.30-60** | 10.25.30-60.235/24 | Reserved expansion VLANs |

---

## **🌡️ 4. Thermal & Environmental Status**

### **4.1 CPU Temperature Profile (Idle)**

| **Sensor Location** | **Temperature** | **Status** |
|--------------------|----------------|------------|
| **Package ID 0** | 44.0°C | Excellent |
| **Cores 0-12** | 39.0°C - 41.0°C | Excellent |
| **Cores 16-23** | 42.0°C - 44.0°C | Excellent |

### **4.2 Triple NVMe Thermal Monitoring**

| **NVMe Device** | **Controller** | **Sensor 1** | **Sensor 2** | **Sensor 3** | **Status** |
|----------------|---------------|--------------|---------------|---------------|------------|
| **nvme0n1 (1.92TB)** | 47.9°C | 47.9°C | 54.9°C | 66.8°C | Good |
| **nvme1n1 (3.84TB)** | 64.8°C | 64.8°C | 78.8°C | **94.8°C** | **⚠️ High** |
| **nvme2n1 (1.88TB)** | 49.9°C | 49.9°C | 53.9°C | 57.9°C | Excellent |

### **4.3 Environmental Sensors**

| **Component** | **Temperature** | **Status** |
|--------------|----------------|------------|
| **ACPI Thermal Zone** | 27.8°C | Excellent |
| **WiFi Module (mt7921)** | 44.0°C | Normal |

### **4.4 Thermal Analysis**

**Storage Thermal Management:** nvme1n1 (3.84TB) operates at elevated temperatures with Sensor 3 at 94.8°C approaching thermal limits. nvme2n1 demonstrates excellent thermal performance. Enhanced cooling recommended for high-capacity drive.

---

## **💻 5. System Configuration**

### **5.1 Operating System & Kernel**

| **Component** | **Version** | **Status** |
|--------------|-------------|------------|
| **Proxmox VE** | pve-manager/8.4.5/57892e8e6cb35b | Current enterprise release |
| **Linux Kernel** | 6.8.12-12-pve (2025-07-14T13:20Z) | Latest stable kernel |
| **Boot Mode** | EFI with Secure Boot enabled | Enhanced security configuration |

---

## **🗄️ 6. Hosted Services**

### **6.1 Storage and Infrastructure Services**

| **Service** | **VM ID** | **Purpose** | **Storage Usage** |
|-------------|-----------|-------------|------------------|
| **proj-fs01** | 2007 | Primary file services (1.5TB) | High-capacity storage |
| **proj-fs02** | 2011 | Secondary file services | Distributed storage |
| **proj-mon01** | 2008 | Monitoring infrastructure (500GB) | Performance monitoring |
| **mgmt-ansible01** | 1002 | Infrastructure automation | Management services |
| **mgmt-veeam01** | 1004 | Enterprise backup services (1TB) | Data protection |

---

## **🔧 7. Operational Procedures**

### **7.1 Storage Management**

| **Operation Type** | **Frequency** | **Focus Area** |
|-------------------|---------------|----------------|
| **Thermal Monitoring** | Continuous | nvme1n1 temperature management |
| **Storage Health** | Daily | Triple NVMe S.M.A.R.T. validation |
| **Capacity Planning** | Weekly | 7.3TB storage utilization analysis |

### **7.2 Cooling Optimization**

**Priority Action:** Enhanced cooling for nvme1n1 (3.84TB) to reduce Sensor 3 temperature from 94.8°C to safer operational range.

---

## **🔒 8. Security & Compliance**

### **8.1 Security Configuration**

**Storage Security:** Triple NVMe configuration provides enhanced storage redundancy and performance isolation for critical file services and backup operations.

---

## **⚠️ 9. Known Issues & Limitations**

### **9.1 Current Operational Notes**

**Thermal Concern:** nvme1n1 (3.84TB Samsung) operates at elevated temperatures (94.8°C Sensor 3) requiring enhanced cooling for optimal longevity.

**Storage Optimization:** Triple NVMe configuration provides maximum capacity but requires systematic thermal management for sustained operations.

---

## **🔗 10. Related Assets**

| **Related System** | **Relationship** | **Documentation** |
|-------------------|------------------|-------------------|
| **[node02](node02-minisforum-ms-a1-12600h.md)** | Matched i5-12600H dual-storage peer | Storage configuration comparison |
| **[node06](node06-minisforum-ms-a1-13900h.md)** | High-performance storage complement | Advanced storage coordination |
| **[Cluster Overview](../README.md)** | Complete 7-node cluster architecture | Enterprise cluster management |

---

## **📊 11. Asset Management**

| **Field** | **Value** |
|-----------|-----------|
| **Asset ID** | node05-px-cluster |
| **Storage Profile** | Maximum capacity (7.3TB total) |
| **Service Specialty** | File services and infrastructure backup |
| **Thermal Priority** | nvme1n1 cooling optimization required |

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
Tags: node05, intel-i5-12600h, triple-nvme-storage, file-services, proxmox-host, storage-capacity, thermal-management
