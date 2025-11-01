<!--
---
title: "Applications and Services"
description: "Containerized application stack and service deployments supporting astronomical research and infrastructure operations in the Proxmox Astronomy Lab"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude 4 Sonnet (claude-4-sonnet-20250514)"
date: "2025-07-23"
version: "1.0"
status: "Published"
tags:
- type: directory-overview
- domain: containerized-applications
- tech: docker-compose
- tech: portainer
- tech: microservices
- phase: phase-1
related_documents:
- "[Main Repository](../README.md)"
- "[Infrastructure](../infrastructure/README.md)"
- "[Monitoring](../monitoring/README.md)"
- "[AI and Machine Learning](../ai-and-machine-learning/README.md)"
---
-->

# 🚀 **Applications and Services**

Containerized application stack and service deployments supporting astronomical research workflows, data management, and infrastructure operations across the Proxmox Astronomy Lab.

## **Overview**

This directory contains the complete containerized application ecosystem that powers our astronomical research infrastructure. Each service is deployed using Docker Compose with standardized configurations, enabling scalable, maintainable, and portable deployments across our hybrid Kubernetes and VM architecture.

**Architecture**: Microservices-based application stack deployed via Portainer and Docker Compose, providing specialized services for astronomical data processing, research collaboration, database management, and infrastructure operations.

## **📂 Service Catalog**

This section provides systematic navigation to all containerized services, organized by functional category.

### **Research and Collaboration Services**

| **Service** | **Purpose** | **Documentation** |
|-------------|-------------|-------------------|
| **[chat01-openwebui](chat01-openwebui/)** | AI-powered research assistant and conversational interface | [chat01-openwebui/README.md](chat01-openwebui/README.md) |
| **[gitea01-project-repository](gitea01-project-repository/)** | Git repository management and collaborative development platform | [gitea01-project-repository/README.md](gitea01-project-repository/README.md) |
| **[sema01-project-semaphore-instance](sema01-project-semaphore-instance/)** | Ansible automation and infrastructure orchestration platform | [sema01-project-semaphore-instance/README.md](sema01-project-semaphore-instance/README.md) |

### **Database and Data Management Services**

| **Service** | **Purpose** | **Documentation** |
|-------------|-------------|-------------------|
| **[pgsql01-project-workloads](pgsql01-project-workloads/)** | Primary PostgreSQL database for DESI research workloads | [pgsql01-project-workloads/README.md](pgsql01-project-workloads/README.md) |
| **[pgsql02-project-general-workloads](pgsql02-project-general-workloads/)** | Secondary PostgreSQL database for general research and testing | [pgsql02-project-general-workloads/README.md](pgsql02-project-general-workloads/README.md) |
| **[pgadmin01-web-database-interface](pgadmin01-web-database-interface/)** | Web-based PostgreSQL administration and query interface | [pgadmin01-web-database-interface/README.md](pgadmin01-web-database-interface/README.md) |
| **[mongo01-document-database](mongo01-document-database/)** | MongoDB document database for flexible data storage | [mongo01-document-database/README.md](mongo01-document-database/README.md) |

### **AI/ML and Vector Database Services**

| **Service** | **Purpose** | **Documentation** |
|-------------|-------------|-------------------|
| **[milvus01-attu-milvus-backup](milvus01-attu-milvus-backup/)** | Milvus vector database with Attu management interface | [milvus01-attu-milvus-backup/README.md](milvus01-attu-milvus-backup/README.md) |
| **[neo4j01-graph-database](neo4j01-graph-database/)** | Neo4j graph database for knowledge graphs and relationship modeling | [neo4j01-graph-database/README.md](neo4j01-graph-database/README.md) |
| **[dragonflydb01-dragonflydb](dragonflydb01-dragonflydb/)** | High-performance Redis-compatible in-memory database | [dragonflydb01-dragonflydb/README.md](dragonflydb01-dragonflydb/README.md) |
| **[rcom01-redis-commander-for-dragonflydb](rcom01-redis-commander-for-dragonflydb/)** | Web interface for DragonflyDB management and monitoring | [rcom01-redis-commander-for-dragonflydb/README.md](rcom01-redis-commander-for-dragonflydb/README.md) |

