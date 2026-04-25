# Proxmox Cluster VM Inventory

**Source:** Proxmox UI screenshots, 2026-03-28; Prometheus/Docker verification 2026-04-05; VM additions 2026-04-07
**Cluster nodes:** node01-node06 (node07 decommissioned, became bare metal ml01)
**Naming convention:** Dropping `radio-` and `proj-` prefixes from all VMs except Windows domain-joined VMs (DCs, MSSQL, file servers).

---

## Active VMs by Node

### node01

| VM ID | Hostname        | OS                  | IP          | vCPU | vRAM | OS Disk | +Volume | Role |
|-------|-----------------|---------------------|-------------|------|------|---------|---------|------|
| 1001  | radio-dc01      | Server 2025 Stnd    | 10.25.10.2  |   2  |   6G | 125G    | N/A     | Domain controller, mgmt VLAN |
| 2004  | radio-mssql01   | Server 2025 Stnd    | 10.25.20.3  |   4  |  32G | 125G    | Many    | SQL Server 2022 (FleetInventory DB) |
| 2012  | pgsql02         | Ubuntu 24.04 Server | 10.25.20.16 |   4  |  16G | 32G     | 100G    | Application PostgreSQL (Gitea, local apps) |

### node02

| VM ID | Hostname        | OS                  | IP          | vCPU | vRAM | OS Disk | +Volume | Role |
|-------|-----------------|---------------------|-------------|------|------|---------|---------|------|
| 1002  | sec01           | Ubuntu 24.04 Server | 10.25.20.4  |   4  |  12G | 32G     | 100G    | Security / Wazuh (pending rebuild) |
| 2003  | dfdb01          | Ubuntu 24.04 Server | 10.25.20.23 |   2  |   8G | 32G     | N/A     | DragonflyDB |
| 2018  | ch01            | Ubuntu 24.04 Server | 10.25.20.6  |   4  |  16G | 32G     | 100G    | ClickHouse + MinIO (Langfuse OLAP backend) |
| 2020  | ztna01          | Ubuntu 24.04 Server | 10.25.20.25 |   2  |   2G | 32G     | N/A     | ZTNA |

### node03

| VM ID | Hostname        | OS                  | IP          | vCPU | vRAM | OS Disk | +Volume | Role |
|-------|-----------------|---------------------|-------------|------|------|---------|---------|------|
| 2001  | radio-dc02      | Server 2025 Stnd    | 10.25.20.2  |   2  |   6G | 125G    | N/A     | Domain controller, proj VLAN |
| 2009  | secrets01       | Ubuntu 24.04 Server | 10.25.20.5  |   2  |   8G | 32G     | N/A     | Infisical secrets management |
| 2016  | mongo01         | Ubuntu 24.04 Server | 10.25.20.18 |   2  |   4G | 32G     | 100G    | MongoDB (available, unused) |
| 2021  | test01          | Ubuntu 24.04 Server | 10.25.20.26 |   4  |  16G | 32G     | 500G    | Development server |

### node04

| VM ID | Hostname        | OS                  | IP          | vCPU | vRAM | OS Disk | +Volume | Role |
|-------|-----------------|---------------------|-------------|------|------|---------|---------|------|
| 2006  | auto01          | Ubuntu 24.04 Server | 10.25.20.33 |   4  |  16G | 32G     | 100G    | Automation: Semaphore, n8n, Windmill (Docker) |
| 2010  | neo4j01         | Ubuntu 24.04 Server | 10.25.20.32 |   4  |  16G | 32G     | 100G    | Neo4j graph database (offline, pending permanent config) |
| 2015  | repo01          | Ubuntu 24.04 Server | 10.25.20.30 |   2  |   8G | 32G     | 100G    | Gitea git server (standalone, AD auth, agent accounts) |
| 2017  | itop01          | Ubuntu 24.04 Server | 10.25.20.31 |   2  |   8G | 32G     | 100G    | iTop ITSM |

### node05

