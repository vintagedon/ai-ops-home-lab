# 🚀 **node07 - Enterprise GPU Computing Platform**

**Asset Classification:** Flagship GPU Workstation | **Service Tier:** Production | **Location:** Rack Position 7

This knowledge base article provides comprehensive hardware specifications, configuration details, and operational status for node07, a custom whitebox AMD Ryzen 9 5950X based Proxmox VE host featuring enterprise GPU acceleration, representing the flagship high-performance computing platform for AI/ML workloads, distributed training, and GPU-accelerated astronomical analysis in the 7-node enterprise astronomy research cluster.

---

## **🎯 1. Purpose & Role**

### **1.1 Primary Function**

node07 serves as the flagship GPU computing platform featuring AMD Ryzen 9 5950X 16-core processor with dedicated RTX A4000 GPU acceleration hosting critical machine learning workloads (proj-gpu01), distributed training infrastructure, and high-performance computing applications requiring CUDA acceleration and enterprise-grade GPU processing capabilities.

### **1.2 Service Classification**

**Production Tier:** Enterprise flagship computing platform optimized for GPU-accelerated workloads, AI/ML inference and training, distributed computing, and high-throughput astronomical analysis requiring enterprise GPU capabilities and maximum parallel processing performance.

### **1.3 Cluster Integration**

GPU flagship node within the 7-node cluster architecture providing enterprise GPU acceleration, distributed ML capabilities, and high-performance computing leadership with RTX A4000 professional graphics for enhanced AI/ML performance and research computing excellence.

---

## **⚙️ 2. Hardware Specifications**

### **2.1 Compute Platform**

| **Component** | **Specification** | **Performance Characteristics** |
|---------------|------------------|--------------------------------|
| **Processor** | AMD Ryzen 9 5950X (32 logical, 16 physical cores) | Enterprise-grade Zen 3 architecture |
| **Socket Configuration** | Single AM4 socket installation | Maximum performance for virtualization and ML |
| **Architecture** | Zen 3 with 7nm process technology | Superior IPC and parallel processing |
| **Virtualization Support** | AMD-V, IOMMU enabled | Hardware-assisted virtualization with GPU passthrough |

### **2.2 Enterprise Cooling System**

| **Component** | **Specification** | **Performance Notes** |
|---------------|------------------|----------------------|
| **CPU Cooler** | 360mm AIO Liquid Cooling System | Enterprise-grade thermal management |
| **Case** | ASUS Prime AP201 33L MicroATX White | Tool-free access, mesh optimization |
| **Airflow** | Quasi-Filter mesh with 360mm cooler support | Maximum thermal efficiency |
| **GPU Cooling** | RTX A4000 professional cooling (41% fan idle) | Optimal GPU thermal performance |

### **2.3 Storage Infrastructure**

| **Storage Device** | **Specifications** | **Health Status** | **Performance Notes** |
|-------------------|-------------------|------------------|----------------------|
| **Primary NVMe** | Fanxiang S660 4TB | S.M.A.R.T.: PASSED | High-capacity enterprise storage |
| **Capacity** | 4.00 TB usable capacity | Wearout: 3% | Excellent remaining lifespan |
| **Additional SSD** | Crucial CT525MX300SSD1 525GB | S.M.A.R.T.: PASSED | Secondary storage tier |
| **Partition Layout** | GPT with EFI/LVM configuration | Performance-optimized | Enterprise storage architecture |

### **2.4 Storage Pool Configuration**

| **Pool Name** | **Type** | **Capacity** | **Usage** |
|--------------|----------|--------------|-----------|
| **data** | LVM Volume Group (pve) | 165.47 GiB | System and VM storage |
| **nvmethin01** | LVM Volume Group | 3.69 TiB | High-performance GPU workload storage |

### **2.5 GPU Acceleration Platform**

| **Component** | **Specification** | **Capabilities** |
|--------------|------------------|------------------|
| **Graphics Card** | RTX A4000 Professional GPU | Enterprise ML/AI acceleration |
| **CUDA Cores** | Professional-grade compute units | Parallel processing optimization |
| **Memory** | Enterprise GPU memory | High-bandwidth ML operations |
| **Thermal Profile** | 38°C idle @ 41% fan speed | Excellent thermal characteristics |

---

## **🌐 3. Network Architecture**

### **3.1 Advanced Network Configuration**

