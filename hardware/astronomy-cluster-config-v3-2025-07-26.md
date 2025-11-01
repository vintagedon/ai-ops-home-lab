# Proxmox Astronomy Lab Cluster Configuration Report v2

**Generated**: 2025-07-26  
**Last Updated**: 2025-07-26

The following is a configuration report for the Proxmox cluster, detailing information for each node, virtual machine, and network switch.

## Cluster Overview

**Cluster Status**: radioastronomy (Quorate: Yes)  
**Total Nodes**: 7 online (node01-node07), 0 offline  
**Total Virtual Machines**: 32 (29 running, 1 stopped, 3 templates)  
**Total LXC Containers**: 0  

### Aggregate Resources

- **Total CPU Cores**: 144 cores across cluster (20 cores per node)
- **Total Memory**: 689.95 GiB available (280.09 GiB currently allocated - 41% utilization)
- **Total Storage**: 20.38 TiB available (828.78 GiB currently used - 4% utilization)
- **Current Load**: 1% CPU utilization cluster-wide

### Security Baseline Architecture

**Golden Image Foundation**: All cluster VMs are provisioned from standardized Ubuntu 24.04 LTS CISv8 Level 2 hardened templates. These images achieve a **Lynis Hardening Index of 86/100**, representing enterprise-grade security posture with defense-in-depth architecture including:

- **CIS Benchmark Compliance**: Full Implementation Group 2 (IG2) control coverage
- **Multi-layer Security Validation**: AIDE file integrity monitoring, RKHunter/Chkrootkit malware detection, auditd with Neo23x0 MITRE ATT&CK framework mapping
- **Automated Security Controls**: AppArmor MAC, Fail2ban intrusion prevention, kernel hardening, automated patching pipeline
- **Continuous Monitoring**: Six-month image lifecycle with security baseline updates

This security foundation ensures all VMs start from a consistent, verifiably secure baseline with comprehensive threat detection and prevention capabilities built into the infrastructure layer.

### Node Hardware Summary

- **node01**: 20x 12th Gen Intel i9-12900H, 1.92 TB NVMe (Samsung)
- **node02**: 20x 12th Gen Intel i9-12900H, 1.92 TB NVMe (Samsung)
- **node03**: 20x 12th Gen Intel i9-12900H, 1.92 TB NVMe (Samsung)
- **node04**: 20x 12th Gen Intel i9-12900H, 1.92 TB NVMe (Samsung)
- **node05**: 20x 12th Gen Intel i9-12900H, 4.00 TB NVMe (Fanxiang S660)
- **node06**: 20x 13th Gen Intel i9-13900H, 1.92 TB NVMe (Samsung)
- **node07**: 20x 12th Gen Intel i9-12900H, 4.00 TB NVMe (Fanxiang S660)

### Network Architecture

- **Management Network**: 10.16.207.0/24 (vmbr0)
- **Internal VLANs**: 10.25.10.0/24 (VLAN 10), 10.25.20.0/24 (VLAN 20), 10.25.30.0/24 (VLAN 30), 10.25.40.0/24 (VLAN 40), 10.25.50.0/24 (VLAN 50), 10.25.60.0/24 (VLAN 60)
- **Bonding**: LACP 802.3ad bonds on all nodes (bond0 = spf0 + spf1)

## Proxmox Cluster Configuration Report

### Cluster Nodes

#### node01

- **CPU**: 20 x 12th Gen Intel(R) Core(TM) i9-12900H (1 Socket)
- **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
- **Boot Mode**: EFI (Secure Boot)
- **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
- **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
- **Network Configuration**:
  - **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
  - **eth0**: Network Device, Active: Yes, Autostart: No
  - **eth1**: Network Device, Active: Yes, Autostart: No
  - **spf0**: Unknown, Active: Yes, Autostart: No
  - **spf1**: Unknown, Active: Yes, Autostart: No
  - **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.61/24, Gateway: 10.16.207.1
  - **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
  - **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.231/24
  - **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.231/24
  - **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.231/24
  - **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.231/24
  - **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.231/24
  - **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.231/24
- **Disk Configuration**:
  - **/dev/nvme0n1**: Type: nvme, Usage: partitions, Size: 1.92 TB, GPT: Yes, Model: SAMSUNG MZ1LB1T9HALS-00007, Serial: S436NC0R484453, S.M.A.R.T.: PASSED, Wearout: 14%
    - **/dev/nvme0n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 1.65 TB, GPT: Yes
- **Storage Pools**:
  - **data**: Volume Group: pve, Size: 165.47 GiB
  - **nvmethin01**: Volume Group: nvmethin01, Size: 1.61 TiB