| VM ID | Hostname        | OS                  | IP          | vCPU | vRAM | OS Disk | +Volume | Role |
|-------|-----------------|---------------------|-------------|------|------|---------|---------|------|
| 2007  | ztna02          | Ubuntu 24.04 Server | 10.25.20.7  |   2  |   2G | 32G     | N/A     | ZTNA |
| 2008  | mon01           | Ubuntu 24.04 Server | 10.25.20.9  |   4  |  12G | 32G     | 500G    | Prometheus / Grafana / Loki / AlertManager |
| 2011  | radio-fs02      | Server 2025 Stnd    | 10.25.20.15 |   4  |   6G | 125G    | 150G    | Windows SMB file server (astronomy, ML data) |
| 2022  | rdp01           | Ubuntu 24.04 Server | 10.25.20.27 |   6  |  24G | 32G     | N/A     | Remote desktop / VDI |

### node06

| VM ID | Hostname        | OS                  | IP          | vCPU | vRAM | OS Disk | +Volume | Role |
|-------|-----------------|---------------------|-------------|------|------|---------|---------|------|
| 2002  | pgsql01         | Ubuntu 24.04 Server | 10.25.20.8  |   8  |  32G | 32G     | 250G    | Primary research PostgreSQL (pgvector, postgis) |
| 2014  | docker01        | Ubuntu 24.04 Server | 10.25.20.14 |   6  |  24G | 32G     | 100G    | Docker host: Traefik, RabbitMQ, PGAdmin, AnythingLLM, Qdrant, Uptime Kuma, Miniflux, CISO Assistant, Homelable |

---

## Templates (node01)

| VM ID | Name                        | Notes |
|-------|-----------------------------|-------|
| 9001  | ubuntu-24lts-2026-04        | Ubuntu 24.04 template (rebuilt 2026-03) |
| 9002  | server2025stnd-11-25        | Server 2025 template |

---

## Bare Metal (Not in Proxmox)

| Hostname    | Hardware              | IPs                                  | OS           | Role |
|-------------|-----------------------|--------------------------------------|--------------|------|
| ml01        | 5950X / 128G / A4000  | 10.25.20.10 (proj), 10.16.207.67 (mgmt) | Ubuntu 24.04 | ML inference, agent compute, Ollama, Ansible control node |
| edge01      | N150 / 16G            | 10.16.207.68                         | —            | Wireless only, minimal |
| agents02    | N150 / 16G            | 10.25.20.11 (proj), 10.16.207.126 (mgmt) | —        | Secondary agent host |

---

## Network Equipment

| Hostname    | Hardware              | IP            | Role |
|-------------|-----------------------|---------------|------|
| fw1         | Fortigate 40F         | 10.16.207.1   | Edge/ISP firewall |
| labswitch02 | —                     | 10.16.207.200 | Managed switch (SNMP monitored) |
| labswitch03 | —                     | 10.16.207.202 | Managed switch (SNMP broken, does not enable) |

---

## Pending Decommission

No VMs currently pending decommission.

---

## Deleted Since Last Inventory

| VM ID | Former Hostname | Reason |
|-------|-----------------|--------|
| 2006  | agents01        | Services migrated to ml01 + cluster VMs |
| 2005  | gpu01           | GPU compute decommissioned, data verified |
| 2009  | radio-port01    | Portainer retired (VMID reused for secrets01) |
| 2015  | radio-docker03  | Empty, no workloads (VMID reused for repo01) |
| 2017  | radio-dns01     | DNS handled by DCs (VMID reused for itop01) |
| 2018  | radio-neo4j01   | Replaced by 2010 (VMID reused for ch01) |
| 2019  | radio-docker02  | Docker fleet consolidated |
| 3001  | radio-k8s01     | K8s cluster decommissioned |
| 3002  | radio-k8s02     | K8s cluster decommissioned |
| 3003  | radio-k8s03     | K8s cluster decommissioned |

---

## Node Resource Summary

Active allocations only. Pending decom VM (gpu01) excluded.