| **Interface** | **Configuration** | **Purpose** |
|--------------|------------------|-------------|
| **bond0** | LACP (802.3ad) aggregation | High-bandwidth GPU data movement |
| **Ports** | spf0 + spf1 bonded | Redundant enterprise connectivity |
| **vmbr0** | 10.16.207.67/24 | Management network |
| **vmbr1** | Bonded bridge | High-performance data network |

### **3.2 VLAN Segmentation**

| **VLAN Interface** | **Network Range** | **Purpose** |
|-------------------|------------------|-------------|
| **vmbr1.10** | 10.25.10.237/24 | Management services |
| **vmbr1.20** | 10.25.20.237/24 | GPU workload and ML services |
| **vmbr1.30-60** | 10.25.30-60.237/24 | Reserved GPU acceleration VLANs |

---

## **🌡️ 4. Thermal & Environmental Status**

### **4.1 CPU Temperature Profile (Idle)**

| **Sensor Zone** | **Temperature** | **Status** | **Architecture Notes** |
|----------------|----------------|------------|----------------------|
| **Tctl (Control)** | 35.5°C | Excellent | Superior AIO cooling performance |
| **Tccd1 (Die 1)** | 39.0°C | Excellent | Zen 3 CCD thermal efficiency |
| **Tccd2 (Die 2)** | 31.0°C | Outstanding | Balanced die temperatures |

### **4.2 Enterprise Storage Thermal Monitoring**

| **NVMe Component** | **Temperature** | **Status** | **Function** |
|-------------------|----------------|------------|--------------|
| **Primary NVMe Composite** | 37.9°C | Outstanding | Exceptional 4TB storage thermal |
| **Sensor 1** | 37.9°C | Outstanding | Primary thermal monitoring |

### **4.3 GPU Thermal Performance**

| **GPU Component** | **Temperature** | **Fan Speed** | **Status** |
|------------------|----------------|---------------|------------|
| **RTX A4000 Idle** | 38.0°C | 41% | Excellent professional GPU cooling |

### **4.4 Network Hardware Thermal**

| **Component** | **Temperature** | **Status** | **Function** |
|--------------|----------------|------------|--------------|
| **MLX5 Port 0** | 86.0°C | Normal | Enterprise network adapter |
| **MLX5 Port 1** | 86.0°C | Normal | Bonded high-performance networking |

### **4.5 Environmental Sensors**

| **Component** | **Temperature** | **Status** |
|--------------|----------------|------------|
| **ACPI Zone 1** | 16.8°C | Excellent |
| **ACPI Zone 2** | 16.8°C | Excellent |
| **Gigabyte System Sensors** | 24.0°C - 61.0°C | Normal |

### **4.6 Thermal Analysis**

**Enterprise Cooling Excellence:** node07 demonstrates exceptional thermal characteristics with outstanding 360mm AIO performance (35.5°C Tctl), superior 4TB NVMe cooling (37.9°C), and optimal RTX A4000 thermal management (38°C @ 41% fan), ideal for sustained GPU-accelerated workloads.

---

## **💻 5. System Configuration**

### **5.1 Operating System & Kernel**

| **Component** | **Version** | **Status** |
|--------------|-------------|------------|
| **Proxmox VE** | pve-manager/8.4.5/57892e8e6cb35b | Current enterprise release |
| **Linux Kernel** | 6.8.12-12-pve (2025-07-14T13:20Z) | Latest stable kernel |
| **Boot Mode** | EFI with Secure Boot enabled | Enhanced security configuration |

---

## **🎮 6. Hosted Services**

### **6.1 Critical GPU Services**

| **Service** | **VM ID** | **Purpose** | **Resources** |
|-------------|-----------|-------------|---------------|
| **proj-gpu01** | 2005 | Primary GPU workstation (ML/AI) | 16 vCPU, 64GB RAM, 1.95TB storage |

### **6.2 GPU Service Integration**

**AI/ML Focus:** Hosts critical GPU-accelerated services leveraging RTX A4000 professional graphics for maximum machine learning performance, distributed training operations, and astronomical analysis requiring CUDA acceleration and enterprise GPU capabilities.

### **6.3 PCI Passthrough Configuration**

| **Device** | **Type** | **Assignment** | **Purpose** |
|------------|----------|----------------|-------------|
| **RTX A4000** | GPU passthrough | proj-gpu01 VM | Dedicated GPU acceleration |
| **Device ID** | 00000800.0 | PCI passthrough enabled | Native GPU performance |