- **Sensor Readings**:
  - coretemp-isa-0000 Package id 0: 46.0°C
  - coretemp-isa-0000 Core 0: 44.0°C
  - coretemp-isa-0000 Core 4: 42.0°C
  - coretemp-isa-0000 Core 8: 46.0°C
  - coretemp-isa-0000 Core 12: 42.0°C
  - coretemp-isa-0000 Core 16: 43.0°C
  - coretemp-isa-0000 Core 20: 41.0°C
  - coretemp-isa-0000 Core 24: 46.0°C
  - coretemp-isa-0000 Core 25: 46.0°C
  - coretemp-isa-0000 Core 26: 46.0°C
  - coretemp-isa-0000 Core 27: 46.0°C
  - coretemp-isa-0000 Core 28: 44.0°C
  - coretemp-isa-0000 Core 29: 44.0°C
  - coretemp-isa-0000 Core 30: 44.0°C
  - coretemp-isa-0000 Core 31: 44.0°C
  - acpitz-acpi-0 temp1: 27.8°C
  - mt7921_phy0-pci-5a00 temp1: 48.0°C
  - nvme-pci-5800 Composite: 50.9°C
  - nvme-pci-5800 Sensor 1: 50.9°C
  - nvme-pci-5800 Sensor 2: 59.9°C
  - nvme-pci-5800 Sensor 3: 71.8°C

#### node02

- **CPU**: 20 x 12th Gen Intel(R) Core(TM) i9-12900H (1 Socket)
- **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
- **Boot Mode**: EFI (Secure Boot)
- **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
- **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
- **Network Configuration**:
  - **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
  - **eth0**: Network Device, Active: Yes, Autostart: No
  - **eth1**: Network Device, Active: Yes, Autostart: No
  - **spf0**: Unknown, Active: Yes, Autostart: No
  - **spf1**: Unknown, Active: Yes, Autostart: No
  - **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.62/24, Gateway: 10.16.207.1
  - **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
  - **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.232/24
  - **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.232/24
  - **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.232/24
  - **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.232/24
  - **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.232/24
  - **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.232/24
- **Disk Configuration**:
  - **/dev/nvme0n1**: Type: nvme, Usage: partitions, Size: 1.92 TB, GPT: Yes, Model: SAMSUNG MZ1LB1T9HALS-00007, Serial: S436NC0R434271, S.M.A.R.T.: PASSED, Wearout: 14%
    - **/dev/nvme0n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 1.65 TB, GPT: Yes
- **Storage Pools**:
  - **data**: Volume Group: pve, Size: 165.47 GiB
  - **nvmethin01**: Volume Group: nvmethin01, Size: 1.61 TiB
- **Sensor Readings**:
  - coretemp-isa-0000 Package id 0: 44.0°C
  - coretemp-isa-0000 Core 0: 42.0°C
  - coretemp-isa-0000 Core 4: 40.0°C
  - coretemp-isa-0000 Core 8: 44.0°C
  - coretemp-isa-0000 Core 12: 40.0°C
  - coretemp-isa-0000 Core 16: 41.0°C
  - coretemp-isa-0000 Core 20: 39.0°C
  - coretemp-isa-0000 Core 24: 44.0°C
  - coretemp-isa-0000 Core 25: 44.0°C
  - coretemp-isa-0000 Core 26: 44.0°C
  - coretemp-isa-0000 Core 27: 44.0°C
  - coretemp-isa-0000 Core 28: 42.0°C
  - coretemp-isa-0000 Core 29: 42.0°C
  - coretemp-isa-0000 Core 30: 42.0°C
  - coretemp-isa-0000 Core 31: 42.0°C
  - acpitz-acpi-0 temp1: 27.8°C
  - mt7921_phy0-pci-5a00 temp1: 46.0°C
  - nvme-pci-5800 Composite: 48.9°C
  - nvme-pci-5800 Sensor 1: 48.9°C
  - nvme-pci-5800 Sensor 2: 57.9°C
  - nvme-pci-5800 Sensor 3: 69.8°C

#### node03

- **CPU**: 20 x 12th Gen Intel(R) Core(TM) i9-12900H (1 Socket)
- **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
- **Boot Mode**: EFI (Secure Boot)
- **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
- **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
- **Network Configuration**:
  - **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
  - **eth0**: Network Device, Active: Yes, Autostart: No
  - **eth1**: Network Device, Active: Yes, Autostart: No
  - **spf0**: Unknown, Active: Yes, Autostart: No
  - **spf1**: Unknown, Active: Yes, Autostart: No
  - **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.63/24, Gateway: 10.16.207.1
  - **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
  - **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.233/24
  - **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.233/24
  - **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.233/24
  - **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.233/24
  - **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.233/24
  - **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.233/24
- **Disk Configuration**:
  - **/dev/nvme0n1**: Type: nvme, Usage: partitions, Size: 1.92 TB, GPT: Yes, Model: SAMSUNG MZ1LB1T9HALS-00007, Serial: S436NC0R434279, S.M.A.R.T.: PASSED, Wearout: 14%
    - **/dev/nvme0n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 1.65 TB, GPT: Yes