| Node   | CPU            | RAM  | vCPU Alloc | vRAM Alloc | Active VMs | Mgmt IP |
|--------|----------------|------|------------|------------|------------|---------|
| node01 | i9-12900H 20T  | 96G  |  10        |  54G       |  3         | 10.16.207.61 |
| node02 | i5-12600H 16T  | 96G  |  12        |  38G       |  4         | 10.16.207.62 |
| node03 | i9-12900H 20T  | 96G  |  10        |  34G       |  4         | 10.16.207.63 |
| node04 | i9-12900H 20T  | 96G  |  12        |  48G       |  4         | 10.16.207.64 |
| node05 | i5-12600H 16T  | 96G  |  14        |  42G       |  4         | 10.16.207.65 |
| node06 | i9-13900H 20T  | 96G  |  14        |  56G       |  2         | 10.16.207.66 |

Bare Metal:

| Host | CPU | RAM | Mgmt IP | Proj IP | Storage | Network |
|------|-----|-----|---------|---------|---------|---------|
| ml01 | 5950X | 128G | 10.16.207.67 | 10.25.20.10 | 2TB PM983 + 2TB ORICO | 1x 2.5G + 2x 10G SFP |
| edge01 | N150 | 16G | 10.16.207.68 | N/A | 256GB 2240 NVMe | Wireless, WiFi5 |
| agents02 | N150 | 16G | 10.16.207.126 | 10.25.20.11 | 512GB 2240 NVMe + 2TB generic NVMe | 1x 2.5G |

**Cluster total (active):** 72 vCPU / 272G vRAM across 21 active VMs
**Cluster capacity:** 112T / 576G
**Decom weight:** None pending

---

## Service Distribution

Post-consolidation service mapping. Updated 2026-04-05.

### docker01 (Docker Compose)

| Service | Image | Published Ports | Purpose |
|---------|-------|-----------------|---------|
| Traefik | traefik:latest | 80, 443 | Reverse proxy, Cloudflare DNS challenge, wildcard TLS |
| RabbitMQ | rabbitmq:4-management-alpine | 5672 (AMQP) | Agent task coordination, telemetry transport |
| PGAdmin | dpage/pgadmin4:latest | — (via Traefik) | PostgreSQL management (pgsql01, pgsql02) |
| AnythingLLM | mintplexlabs/anythingllm:latest | — | RAG interface, Ollama backend on ML01 |
| Qdrant | qdrant/qdrant:v1.14.0 | — | Vector database for embeddings |
| Uptime Kuma | louislam/uptime-kuma:2 | — | Availability monitoring |
| Miniflux | miniflux/miniflux:latest | — | RSS feed reader/aggregator |
| CISO Assistant | intuitem/ciso-assistant | — | GRC platform (frontend + backend + huey) |
| Homelable | pouzor/homelable | — | Home lab dashboard (frontend + backend) |

### auto01 (Docker Compose)

| Service | Purpose |
|---------|---------|
| Semaphore | Ansible UI |
| n8n | Workflow automation |
| Windmill | Script/workflow engine |

### Standalone Services

| Service | Host | Deployment | Notes |
|---------|------|------------|-------|
| Gitea | repo01 | Standalone binary | PostgreSQL backend on pgsql02, AD auth, agent accounts |
| iTop ITSM | itop01 | Standalone | Installed, not actively used for ethops coordination yet |
| Neo4j | neo4j01 | Standalone | Provisioned, offline, needs permanent configuration |
| Ollama | ml01 | Bare metal | GPU inference on A4000, priority queue |
| OpenCode / aoe / Claude Code | ml01 | Bare metal | Agent runtimes |
| Prometheus / Grafana / Loki | mon01 | Existing | Prometheus and Grafana operational; Loki needs global log shipping config |
| PostgreSQL (research) | pgsql01 | Existing | pgvector, postgis |
| PostgreSQL (apps) | pgsql02 | Existing | Gitea DB |
| SQL Server | radio-mssql01 | Existing | FleetInventory database |
| DragonflyDB | dfdb01 | Existing | Agent caching |
| MongoDB | mongo01 | Existing | Available, unused |
