## Proxmox and Hyper-V Home Lab

This is my rather extensive home lab project, mostly built on AMD Mini PCs with a small Fortinet firewall. The lab currently consists of a 4-node Proxmox v8 cluster, along with a stand-alone Server 2022 Datacenter box that runs all of my Windows VMs including serving as a development and scripting box for Windows / Hyper-V.

Networking runs on 1Gbps / 2.5Gbps w/firewall duty handled by a Fortigate 40F.

The lab also uses my home NAS, a QNAP TS-873 for NFS and object storage.

## Motivation

Although I have had a number of home labs through the years, this is my first concerted effort to build a Home Lab from the ground up as scratch. The lab is for learning, development, and exploration of various IT technologies related not just to my job as a systems engineer, but technologies I'm personally interested in, such as DevOps, Ifrastructure as Code, AI, and Automation.

Primary Technologies: Virtualization (Proxmox, Hyper-V, and Kubernetes), Automation (Ansible, Powershell, RMMs), Infrastructure as Code (Pulumi), Monitoring as Code (Checkly), Monitoring/Performance (Prometheus/Grafana), SQL/NoSQL (SQL Server, MariaDB, CouchDB), Security/SEIM (Wazuh), Azure (Entra, Autopilot, Intune, AKS, Azure DevOps, Azure Arc).

## Hardware

Building a Home Lab can be expensive, but with some good timing, patience, and a Black Friday sale, I was able to keep the cost fairly reasonable.

For the hardware itself, I picked mini PCs. These palmtop PCs have gotten quite powerful in recent years, usually running gaming laptop APUs, and have a ton of options. The ones I went with are the AceMagician AM06OPRO, which has an AMD 5700U (8c/16t), up to 64GB of DDR4, an nVME, space for a SATA SSD, and dual LAN (1Gbps + 2.5Gbps). Maxing these out with 64GB of DDR4, a 2TB nNVME (VM storage), and a cheap 256GB SATA SSD (boot drive; I had some older extra ones), makes these quite capable nodes. Three of these run the Proxmox cluster, while the 4th runs the Hyper-V node.

Completely loaded, the Mini PCs were $425 each ($250/node, $100 64GB DDR4 SODIMMs, $75 2TB nVME). The mATX node is my old PC CPU paired with a mATX mobo, 128GB of DDR4 and old parts.

- Mini PC Nodes x4: AMD 5700U (TDP15w), 8c/16t, 64GB RAM, 2TB nVME (VM storage), 256GB SATA SSD (boot drive), 1Gbps LAN + 2.5Gbps
- mATX Node x1: AMD 3700X, 8c/16t, 128GB RAM, 2TB nVME (VM storage), 256GB SATA SSD (boot drive), 1Gbps LAN + 2.5Gbps, nVidia 3090 GPU
- LAB WAN Switch: TP-Link TL-SG116E 16 Port Managed Gigabit Switch
- Storage Switch: SODOLA 8 Port 2.5G Ethernet Switch with 10G SFP

### Hardware Links (Affliate links)
- AceMagician AM06OPRO https://amzn.to/3GsgQ5j
- TP-Link TL-SG116E Switch https://amzn.to/3t0MWlt
- SODOLA 8 Port 2.5G Switch https://amzn.to/47YDz4L