- **Storage Pools**:
  - **data**: Volume Group: pve, Size: 165.47 GiB
  - **nvmethin01**: Volume Group: nvmethin01, Size: 1.61 TiB
- **Sensor Readings**:
  - coretemp-isa-0000 Package id 0: 46.0°C
  - coretemp-isa-0000 Core 0: 44.0°C
  - coretemp-isa-0000 Core 4: 42.0°C
  - coretemp-isa-0000 Core 8: 46.0°C
  - coretemp-isa-0000 Core 12: 42.0°C
  - coretemp-isa-0000 Core 16: 43.0°C
  - coretemp-isa-0000 Core 20: 41.0°C
  - coretemp-isa-0000 Core 24: 46.0°C
  - coretemp-isa-0000 Core 25: 46.0°C
  - coretemp-isa-0000 Core 26: 46.0°C
  - coretemp-isa-0000 Core 27: 46.0°C
  - coretemp-isa-0000 Core 28: 44.0°C
  - coretemp-isa-0000 Core 29: 44.0°C
  - coretemp-isa-0000 Core 30: 44.0°C
  - coretemp-isa-0000 Core 31: 44.0°C
  - acpitz-acpi-0 temp1: 27.8°C
  - mt7921_phy0-pci-5a00 temp1: 48.0°C
  - nvme-pci-5800 Composite: 50.9°C
  - nvme-pci-5800 Sensor 1: 50.9°C
  - nvme-pci-5800 Sensor 2: 59.9°C
  - nvme-pci-5800 Sensor 3: 71.8°C

#### node04

- **CPU**: 20 x 12th Gen Intel(R) i9-12900H (1 Socket)
- **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
- **Boot Mode**: EFI (Secure Boot)
- **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
- **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
- **Network Configuration**:
  - **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
  - **eth0**: Network Device, Active: Yes, Autostart: No
  - **eth1**: Network Device, Active: Yes, Autostart: No
  - **spf0**: Unknown, Active: Yes, Autostart: No
  - **spf1**: Unknown, Active: Yes, Autostart: No
  - **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.64/24, Gateway: 10.16.207.1
  - **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
  - **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.234/24
  - **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.234/24
  - **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.234/24
  - **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.234/24
  - **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.234/24
  - **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.234/24
- **Disk Configuration**:
  - **/dev/nvme0n1**: Type: nvme, Usage: partitions, Size: 1.92 TB, GPT: Yes, Model: SAMSUNG MZ1LB1T9HALS-00007, Serial: S436NC0R434304, S.M.A.R.T.: PASSED, Wearout: 14%
    - **/dev/nvme0n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 1.65 TB, GPT: Yes
- **Storage Pools**:
  - **data**: Volume Group: pve, Size: 165.47 GiB
  - **nvmethin01**: Volume Group: nvmethin01, Size: 1.61 TiB
- **Sensor Readings**:
  - coretemp-isa-0000 Package id 0: 46.0°C
  - coretemp-isa-0000 Core 0: 44.0°C
  - coretemp-isa-0000 Core 4: 42.0°C
  - coretemp-isa-0000 Core 8: 46.0°C
  - coretemp-isa-0000 Core 12: 42.0°C
  - coretemp-isa-0000 Core 16: 43.0°C
  - coretemp-isa-0000 Core 20: 41.0°C
  - coretemp-isa-0000 Core 24: 46.0°C
  - coretemp-isa-0000 Core 25: 46.0°C
  - coretemp-isa-0000 Core 26: 46.0°C
  - coretemp-isa-0000 Core 27: 46.0°C
  - coretemp-isa-0000 Core 28: 44.0°C
  - coretemp-isa-0000 Core 29: 44.0°C
  - coretemp-isa-0000 Core 30: 44.0°C
  - coretemp-isa-0000 Core 31: 44.0°C
  - acpitz-acpi-0 temp1: 27.8°C
  - mt7921_phy0-pci-5a00 temp1: 48.0°C
  - nvme-pci-5800 Composite: 50.9°C
  - nvme-pci-5800 Sensor 1: 50.9°C
  - nvme-pci-5800 Sensor 2: 59.9°C
  - nvme-pci-5800 Sensor 3: 71.8°C

#### node05

- **CPU**: 20 x 12th Gen Intel(R) Core(TM) i9-12900H (1 Socket)
- **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
- **Boot Mode**: EFI (Secure Boot)
- **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
- **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
- **Network Configuration**:
  - **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
  - **eth0**: Network Device, Active: Yes, Autostart: No
  - **eth1**: Network Device, Active: Yes, Autostart: No
  - **spf0**: Unknown, Active: Yes, Autostart: No
  - **spf1**: Unknown, Active: Yes, Autostart: No
  - **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.65/24, Gateway: 10.16.207.1
  - **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
  - **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.235/24
  - **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.235/24
  - **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.235/24
  - **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.235/24
  - **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.235/24
  - **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.235/24
