# 🖥️ **node06 - Enterprise Proxmox Host**

**Asset Classification:** Next-Gen Performance Node | **Service Tier:** Production | **Location:** Rack Position 6

This knowledge base article provides comprehensive hardware specifications, configuration details, and operational status for node06, an Intel i9-13900H based Proxmox VE host representing the next-generation performance platform hosting critical container services and high-performance computing workloads in the 7-node enterprise astronomy research cluster.

---

## **🎯 1. Purpose & Role**

### **1.1 Primary Function**

node06 serves as the next-generation performance platform featuring Intel 13th Gen i9-13900H processor hosting critical container services (proj-docker01), primary PostgreSQL databases (proj-pg01), and high-performance computing workloads requiring maximum CPU performance and advanced processing capabilities.

### **1.2 Service Classification**

**Production Tier:** Next-generation enterprise research computing platform optimized for maximum CPU performance, container orchestration, and high-throughput computing workloads requiring cutting-edge processor architecture and sustained performance capabilities.

### **1.3 Cluster Integration**

Performance flagship node within the 7-node cluster architecture providing next-generation compute capabilities, critical service hosting, and advanced processing power with Intel 13th Gen architecture for enhanced performance and research computing leadership.

---

## **⚙️ 2. Hardware Specifications**

### **2.1 Compute Platform**

| **Component** | **Specification** | **Performance Characteristics** |
|---------------|------------------|--------------------------------|
| **Processor** | Intel i9-13900H (13th Gen) | 20 cores, next-generation Raptor Lake architecture |
| **Socket Configuration** | Single socket installation | Maximum performance for enterprise virtualization |
| **Architecture** | Raptor Lake hybrid design | Enhanced performance and efficiency cores |
| **Virtualization Support** | VT-x, VT-d enabled | Hardware-assisted virtualization with IOMMU |

### **2.2 Storage Infrastructure**

| **Storage Device** | **Specifications** | **Health Status** | **Performance Notes** |
|-------------------|-------------------|------------------|----------------------|
| **Primary NVMe** | Samsung MZ1LB1T9HALS-00007 | S.M.A.R.T.: PASSED | Enterprise-grade performance |
| **Capacity** | 1.92 TB usable capacity | Wearout: 13% | Excellent remaining lifespan |
| **Serial Number** | S436NC0R434152 | Active monitoring | Superior storage health |
| **Partition Layout** | GPT with EFI/LVM configuration | Performance-optimized | Standard enterprise configuration |

### **2.3 Storage Pool Configuration**

| **Pool Name** | **Type** | **Capacity** | **Usage** |
|--------------|----------|--------------|-----------|
| **data** | LVM Volume Group (pve) | 165.47 GiB | System and VM storage |
| **nvmethin01** | LVM Volume Group | 1.61 TiB | High-performance VM and container storage |

---

## **🌐 3. Network Architecture**

### **3.1 VLAN Segmentation**

| **VLAN Interface** | **Network Range** | **Purpose** |
|-------------------|------------------|-------------|
| **vmbr0** | 10.16.207.66/24 | Management network |
| **vmbr1.10** | 10.25.10.236/24 | Management services |
| **vmbr1.20** | 10.25.20.236/24 | Project and container services |
| **vmbr1.30-60** | 10.25.30-60.236/24 | Reserved expansion VLANs |

---

## **🌡️ 4. Thermal & Environmental Status**

### **4.1 CPU Temperature Profile (Idle)**

| **Sensor Location** | **Temperature** | **Status** | **Notes** |
|--------------------|----------------|------------|-----------|
| **Package ID 0** | 46.0°C | Normal | 13th Gen thermal performance |
| **Core 0** | 41.0°C | Excellent | P-core primary |
| **Core 4** | 43.0°C | Excellent | P-core secondary |
| **Core 8** | 41.0°C | Excellent | P-core tertiary |
| **Core 12** | 41.0°C | Excellent | P-core quaternary |
| **Core 16** | 40.0°C | Excellent | P-core additional |
| **Core 20** | 42.0°C | Excellent | P-core enhanced |
| **Cores 24-31** | 43.0°C - 45.0°C | Excellent | E-core cluster performance |

### **4.2 Storage Thermal Monitoring**

