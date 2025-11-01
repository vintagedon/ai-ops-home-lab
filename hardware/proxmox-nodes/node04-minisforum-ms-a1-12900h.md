# 🖥️ **node04 - Enterprise Proxmox Host**

**Asset Classification:** Database-Optimized Cluster Node | **Service Tier:** Production | **Location:** Rack Position 4

This knowledge base article provides comprehensive hardware specifications, configuration details, and operational status for node04, an Intel i9-12900H based Proxmox VE host serving as a database-optimized compute node hosting critical PostgreSQL services and data processing workloads in the 7-node enterprise astronomy research cluster.

---

## **🎯 1. Purpose & Role**

### **1.1 Primary Function**

node04 serves as a database-optimized compute platform hosting critical PostgreSQL databases (proj-pg01, proj-pgsql02), data processing services (proj-dp01), and repository services (proj-repo01) supporting production DESI analysis workloads and research computing operations.

### **1.2 Service Classification**

**Production Tier:** Enterprise research computing platform optimized for database operations and data processing workloads requiring stable performance, low storage temperatures, and reliable service hosting for critical research infrastructure.

### **1.3 Cluster Integration**

Database-specialized node within the 7-node cluster architecture providing critical data services, PostgreSQL hosting, and data processing capabilities with optimal thermal characteristics for sustained database operations and research computing workloads.

---

## **⚙️ 2. Hardware Specifications**

### **2.1 Compute Platform**

| **Component** | **Specification** | **Performance Characteristics** |
|---------------|------------------|--------------------------------|
| **Processor** | Intel i9-12900H (12th Gen) | 20 cores, hybrid architecture optimized for database workloads |
| **Socket Configuration** | Single socket installation | Balanced performance for sustained database operations |
| **Architecture** | Alder Lake hybrid design | Enhanced I/O performance for data processing |
| **Virtualization Support** | VT-x, VT-d enabled | Hardware-assisted virtualization with IOMMU |

### **2.2 Storage Infrastructure**

| **Storage Device** | **Specifications** | **Health Status** | **Performance Notes** |
|-------------------|-------------------|------------------|----------------------|
| **Primary NVMe** | Samsung MZ1LB1T9HALS-00007 | S.M.A.R.T.: PASSED | Enterprise-grade database storage |
| **Capacity** | 1.92 TB usable capacity | Wearout: 13% | Excellent remaining lifespan |
| **Serial Number** | S436NC0R434304 | Active monitoring | Superior storage health |
| **Partition Layout** | GPT with EFI/LVM configuration | Database-optimized | Standard enterprise configuration |

### **2.3 Storage Pool Configuration**

| **Pool Name** | **Type** | **Capacity** | **Usage** |
|--------------|----------|--------------|-----------|
| **data** | LVM Volume Group (pve) | 165.47 GiB | System and VM storage |
| **nvmethin01** | LVM Volume Group | 1.61 TiB | Database and high-performance storage |

---

## **🌐 3. Network Architecture**

### **3.1 VLAN Segmentation**

| **VLAN Interface** | **Network Range** | **Purpose** |
|-------------------|------------------|-------------|
| **vmbr0** | 10.16.207.64/24 | Management network |
| **vmbr1.10** | 10.25.10.234/24 | Management services |
| **vmbr1.20** | 10.25.20.234/24 | Project and database services |
| **vmbr1.30-60** | 10.25.30-60.234/24 | Reserved expansion VLANs |

---

## **🌡️ 4. Thermal & Environmental Status**

### **4.1 CPU Temperature Profile (Idle)**

| **Sensor Location** | **Temperature** | **Status** | **Notes** |
|--------------------|----------------|------------|-----------|
| **Package ID 0** | 47.0°C | Normal | Stable database operation temperature |
| **Core 0** | 43.0°C | Excellent | P-core primary |
| **Core 4** | 42.0°C | Excellent | P-core secondary |
| **Core 8** | 44.0°C | Excellent | P-core tertiary |
| **Core 12** | 45.0°C | Normal | P-core quaternary |
| **Core 16** | 47.0°C | Normal | E-core lead |
| **Cores 20-27** | 43.0°C | Excellent | E-core cluster excellent |
| **Cores 28-31** | 46.0°C | Normal | E-core cluster upper |

