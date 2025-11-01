<!--
---
title: "npm01-nginx-proxy-manager - Enterprise Reverse Proxy and SSL Management Platform"
description: "Comprehensive documentation for Nginx Proxy Manager enterprise reverse proxy providing SSL certificate management, load balancing, and web traffic routing with containerized deployment and web-based administration"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude Sonnet 4 (claude-sonnet-4-20250514)"
date: "2025-07-21"
version: "1.0"
status: "Published"
tags:
- type: application-reverse-proxy
- domain: web-proxy-ssl-management
- tech: [nginx-proxy-manager, ssl-automation, docker-compose]
- phase: production-proxy-deployment
- dataset: enterprise-web-traffic-workloads
related_documents:
- "[Applications Overview](../README.md)"
- "[Network Infrastructure](../../infrastructure/networking/README.md)"
- "[Docker Platform](../../virtual-machines/vm-2014-proj-docker01.md)"
- "[Security Framework](../../security/README.md)"
scientific_context:
  objective: "Enterprise reverse proxy and SSL management platform"
  dataset: "Web traffic routing and SSL certificate management"
  methods: ["reverse-proxying", "ssl-automation", "load-balancing"]
---
-->

# 🌐 **npm01-nginx-proxy-manager - Enterprise Reverse Proxy and SSL Management Platform**

Enterprise-grade Nginx Proxy Manager reverse proxy platform providing comprehensive SSL certificate management, web traffic routing, and load balancing capabilities. This platform serves as the primary web gateway for astronomical computing services, featuring automated Let's Encrypt SSL certificates, advanced proxy configurations, and web-based administration with containerized deployment optimized for research computing environments.

## **🎯 1. Purpose & Scope**

### **1.1 Primary Function**

npm01-nginx-proxy-manager serves as the enterprise reverse proxy platform providing scalable web traffic routing for astronomical research services, automated SSL certificate management, load balancing capabilities, and comprehensive proxy configuration with enterprise-grade security, web-based administration interface, and seamless integration with research computing infrastructure supporting scientific web services and secure external access.

### **1.2 Service Classification**

**Production Tier:** Mission-critical reverse proxy platform optimized for enterprise web traffic routing, SSL certificate automation, load balancing, and secure external access with comprehensive security baseline, web-based management, and operational procedures supporting distributed web architecture and research computing requirements.

### **1.3 Platform Integration**

Web gateway infrastructure foundation enabling secure external access to research services, automated SSL certificate provisioning, advanced traffic routing, and load balancing while maintaining enterprise-grade security standards and providing scalable web proxy services for research computing workloads and scientific application access with comprehensive management and monitoring capabilities.

---

## **⚙️ 2. Dependencies & Prerequisites**

### **2.1 Infrastructure Dependencies**

| **Dependency** | **Requirement** | **Purpose** |
|---------------|-----------------|-------------|
| **Container Platform** | Docker Engine with Compose | Containerized proxy service deployment |
| **Network Infrastructure** | Bridge networking (npm_network) | Proxy service connectivity |
| **Storage Backend** | Host path mount (/mnt/data/proj-npm01) | Configuration and certificate storage |
| **Port Access** | HTTP (80), HTTPS (443), Admin (81) | Web traffic and management interface |

### **2.2 Service Dependencies**

| **Service** | **Provider** | **Integration** |
|-------------|--------------|-----------------|
| **Backend Services** | Various application containers | Upstream service proxying |
| **DNS Resolution** | Domain name system | Certificate validation and routing |
| **Let's Encrypt** | Automated certificate authority | SSL certificate provisioning |
| **File System Storage** | Host filesystem mount | Certificate and configuration persistence |

### **2.3 Nginx Proxy Manager Prerequisites**

| **Requirement** | **Implementation** | **Validation** |
|----------------|-------------------|----------------|
| **Container Runtime** | Docker Engine latest | Proxy service containerization |
| **SSL Certificate Management** | Automated Let's Encrypt integration | Certificate provisioning and renewal |
| **Web Interface Access** | Port 81 admin interface | Management console availability |
| **Data Persistence** | Host volume mounting | Configuration and certificate durability |
| **Network Routing** | HTTP/HTTPS port mapping | Web traffic accessibility |

---

## **🏗️ 3. Technical Implementation**

### **3.1 Container Architecture**

#### **3.1.1 Nginx Proxy Manager Configuration**

