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

Importantly, each node will also need space to store images and containers. My suggestion would be a minimum of 64GB; I use 128GB and it affords me plenty of headroom.

MicroCeph will need 1+ OSDs per node. You can use https://florian.ca/ceph-calculator/ for CephFS calculations to decide how much you need for your use case.

## Suggested / Minimal Specs
* MicroK8s Nodes (3): Ubuntu 2204, 2 cores, 4GB RAM, 64GB disk
* MicroCeph Nodes (3): Ubuntu 2204, 2 cores, 4GB RAM, 32GB disk + 1 OSD/node (32GB)
* Cluster Specs: 6 cores, 12GB RAM, CephFS (32GB safe / 48GB risky)

A more capable small production cluster might look like this (my current cluster):
* MicroK8s Nodes (5): Ubuntu 2204, 6 cores, 16GB RAM, 32GB disk
* Ceph Nodes (3): Ubuntu 2204 2 cores, 16GB RAM, 32GB disk + 3 OSDs/node (750GB nVME total/node)
* Cluster Specs: 30 cores, 80GB RAM, CephFS (750GB safe / 1125GB risky)

# Usage

This assumes you have your VMs from the requirements setup, freshly updated, and ready to begin.

For simplicity: I'll refer to the MicroK8s nodes as node1, node2 and node3, and the ceph nodes as ceph1, ceph2, and ceph3.

## All Nodes: Install MicroK8s

Login to each node and install MicroK8s via snap. As of the time of this writing, 1.29 is the current version. Adjust for the version you need.

```
snap install microk8s --classic --channel=1.29
```

## Node 1: Add Remaining Nodes to Cluster

On node1, generate a cluster join token by running the Add Node command.

```
microk8s add-node
```

This will provide an output similar to

```
From the node you wish to join to this cluster, run the following:
microk8s join 192.168.1.230:25000/92b2db237428470dc4fcfc4ebbd9dc81/2c0cb3284b05

Use the '--worker' flag to join a node as a worker not running the control plane, eg:
microk8s join 192.168.1.230:25000/92b2db237428470dc4fcfc4ebbd9dc81/2c0cb3284b05 --worker

If the node you are adding is not reachable through the default interface you can use one of the following:
microk8s join 192.168.1.230:25000/92b2db237428470dc4fcfc4ebbd9dc81/2c0cb3284b05
microk8s join 10.23.209.1:25000/92b2db237428470dc4fcfc4ebbd9dc81/2c0cb3284b05
microk8s join 172.17.0.1:25000/92b2db237428470dc4fcfc4ebbd9dc81/2c0cb3284b05
```

The options are self-explanatory, but my recommendation would be the first join command, considered a 'standard join'. This installs the control plane and allows this node to be a worker node.

If you join three or more nodes together using the first join command, MicroK8s will automatically configure HA for you.