- **Disk Configuration**:
  - **/dev/nvme0n1**: Type: nvme, Usage: partitions, Size: 4.00 TB, GPT: Yes, Model: Fanxiang S660 4TB, Serial: FK232806224, S.M.A.R.T.: PASSED, Wearout: 3%
    - **/dev/nvme0n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 3.73 TB, GPT: Yes
  - **/dev/sda**: Type: SSD, Usage: N/A, Size: 525.11 GB, GPT: No, Model: Crucial_CT525MX300SSD1, Serial: 1744137A9B51, S.M.A.R.T.: PASSED, Wearout: 45%
- **Storage Pools**:
  - **data**: Volume Group: pve, Size: 165.47 GiB
  - **nvmethin01**: Volume Group: nvmethin01, Size: 3.64 TiB
  - **nvmethin02**: Volume Group: nvmethin02, Size: 487.88 GiB
- **Sensor Readings**:
  - coretemp-isa-0000 Package id 0: 46.0°C
  - coretemp-isa-0000 Core 0: 44.0°C
  - coretemp-isa-0000 Core 4: 42.0°C
  - coretemp-isa-0000 Core 8: 46.0°C
  - coretemp-isa-0000 Core 12: 42.0°C
  - coretemp-isa-0000 Core 16: 43.0°C
  - coretemp-isa-0000 Core 20: 41.0°C
  - coretemp-isa-0000 Core 24: 46.0°C
  - coretemp-isa-0000 Core 25: 46.0°C
  - coretemp-isa-0000 Core 26: 46.0°C
  - coretemp-isa-0000 Core 27: 46.0°C
  - coretemp-isa-0000 Core 28: 44.0°C
  - coretemp-isa-0000 Core 29: 44.0°C
  - coretemp-isa-0000 Core 30: 44.0°C
  - coretemp-isa-0000 Core 31: 44.0°C
  - acpitz-acpi-0 temp1: 27.8°C
  - mt7921_phy0-pci-5a00 temp1: 48.0°C
  - nvme-pci-5800 Composite: 50.9°C
  - nvme-pci-5800 Sensor 1: 50.9°C
  - nvme-pci-5800 Sensor 2: 59.9°C
  - nvme-pci-5800 Sensor 3: 71.8°C

#### node06

- **CPU**: 20 x 13th Gen Intel(R) i9-13900H (1 Socket)
- **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
- **Boot Mode**: EFI (Secure Boot)
- **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
- **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
- **Network Configuration**:
  - **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
  - **eth0**: Network Device, Active: Yes, Autostart: No
  - **eth1**: Network Device, Active: Yes, Autostart: No
  - **spf0**: Unknown, Active: Yes, Autostart: No
  - **spf1**: Unknown, Active: Yes, Autostart: No
  - **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.66/24, Gateway: 10.16.207.1
  - **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
  - **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.236/24
  - **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.236/24
  - **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.236/24
  - **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.236/24
  - **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.236/24
  - **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.236/24
- **Disk Configuration**:
  - **/dev/nvme0n1**: Type: nvme, Usage: partitions, Size: 1.92 TB, GPT: Yes, Model: SAMSUNG MZ1LB1T9HALS-00007, Serial: S436NC0R434152, S.M.A.R.T.: PASSED, Wearout: 14%
    - **/dev/nvme0n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 1.65 TB, GPT: Yes
  - **/dev/nvme1n1**: Type: nvme, Usage: partitions, Size: 1.92 TB, GPT: Yes, Model: SAMSUNG MZ1LB1T9HALS-00007, Serial: S436NC0R434169, S.M.A.R.T.: PASSED, Wearout: 14%
    - **/dev/nvme1n... partition**: Type: LVM, Size: 1.92 TB, GPT: Yes
  - **/dev/nvme2n1**: Type: nvme, Usage: partitions, Size: 1.92 TB, GPT: Yes, Model: SAMSUNG MZ1LB1T9HALS-00007, Serial: S436NC0R434162, S.M.A.R.T.: PASSED, Wearout: 14%
    - **/dev/nvme2n... partition**: Type: LVM, Size: 1.92 TB, GPT: Yes
- **Storage Pools**:
  - **data**: Volume Group: pve, Size: 165.47 GiB
  - **nvmethin01**: Volume Group: nvmethin01, Size: 1.61 TiB
  - **nvmethin04**: Volume Group: nvmethin04, Size: 1.86 TiB
  - **nvmethin05**: Volume Group: nvmethin05, Size: 1.86 TiB