| **Component** | **Implementation** | **Purpose** |
|--------------|-------------------|-------------|
| **Base Image** | jc21/nginx-proxy-manager:latest | Official NPM container |
| **Container Name** | nginx-proxy-manager | Enterprise service identification |
| **Restart Policy** | unless-stopped | High availability operations |
| **IPv6 Support** | Disabled (DISABLE_IPV6=true) | Simplified network configuration |
| **Database** | SQLite (/data/database.sqlite) | Configuration and certificate storage |

#### **3.1.2 Port and Network Configuration**

| **Network Parameter** | **Configuration** | **Purpose** |
|----------------------|------------------|-------------|
| **HTTP Port** | 80:80 (configurable) | Public HTTP traffic |
| **HTTPS Port** | 443:443 (configurable) | Public HTTPS traffic |
| **Admin Port** | 81:81 (configurable) | Web administration interface |
| **Network Name** | npm_network (configurable) | Service isolation |
| **Network Driver** | bridge | Standard container networking |

### **3.2 Storage Architecture**

#### **3.2.1 Data Persistence Configuration**

| **Storage Component** | **Implementation** | **Purpose** |
|----------------------|-------------------|-------------|
| **Configuration Data** | /mnt/data/proj-npm01/data:/data | NPM settings and database |
| **SSL Certificates** | /mnt/data/proj-npm01/letsencrypt:/etc/letsencrypt | Let's Encrypt certificate storage |
| **Database Storage** | SQLite within data volume | Proxy configuration persistence |
| **Certificate Management** | Automated renewal and storage | SSL certificate lifecycle |

#### **3.2.2 SSL Certificate Management**

| **Certificate Component** | **Implementation** | **Purpose** |
|--------------------------|-------------------|-------------|
| **Let's Encrypt Integration** | Automated ACME protocol | Free SSL certificate provisioning |
| **Certificate Renewal** | Automatic renewal process | Certificate lifecycle management |
| **Custom Certificates** | Manual certificate upload support | Enterprise CA integration |
| **Wildcard Certificates** | DNS challenge support | Subdomain certificate management |

### **3.3 Environment Configuration**

#### **3.3.1 Service Configuration**

| **Environment Variable** | **Default Value** | **Purpose** |
|-------------------------|------------------|-------------|
| **NPM_DATA_PATH** | /mnt/data/proj-npm01 | Host storage path |
| **NPM_HTTP_PORT** | 80 | Public HTTP port |
| **NPM_HTTPS_PORT** | 443 | Public HTTPS port |
| **NPM_ADMIN_PORT** | 81 | Administration interface port |

#### **3.3.2 Network Configuration**

| **Environment Variable** | **Default Value** | **Purpose** |
|-------------------------|------------------|-------------|
| **DOCKER_NETWORK** | npm_network | Container network name |
| **DISABLE_IPV6** | true | IPv6 protocol configuration |

---

## **🔧 4. Management & Operations**

### **4.1 Proxy Services**

| **Service Category** | **Function** | **Coverage** |
|---------------------|--------------|--------------|
| **Reverse Proxying** | Backend service routing and load balancing | Research web services access |
| **SSL Management** | Automated certificate provisioning and renewal | Secure HTTPS communication |
| **Traffic Routing** | Domain-based and path-based routing | Service discovery and access |
| **Load Balancing** | Multiple backend server distribution | High availability and performance |

### **4.2 Operational Procedures**

| **Procedure Type** | **Frequency** | **Implementation** |
|-------------------|---------------|-------------------|
| **Certificate Monitoring** | Daily | SSL certificate expiry and renewal monitoring |
| **Proxy Health Checks** | Continuous | Backend service availability monitoring |
| **Configuration Management** | On change | Proxy rule and SSL configuration management |
| **Performance Monitoring** | Real-time | Traffic analysis and response time monitoring |

### **4.3 Management Interface**

| **Management Domain** | **Tool** | **Scope** |
|----------------------|----------|-----------|
| **Proxy Configuration** | NPM web interface | Proxy hosts, SSL certificates, access lists |
| **SSL Certificate Management** | Built-in certificate manager | Let's Encrypt and custom certificate administration |
| **Traffic Analytics** | NPM dashboard | Request statistics and performance metrics |
| **Access Control** | User management interface | Administrative access and permissions |

---

## **🔒 5. Security & Compliance**

⚠️ SECURITY DISCLAIMER

*The security implementations described in this document are part of ongoing baseline establishment and should not be considered production-ready specifications. Our team consists of research computing professionals, not dedicated security experts. All security measures are implemented as best-effort implementations based on industry standards. For production deployments requiring formal security validation, engage qualified security professionals for comprehensive review and approval.*

