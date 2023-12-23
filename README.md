![github-proxmoxhomelab-cover](https://github.com/vintagedon/proxmoxlab/assets/4473026/c6b964cd-0d73-47a6-ae1b-7e682c53c2ca)
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]  

## About the Project
This is my rather extensive home lab project, mostly built on AMD Mini PCs with a small Fortinet firewall.

The lab currently consists of a 4-node Proxmox v8 cluster, along with a stand-alone Server 2022 Datacenter box that runs all of my Windows VMs including serving as a development and scripting box for Windows / Hyper-V.

Networking runs on 1Gbps for WAN with a 2.5Gbps switch for storage and firewall duty handled by a Fortigate 40F.

Infrastructure diagrams can be found in the Wiki: https://github.com/vintagedon/proxmoxlab/wiki/Infrastructure-Diagrams

Public Trello Board for Current Sprint: https://trello.com/b/HVu1JBfX/homelab-sprint-4

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/E1E8S7NNI)

## Current Lab Specs

| Technology | # of Nodes | vCPU | vRAM | SSD Storage | nVME Storage | 
| ---------- | ---------- | ---- | ---- | ----------- | ------------ |
| Proxmox | 4 | 64 cores | 224G | 256GB boot | 8TB VM storage | 
| Hyper-V | 1 | 16 cores |  64G | 256GB boot | 2TB VM storage | 
| Total | 5 | 80 cores | 288G | ----------- | 10TB VM storage | 

* Power Draw (measured by UPS): 200w +/-25w at idle (includes NAS, firewall, switches, ISP modem, Wifi, and all lab infrastructure)
* Power Cost (using 212.5w as average): 5.1kWh/day x 30 days = 153kWh x .09 (my local power cost) = $13.77/mo average