| **NVMe Component** | **Temperature** | **Status** | **Function** |
|-------------------|----------------|------------|--------------|
| **Composite** | 48.9°C | Excellent | Outstanding storage thermal |
| **Sensor 1** | 48.9°C | Excellent | Primary storage monitoring |
| **Sensor 2** | 55.9°C | Excellent | Secondary thermal zone |
| **Sensor 3** | 64.8°C | Good | Container workload thermal |

### **4.3 Environmental Sensors**

| **Component** | **Temperature** | **Status** |
|--------------|----------------|------------|
| **ACPI Thermal Zone** | 27.8°C | Excellent |
| **WiFi Module (mt7921)** | 44.0°C | Normal |

### **4.4 Thermal Analysis**

**Next-Gen Performance:** node06 demonstrates excellent thermal characteristics for 13th Gen Intel architecture with outstanding NVMe thermal performance (48.9°C composite) and stable CPU temperatures ideal for sustained high-performance computing workloads.

---

## **💻 5. System Configuration**

### **5.1 Operating System & Kernel**

| **Component** | **Version** | **Status** |
|--------------|-------------|------------|
| **Proxmox VE** | pve-manager/8.4.5/57892e8e6cb35b | Current enterprise release |
| **Linux Kernel** | 6.8.12-12-pve (2025-07-14T13:20Z) | Latest stable kernel |
| **Boot Mode** | EFI with Secure Boot enabled | Enhanced security configuration |

---

## **🐳 6. Hosted Services**

### **6.1 Critical Performance Services**

| **Service** | **VM ID** | **Purpose** | **Resources** |
|-------------|-----------|-------------|---------------|
| **proj-pg01** | 2002 | Primary PostgreSQL (DESI analysis) | 8 vCPU, 48GB RAM, 250GB storage |
| **proj-docker01** | 2014 | Container orchestration services | 6 vCPU, 32GB RAM, 100GB storage |

### **6.2 Service Integration**

**Performance Focus:** Hosts critical high-performance services leveraging 13th Gen Intel architecture for maximum container orchestration performance and PostgreSQL database operations supporting production DESI research workloads.

---

## **🔧 7. Operational Procedures**

### **7.1 Performance Management**

| **Operation Type** | **Frequency** | **Focus Area** |
|-------------------|---------------|----------------|
| **CPU Performance** | Continuous | 13th Gen architecture optimization |
| **Container Operations** | Daily | Docker service performance and orchestration |
| **Database Performance** | Daily | PostgreSQL optimization and monitoring |

### **7.2 Next-Gen Monitoring**

**Architecture Advantage:** 13th Gen Intel i9-13900H provides enhanced performance capabilities requiring specialized monitoring for optimal utilization of advanced processor features.

---

## **🔒 8. Security & Compliance**

### **8.1 Security Configuration**

**Next-Gen Security:** Enhanced security features of 13th Gen Intel architecture with EFI Secure Boot and advanced virtualization security for critical container and database services.

---

## **⚠️ 9. Known Issues & Limitations**

### **9.1 Current Operational Notes**

**Architecture Advantage:** 13th Gen Intel architecture provides superior performance characteristics compared to 12th Gen nodes in cluster.

**Service Optimization:** Critical service hosting requires systematic performance monitoring to fully leverage next-generation processor capabilities.

---

## **🔗 10. Related Assets**

| **Related System** | **Relationship** | **Documentation** |
|-------------------|------------------|-------------------|
| **[node07](node07-whitebox-gpu-node-5950x.md)** | AMD GPU node complement | GPU computing coordination |
| **[node04](node04-minisforum-ms-a1-12900h.md)** | Database service coordination peer | PostgreSQL service distribution |
| **[Cluster Overview](../README.md)** | Complete 7-node cluster architecture | Enterprise cluster management |

---

## **📊 11. Asset Management**

| **Field** | **Value** |
|-----------|-----------|
| **Asset ID** | node06-px-cluster |
| **Performance Profile** | Next-generation 13th Gen Intel |
| **Architecture** | Raptor Lake hybrid (20 cores) |
| **Service Specialty** | Container orchestration and databases |

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
Tags: node06, intel-i9-13900h, 13th-gen-performance, container-services, proxmox-host, next-generation, raptor-lake