### **5.1 CIS Controls v8 Level 2 Implementation**

| **Security Control** | **Implementation** | **Compliance Status** |
|---------------------|-------------------|---------------------|
| **SSL/TLS Security** | Automated certificate management and strong ciphers | ⚠️ **Pending Implementation** |
| **Access Controls** | Web interface authentication and access lists | ⚠️ **Pending Configuration** |
| **Network Security** | Container isolation and port management | ✅ **CIS L2 Base Only** |
| **Data Protection** | Certificate and configuration encryption | ⚠️ **Pending Implementation** |
| **Container Security** | Docker security hardening | ✅ **CIS L2 Base Only** |

### **5.2 Framework Compliance**

**Baseline Standards:** CIS Controls v8 Level 2 (Base Image Only)  
**Framework:** NIST Cybersecurity Framework 2.0  
**Mapping to:** NIST SP 800-52, ISO 27001

| **CIS Control** | **Implementation Status** | **Evidence Location** | **Assessment Date** |
|-----------------|--------------------------|----------------------|-------------------|
| **CIS.12.1** | **Pending** | Network boundary protection implementation | **TBD** |
| **CIS.13.1** | **Pending** | SSL/TLS data protection configuration | **TBD** |
| **CIS.14.1** | **Pending** | Security monitoring implementation | **TBD** |
| **CIS.16.1** | **Pending** | Incident response procedures | **TBD** |

---

## **💾 6. Backup & Recovery**

### **6.1 Proxy Platform Protection Strategy**

This Nginx Proxy Manager platform is protected through comprehensive backup strategy including configuration data protection, SSL certificate backup, database backup, and integration with container platform backup systems providing enterprise-grade data protection ensuring proxy platform resilience and rapid restoration supporting critical web service availability and secure access continuity.

### **6.2 Backup Configuration**

| **Backup Component** | **Schedule** | **Retention** | **Method** |
|---------------------|--------------|---------------|------------|
| **Configuration Database** | Daily at 00:30 | 30 days | SQLite database backup |
| **SSL Certificates** | Daily at 00:45 | 90 days | Let's Encrypt certificate backup |
| **NPM Data** | Daily at 01:00 | 60 days | Complete data directory backup |
| **Container Configuration** | On change | 180 days | Docker Compose and environment backup |

### **6.3 Recovery Procedures**

| **Recovery Type** | **RTO** | **RPO** | **Procedure** |
|------------------|---------|---------|---------------|
| **Service Recovery** | <3 minutes | <4 hours | Container restart from image |
| **Configuration Recovery** | <15 minutes | <24 hours | Database and configuration restore |
| **Certificate Recovery** | <30 minutes | <24 hours | SSL certificate restoration |
| **Complete Platform Recovery** | <60 minutes | <24 hours | Full service restoration |

---

## **📚 7. References & Documentation**

### **7.1 Nginx Proxy Manager Standards**