![2023-12-19 11_29_47-node01 - Proxmox Virtual Environment](https://github.com/vintagedon/proxmoxlab/assets/4473026/e2bfd850-c4c1-46f8-ba03-933b122c1c07)  
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Built With
Infrastructure [![Next][fortinet]][fortinet-url] [![Next][cloudflare]][cloudflare-url]  
Hypervisors [![Next][proxmox]][proxmox-url] [![Next][hyperv]][hyperv-url]  
Container Orchestration [![Next][kubernetes]][kubernetes-url] [![Next][portainer]][portainer-url]  
Automation [![Next][ansible]][ansible-url] [![Next][pulumi]][pulumi-url]  
Databases [![Next][mariadb]][mariadb-url] [![Next][postgresql]][postgresql-url] [![Next][victoriametrics]][victoriametrics-url] [![Next][couchdb]][couchdb-url] [![Next][microsoftsql]][microsoftsql-url]  
Identity [![Next][microsoftazure]][microsoftazure-url]  
Monitoring [![Next][prometheus]][prometheus-url] [![Next][grafana]][grafana-url]  
Proxying [![Next][npm]][npm-url] [![Next][traefik]][traefik-url]  
Secrets [![Next][bitwarden]][bitwarden-url] [![Next][vault]][vault-url]  
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Motivation

Although I have had a number of home labs through the years, this is my first concerted effort to build a Home Lab from the ground up from scratch. The lab is for learning, development, and exploration of various IT technologies related not just to my job as a systems engineer, but technologies I'm personally interested in, such as DevOps, Ifrastructure as Code, AI, Automation and Platform Engineering.
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Project Sprints

As the lab is a fairly major project, I'm loosly using Sprints to divide up the initial workload.

### Sprints Completed
These sprints have been completed, and the boards archived.

<details>
  <summary>Sprint 1: Bare Metal and Hypervisors</summary>
  <ol>
    <ul>
      <li>MiniPC Setup: BIOS, hardware upgrades</li>
      <li>Switch Setup: Wiring and Configuration</li>
      <li>NAS NFS Storage Configuration</li>
      <li>Hypervisor Setup: Proxmox single node x4, Server 2022 Hyper-V single node</li>
      <li>Networking Setup: Proxmox (openVSwitch, VLANs), Hyper-V (Virtual switch, VLANs), Fortigate 40F (VLANs, DHCP, DNAT, SNAT, baseline policies)</li>
    </ul>
  </ol>
</details>

<details>
  <summary>Sprint 2: (Azure Multitenancy Setup, Phase 1</summary>
  <ol>
    <ul>
      <li>Azure Lab Account Creation: pay-as-you-go, Licensing: O365 Standard x1, 1 x Entra P2</li>
      <li>Create multi-tenancy x4: Primary lab, MSFT lab, AWS lab, GCP lab</li>
      <li>Create tenant domain controllers, On-prem user, setup Entra Connect</li>
      <li>Azure Services on all DCs: Azure Arc, Monitor, Sentinel, Logging</li>
      <li>Azure Baseline Conditional Access and Security policy configuration</li>
      <li>Tenancy users onboarded with MFA</li>
    </ul>
  </ol>
</details>

<details>
  <summary>Sprint 3: RMM and Configuration Management </summary>
  <ol>
    <ul>
      <li>RMM Agents, Windows: Agents to all endpoints, agent auto-deployment via Group Policy all tenants, Patch Management baseline policies</li>
      <li>RMM Agents, Linux: Agents to all endpoints (monitoring mode only)</li>
      <li>Ansible w/Semaphore + HashiCorp Vault: Instllation all endpoints, auth via SSH key</li>
      <li>Ansible Playbook, ad-hoc: install RMM Linux agent</li>
    </ul>
  </ol>
</details>

### Sprints In Progress
The current sprint; best viewed in the public Trello project for up-to-date items and progress.

https://trello.com/b/HVu1JBfX/homelab-sprint-4

<details>
  <summary>Sprint 4:Infrastructure, Phase 1 </summary>
  <ol>
    <ul>
      <li>MicroK8s Cluster: 4 VM nodes, 4c/16GB RAM/96GB Disk (per node), NFS cluster storage, MeltalLB, Ingress</li>
      <li>Portainer Business Edition: 2c/4GB RAM/32GB disk, configure MicroK8s cluster as Edge cluster</li>
      <li>Database Clusters: MariaDB Galera cluster, PostgreSQL Patroni Cluster, CouchDB cluster</li>
      <li>Database and Ingress Load Balancing: Ngnix Proxy Manager</li>
      <li>SSLs / PKI: Lego Lets Encrypt Server</li>
      <li>Monitoring: Cortex cluster (multitenancy Prometheus) w/Grafana front-end, install node_exporter on all endpoints</li>
      <li>Backups: Promox Backup Server and Iperius Backup (HyperV VMs and Databases)</li>
      <li>Secrets: Bitwarden Password Server, Infisical, HashiCorp Vault</li>
      <li>Ansible, Phase 1: setup Ansible w/Semaphore front-end, HashiCorp Vault</li>
      <li>SEIM/XDR, Phase 1: setup Wazuh, install Wazuh agents</li>
      <li>Container Registry (on prem): setup ProGet Container Registry, Configure for Portainer</li>
      <li>Github: Initial setup of Repo</li>
      <li>Trello: Sprint Templates</li>
      <li>Slack: Initial Integrations, Github, Trello</li>
      <li></li>
    </ul>
  </ol>
</details>

### Future Sprints

Future planned sprints. Item list is volatile until sprint start.

<details>
  <summary>Sprint 5: Configuration Management, Automation, Deployment</summary>
  <ol>
    <ul>
      <li>Windows OS Deployment: Win11 + Win2022 unattended installs (Windows Deployment Toolkit), Autopilot, Intune, RMM device onboarding, initial PS scrips</li>
      <li>Windows App Deployment: Intune, RMM, Chocolately via PS</li>
      <li>Proxmox Deploymement, Linux VM Templates: Cloud Images via Cloud-Init w/Software Installations</li>
      <li>Ansible: Configure initial infrastructure, initial playbooks</li>
      <li>Container Registry: Configure and store all current microk8s stacks into container registries (local + Github)</li>
      <li>GitOps: create 'testing' and 'production' pods, Docker Compose files for current microk8s stack to repositories w/push to 'test' > 'prod', destroy old default pod</li>
      <li>IaC: Pulumi configuration, Ansible Pulumi deployment playbooks (Hyper-V + Proxmox)</li>
      <li></li>
    </ul>
  </ol>
</details>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing
Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.  
If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!  
1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License
Distributed under the Apache 2.0 License. See `LICENSE.md` for more information.  
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact
Your Name - [@crainbramp](https://twitter.com/crainbramp) - crainbramp@beardinthe.cloud
Project Link: https://github.com/vintagedon/proxmoxlab/
<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/vintagedon/proxmoxlab.svg?style=for-the-badge
[contributors-url]: https://github.com/vintagedon/proxmoxlab/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/vintagedon/proxmoxlab.svg?style=for-the-badge
[forks-url]: https://github.com/vintagedon/proxmoxlab/network/members
[stars-shield]: https://img.shields.io/github/stars/vintagedon/proxmoxlab.svg?style=for-the-badge
[stars-url]: https://github.com/vintagedon/proxmoxlab/stargazers
[issues-shield]: https://img.shields.io/github/issues/vintagedon/proxmoxlab.svg?style=for-the-badge
[issues-url]: https://github.com/vintagedon/proxmoxlab/issues
[license-shield]: https://img.shields.io/github/license/vintagedon/proxmoxlab.svg?style=for-the-badge
[license-url]: https://github.com/vintagedon/proxmoxlab/blob/master/LICENSE.txt
[license-shield]: https://img.shields.io/github/license/vintagedon/proxmoxlab.svg?style=for-the-badge
[license-url]: https://github.com/vintagedon/proxmoxlab/blob/master/LICENSE.txt
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
[prometheus]: https://img.shields.io/badge/prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=000000
[prometheus-url]: https://prometheus.io/
[grafana]: https://img.shields.io/badge/grafana-F46800?style=for-the-badge&logo=grafana&logoColor=000000
[grafana-url]: https://grafana.com/
[azuredevops]: https://img.shields.io/badge/grafana-0078D7?style=for-the-badge&logo=grafana&logoColor=000000
[azuredevops-url]: https://grafana.com/
[microsoftazure]: https://img.shields.io/badge/Microsoft_Entra-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=000000
[microsoftazure-url]: https://azure.microsoft.com/en-us
[npm]: https://img.shields.io/badge/nginx_proxymanager-F15833?style=for-the-badge&logo=nginxproxymanager&logoColor=000000
[npm-url]: https://nginxproxymanager.com/
[traefik]: https://img.shields.io/badge/traefik-24A1C1?style=for-the-badge&logo=traefikproxy&logoColor=000000
[traefik-url]: https://traefik.io/traefik/
[bitwarden]: https://img.shields.io/badge/bitwarden_server-175DDC?style=for-the-badge&logo=bitwarden&logoColor=000000
[bitwarden-url]: https://github.com/bitwarden/server
[fortinet]: https://img.shields.io/badge/fortinet-EE3124?style=for-the-badge&logo=fortinet&logoColor=000000
[fortinet-url]: https://github.com/bitwarden/server
[vault]: https://img.shields.io/badge/vault-FFEC6E?style=for-the-badge&logo=vault&logoColor=000000
[vault-url]: https://www.vaultproject.io/
[vagrant]: https://img.shields.io/badge/vagrant-1868F2?style=for-the-badge&logo=vagrant&logoColor=000000
[vagrant-url]: https://www.vagrantup.com/
[cloudflare]: https://img.shields.io/badge/cloudflare-F38020?style=for-the-badge&logo=cloudflare&logoColor=000000
[cloudflare-url]: https://www.cloudflare.com/
[microsoftsql]: https://img.shields.io/badge/sql_server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=000000
[microsoftsql-url]: https://www.microsoft.com/en-us/sql-server/sql-server-2022