- **Sensor Readings**:
  - coretemp-isa-0000 Package id 0: 44.0°C
  - coretemp-isa-0000 Core 0: 42.0°C
  - coretemp-isa-0000 Core 4: 40.0°C
  - coretemp-isa-0000 Core 8: 44.0°C
  - coretemp-isa-0000 Core 12: 40.0°C
  - coretemp-isa-0000 Core 16: 41.0°C
  - coretemp-isa-0000 Core 20: 39.0°C
  - coretemp-isa-0000 Core 24: 44.0°C
  - coretemp-isa-0000 Core 25: 44.0°C
  - coretemp-isa-0000 Core 26: 44.0°C
  - coretemp-isa-0000 Core 27: 44.0°C
  - coretemp-isa-0000 Core 28: 42.0°C
  - coretemp-isa-0000 Core 29: 42.0°C
  - coretemp-isa-0000 Core 30: 42.0°C
  - coretemp-isa-0000 Core 31: 42.0°C
  - nvme-pci-5900 Composite: 52.9°C
  - nvme-pci-5900 Sensor 1: 52.9°C
  - nvme-pci-5900 Sensor 2: 54.9°C
  - nvme-pci-5900 Sensor 3: 66.8°C
  - acpitz-acpi-0 temp1: 27.8°C
  - mt7921_phy0-pci-5c00 temp1: 44.0°C
  - nvme-pci-5a00 Composite: 49.9°C
  - nvme-pci-5a00 Sensor 1: 49.9°C
  - nvme-pci-5a00 Sensor 2: 53.9°C
  - nvme-pci-5a00 Sensor 3: 57.9°C
  - nvme-pci-0100 Composite: 64.8°C
  - nvme-pci-0100 Sensor 1: 64.8°C
  - nvme-pci-0100 Sensor 2: 78.8°C
  - nvme-pci-0100 Sensor 3: 94.8°C

#### node07

- **CPU**: 20 x 12th Gen Intel(R) Core(TM) i9-12900H (1 Socket)
- **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
- **Boot Mode**: EFI (Secure Boot)
- **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
- **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
- **Network Configuration**:
  - **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
  - **eth0**: Network Device, Active: Yes, Autostart: No
  - **eth1**: Network Device, Active: Yes, Autostart: No
  - **spf0**: Unknown, Active: Yes, Autostart: No
  - **spf1**: Unknown, Active: Yes, Autostart: No
  - **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.67/24, Gateway: 10.16.207.1
  - **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
  - **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.237/24
  - **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.237/24
  - **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.237/24
  - **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.237/24
  - **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.237/24
  - **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.237/24
- **Disk Configuration**:
  - **/dev/nvme0n1**: Type: nvme, Usage: partitions, Size: 4.00 TB, GPT: Yes, Model: Fanxiang S660 4TB, Serial: FK232806224, S.M.A.R.T.: PASSED, Wearout: 3%
    - **/dev/nvme0n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
    - **/dev/nvme0n... partition**: Type: LVM, Size: 3.73 TB, GPT: Yes
  - **/dev/sda**: Type: SSD, Usage: N/A, Size: 525.11 GB, GPT: No, Model: Crucial_CT525MX300SSD1, Serial: 1744137A9B51, S.M.A.R.T.: PASSED, Wearout: 45%
- **Storage Pools**:
  - **data**: Volume Group: pve, Size: 165.47 GiB
  - **nvmethin01**: Volume Group: nvmethin01, Size: 3.64 TiB
- **Sensor Readings**:
  - coretemp-isa-0000 Package id 0: 46.0°C
  - coretemp-isa-0000 Core 0: 44.0°C
  - coretemp-isa-0000 Core 4: 42.0°C
  - coretemp-isa-0000 Core 8: 46.0°C
  - coretemp-isa-0000 Core 12: 42.0°C
  - coretemp-isa-0000 Core 16: 43.0°C
  - coretemp-isa-0000 Core 20: 41.0°C
  - coretemp-isa-0000 Core 24: 46.0°C
  - coretemp-isa-0000 Core 25: 46.0°C
  - coretemp-isa-0000 Core 26: 46.0°C
  - coretemp-isa-0000 Core 27: 46.0°C
  - coretemp-isa-0000 Core 28: 44.0°C
  - coretemp-isa-0000 Core 29: 44.0°C
  - coretemp-isa-0000 Core 30: 44.0°C
  - coretemp-isa-0000 Core 31: 44.0°C
  - acpitz-acpi-0 temp1: 27.8°C
  - mt7921_phy0-pci-5a00 temp1: 48.0°C
  - nvme-pci-5800 Composite: 50.9°C
  - nvme-pci-5800 Sensor 1: 50.9°C
  - nvme-pci-5800 Sensor 2: 59.9°C
  - nvme-pci-5800 Sensor 3: 71.8°C

