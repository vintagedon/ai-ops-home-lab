![home-lab-proxmox-logo-500x](https://github.com/vintagedon/proxmoxlab/assets/4473026/23ac4c5a-cf65-4d67-ae7d-87a05193a174)

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#lab-overview">Lab Overview</a>
      <ul>
        <li><a href="#hardware">Hardware</a></li>
        <li><a href="#phases">Phases</a></li>
      </ul>
    </li>
    <li><a href="#baremetal">Bare Metal: Node Hardware</a></li>
    <li><a href="#hypervisors">Hypervisors</a></li>
    <li><a href="tenants"></a>Lab Tenancy</li>
    <li><a href="technologies"></a>Technologies</li>
    <li><a href="licensing"></a>Licensing and Lab Licenses</li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

## About the Project

This is my rather extensive home lab project, mostly built on AMD Mini PCs with a small Fortinet firewall. The lab currently consists of a 4-node Proxmox v8 cluster, along with a stand-alone Server 2022 Datacenter box that runs all of my Windows VMs including serving as a development and scripting box for Windows / Hyper-V.

Networking runs on 1Gbps for WAN with a 2.5Gbps switch for storage and firewall duty handled by a Fortigate 40F.

The lab also uses my home NAS, a QNAP TS-873 for NFS and object storage (8 x 8TB in RAID6), with a 2TB nVME for caching, and a 2TB nvme for shared cluster storage (NFS/iSCSI),

Infrastructure diagrams can be found in the Wiki: https://github.com/vintagedon/proxmoxlab/wiki

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/E1E8S7NNI)

## Current Lab Stats

| Technology | # of Nodes | vCPU | vRAM | nVME Storage | 
| ---------- | ---------- | ---- | ---- | ------------ |
| Proxmox | 4 | 64 cores | 224G | 8TB |
| Hyper-V | 1 | 16 cores |  64G | 2TB |
| Total | 5 | 80 cores | 288G | 10TB |

