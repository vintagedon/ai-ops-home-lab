<!--
---
title: "Automation and Orchestration"
description: "Ansible-based infrastructure automation and orchestration for the Proxmox Astronomy Lab cluster, including baseline configuration, monitoring, and security hardening"
author: "VintageDon - https://github.com/vintagedon"
ai_contributor: "Claude 4 Sonnet (claude-4-sonnet-20250514)"
date: "2025-07-23"
version: "1.0"
status: "Published"
tags:
- type: directory-overview
- domain: infrastructure-automation
- tech: ansible
- tech: configuration-management
- tech: infrastructure-as-code
- phase: phase-1
related_documents:
- "[Main Repository](../README.md)"
- "[Infrastructure](../infrastructure/README.md)"
- "[Monitoring](../monitoring/README.md)"
- "[Security](../security/README.md)"
---
-->

# 🤖 **Automation and Orchestration**

Ansible-based infrastructure automation and orchestration for the Proxmox Astronomy Lab cluster, providing systematic configuration management, monitoring deployment, and security hardening across all nodes.

## **Overview**

This directory contains the complete Ansible automation framework that manages configuration, deployment, and maintenance across our 7-node Proxmox cluster. The automation system ensures consistent baseline configuration, deploys monitoring infrastructure, and maintains security hardening standards across all systems supporting astronomical research workflows.

**Architecture**: Production Ansible deployment with role-based organization, supporting baseline system configuration, logging infrastructure with Grafana Alloy, and comprehensive monitoring with Prometheus integration.

## **📁 Ansible Structure**

### **Core Configuration**

```markdown
ansible/
├── ansible.cfg                 # Ansible configuration and performance settings
├── README.md                   # This documentation
├── inventory/                  # Host inventory and group definitions
│   ├── hosts.ini              # Main inventory file with all cluster nodes
│   └── production.ini         # Production environment inventory
└── playbooks/                 # Orchestration playbooks for cluster operations
    ├── baseline.yml           # System baseline configuration and hardening
    ├── logging.yml            # Grafana Alloy deployment and log collection
    ├── monitoring.yml         # Prometheus monitoring infrastructure
    └── site.yml               # Master playbook orchestrating all roles
```

### **Role-Based Organization**

```markdown
roles/
├── baseline/                   # System baseline configuration
│   ├── handlers/
│   │   └── main.yml           # Service restart and system handlers
│   ├── tasks/
│   │   ├── main.yml           # Main baseline configuration tasks
│   │   ├── hosts-management.yml    # /etc/hosts management and DNS
│   │   ├── system-hardening.yml    # Security hardening and CIS controls
│   │   ├── time-sync.yml           # NTP synchronization with chrony
│   │   └── unattended-upgrades.yml # Automated security updates
│   └── templates/
│       ├── 20auto-upgrades.j2      # Unattended upgrades configuration
│       ├── 50unattended-upgrades.j2 # Security update policies
│       ├── chrony.conf.j2          # NTP configuration template
│       ├── unattended-upgrades.service.j2  # Systemd service
│       └── unattended-upgrades.timer.j2    # Systemd timer
├── logging/                    # Grafana Alloy logging infrastructure
│   ├── handlers/
│   │   └── main.yml           # Logging service management
│   ├── tasks/
│   │   ├── main.yml           # Main logging deployment tasks
│   │   ├── docker-logging.yml     # Docker container log configuration
│   │   ├── install-alloy.yml      # Grafana Alloy installation
│   │   ├── prometheus-config.yml  # Prometheus metrics configuration
│   │   └── remove-promtail.yml    # Legacy promtail cleanup
│   └── templates/
│       ├── alloy-config.river.j2   # Grafana Alloy configuration
│       └── alloy.service.j2        # Systemd service template
└── monitoring/                 # Prometheus monitoring deployment
    ├── tasks/
    │   └── main.yml           # Monitoring infrastructure tasks
    └── templates/
        └── prometheus.yml.j2   # Prometheus configuration template
```

## **🎯 Deployment Playbooks**

### **System Baseline (baseline.yml)**

Comprehensive system configuration and hardening:

- **Host Management**: Centralized /etc/hosts configuration for cluster communication
- **Time Synchronization**: Chrony NTP configuration for accurate cluster timekeeping
- **Security Hardening**: CIS Controls v8 baseline implementation and system hardening
- **Automated Updates**: Unattended security updates with controlled restart policies
- **Service Management**: Systemd service optimization and management

### **Logging Infrastructure (logging.yml)**

Grafana Alloy-based log collection and forwarding:

- **Alloy Deployment**: Modern replacement for promtail with enhanced capabilities
- **Docker Integration**: Container log collection and forwarding to Loki
- **Prometheus Metrics**: System and application metrics collection
- **Legacy Cleanup**: Automated removal of deprecated promtail installations
- **Configuration Management**: Dynamic configuration based on node roles and requirements

### **Monitoring Deployment (monitoring.yml)**

Prometheus monitoring infrastructure setup:

