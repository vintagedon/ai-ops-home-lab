# MicroK8s Cluster w/NFS, Ceph, Portainer, 

This is a full set of instructions, configuration files, and scripts, to set up an HA MicroK8s cluster managed by Portainer.

The cluster includes:

* MicroK8s 1.29 classic
* NFS shared cluster storage via NFS CIFS drivers + persistent volume claim
* CephFS and Object Storage via MicroCeph Cluster + Ceph Addon
* Web-Based GUI iterface via Portainer or MicroK8s Dashboard
* Ingress Load Balancer: Ngnix
* Kata Containers (HA virtual machines in MicroK8s)

Due to the modular nature of MicroK8s, simply leave off a section if you don't want to enable it.

# Requirements

This is based off my cluster, which is a 4 node MicroK8s cluster with a 3 node Ceph cluster.

Although MicroK8s is lightweight, I would suggest VMs with at least 2 cores and 4GB of RAM and one OSD per Ceph node.

## Suggested / Minimal Specs
* MicroK8s Nodes (3): Ubuntu 2204, 2 cores, 4GB RAM, 32GB disk
* MicroCeph Nodes (3): Ubuntu 2204, 2 cores, 4GB RAM, 32GB disk + 1 OSD/node (32GB)
* Cluster Specs: 6 cores, 12GB RAM, CephFS (32GB safe / 48GB risky)

A more capable cluster might look like this (my current cluster):
* MicroK8s Nodes (5): Ubuntu 2204, 6 cores, 16GB RAM, 32GB disk
* Ceph Nodes (3): Ubuntu 2204 2 cores, 16GB RAM, 32GB disk + 3 OSDs/node (750GB nVME total/node)
* Cluster Specs: 30 cores, 80GB RAM, CephFS (750GB safe / 1125GB risky)

https://florian.ca/ceph-calculator/ for CephFS calculations.

# Usage

This assumes you have your VMs from the requirements setup, freshly updated, and ready to begin.

For simplicity: I'll refer to the MicroK8s nodes as node1, node2 and node3, and the ceph nodes as ceph1, ceph2, and ceph3.

## Node 1: Create a single Node MicroK8s cluster

Login to node1 and install MicroK8s via snap. As of the time of this writing, 1.29 is the current version. Adjust for the version you need.

```
snap install microk8s --classic --channel=1.29
```