![2023-12-19 11_29_47-node01 - Proxmox Virtual Environment](https://github.com/vintagedon/proxmoxlab/assets/4473026/e2bfd850-c4c1-46f8-ba03-933b122c1c07)

## Built With

Hypervisors [![Next][proxmox]][proxmox-url] [![Next][hyperv]][hyperv-url]  

Containers [![Next][kubernetes]][kubernetes-url] [![Next][portainer]][portainer-url] [![Next][rancher]][rancher-url]  

Automation [![Next][ansible]][ansible-url] [![Next][pulumi]][pulumi-url]  

Databases [![Next][mariadb]][mariadb-url] [![Next][postgresql]][postgresql-url] [![Next][victoriametrics]][victoriametrics-url] [![Next][couchdb]][couchdb-url]  

Identity [![Next][microsoftazure]][microsoftazure-url]  

Monitoring [![Next][prometheus]][prometheus-url] [![Next][grafana]][grafana-url]  

Proxying [![Next][npm]][npm-url] [![Next][traefik]][traefik-url]  

## Motivation

Although I have had a number of home labs through the years, this is my first concerted effort to build a Home Lab from the ground up as scratch. The lab is for learning, development, and exploration of various IT technologies related not just to my job as a systems engineer, but technologies I'm personally interested in, such as DevOps, Ifrastructure as Code, AI, Automation and Platform Engineering.

## Hardware

Mini PCs serve as the primary nodes. These palmtop PCs have gotten quite powerful in recent years, usually running gaming laptop APUs, and have a ton of options. The ones I went with are the AceMagician AM06OPRO, which has an AMD 5700U (8c/16t), up to 64GB of DDR4, an nVME, space for a SATA SSD, and dual LAN (1Gbps + 2.5Gbps). Maxing these out with 64GB of DDR4, a 2TB nNVME (VM storage), and a cheap 256GB SATA SSD (boot drive; I had some older extra ones), makes these quite capable nodes and are a lowly 15w TDP each.

Four of these run the Proxmox cluster, while the 5th runs the Hyper-V node.

Completely loaded, the Mini PCs were $425 each ($250/node, $100 64GB DDR4 SODIMMs, $75 2TB nVME).

- Mini PC Nodes x4: AMD 5700U (TDP15w), 8c/16t, 64GB RAM, 2TB nVME (VM storage), 256GB SATA SSD (boot drive), Dual NICs: 1Gbps LAN + 2.5Gbps
- LAB WAN Switch: TP-Link TL-SG116E 16 Port Managed Gigabit Switch
- Storage Switch: SODOLA 8 Port 2.5G Ethernet Switch with 10G SFP (nodes on 2.5G, NAS on 10G)

### Hardware Links (Affliate links)
- AceMagician AM06OPRO https://amzn.to/3GsgQ5j
- TP-Link TL-SG116E Switch https://amzn.to/3t0MWlt
- Sodola Managed 2.5G/10G Managed Switch (8*2.5G+10G SFP) https://amzn.to/3RMwTBt

## Phases

As the lab is a fairly major project, I'm proceding in phases to keep it more organized, working from the bare metal layer up. Below is my current progress.

### Phases: Completed

* **Phase 1 (Bare Metal and Hypervisors):** MiniPC Hardware and BIOS setup, Switches Setup, NAS Storage Setup, Networking Setup (VLANs, SNAT/DNAT, Initial FW Policies), Hypervisor Setup (Proxmox Cluster, Hyper-V [Single Node])
* **Phase 2 (Azure Multitenancy Setup, Phase 1):** Azure 'Lab' Account Setup + Multitenancy, Tenant Domain Controllers + Entra Connect, Azure Licensing, Lab Licensing, Azure Tenant Accounts Setup + Users, Azure Arc Setup, Azure Monitor + Logging on all nodes [no alerting], Azure Sentinel, Baseline Azure Policies + Conditional Access, Tenant User Onboarding (MFA + Clerk App)
* **Phase 3 (RMM and Configuration Management, Phase 1):** RMM Agents w/Group Policy Auto-Deploy, RMM Patch Management Base Policies, Semaphore Ansible w/Hasicorp Vault, Backups (HyperV [Iperius Incrementals > External SSD] / Proxmox [Proxmox Backup Server > External SSD)
* **Phase 4 (Infrastructure, Phase 1):** Portainer K8s cluster + NFS Storage, DB Clusters (MariaDB, Postgres, CouchDB), Bitwarden Server, Prometheus / VictoriaMetrics / Grafana, Grafana Loki, Ngnix Proxy Manager, Lego Lets Encrypt Server (wildcard SSLs on all web endpoints)

### Phases: In Progress
* Phase 5 (Automation and Deployment): Windows Deplpoyment Services (Win11 + Win2022), Proxmox Cloud Images via Cloud-Init, Pulimi for Proxmox and Hyper-V, Netbox via Proxmox API for IPAM, Ansible Playbooks for Deploying VMs, Ansible Chocolately setup w/basic Playbooks, 

## Software / Technologies
There are a number of technologies that I'm studying, and the lab is fairly detailed. Have lab environments in the major cloud providers for various projects w/tightly controlled budgets.

### Cloud Platforms
Azure Lab -- MSFT Dev Account + paid multi-tenant account<br/>
AWS / Amazon Web Services  <br/>
GCP (Google Cloud Platform)  <br/>

### Virtualization
Proxmox (4 node cluster) -- https://www.proxmox.com/en/proxmox-virtual-environment/overview  
Server 2022 Datacenter w/Hyper-V (single node) -- https://www.microsoft.com/en-us/windows-server  
Kubernetes / Portainer BE (3 pods) -- https://www.portainer.io/take-3  
Docker -- https://www.docker.com/

### Monitoring and RMM
Prometheus Cortex (multi-tenant Prometheus) -- https://github.com/cortexproject/cortex  
Grafana (Monitoring GUI + Alerting) -- https://grafana.com/  
Itarian RMM -- https://www.itarian.com  

### Automation / IPAM / Configuration Management
MSP Magic (tenancy baseline management) -- https://mspmagic.com/  
Cipp (in-tenancy management) -- https://cipp.app/  
Ansible / Semaphore -- https://www.ansible.com/  
Pulumi -- https://www.pulumi.com/  
Netbox -- https://netbox.dev/  

### Infrastructure and Development
Azure DevOps -- https://azure.microsoft.com/en-us/products/devops
GitLab -- https://about.gitlab.com/  
TeamCity (Pipeline Management) -- https://www.jetbrains.com/teamcity/ 
Vagrant -- https://www.vagrantup.com/  

### Databases
MariaDB -- https://mariadb.org/  
PostgreSQL -- https://www.postgresql.org/  
SQL Server 2019 -- https://www.microsoft.com/en-us/sql-server/sql-server-2019  
CouchDB  -- https://couchdb.apache.org/  

### Security and Logging
Grafana Loki -- https://grafana.com/oss/loki/  
Wazuh -- https://wazuh.com/  
GoAccess -- https://goaccess.io/  

## Infrastructure Diagram
![home-lab-environment-overview](https://github.com/vintagedon/proxmoxlab/assets/4473026/ab6f30b7-8b70-4ecc-ad90-088b7a151d41)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/donaldfountain
[proxmox]: https://img.shields.io/badge/proxmox-E57000?style=for-the-badge&logo=proxmox&logoColor=000000
[proxmox-url]: https://www.proxmox.com/en/proxmox-virtual-environment/overview
[ansible]: https://img.shields.io/badge/ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=000000
[ansible-url]: https://www.ansible.com
[pulumi]: https://img.shields.io/badge/pulumi-8A3391?style=for-the-badge&logo=pulumi&logoColor=FFFFF
[pulumi-url]: https://www.pulumi.com
[kubernetes]: https://img.shields.io/badge/kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=FFFFFF
[kubernetes-url]: https://kubernetes.io
[hyperv]: https://img.shields.io/badge/hyperv-326CE5?style=for-the-badge&logo=windows&logoColor=000000
[hyperv-url]: https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/hyper-v-technology-overview
[portainer]: https://img.shields.io/badge/portainer-326CE5?style=for-the-badge&logo=portainer&logoColor=FFFFFF
[portainer-url]: https://www.portainer.io
[couchdb]: https://img.shields.io/badge/couchdb-E42528?style=for-the-badge&logo=apachecouchdb&logoColor=000000
[couchdb-url]: https://couchdb.apache.org/
[mariadb]: https://img.shields.io/badge/mariadb-003545?style=for-the-badge&logo=mariadb&logoColor=000000
[mariadb-url]: https://couchdb.apache.org/
[postgresql]: https://img.shields.io/badge/postgresql-4169E1?style=for-the-badge&logo=postgresql&logoColor=000000
[postgresql-url]: https://www.postgresql.org/
[victoriametrics]: https://img.shields.io/badge/victoriametrics-621773?style=for-the-badge&logo=victoriametrics&logoColor=000000
[victoriametrics-url]: https://victoriametrics.com/
[rancher]: https://img.shields.io/badge/rancher-0075A8?style=for-the-badge&logo=rancher&logoColor=000000
[rancher-url]: https://www.rancher.com
[prometheus]: https://img.shields.io/badge/prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=000000
[prometheus-url]: https://prometheus.io/
[grafana]: https://img.shields.io/badge/grafana-F46800?style=for-the-badge&logo=grafana&logoColor=000000
[grafana-url]: https://grafana.com/
[azuredevops]: https://img.shields.io/badge/grafana-0078D7?style=for-the-badge&logo=grafana&logoColor=000000
[azuredevops-url]: https://grafana.com/
[microsoftazure]: https://img.shields.io/badge/MicrosoftEntra-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=000000
[microsoftazure-url]: https://azure.microsoft.com/en-us
[npm]: https://img.shields.io/badge/nginxproxymanager-F15833?style=for-the-badge&logo=nginxproxymanager&logoColor=000000
[npm-url]: https://nginxproxymanager.com/
[traefik]: https://img.shields.io/badge/traefikproxy-24A1C1?style=for-the-badge&logo=traefikproxy&logoColor=000000
[traefik-url]: https://traefik.io/traefik/