- **Node Exporter**: System metrics collection on all cluster nodes
- **Service Discovery**: Automatic discovery and monitoring of cluster services
- **Alerting Rules**: Proactive alerting for system health and performance issues
- **Integration**: Seamless integration with existing Grafana dashboard infrastructure

### **Master Orchestration (site.yml)**

Coordinated deployment across all roles:

- **Dependency Management**: Proper ordering of baseline, logging, and monitoring deployment
- **Cluster Coordination**: Systematic application of configuration across all nodes
- **Rollback Capabilities**: Safe deployment with rollback procedures for production safety

## **📊 Inventory Management**

### **Host Organization**

```ini
[proxmox_nodes]
node01 ansible_host=10.16.207.61
node02 ansible_host=10.16.207.62
node03 ansible_host=10.16.207.63
node04 ansible_host=10.16.207.64
node05 ansible_host=10.16.207.65
node06 ansible_host=10.16.207.66
node07 ansible_host=10.16.207.67

[kubernetes_nodes]
node01
node03
node07

[docker_hosts]
node02
node04
node05
node06

[monitoring_targets:children]
proxmox_nodes
```

### **Group Variables and Host-Specific Configuration**

- **Scalable Configuration**: Role-based variables and host-specific overrides
- **Environment Separation**: Production and development inventory management
- **Security Variables**: Encrypted secrets and credential management
- **Service Configuration**: Per-host service and firewall rule definitions

## **🔧 Configuration Management**

### **Ansible Configuration (ansible.cfg)**

Production-optimized Ansible settings:

- **Performance Tuning**: High parallelism (20 forks) for efficient cluster management
- **Security Settings**: Strict host key checking and secure connection management
- **Logging Integration**: Structured logging with syslog_json callback for Loki integration
- **Callback Plugins**: Performance profiling and operational monitoring

### **Template System**

Dynamic configuration generation:

- **Jinja2 Templates**: Environment-specific configuration rendering
- **Variable Substitution**: Host and group-specific customization
- **Configuration Validation**: Template validation and syntax checking
- **Version Control**: All templates under version control with change tracking

## **🛡️ Security and Compliance**

### **CIS Controls v8 Implementation**

- **System Hardening**: Automated implementation of security baseline controls
- **Access Control**: SSH hardening and authentication security
- **Audit Configuration**: System audit logging and compliance monitoring
- **Update Management**: Automated security updates with controlled deployment

### **Infrastructure Security**

- **Firewall Management**: UFW firewall configuration and rule management
- **Service Hardening**: Security configuration for system services
- **Certificate Management**: SSL/TLS certificate deployment and renewal
- **Compliance Validation**: Automated validation of security configurations

## **📈 Operational Workflows**

### **Standard Deployment**

```bash
# Deploy complete infrastructure baseline
ansible-playbook -i inventory/production.ini site.yml

# Deploy specific components
ansible-playbook -i inventory/production.ini baseline.yml
ansible-playbook -i inventory/production.ini logging.yml
ansible-playbook -i inventory/production.ini monitoring.yml
```

### **Maintenance Operations**

```bash
# Update system configurations
ansible-playbook -i inventory/production.ini baseline.yml --tags=system-hardening

# Deploy monitoring updates
ansible-playbook -i inventory/production.ini monitoring.yml --tags=prometheus-config

# Restart services across cluster
ansible-playbook -i inventory/production.ini baseline.yml --tags=service-restart
```

## **🔗 Integration Points**

| **System** | **Relationship** | **Integration** |
|------------|------------------|-----------------|
| **[Infrastructure](../infrastructure/README.md)** | Target systems for automated configuration and management | Proxmox nodes, VMs, and network infrastructure |
| **[Monitoring](../monitoring/README.md)** | Deploys monitoring agents and configuration | Prometheus, Grafana Alloy, node exporters |
| **[Security](../security/README.md)** | Implements security baselines and compliance controls | CIS Controls v8, system hardening, audit configuration |
| **[Applications](../applications-and-services/README.md)** | Manages containerized service infrastructure | Docker configuration, service deployment |

## **🚀 Current Capabilities**

### **Baseline Management**

- **System Configuration**: Comprehensive baseline configuration across all cluster nodes
- **Security Hardening**: Automated CIS Controls v8 implementation and validation
- **Service Management**: Standardized service configuration and management
- **Update Automation**: Controlled security update deployment with restart coordination

### **Monitoring Infrastructure**

- **Log Collection**: Grafana Alloy deployment for centralized log aggregation
- **Metrics Collection**: Prometheus node exporter and custom metrics deployment
- **Service Discovery**: Automatic monitoring configuration for new services
- **Alerting Integration**: Proactive monitoring with alert rule deployment

### **Operational Excellence**

- **Infrastructure as Code**: Complete infrastructure configuration under version control
- **Reproducible Deployments**: Consistent configuration across development and production
- **Change Management**: Systematic deployment with rollback capabilities
- **Documentation Integration**: Self-documenting playbooks with comprehensive logging

---

**Status**: Phase 1 - Production Ansible deployment with baseline, logging, and monitoring automation  
**Architecture**: Role-based Ansible with Grafana Alloy logging and Prometheus monitoring integration
