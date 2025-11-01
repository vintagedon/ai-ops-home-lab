<!--
---
title: "Portainer Container Management"
description: "Portainer Enterprise Edition deployment for centralized Docker and Kubernetes management across the Proxmox Astronomy Lab infrastructure"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude 4 Sonnet (claude-4-sonnet-20250514)"
date: "2025-07-23"
version: "1.0"
status: "Published"
tags:
- type: directory-overview
- domain: container-orchestration
- tech: portainer-ee
- tech: docker-management
- tech: kubernetes-management
- phase: phase-1
related_documents:
- "[Automation and Orchestration](../README.md)"
- "[Applications and Services](../../applications-and-services/README.md)"
- "[Infrastructure](../../infrastructure/README.md)"
- "[Monitoring](../../monitoring/README.md)"
---
-->

# 🐳 **Portainer Container Management**

Portainer Enterprise Edition deployment for centralized Docker and Kubernetes container management across the Proxmox Astronomy Lab infrastructure, providing unified orchestration and monitoring capabilities.

## **Overview**

This directory documents the Portainer Enterprise Edition deployment on port01, serving as the central container orchestration platform for our astronomical computing infrastructure. Portainer provides unified management of Docker containers and Kubernetes clusters, enabling efficient deployment and monitoring of research applications and infrastructure services.

**Deployment Host**: port01 (dedicated container management node)  
**Access**: HTTPS on port 9443, TCP on port 8000 for edge agent communication  
**Architecture**: Portainer Enterprise Edition with Docker socket access and persistent data storage

## **🚀 Installation and Configuration**

### **Initial System Setup**

The installation follows the standard Portainer deployment procedure with Docker Engine:

```bash
# Install Docker Engine using official script
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Create host monitoring directory structure
mkdir -p /opt/docker/host-monitoring
cd /opt/docker/host-monitoring/

# Deploy host monitoring stack (optional)
# docker-compose.yml for system monitoring integration
docker compose up -d
```

### **Portainer Enterprise Deployment**

```bash
# Create persistent data volume for Portainer configuration
docker volume create portainer_data

# Deploy Portainer Enterprise Edition with full capabilities
docker run -d \
  -p 8000:8000 \
  -p 9443:9443 \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ee:lts
```

## **🏗️ Architecture and Components**

### **Core Infrastructure**

- **Portainer Server**: Enterprise Edition providing advanced management capabilities
- **Docker Socket Access**: Direct Docker daemon communication for container management
- **Persistent Storage**: Dedicated volume for configuration, users, and application state
- **Network Configuration**: HTTPS management interface and edge agent communication

### **Port Configuration**

| **Port** | **Protocol** | **Purpose** | **Access** |
|----------|-------------|-------------|------------|
| **9443** | HTTPS | Primary management interface | Web UI, API access |
| **8000** | TCP | Edge agent communication | Agent connectivity |

### **Storage Architecture**

- **portainer_data Volume**: Persistent storage for all Portainer configuration and state
- **Docker Socket Mount**: Read/write access to host Docker daemon for container management
- **Host Monitoring**: Optional monitoring stack for system observability integration

## **🔧 Management Capabilities**

### **Container Orchestration**

- **Docker Management**: Complete lifecycle management of Docker containers and services
- **Kubernetes Integration**: RKE2 cluster management and workload deployment
- **Stack Deployment**: Docker Compose stack management and template deployment
- **Image Management**: Container image repository integration and deployment workflows

### **Multi-Environment Support**

- **Local Docker**: Direct management of port01 Docker environment
- **Remote Endpoints**: Edge agent deployment for distributed container management
- **Kubernetes Clusters**: RKE2 cluster integration for hybrid container/VM workloads
- **Environment Isolation**: Separate management contexts for development and production

### **Enterprise Features**

- **Role-Based Access Control**: User and team management with granular permissions
- **Registry Integration**: Private container registry support and image scanning
- **Application Templates**: Pre-configured templates for astronomical research applications
- **Monitoring Integration**: Container and cluster monitoring with alerting capabilities

## **🎯 Use Cases in Astronomical Research**

### **Research Application Deployment**

- **DESI Analysis Containers**: Deployment of containerized astronomical analysis workflows
- **Database Services**: PostgreSQL, MongoDB, and vector database container management
- **AI/ML Workloads**: GPU-enabled container deployment for machine learning pipelines
- **Development Environments**: Rapid deployment of research development containers

### **Infrastructure Service Management**

- **Monitoring Stack**: Prometheus, Grafana, and logging infrastructure containers
- **Reverse Proxy**: Nginx Proxy Manager and SSL certificate management
- **Authentication Services**: Identity and access management container deployment
- **Backup Services**: Automated backup container scheduling and management

## **🔐 Security and Access Control**

### **Authentication and Authorization**

- **Enterprise RBAC**: Role-based access control with team and user management
- **Local Authentication**: Portainer-managed user accounts and permissions
- **External Integration**: LDAP/Active Directory integration for centralized authentication
- **API Security**: Secure API access with token-based authentication

### **Container Security**

- **Docker Socket Security**: Controlled access to Docker daemon with monitoring
- **Network Isolation**: Container network segmentation and security policies
- **Image Security**: Container image scanning and vulnerability assessment
- **Compliance Controls**: Security policy enforcement and audit logging

## **📊 Integration with Lab Infrastructure**

### **Container Platform Integration**

| **Service** | **Integration** | **Management** |
|-------------|----------------|----------------|
| **[Applications and Services](../../applications-and-services/README.md)** | Direct deployment and management of all containerized research applications | Stack templates, container lifecycle |
| **[RKE2 Kubernetes](../../infrastructure/k8s/README.md)** | Kubernetes cluster management and workload deployment | Cluster connectivity, namespace management |
| **[Monitoring](../../monitoring/README.md)** | Container and cluster monitoring with observability integration | Metrics collection, alert management |
| **[Security](../../security/README.md)** | Container security controls and compliance validation | RBAC, network policies, audit logging |

### **Operational Workflows**

- **Research Deployment**: Streamlined deployment of astronomical research containers
- **Infrastructure Management**: Centralized management of platform services
- **Development Workflows**: Rapid development environment provisioning
- **Production Operations**: Controlled deployment with rollback capabilities

## **🚀 Getting Started**

### **Initial Access**

1. **Web Interface**: Navigate to `https://port01:9443` for Portainer management
2. **Initial Setup**: Complete administrator account creation and license activation
3. **Environment Configuration**: Connect Docker environments and Kubernetes clusters
4. **User Management**: Configure teams, users, and access control policies

### **Common Operations**

- **Stack Deployment**: Deploy Docker Compose stacks for research applications
- **Container Management**: Start, stop, and monitor container lifecycle
- **Image Management**: Pull, build, and deploy container images
- **Monitoring Integration**: Configure container and cluster monitoring

## **🔗 Related Resources**

- **[Portainer Documentation](https://docs.portainer.io/)** - Official Portainer Enterprise documentation
- **[Docker Compose Reference](https://docs.docker.com/compose/)** - Docker Compose stack deployment
- **[Kubernetes Management](https://kubernetes.io/docs/)** - Kubernetes cluster management

---

**Status**: Phase 1 - Production Portainer Enterprise deployment with Docker and Kubernetes management  
**Access**: `https://port01:9443` (HTTPS management interface)  
**Capabilities**: Container orchestration, stack deployment, multi-environment management
