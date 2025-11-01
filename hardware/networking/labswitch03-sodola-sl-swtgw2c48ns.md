# 🌐 **labswitch03 - Enterprise Expansion Switch**

**Asset Classification:** Storage & Expansion Infrastructure | **Service Tier:** Production | **Location:** Rack Position - Expansion Layer

This knowledge base article provides comprehensive hardware specifications, configuration details, and operational status for labswitch03, a Sodola SL-SWTGW2C48NS hybrid 4x RJ45 + 8x SFP enterprise expansion switch serving specialized high-performance connectivity for database nodes and providing network expansion capabilities for the 7-node Proxmox astronomy research cluster.

---

## **🎯 1. Purpose & Role**

### **1.1 Primary Function**

labswitch03 serves as the enterprise expansion switch providing specialized high-performance connectivity for critical database and performance nodes (node04, node06) through dedicated 10G SFP+ LACP bonding, while offering expansion capacity for future cluster growth and specialized workload requirements.

### **1.2 Service Classification**

**Production Tier:** Specialized expansion infrastructure providing enterprise-grade connectivity for high-performance database nodes and next-generation compute platforms, supporting critical PostgreSQL workloads and Intel 13th Gen performance optimization with dedicated network isolation and expansion capabilities.

### **1.3 Cluster Integration**

Expansion layer enabling specialized connectivity for flagship database and performance nodes while providing network growth capacity and alternative connectivity paths, supporting the hybrid infrastructure architecture with dedicated high-performance connections for critical enterprise services.

---

## **⚙️ 2. Hardware Specifications**

### **2.1 Network Platform**

| **Component** | **Specification** | **Performance Characteristics** |
|---------------|------------------|--------------------------------|
| **Model** | Sodola SL-SWTGW2C48NS | Enterprise hybrid expansion switch |
| **Port Configuration** | 4x RJ45 (TE1-TE4) + 8x SFP (TE5-TE12) | Flexible connectivity options |
| **RJ45 Ports** | 4x 10GBase-T | Copper-based high-speed connectivity |
| **SFP Ports** | 8x 10G SFP+ | Fiber-based enterprise connectivity |
| **Form Factor** | Enterprise rack-mount | Professional datacenter design |

### **2.2 System Information**

| **Component** | **Specification** | **Details** |
|--------------|------------------|-------------|
| **Serial Number** | 238322504090016 | Unique device identifier |
| **MAC Address** | 1C:2A:A3:1E:C2:32 | Primary management MAC |
| **Management IP** | 10.16.207.202 | Static management address |
| **System OID** | 1.3.6.1.4.1.27282.1.3 | SNMP device identification |

### **2.3 Firmware & Software**

| **Component** | **Version** | **Release Date** |
|--------------|-------------|------------------|
| **Firmware Version** | 1.1.1.28 | Sep 11 2024 - 12:44:17 |
| **HTTP Management** | Enabled | Web interface active |
| **SNMP Service** | Disabled | Monitoring not configured |

### **2.4 Environmental Monitoring**

| **Sensor** | **Reading** | **Status** | **Threshold** |
|------------|-------------|------------|---------------|
| **CPU Temperature** | 51.25°C | Normal | <70°C |
| **Chassis Temperature** | 44.25°C | Normal | <60°C |
| **PHY Temperature** | 44.25°C | Normal | <60°C |
| **Fan Speed** | FAN1: 5314 RPM | Normal | >3000 RPM |

---

## **🌐 3. Network Configuration**

### **3.1 Management Access**

| **Access Method** | **Configuration** | **Purpose** |
|------------------|------------------|-------------|
| **Web Interface** | <http://labswitch03> | Primary management access |
| **IPv4 Address** | 10.16.207.202 | Management network access |
| **System Contact** | <alerts@radioastronomy.io> | Operational contact |
| **System Location** | homelab | Physical location identifier |

### **3.2 Port Mapping - RJ45 Connections (TE1-TE4)**

| **Port** | **Status** | **Planned Use** | **Capability** |
|----------|------------|----------------|----------------|
| **TE1** | Unused | Future expansion | 10GBase-T copper |
| **TE2** | Unused | Future expansion | 10GBase-T copper |
| **TE3** | Unused | Future expansion | 10GBase-T copper |
| **TE4** | Unused | Future expansion | 10GBase-T copper |