---

## **🔧 7. Operational Procedures**

### **7.1 GPU Performance Management**

| **Operation Type** | **Frequency** | **Focus Area** |
|-------------------|---------------|----------------|
| **GPU Utilization** | Continuous | RTX A4000 workload optimization |
| **ML Workload Management** | Daily | Training and inference performance |
| **Thermal Management** | Continuous | AIO and GPU cooling optimization |
| **Storage Performance** | Daily | 4TB NVMe and GPU workload I/O |

### **7.2 Enterprise GPU Monitoring**

**Professional GPU Advantage:** RTX A4000 provides enterprise-grade compute capabilities requiring specialized monitoring for optimal utilization of professional graphics features and ML acceleration.

### **7.3 Maintenance Procedures**

| **Maintenance Type** | **Schedule** | **Procedure** |
|--------------------|--------------|---------------|
| **GPU Maintenance** | Weekly | RTX A4000 performance and thermal validation |
| **AIO System Check** | Monthly | 360mm cooling system inspection |
| **Storage Validation** | Weekly | 4TB NVMe health and performance monitoring |

---

## **🔒 8. Security & Compliance**

### **8.1 Enterprise GPU Security**

**Professional GPU Security:** Enhanced security features of RTX A4000 professional graphics with EFI Secure Boot and enterprise-grade PCI passthrough security for critical ML and AI workloads requiring professional GPU acceleration.

### **8.2 Access Control**

| **Security Layer** | **Implementation** | **Purpose** |
|-------------------|-------------------|-------------|
| **GPU Access Control** | VM-based PCI passthrough | Isolated GPU acceleration |
| **Network Segmentation** | VLAN 20 isolation | Secure GPU workload networking |
| **Storage Encryption** | Enterprise NVMe security | Protected GPU workload data |

---

## **⚠️ 9. Known Issues & Limitations**

### **9.1 Current Operational Notes**

**GPU Optimization Opportunity:** RTX A4000 professional capabilities provide extensive optimization opportunities requiring systematic ML workload profiling to fully leverage enterprise GPU features.

**Storage Performance:** 4TB NVMe provides exceptional capacity for GPU workloads requiring large dataset storage and high-performance ML operations.

### **9.2 Future Enhancement Opportunities**

**Multi-GPU Scaling:** Platform architecture supports future multi-GPU expansion for enhanced distributed training and parallel ML inference capabilities.

---

## **🔗 10. Related Assets**

| **Related System** | **Relationship** | **Documentation** |
|-------------------|------------------|-------------------|
| **[node06](node06-13900h-performance-node.md)** | Intel performance complement | CPU/GPU coordination |
| **[node04](node04-minisforum-ms-a1-12900h.md)** | Database service coordination | PostgreSQL ML integration |
| **[Cluster Overview](../README.md)** | Complete 7-node cluster architecture | Enterprise cluster management |

---

## **📊 11. Asset Management**

| **Field** | **Value** |
|-----------|-----------|
| **Asset ID** | node07-px-cluster |
| **Performance Profile** | Enterprise GPU flagship platform |
| **Architecture** | AMD Zen 3 + RTX A4000 professional |
| **Service Specialty** | AI/ML acceleration and GPU computing |

---

## **📈 12. Performance Characteristics**

### **12.1 Compute Performance**

| **Metric** | **Specification** | **Capability** |
|------------|------------------|----------------|
| **CPU Cores** | 16 physical / 32 logical | Maximum parallel processing |
| **GPU Compute** | RTX A4000 professional | Enterprise ML acceleration |
| **Memory Bandwidth** | High-speed DDR4 | Optimal GPU-CPU coordination |
| **Storage Throughput** | 4TB NVMe performance | Large ML dataset operations |

### **12.2 Thermal Efficiency**

| **Component** | **Idle Performance** | **Efficiency Rating** |
|--------------|---------------------|----------------------|
| **CPU (AIO)** | 35.5°C Tctl | Outstanding |
| **GPU** | 38°C @ 41% fan | Excellent |
| **Storage** | 37.9°C NVMe | Exceptional |
| **Overall** | Superior thermal management | Enterprise-grade |

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
Tags: node07, amd-ryzen-9-5950x, rtx-a4000, gpu-computing, enterprise-ml, whitebox-build, 360mm-aio, proxmox-host, flagship-node