### Virtual Machines

- **VM 1001 (mgmt-mon01)**
  - **Node**: node03
  - **Tags**: infra, mgmt, monitor
  - **IPs**: 10.25.10.2
  - **Hardware**:
    - Memory: 8.00 GiB/12.00 GiB
    - Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-1001-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-1001-disk-3,discard=on,iothread=1,size=100G
    - Network Device (net0): virtio=BC:24:11:F7:E7:31,bridge=vmbr1,tag=10
    - EFI Disk: nvmethin01:vm-1001-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-1001-disk-2,size=4M,version=v2.0

- **VM 1002 (mgmt-proxy01)**
  - **Node**: node06
  - **Tags**: infra, mgmt, proxy
  - **IPs**: 10.25.10.3
  - **Hardware**:
    - Memory: 4.00 GiB/8.00 GiB
    - Processors: 2 (2 sockets, 1 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-1002-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-1002-disk-3,discard=on,iothread=1,size=100G
    - Network Device (net0): virtio=BC:24:11:B0:72:EC,bridge=vmbr1,tag=10
    - EFI Disk: nvmethin01:vm-1002-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-1002-disk-2,size=4M,version=v2.0

- **VM 1003 (mgmt-test01)**
  - **Node**: node07
  - **Tags**: mgmt, test
  - **IPs**: 10.25.10.4
  - **Hardware**:
    - Memory: 2.00 GiB/4.00 GiB
    - Processors: 2 (2 sockets, 1 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-1003-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-1003-disk-3,discard=on,iothread=1,size=100G
    - Network Device (net0): virtio=BC:24:11:A3:6E:31,bridge=vmbr1,tag=10
    - EFI Disk: nvmethin01:vm-1003-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-1003-disk-2,size=4M,version=v2.0

- **VM 1004 (mgmt-file01)**
  - **Node**: node05
  - **Tags**: file, infra, mgmt
  - **IPs**: 10.25.10.5
  - **Hardware**:
    - Memory: 8.00 GiB/16.00 GiB
    - Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: pc-q35-9.0
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-1004-disk-0,backup=0,discard=on,iothread=1,size=125G
    - Hard Disk (scsi1): nvmethin04:vm-1004-disk-0,size=1000G
    - Network Device (net0): virtio=BC:24:11:EB:E6:90,bridge=vmbr1,tag=10
    - EFI Disk: nvmethin01:vm-1004-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-1004-disk-2,size=4M,version=v2.0

- **VM 1005 (mgmt-docker01)**
  - **Node**: node02
  - **Tags**: docker, mgmt
  - **IPs**: 10.25.10.9
  - **Hardware**:
    - Memory: 8.00 GiB/24.00 GiB
    - Processors: 6 (2 sockets, 3 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-1005-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-1005-disk-3,discard=on,iothread=1,size=100G
    - Network Device (net0): virtio=BC:24:11:D5:B3:60,bridge=vmbr1,tag=10
    - EFI Disk: nvmethin01:vm-1005-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-1005-disk-2,size=4M,version=v2.0

- **VM 1006 (mgmt-sec01)**
  - **Node**: node02
  - **Tags**: mgmt, security
  - **IPs**: 10.25.10.8
  - **Hardware**:
    - Memory: 4.00 GiB/12.00 GiB
    - Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-1006-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-1006-disk-3,discard=on,iothread=1,size=100G
    - Network Device (net0): virtio=BC:24:11:FF:B2:94,bridge=vmbr0,tag=10
    - EFI Disk: nvmethin01:vm-1006-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-1006-disk-2,size=4M,version=v2.0

- **VM 1007 (mgmt-agents01)**
  - **Node**: node02
  - **Tags**: ai-ml, dev, proj
  - **IPs**: 10.25.10.10
  - **Hardware**:
    - Memory: 4.00 GiB/16.00 GiB
    - Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-1007-disk-3,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-1007-disk-0,discard=on,iothread=1,size=100G
    - Network Device (net0): virtio=BC:24:11:4D:35:5E,bridge=vmbr1,tag=10
    - EFI Disk: nvmethin01:vm-1007-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-1007-disk-2,size=4M,version=v2.0

- **VM 2001 (proj-dp01)**
  - **Node**: node04
  - **Tags**: data, proj
  - **IPs**: 10.25.20.3
  - **Hardware**:
    - Memory: 2.00 GiB/16.00 GiB
    - Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-2001-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-2001-disk-3,discard=on,iothread=1,size=100G
    - Network Device (net0): virtio=BC:24:11:43:78:3A,bridge=vmbr1,tag=20
    - EFI Disk: nvmethin01:vm-2001-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-2001-disk-2,size=4M,version=v2.0

- **VM 2002 (proj-pg01)**
  - **Node**: node06
  - **Tags**: db, infra, proj
  - **IPs**: 10.25.20.8
  - **Hardware**:
    - Memory: 8.00 GiB/48.00 GiB
    - Processors: 8 (2 sockets, 4 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-2002-disk-2,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-2002-disk-4,discard=on,iothread=1,size=250G
    - Network Device (net0): virtio=BC:24:11:B0:1F:69,bridge=vmbr1,tag=20
    - EFI Disk: nvmethin01:vm-2002-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-2002-disk-3,size=4M,version=v2.0

- **VM 2003 (radio-dc02)**
  - **Node**: node03
  - **Tags**: infra, mgmt, rodc
  - **IPs**: 10.25.20.2
  - **Hardware**:
    - Memory: 2.00 GiB/6.00 GiB
    - Processors: 2 (2 sockets, 1 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: pc-i440fx-9.0
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-2003-disk-4,discard=on,format=raw,iothread=1,size=125G
    - Network Device (net0): virtio=BC:24:11:4F:DE:D1,bridge=vmbr1,tag=20
    - EFI Disk: nvmethin01:vm-2003-disk-3,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-2003-disk-5,size=4M,version=v2.0

- **VM 2004 (proj-dev01)**
  - **Node**: node05
  - **Tags**: dev, docker
  - **IPs**: 10.25.20.7
  - **Hardware**:
    - Memory: 4.00 GiB/16.00 GiB
    - Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-2004-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin02:vm-2004-disk-0,discard=on,iothread=1,size=100G
    - Network Device (net0): virtio=BC:24:11:19:D9:95,bridge=vmbr1,tag=20
    - EFI Disk: nvmethin01:vm-2004-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-2004-disk-2,size=4M,version=v2.0

- **VM 2005 (proj-kasm01)**
  - **Node**: node06
  - **Tags**: proj, vdi
  - **IPs**: 10.25.20.10
  - **Hardware**:
    - Memory: 8.00 GiB/24.00 GiB
    - Processors: 6 (2 sockets, 3 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-2005-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-2005-disk-3,discard=on,iothread=1,size=100G
    - Network Device (net0): virtio=BC:24:11:D8:47:E6,bridge=vmbr1,tag=20
    - EFI Disk: nvmethin01:vm-2005-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-2005-disk-2,size=4M,version=v2.0

- **VM 2006 (proj-pgsql02)**
  - **Node**: node01
  - **Tags**: db, proj
  - **IPs**: 10.25.20.9
  - **Hardware**:
    - Memory: 16.00 GiB/48.00 GiB
    - Processors: 8 (2 sockets, 4 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-2006-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-2006-disk-3,discard=on,iothread=1,size=500G
    - Network Device (net0): virtio=BC:24:11:80:F1:B3,bridge=vmbr1,tag=20
    - EFI Disk: nvmethin01:vm-2006-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-2006-disk-2,size=4M,version=v2.0

- **VM 2018 (proj-mon01)**
  - **Node**: node07
  - **Tags**: monitor, proj
  - **IPs**: 10.25.20.11
  - **Hardware**:
    - Memory: 8.00 GiB/16.00 GiB
    - Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-2018-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-2018-disk-3,discard=on,iothread=1,size=100G
    - Network Device (net0): virtio=BC:24:11:29:B6:52,bridge=vmbr1,tag=20
    - EFI Disk: nvmethin01:vm-2018-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-2018-disk-2,size=4M,version=v2.0

- **VM 2019 (proj-docker02)**
  - **Node**: node04
  - **Tags**: docker, proj
  - **IPs**: 10.25.20.24
  - **Hardware**:
    - Memory: 5.06 GiB/24.00 GiB
    - Processors: 6 (2 sockets, 3 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-2019-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-2019-disk-3,discard=on,iothread=1,size=100G
    - Network Device (net0): virtio=BC:24:11:59:C1:99,bridge=vmbr1,tag=20
    - EFI Disk: nvmethin01:vm-2019-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-2019-disk-2,size=4M,version=v2.0

- **VM 2020 (proj-ztna01)**
  - **Node**: node02
  - **Tags**: infra, proj, security
  - **IPs**: 10.25.20.25
  - **Hardware**:
    - Memory: 1.73 GiB/2.00 GiB
    - Processors: 2 (2 sockets, 1 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-2020-disk-1,discard=on,iothread=1,size=32G
    - Network Device (net0): virtio=BC:24:11:D0:12:7F,bridge=vmbr1,tag=20
    - EFI Disk: nvmethin01:vm-2020-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-2020-disk-2,size=4M,version=v2.0

- **VM 2021 (proj-dev02)**
  - **Node**: node05
  - **Tags**: dev, docker
  - **IPs**: 10.25.20.26
  - **Hardware**:
    - Memory: 976.98 MiB/8.00 GiB
    - Processors: 2 (2 sockets, 1 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-2021-disk-1,discard=on,iothread=1,size=32G
    - Network Device (net0): virtio=BC:24:11:59:C1:99,bridge=vmbr1,tag=20
    - EFI Disk: nvmethin01:vm-2021-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-2021-disk-2,size=4M,version=v2.0

- **VM 3001 (proj-k8s01)**
  - **Node**: node01
  - **Tags**: k8s, proj
  - **IPs**: 10.25.20.4
  - **Hardware**:
    - Memory: 32.00 GiB/82.00 GiB
    - Processors: 16 (2 sockets, 8 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-3001-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-3001-disk-3,discard=on,iothread=1,size=1000G
    - Network Device (net0): virtio=BC:24:11:7F:95:52,bridge=vmbr1,tag=20
    - EFI Disk: nvmethin01:vm-3001-disk-0,efitype=4m,pre-enrolled-keys=1,size=4M
    - TPM State: nvmethin01:vm-3001-disk-2,size=4M,version=v2.0

- **VM 3002 (proj-k8s02)**
  - **Node**: node03
  - **Tags**: k8s, proj
  - **IPs**: 10.25.20.5
  - **Hardware**:
    - Memory: 32.00 GiB/82.00 GiB
    - Processors: 16 (2 sockets, 8 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-3002-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-3002-disk-3,discard=on,iothread=1,size=1000G
    - Network Device (net0): virtio=BC:24:11:C3:03:AA,bridge=vmbr0,tag=20
    - EFI Disk: nvmethin01:vm-3002-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-3002-disk-2,size=4M,version=v2.0

- **VM 3003 (proj-k8s03)**
  - **Node**: node07
  - **Tags**: k8s, proj
  - **IPs**: 10.25.20.6
  - **Hardware**:
    - Memory: 32.00 GiB/82.00 GiB
    - Processors: 16 (2 sockets, 8 cores) [host] [numa=1]
    - BIOS: OVMF (UEFI)
    - Display: Default
    - Machine: q35,viommu=intel
    - SCSI Controller: VirtIO SCSI single
    - CD/DVD Drive: none,media=cdrom
    - Hard Disk (scsi0): nvmethin01:vm-3003-disk-1,discard=on,iothread=1,size=32G
    - Hard Disk (scsi1): nvmethin01:vm-3003-disk-3,discard=on,iothread=1,size=1000G
    - Network Device (net0): virtio=BC:24:11:91:85:4C,bridge=vmbr1,tag=20
    - EFI Disk: nvmethin01:vm-3003-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
    - TPM State: nvmethin01:vm-3003-disk-2,size=4M,version=v2.0

### Network Switches

#### Main Switch (Model: Unifi UDM Pro)

- **Ports**: 10
- **Port Config**:
  - Port 1: node01 - eth0 (1G management)
  - Port 2: node02 - eth0 (1G management)
  - Port 3: node03 - eth0 (1G management)
  - Port 4: node04 - eth0 (1G management)
  - Port 5: node05 - eth0 (1G management)
  - Port 6: node06 - eth0 (1G management)
  - Port 7: node07 - eth0 (1G management)
  - Port 8: SFP+ Switch - Uplink (10G)
  - Port 9: Open
  - Port 10: WAN Uplink

#### SFP+ Switch (Model: Unifi USW Pro Aggregation)

- **Ports**: 28 (20x SFP+, 8x RJ45)
- **Port Config**:
  - SFP+ 1: node01 - spf0 (10G cluster)
  - SFP+ 2: node01 - spf1 (10G cluster)
  - SFP+ 3: node02 - spf0 (10G cluster)
  - SFP+ 4: node02 - spf1 (10G cluster)
  - SFP+ 5: node03 - spf0 (10G cluster)
  - SFP+ 6: node03 - spf1 (10G cluster)
  - SFP+ 7: node04 - spf0 (10G cluster)
  - SFP+ 8: node04 - spf1 (10G cluster)
  - SFP+ 9: node05 - spf0 (10G cluster)
  - SFP+ 10: node05 - spf1 (10G cluster)
  - SFP+ 11: node06 - spf0 (10G cluster)
  - SFP+ 12: node06 - spf1 (10G cluster)
  - SFP+ 13: node07 - spf0 (10G cluster)
  - SFP+ 14: node07 - spf1 (10G cluster)
  - SFP+ 15-20: Available
  - RJ45 1: Uplink to Main Switch (10G)
  - RJ45 2-8: Available

---

## Configuration Summary

This cluster configuration represents a production-ready astronomical computing platform with comprehensive security hardening, enterprise networking, and scalable storage architecture. The Ubuntu 24.04 LTS CISv8 L2 baseline ensures consistent security posture across all workloads while maintaining operational flexibility for research computing requirements.