### **3.3 Port Mapping - SFP+ Connections (TE5-TE12)**

| **Port** | **Connected Device** | **Interface** | **Purpose** |
|----------|---------------------|---------------|-------------|
| **TE5** | node04 | spf0 | Database flagship LACP pair |
| **TE6** | node04 | spf1 | Database flagship LACP pair |
| **TE7** | node06 | spf0 | Next-gen performance LACP pair |
| **TE8** | node06 | spf1 | Next-gen performance LACP pair |
| **TE9** | Unused | - | Reserved expansion |
| **TE10** | Unused | - | Reserved expansion |
| **TE11** | Unused | - | Reserved expansion |
| **TE12** | labswitch02 | Port 17 | Inter-switch uplink |

### **3.4 LACP Configuration**

| **LACP Bond** | **Ports** | **Connected Node** | **Aggregate Bandwidth** |
|---------------|-----------|-------------------|------------------------|
| **Bond 1** | TE5+TE6 | node04 (i9-12900H database) | 20 Gbps |
| **Bond 2** | TE7+TE8 | node06 (i9-13900H performance) | 20 Gbps |

---

## **🌡️ 4. Environmental & Performance Status**

### **4.1 System Status**

| **Component** | **Status** | **Performance** |
|--------------|------------|-----------------|
| **System Uptime** | 1 day, 9 hr, 45 min, 52 sec | Stable operation |
| **Management Interface** | Operational | HTTP active |
| **Port Status** | 4/12 ports active | Specialized connectivity |
| **Thermal Management** | Normal | All sensors within range |

### **4.2 Thermal Performance**

| **Component** | **Temperature** | **Status** | **Performance Notes** |
|--------------|----------------|------------|----------------------|
| **CPU** | 51.25°C | Normal | Processing within specifications |
| **Chassis** | 44.25°C | Excellent | Superior ambient thermal |
| **PHY** | 44.25°C | Excellent | Network processor optimal |
| **Cooling** | FAN1: 5314 RPM | Active | Effective thermal management |

### **4.3 Port Utilization Analysis**

| **Port Group** | **Utilization** | **Function** | **Expansion Capacity** |
|----------------|----------------|--------------|----------------------|
| **RJ45 (TE1-4)** | 0/4 ports | Reserved expansion | 4x 10GBase-T available |
| **SFP (TE5-11)** | 4/7 ports | Node connectivity | 3x 10G SFP+ available |
| **SFP (TE12)** | 1/1 port | Inter-switch uplink | Backbone connectivity |
| **Total** | 5/12 ports | Current utilization | 58% expansion capacity |

---

## **💻 5. System Configuration**

### **5.1 Management Configuration**

| **Component** | **Configuration** | **Status** |
|--------------|------------------|------------|
| **System Name** | labswitch03 | Configured |
| **Management IP** | 10.16.207.202/24 | Static assignment |
| **HTTP Service** | Enabled | Web management active |
| **SNMP Service** | Disabled | Monitoring not configured |

### **5.2 Specialized Services**

| **Service** | **Configuration** | **Purpose** |
|-------------|------------------|-------------|
| **Database Connectivity** | node04 LACP bonding | PostgreSQL performance optimization |
| **Performance Node** | node06 LACP bonding | 13th Gen Intel platform support |
| **Inter-switch Uplink** | labswitch02 connection | Distribution layer integration |
| **Expansion Capacity** | 7 unused ports | Future growth accommodation |

---

## **🔧 6. Operational Procedures**

### **6.1 Expansion Switch Management**

| **Operation Type** | **Frequency** | **Focus Area** |
|-------------------|---------------|----------------|
| **Thermal Monitoring** | Continuous | CPU, chassis, PHY temperature |
| **Port Configuration** | As needed | Expansion port activation |
| **Performance Monitoring** | Daily | Database and performance node connectivity |
| **Capacity Planning** | Monthly | Expansion port allocation |

### **6.2 Specialized Node Support**

| **Node** | **Connectivity** | **Performance Focus** |
|----------|------------------|----------------------|
| **node04** | LACP 20Gbps | PostgreSQL database optimization |
| **node06** | LACP 20Gbps | 13th Gen Intel performance platform |
| **Future Nodes** | Expansion ready | Growth accommodation |

