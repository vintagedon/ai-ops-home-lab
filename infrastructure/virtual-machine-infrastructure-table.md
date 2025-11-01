| VM ID | Hostname       | OS                  | IP          |  vCPU  | vRAM |  Node  |  OS  | +Volume |
| ----- | -------------- | ------------------- | ----------- | ------ | ---- | ------ | ---- | ------- |
| 1003  | radio-dc01     | Server 2025 Stnd    | 10.25.10.2  |   2    |   6  | node01 | 125G |    N/A  |
| 1006  | mgmt-sec01     | Ubuntu 24.04 Server | 10.25.10.8  |   4    |  12  | node02 |  32G |   100G  |
| 2001  | proj-dp01      | Ubuntu 24.04 Server | 10.25.20.X  |   2    |   6  | node05 |  32G |  1000G  |
| 2002  | proj-pgsql01   | Ubuntu 24.04 Server | 10.25.20.8  |   8    |  32  | node06 |  32G |   250G  |
| 2003  | radio-dc02     | Server 2025 Stnd    | 10.25.20.2  |   2    |   6  | node03 | 125G |    N/A  |
| 2004  | proj-dev01     | Ubuntu 24.04 Server | 10.25.20.7  |   2    |   8  | node05 |  32G |   100G  |
| 2005  | proj-gpu01     | Ubuntu 24.04 Server | 10.25.20.10 |   8    |  32  | node07 |  32G |   100G  |
| 2006  | proj-agents01  | Ubuntu 24.04 Server | 10.25.20.102|   4    |  32  | node02 | 200G |   100G  |
| 2007  | proj-fs01      | Ubuntu 24.04 Server | 10.25.20.11 |   2    |   6  | node05 |  32G |  1000G  |
| 2008  | proj-mon01     | Ubuntu 24.04 Server | 10.25.20.9  |   4    |  12  | node05 |  32G |   500G  |
| 2009  | proj-port01    | Ubuntu 24.04 Server | 10.25.20.22 |   2    |   6  | node02 |  32G |    N/A  |
| 2010  | proj-repo01    | Ubuntu 24.04 Server | 10.25.20.3  |   4    |  16  | node05 |  32G |   250G  |
| 2011  | proj-fs02      | Server 2025 Stnd    | 10.25.20.15 |   4    |   6  | node05 | 125G |   150G  |
| 2012  | proj-pgsql02   | Ubuntu 24.04 Server | 10.25.20.16 |   4    |  16  | node06 |  32G |   100G  |
| 2014  | proj-docker02  | Ubuntu 24.04 Server | 10.25.20.14 |   6    |  24  | node06 |  32G |   100G  |
| 2015  | proj-docker03  | Ubuntu 24.04 Server | 10.25.20.14 |   6    |  24  | node06 |  32G |   100G  |
| 2016  | proj-mongo01   | Ubuntu 24.04 Server | 10.25.20.18 |   2    |   4  | node03 |  32G |   100G  |
| 2017  | proj-dns01     | Ubuntu 24.04 Server | 10.25.20.12 |   2    |   2  | node04 |  32G |    32G  |
| 2018  | proj-neo4j01   | Ubuntu 24.04 Server | 10.25.20.21 |   6    |  24  | node06 |  32G |   250G  |
| 2019  | proj-docker03  | Ubuntu 24.04 Server | 10.25.20.24 |   6    |  24  | node05 |  32G |    N/A  |
| 2020  | proj-ztna01    | Ubuntu 24.04 Server | 10.25.20.25 |   2    |   2  | node04 |  32G |    N/A  |
| 2021  | proj-dev02     | Ubuntu 24.04 Server | 10.25.20.26 |   2    |   8  | node04 |  32G |    N/A  |
| 2022  | proj-cisbench  | Ubuntu 24.04 Server | 10.25.20.27 |   2    |   2  | node01 |  32G |    N/A  |
| 2023  | proj-oscal01   | Ubuntu 24.04 Server | 10.25.20.28 |   2    |   8  | node04 |  32G |   100G  |
| 3001  | proj-k8s01     | Ubuntu 24.04 Server | 10.25.20.4  |  12    |  48  | node01 |  32G |  1000G  |
| 3002  | proj-k8s02     | Ubuntu 24.04 Server | 10.25.20.5  |  12    |  48  | node03 |  32G |  1000G  |
| 3003  | proj-k8s03     | Ubuntu 24.04 Server | 10.25.20.6  |  12    |  48  | node04 |  32G |  1000G  |

## **Node Resource Summary & Oversubscription Analysis**

| Node   | Cores | RAM | Primary Workload Focus |
| pbs01  |   4   | 16  | N150/16G, 1x2.5G NIC, 4TB nvme for cluster backups |
| nas01  |  16   | 64  | Aoostar WTR MAX AMD R7 PRO 8845HS 11 Bays Mini PC 7x3.5" 4xnvme |
| edge01 |   8   | 40  | VM w/9TB bandwidth for edge downloads, data processing, cascadelake 2.0Ghz, 200G nvme |
| edge02 |   4   |     | N150/16G, on patio for project |
| htpc   |   4   | 16  | N150/16G, house HTPC docker server w/jellyfin, pihole, etc |
| node01 |  16   | 64  | 12900H, 96G, 2T pm983 nvme, compute node |
| node02 |  16   | 64  | 12600H, 96G, 2T pm983 nvme, light compute + storage |
| node03 |  16   | 64  | 12900H, 96G, 2T pm983 nvme, compute |
| node04 |  16   | 64  | 12900H, 96G, 2T pm983 nvme, compute |
| node05 |  16   | 64  | 12600H, 96G, 2T pm983 nvme, light compute + storage |
| node06 |  16   | 64  | 13900H, 96G, 2T pm983 nvme, heavy compute |
| node07 |  16   | 64  | 12900H, 96G, 2T pm983 nvme, compute |

All nodes + NAS = 2 x 2.5g NICs in LACP + 2 x 10G NICs in LACP
n150 = mini-pcs, low power, 1 x 2.5G, 256G boot drive

node01 22c/80g
dc01 2c/6g, cisbench 2c/2g, k8s01 12c/48g, docker01 6c/24g

node02 18c/86g
sec01 4c/16g, agents01 4c/32g, port01 2c/6g, dev02 8c/32g

node03 16c/72g
dc02 2c/6g, mongo01 2c/8g, k8s02 12c/48g

node04 20c/76g
ztna01 2c/2g, oscal01 4c/16c, k8s03 12c/48g, proj-dns01 2c/2g
			
node05 18c/72G
fs01 2c/8g, mon01 4c/16g, fs02 2c/8g, docker02 6c/24g, repo01 4c/16c

node06 18c/72g
pgsql01 8c/32g, psql02 4c/16g, neo4j01 6c/24g

node07
gpu01 8c/32g, dev01 8c/32g, docker03 6c/24g, kasm 8c/32g