### **4.2 Storage Thermal Monitoring**

| **NVMe Component** | **Temperature** | **Status** | **Function** |
|-------------------|----------------|------------|--------------|
| **Composite** | 46.9°C | Excellent | Outstanding storage thermal performance |
| **Sensor 1** | 46.9°C | Excellent | Primary storage monitoring |
| **Sensor 2** | 54.9°C | Excellent | Secondary thermal zone |
| **Sensor 3** | 65.8°C | Good | Database workload thermal |

### **4.3 Environmental Sensors**

| **Component** | **Temperature** | **Status** |
|--------------|----------------|------------|
| **ACPI Thermal Zone** | 27.8°C | Excellent |
| **WiFi Module (mt7921)** | 40.0°C | Excellent |

### **4.4 Thermal Analysis**

**Database-Optimized Performance:** node04 demonstrates excellent thermal characteristics for database operations with outstanding NVMe thermal performance (46.9°C composite) and stable CPU temperatures ideal for sustained PostgreSQL workloads.

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

### **6.1 Critical Database Services**

| **Service** | **VM ID** | **Purpose** | **Resources** |
|-------------|-----------|-------------|---------------|
| **proj-pg01** | 2002 | Primary PostgreSQL (DESI analysis) | 8 vCPU, 48GB RAM |
| **proj-pgsql02** | 2012 | Secondary PostgreSQL cluster | 4 vCPU, 16GB RAM |
| **proj-dp01** | 2001 | Data processing workflows | 4 vCPU, 16GB RAM |
| **proj-repo01** | 2018 | Git repository services | 4 vCPU, 12GB RAM |

### **6.2 Service Integration**

**Database Focus:** Hosts critical PostgreSQL services supporting 30GB+ DESI cosmic void analysis datasets with optimized thermal characteristics for sustained database operations and research computing workloads.

---

## **🔧 7. Operational Procedures**

### **7.1 Database Operations**

| **Operation Type** | **Frequency** | **Focus Area** |
|-------------------|---------------|----------------|
| **Database Health** | Daily | PostgreSQL performance and integrity |
| **Storage Performance** | Continuous | NVMe optimization for database I/O |
| **Thermal Monitoring** | Real-time | Optimal temperature for database operations |

---

## **🔒 8. Security & Compliance**

### **8.1 Security Configuration**

**Database Security:** Enhanced security configuration for critical PostgreSQL services with systematic access control and audit capabilities.
**Storage Security:** Excellent thermal characteristics enable secure sustained database operations.

---

## **⚠️ 9. Known Issues & Limitations**

### **9.1 Current Operational Notes**

**Storage Health:** Excellent 13% wearout with outstanding thermal performance ideal for database workloads.
**Service Density:** High-density service hosting requires systematic resource monitoring and optimization.

---

## **🔗 10. Related Assets**

| **Related System** | **Relationship** | **Documentation** |
|-------------------|------------------|-------------------|
| **[node03](node03-minisforum-ms-a1-12900h.md)** | Performance-matched i9-12900H peer | High-performance configuration |
| **[node06](node06-minisforum-ms-a1-13900h.md)** | Complementary database hosting node | Database service coordination |
| **[Cluster Overview](../README.md)** | Complete 7-node cluster architecture | Enterprise cluster management |

---

## **📊 11. Asset Management**

| **Field** | **Value** |
|-----------|-----------|
| **Asset ID** | node04-px-cluster |
| **Service Profile** | Database and data processing optimized |
| **Storage Health** | Excellent (13% wearout) |
| **Workload Specialty** | PostgreSQL and repository services |

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
Tags: node04, intel-i9-12900h, database-hosting, postgresql-services, proxmox-host, enterprise-storage, thermal-optimization