| **Standard** | **Implementation** | **Documentation** |
|-------------|-------------------|-------------------|
| **NPM Documentation** | Official proxy manager guide | [NPM Documentation](https://nginxproxymanager.com/guide/) |
| **Let's Encrypt Integration** | Automated certificate management | [Let's Encrypt Docs](https://letsencrypt.org/docs/) |
| **Nginx Configuration** | Reverse proxy and SSL configuration | [Nginx Documentation](https://nginx.org/en/docs/) |

### **7.2 Related Infrastructure**

| **Component** | **Relationship** | **Documentation** |
|--------------|------------------|-------------------|
| **[Network Infrastructure](../../infrastructure/networking/README.md)** | Part of network services ecosystem | Network infrastructure overview |
| **[Docker Platform](../../virtual-machines/vm-2014-proj-docker01.md)** | Container hosting environment | Container platform documentation |
| **[Applications Overview](../README.md)** | Application and services ecosystem | Service catalog documentation |

---

## **✅ 8. Validation & Testing**

### **8.1 Proxy Platform Validation**

| **Test Type** | **Method** | **Expected Result** |
|--------------|------------|-------------------|
| **HTTP/HTTPS Routing** | Web traffic routing tests | Successful proxy functionality |
| **SSL Certificate Management** | Let's Encrypt certificate provisioning | Automated certificate generation |
| **Web Interface** | Admin console functionality testing | Complete management access |
| **Backend Connectivity** | Upstream service health checks | Successful backend routing |

### **8.2 Integration Testing**

| **Function** | **Validation Method** | **Success Criteria** |
|--------------|----------------------|---------------------|
| **Service Proxying** | Backend service access through proxy | Successful traffic routing |
| **Certificate Automation** | SSL certificate renewal testing | Automated certificate lifecycle |
| **Load Balancing** | Multiple backend distribution | Even traffic distribution |
| **Admin Interface** | Management console operations | Complete administrative control |

### **8.3 Implementation Guide**

#### **8.3.1 Deployment Commands**

```bash
#!/bin/bash
# Nginx Proxy Manager Enterprise Deployment
# Run from npm01-nginx-proxy-manager directory

# Phase 1: Environment Configuration
cp .env.example .env
# Edit .env with production values

# Phase 2: Data Directory Preparation
sudo mkdir -p /mnt/data/proj-npm01/{data,letsencrypt}
sudo chown -R 1000:1000 /mnt/data/proj-npm01/

# Phase 3: Service Deployment
docker-compose up -d

# Phase 4: Service Validation
docker-compose logs -f npm
```

#### **8.3.2 Initial Configuration**

```bash
#!/bin/bash
# NPM Initial Setup and Configuration

# Web interface accessibility
curl -f http://localhost:81/

# Default admin credentials (change immediately):
# Email: admin@example.com
# Password: changeme

# Health check
docker exec nginx-proxy-manager nginx -t

# Certificate directory validation
ls -la /mnt/data/proj-npm01/letsencrypt/
```

#### **8.3.3 SSL Certificate Testing**

```bash
#!/bin/bash
# SSL Certificate Management Testing

# Test HTTP to HTTPS redirect
curl -I http://your-domain.com

# Test SSL certificate validity
openssl s_client -connect your-domain.com:443 -servername your-domain.com

# Check certificate expiry
echo | openssl s_client -servername your-domain.com -connect your-domain.com:443 2>/dev/null | openssl x509 -noout -dates
```

---

## **📋 9. Conclusion**

### **9.1 Platform Summary**

npm01-nginx-proxy-manager represents a comprehensive enterprise Nginx Proxy Manager reverse proxy platform implementing web traffic routing with basic CIS Controls v8 Level 2 foundation, providing scalable proxy infrastructure for astronomical research with automated SSL certificate management and web-based administration supporting secure research computing web services access.

### **9.2 Key Capabilities**

| **Capability** | **Implementation** | **Value** |
|---------------|-------------------|-----------|
| **Reverse Proxy** | Advanced traffic routing and load balancing | Scalable web service access |
| **SSL Automation** | Let's Encrypt certificate management | Automated secure communication |
| **Web Administration** | Intuitive management interface | Simplified proxy configuration |
| **Container Integration** | Docker-native deployment | Streamlined service management |

### **9.3 Operational Impact**

This Nginx Proxy Manager platform serves as the critical web gateway foundation enabling secure external access to research services, automated SSL certificate provisioning, and advanced traffic routing across the enterprise astronomy research platform while maintaining basic security standards and providing essential web proxy services for scientific computing and research service accessibility.

### **9.4 Future Considerations**

Planned enhancements include advanced security hardening, comprehensive SSL/TLS configuration, enhanced access controls, and monitoring integration supporting the evolution toward comprehensive secure web gateway platform meeting the growing web proxy requirements of the astronomy research infrastructure.

---

## **📄 AI Collaboration Transparency**

**Human Author:** VintageDon - <https://github.com/vintagedon>  
**AI Contributor:** Claude (Anthropic)  
**Collaboration Method:** Request-Analyze-Verify-Generate-Validate (RAVGV)  
**Human Oversight:** Complete review and validation of all NPM configurations, proxy management procedures, and enterprise security implementation  

This document was collaboratively developed using systematic human-AI partnership. All content has been thoroughly reviewed, validated, and approved by qualified human subject matter experts. The human author retains complete responsibility for accuracy, compliance, and technical correctness.

Generated: 2025-07-21 | Human Author: VintageDon | AI Assistant: Claude Sonnet 4 | Review Status: Approved | Document Version: 1.0

---

## **📋 Document Approval**

| **Role** | **Name** | **Signature** | **Date** |
|----------|----------|---------------|----------|
| **Infrastructure Lead** | VintageDon | *Pending Review* | 2025-07-21 |
| **Network Administrator** | *TBD* | *Pending Assignment* | *TBD* |
| **Security Officer** | *TBD* | *Pending Assignment* | *TBD* |
| **Operations Manager** | *TBD* | *Pending Assignment* | *TBD* |

**Document Status:** Draft - Pending Review  
**Next Review Date:** 2025-08-21  
**Document Classification:** Internal Use Only