### **6.3 Maintenance Procedures**

| **Maintenance Type** | **Schedule** | **Impact** |
|---------------------|--------------|------------|
| **Thermal Validation** | Weekly | Environmental sensor checks |
| **Firmware Updates** | Quarterly | Planned service interruption |
| **Expansion Planning** | Monthly | Capacity utilization review |

---

## **🔒 7. Security & Compliance**

### **7.1 Expansion Layer Security**

**Specialized Security:** Implements dedicated high-performance connectivity for critical database and performance nodes with isolated network paths and controlled expansion capabilities supporting secure specialized workload requirements.

### **7.2 Access Control**

| **Security Layer** | **Implementation** | **Purpose** |
|-------------------|-------------------|-------------|
| **Management Access** | HTTP authentication | Secure switch configuration |
| **Port Isolation** | Dedicated node connections | Specialized workload security |
| **Inter-switch Security** | Controlled uplink access | Distribution layer integration |

### **7.3 Monitoring Configuration**

| **Service** | **Status** | **Security Impact** |
|-------------|------------|-------------------|
| **SNMP** | Disabled | Manual monitoring required |
| **HTTP Management** | Enabled | Web-based administration |
| **Thermal Monitoring** | Hardware-based | Environmental protection |

---

## **⚠️ 8. Known Issues & Limitations**

### **8.1 Current Operational Notes**

**SNMP Monitoring:** Currently disabled, requiring manual monitoring and potential integration with enterprise monitoring systems.

**Port Utilization:** 5 of 12 ports active with significant expansion capacity available for future cluster growth.

### **8.2 Expansion Opportunities**

**Available Capacity:** 7 unused ports (4x RJ45 + 3x SFP+) provide substantial expansion capability for additional nodes or specialized services.

**Thermal Performance:** Excellent thermal characteristics with all sensors well within operational ranges support sustained high-performance operations.

---

## **🔗 9. Related Assets**

| **Related System** | **Relationship** | **Documentation** |
|-------------------|------------------|-------------------|
| **[node04](../hardware/node04-minisforum-ms-a1-12900h.md)** | Database flagship | PostgreSQL performance connectivity |
| **[node06](../hardware/node06-13900h-performance-node.md)** | Performance platform | 13th Gen Intel connectivity |
| **[labswitch02](labswitch02-mokerlink-2g16210gsm.md)** | Distribution uplink | Management layer integration |
| **[labswitch01](labswitch01-sodola-sl-swtg3c12f.md)** | Core switch | High-performance backbone |

---

## **📊 10. Asset Management**

| **Field** | **Value** |
|-----------|-----------|
| **Asset ID** | labswitch03-nx-cluster |
| **Network Classification** | Enterprise expansion layer |
| **Service Tier** | Production specialized connectivity |
| **Connectivity Type** | Hybrid RJ45/SFP+ with LACP |

---

## **📈 11. Performance Metrics**

### **11.1 Specialized Connectivity**

| **Metric** | **Specification** | **Utilization** |
|------------|------------------|-----------------|
| **Database Connectivity** | 20 Gbps LACP (node04) | Optimal PostgreSQL performance |
| **Performance Platform** | 20 Gbps LACP (node06) | 13th Gen Intel optimization |
| **Expansion Capacity** | 7 unused ports | Future growth ready |
| **Inter-switch Uplink** | 10G SFP+ to labswitch02 | Distribution integration |

### **11.2 Environmental Performance**

| **Component** | **Performance** | **Status** |
|--------------|-----------------|------------|
| **Thermal Management** | All sensors normal | Excellent cooling |
| **Fan Performance** | 5314 RPM | Optimal airflow |
| **System Uptime** | 1+ days | Stable operation |

### **11.3 Expansion Readiness**

| **Port Type** | **Available** | **Capability** | **Future Use** |
|--------------|---------------|----------------|----------------|
| **10GBase-T RJ45** | 4 ports | Copper connectivity | Node expansion |
| **10G SFP+** | 3 ports | Fiber connectivity | Specialized services |
| **Total Expansion** | 7 ports | Mixed connectivity | 58% growth capacity |

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
Tags: labswitch03, sodola-sl-swtgw2c48ns, expansion-switch, database-connectivity, performance-nodes, hybrid-ports, enterprise-expansion