### **Infrastructure and Security Services**

| **Service** | **Purpose** | **Documentation** |
|-------------|-------------|-------------------|
| **[npm01-nginx-proxy-manager](npm01-nginx-proxy-manager/)** | Reverse proxy and SSL certificate management | [npm01-nginx-proxy-manager/README.md](npm01-nginx-proxy-manager/README.md) |
| **[vw01-vaultwarden-password-repository](vw01-vaultwarden-password-repository/)** | Self-hosted password management and secure credential storage | [vw01-vaultwarden-password-repository/README.md](vw01-vaultwarden-password-repository/README.md) |

## **🏗️ Deployment Architecture**

### **Container Orchestration**

- **Portainer Management**: Centralized container lifecycle management and monitoring
- **Docker Compose**: Standardized service definitions with environment-specific configurations
- **Network Isolation**: Secure inter-service communication with dedicated Docker networks
- **Volume Management**: Persistent storage with backup integration and data protection

### **Service Integration Patterns**

- **Database Connectivity**: Optimized connection pooling and performance tuning for astronomical workloads
- **Authentication**: Centralized identity management and single sign-on capabilities
- **Monitoring Integration**: Comprehensive observability with Prometheus metrics and log aggregation
- **Security Controls**: Network policies, secret management, and access control enforcement

## **🔧 Service Categories**

### **Research Platform Services**

Core services enabling astronomical research workflows:

- **Data Processing**: PostgreSQL databases optimized for DESI survey data
- **Collaboration**: Git repositories and AI-assisted research interfaces
- **Analysis**: Vector and graph databases supporting advanced analytics

### **Infrastructure Services**

Platform services supporting reliable operations:

- **Automation**: Ansible orchestration and infrastructure as code
- **Security**: Password management and reverse proxy with SSL termination
- **Administration**: Database management interfaces and monitoring dashboards

### **AI/ML Services**

Specialized services for machine learning and knowledge discovery:

- **Vector Search**: Milvus for similarity search and embedding operations
- **Graph Analytics**: Neo4j for relationship modeling and complex queries
- **Caching**: High-performance in-memory storage for ML pipelines

## **🔗 Integration Points**

This section establishes relationships with broader lab infrastructure.

| **System** | **Relationship** | **Documentation** |
|------------|------------------|-------------------|
| **[Infrastructure](../infrastructure/README.md)** | Underlying VM and network infrastructure hosting containerized services | [../infrastructure/README.md](../infrastructure/README.md) |
| **[AI/ML Platform](../ai-and-machine-learning/README.md)** | Vector and graph database integration with AI workflows | [../ai-and-machine-learning/README.md](../ai-and-machine-learning/README.md) |
| **[Monitoring](../monitoring/README.md)** | Service health monitoring and performance metrics collection | [../monitoring/README.md](../monitoring/README.md) |
| **[Security](../security/README.md)** | Service security controls and compliance validation | [../security/README.md](../security/README.md) |

## **🎯 Getting Started**

For new users approaching the application stack:

1. **[Research Services](gitea01-project-repository/README.md)** - Git repositories and collaborative development
2. **[Database Services](pgsql01-project-workloads/README.md)** - Primary PostgreSQL for astronomical data
3. **[AI/ML Services](milvus01-attu-milvus-backup/README.md)** - Vector databases for similarity search
4. **[Infrastructure Services](npm01-nginx-proxy-manager/README.md)** - Reverse proxy and SSL management

---

**Status**: Phase 1 - Core containerized service stack with research and infrastructure applications  
**Architecture**: Docker Compose deployments managed via Portainer with integrated monitoring and security
