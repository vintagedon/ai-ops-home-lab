# 🖥️ **node03 - Enterprise Proxmox Host**

**Asset Classification:** High-Performance Cluster Node | **Service Tier:** Production | **Location:** Rack Position 3

This knowledge base article provides comprehensive hardware specifications, configuration details, and operational status for node03, an Intel i9-12900H based Proxmox VE host serving as a high-performance compute node in the 7-node enterprise astronomy research cluster with optimized thermal performance and single enterprise NVMe storage configuration.

---

## **🎯 1. Purpose & Role**

### **1.1 Primary Function**

node03 serves as a high-performance compute platform providing optimized virtualization capabilities for compute-intensive research workloads, Kubernetes cluster hosting, and CPU-bound scientific computing operations within the enterprise astronomy computing infrastructure.

### **1.2 Service Classification**

**Production Tier:** Enterprise research computing platform optimized for high-performance virtualization workloads requiring maximum CPU performance and efficient thermal management for sustained computational operations.

### **1.3 Cluster Integration**

Performance-optimized node within the 7-node cluster architecture providing high-throughput compute capabilities, Kubernetes worker node hosting, and compute-intensive research workloads with excellent thermal characteristics for sustained performance.

---

## **⚙️ 2. Hardware Specifications**

### **2.1 Compute Platform**

| **Component** | **Specification** | **Performance Characteristics** |
|---------------|------------------|--------------------------------|
| **Processor** | Intel i9-12900H (12th Gen) | 20 cores, hybrid architecture with enhanced thermal optimization |
| **Socket Configuration** | Single socket installation | Maximum performance per watt for sustained workloads |
| **Architecture** | Alder Lake hybrid design | Optimized for high-performance virtualization |
| **Virtualization Support** | VT-x, VT-d enabled | Hardware-assisted virtualization with IOMMU |

### **2.2 Storage Infrastructure**

| **Storage Device** | **Specifications** | **Health Status** | **Performance Notes** |
|-------------------|-------------------|------------------|----------------------|
| **Primary NVMe** | Samsung MZ1LB1T9HALS-00007 | S.M.A.R.T.: PASSED | Enterprise-grade performance |
| **Capacity** | 1.92 TB usable capacity | Wearout: 20% | Good remaining lifespan |
| **Serial Number** | S436NC0R520364 | Active monitoring | Systematic health validation |
| **Partition Layout** | GPT with EFI/LVM configuration | Optimized allocation | Standard enterprise configuration |

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

### **3.2 VLAN Segmentation**

| **VLAN Interface** | **Network Range** | **Purpose** |
|-------------------|------------------|-------------|
| **vmbr0** | 10.16.207.63/24 | Management network |
| **vmbr1.10** | 10.25.10.233/24 | Management services |
| **vmbr1.20** | 10.25.20.233/24 | Project and research computing |
| **vmbr1.30-60** | 10.25.30-60.233/24 | Reserved expansion VLANs |

---

## **🌡️ 4. Thermal & Environmental Status**

### **4.1 CPU Temperature Profile (Idle)**

| **Sensor Location** | **Temperature** | **Status** | **Notes** |
|--------------------|----------------|------------|-----------|
| **Package ID 0** | 43.0°C | Excellent | Outstanding thermal performance |
| **Core 0** | 39.0°C | Excellent | P-core primary |
| **Core 4** | 38.0°C | Excellent | P-core secondary |
| **Core 8** | 39.0°C | Excellent | P-core tertiary |
| **Core 12** | 37.0°C | Excellent | P-core quaternary |
| **Cores 16-24** | 37.0°C - 39.0°C | Excellent | E-core cluster low thermal |
| **Cores 25-31** | 40.0°C - 44.0°C | Excellent | E-core cluster upper range |

### **4.2 Storage Thermal Monitoring**

| **NVMe Component** | **Temperature** | **Status** | **Function** |
|-------------------|----------------|------------|--------------|
| **Composite** | 50.9°C | Normal | Overall controller temperature |
| **Sensor 1** | 50.9°C | Normal | Primary storage monitoring |
| **Sensor 2** | 59.9°C | Normal | Secondary thermal zone |
| **Sensor 3** | 71.8°C | Acceptable | High-performance operation |

### **4.3 Environmental Sensors**

| **Component** | **Temperature** | **Status** |
|--------------|----------------|------------|
| **ACPI Thermal Zone** | 27.8°C | Excellent |
| **WiFi Module (mt7921)** | 48.0°C | Normal |

### **4.4 Thermal Analysis**

**Outstanding Performance:** node03 demonstrates superior thermal characteristics with Package ID 0 at only 43.0°C and individual cores ranging 37-44°C, indicating excellent cooling efficiency and thermal headroom for sustained high-performance workloads.

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

### **6.1 Performance Optimization**

| **Optimization Area** | **Status** | **Implementation** |
|----------------------|------------|-------------------|
| **Thermal Management** | Excellent | Superior cooling performance enables sustained workloads |
| **CPU Performance** | Optimized | 20-core configuration with excellent thermal headroom |
| **Storage Performance** | Good | Single NVMe configuration with enterprise-grade performance |

### **6.2 Maintenance Schedule**

| **Maintenance Type** | **Frequency** | **Focus Area** |
|---------------------|---------------|----------------|
| **Thermal Monitoring** | Continuous | Maintain excellent thermal performance |
| **Performance Analysis** | Daily | CPU utilization and thermal trending |
| **Storage Health** | Weekly | S.M.A.R.T. monitoring and wear analysis |

---

## **🔒 7. Security & Compliance**

### **7.1 Security Configuration**

**Boot Security:** EFI Secure Boot enabled providing hardware-level boot integrity validation.
**Performance Security:** Excellent thermal characteristics enable secure sustained high-performance operations.
**Network Security:** VLAN segmentation with LACP bonding for enhanced availability.

---

## **⚠️ 8. Known Issues & Limitations**

### **8.1 Current Operational Notes**

**Storage Configuration:** Single NVMe configuration provides excellent performance but lacks storage redundancy of dual-drive nodes.

**Thermal Excellence:** Outstanding thermal performance provides significant headroom for workload expansion and sustained operations.

---

## **🔗 9. Related Assets**

| **Related System** | **Relationship** | **Documentation** |
|-------------------|------------------|-------------------|
| **[node01](node01-minisforum-ms-a1-12900h.md)** | Matched i9-12900H performance peer | Hardware specifications |
| **[node02](node02-minisforum-ms-a1-12600h.md)** | Storage-optimized cluster complement | Dual-storage configuration |
| **[Cluster Overview](../README.md)** | Complete 7-node cluster architecture | Enterprise cluster management |

---

## **📊 10. Asset Management**

| **Field** | **Value** |
|-----------|-----------|
| **Asset ID** | node03-px-cluster |
| **Performance Profile** | High-compute optimized |
| **Thermal Characteristics** | Superior cooling performance |
| **Workload Specialty** | CPU-intensive virtualization |

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
Tags: node03, intel-i9-12900h, high-performance-compute, proxmox-host, thermal-optimization, enterprise-hardware
