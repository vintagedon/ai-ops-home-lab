The following is a configuration report for the Proxmox cluster, detailing information for each node, virtual machine, and network switch.

## Proxmox Cluster Configuration Report

### Cluster Nodes

#### node01

*   **CPU**: 20 x 12th Gen Intel(R) Core(TM) i9-12900H (1 Socket)
*   **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
*   **Boot Mode**: EFI (Secure Boot)
*   **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
*   **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
*   **Network Configuration**:
    *   **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
    *   **eth0**: Network Device, Active: Yes, Autostart: No
    *   **eth1**: Network Device, Active: Yes, Autostart: No
    *   **spf0**: Unknown, Active: Yes, Autostart: No
    *   **spf1**: Unknown, Active: Yes, Autostart: No
    *   **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.61/24, Gateway: 10.16.207.1
    *   **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
    *   **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.231/24
    *   **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.231/24
    *   **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.231/24
    *   **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.231/24
    *   **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.231/24
    *   **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.231/24
*   **Disk Configuration**:
    *   **/dev/nvme0n1**: Type: nvme, Usage: partitions, Size: 1.92 TB, GPT: Yes, Model: SAMSUNG MZ1LB1T9HALS-00007, Serial: S436NC0R484453, S.M.A.R.T.: PASSED, Wearout: 14%
        *   **/dev/nvme0n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: LVM, Size: 1.65 TB, GPT: Yes
*   **Storage Pools**:
    *   **data**: Volume Group: pve, Size: 165.47 GiB
    *   **nvmethin01**: Volume Group: nvmethin01, Size: 1.61 TiB
*   **Sensor Readings**:
    *   coretemp-isa-0000 Package id 0: 46.0°C
    *   coretemp-isa-0000 Core 0: 44.0°C
    *   coretemp-isa-0000 Core 4: 42.0°C
    *   coretemp-isa-0000 Core 8: 46.0°C
    *   coretemp-isa-0000 Core 12: 42.0°C
    *   coretemp-isa-0000 Core 16: 43.0°C
    *   coretemp-isa-0000 Core 20: 41.0°C
    *   coretemp-isa-0000 Core 24: 46.0°C
    *   coretemp-isa-0000 Core 25: 46.0°C
    *   coretemp-isa-0000 Core 26: 46.0°C
    *   coretemp-isa-0000 Core 27: 46.0°C
    *   coretemp-isa-0000 Core 28: 43.0°C
    *   coretemp-isa-0000 Core 29: 43.0°C
    *   coretemp-isa-0000 Core 30: 43.0°C
    *   coretemp-isa-0000 Core 31: 43.0°C
    *   acpitz-acpi-0 temp1: 27.8°C
    *   mt7921_phy0-pci-5a00 temp1: 46.0°C
    *   nvme-pci-5800 Composite: 48.9°C
    *   nvme-pci-5800 Sensor 1: 48.9°C
    *   nvme-pci-5800 Sensor 2: 58.9°C
    *   nvme-pci-5800 Sensor 3: 69.8°C

#### node02

*   **CPU**: 16 x 12th Gen Intel(R) Core(TM) i5-12600H (1 Socket)
*   **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
*   **Boot Mode**: EFI (Secure Boot)
*   **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
*   **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
*   **Network Configuration**:
    *   **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
    *   **eth0**: Network Device, Active: Yes, Autostart: No
    *   **eth1**: Network Device, Active: Yes, Autostart: No
    *   **spf0**: Unknown, Active: Yes, Autostart: No
    *   **spf1**: Unknown, Active: Yes, Autostart: No
    *   **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.62/24, Gateway: 10.16.207.1
    *   **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
    *   **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.232/24
    *   **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.232/24
    *   **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.232/24
    *   **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.232/24
    *   **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.232/24
    *   **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.232/24
*   **Disk Configuration**:
    *   **/dev/nvme0n1**: Type: nvme, Usage: LVM, Size: 1.92 TB, GPT: No, Model: SAMSUNG MZ1LB1T9HALS-00007, Serial: S436NC0R433971, S.M.A.R.T.: PASSED, Wearout: 20%
    *   **/dev/nvme1n1**: Type: nvme, Usage: partitions, Size: 2.00 TB, GPT: Yes, Model: Samsung SSD 990 PRO 2TB, Serial: S7KHNU0Y522907V, S.M.A.R.T.: PASSED, Wearout: 0%
        *   **/dev/nvme1n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
        *   **/dev/nvme1n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
        *   **/dev/nvme1n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
        *   **/dev/nvme1n... partition**: Type: LVM, Size: 1.73 TB, GPT: Yes
*   **Storage Pools**:
    *   **data**: Volume Group: pve, Size: 165.47 GiB
    *   **nvmethin01**: Volume Group: nvmethin01, Size: 1.69 TiB
    *   **nvmethin02**: Volume Group: nvmethin02, Size: 1.89 TiB
*   **Sensor Readings**:
    *   mt7921_phy0-pci-5b00 temp1: 44.0°C
    *   nvme-pci-5800 Composite: 49.9°C
    *   nvme-pci-5800 Sensor 1: 49.9°C
    *   nvme-pci-5800 Sensor 2: 59.9°C
    *   nvme-pci-5800 Sensor 3: 69.8°C
    *   acpitz-acpi-0 temp1: 27.8°C
    *   coretemp-isa-0000 Package id 0: 46.0°C
    *   coretemp-isa-0000 Core 0: 44.0°C
    *   coretemp-isa-0000 Core 4: 46.0°C
    *   coretemp-isa-0000 Core 8: 42.0°C
    *   coretemp-isa-0000 Core 12: 41.0°C
    *   coretemp-isa-0000 Core 16: 44.0°C
    *   coretemp-isa-0000 Core 17: 44.0°C
    *   coretemp-isa-0000 Core 18: 44.0°C
    *   coretemp-isa-0000 Core 19: 44.0°C
    *   coretemp-isa-0000 Core 20: 44.0°C
    *   coretemp-isa-0000 Core 21: 44.0°C
    *   coretemp-isa-0000 Core 22: 44.0°C
    *   coretemp-isa-0000 Core 23: 44.0°C
    *   nvme-pci-5900 Composite: 48.9°C
    *   nvme-pci-5900 Sensor 1: 48.9°C
    *   nvme-pci-5900 Sensor 2: 56.9°C

#### node03

*   **CPU**: 20 x 12th Gen Intel(R) i9-12900H (1 Socket)
*   **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
*   **Boot Mode**: EFI (Secure Boot)
*   **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
*   **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
*   **Network Configuration**:
    *   **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
    *   **eth0**: Network Device, Active: Yes, Autostart: No
    *   **eth1**: Network Device, Active: Yes, Autostart: No
    *   **spf0**: Unknown, Active: Yes, Autostart: No
    *   **spf1**: Unknown, Active: Yes, Autostart: No
    *   **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.63/24, Gateway: 10.16.207.1
    *   **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
    *   **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.233/24
    *   **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.233/24
    *   **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.233/24
    *   **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.233/24
    *   **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.233/24
    *   **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.233/24
*   **Disk Configuration**:
    *   **/dev/nvme0n1**: Type: nvme, Usage: partitions, Size: 1.92 TB, GPT: Yes, Model: SAMSUNG MZ1LB1T9HALS-00007, Serial: S436NC0R520364, S.M.A.R.T.: PASSED, Wearout: 20%
        *   **/dev/nvme0n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: LVM, Size: 1.65 TB, GPT: Yes
*   **Storage Pools**:
    *   **data**: Volume Group: pve, Size: 165.47 GiB
    *   **nvmethin01**: Volume Group: nvmethin01, Size: 1.61 TiB
*   **Sensor Readings**:
    *   coretemp-isa-0000 Package id 0: 43.0°C
    *   coretemp-isa-0000 Core 0: 39.0°C
    *   coretemp-isa-0000 Core 4: 38.0°C
    *   coretemp-isa-0000 Core 8: 39.0°C
    *   coretemp-isa-0000 Core 12: 37.0°C
    *   coretemp-isa-0000 Core 16: 39.0°C
    *   coretemp-isa-0000 Core 20: 37.0°C
    *   coretemp-isa-0000 Core 24: 39.0°C
    *   coretemp-isa-0000 Core 25: 40.0°C
    *   coretemp-isa-0000 Core 26: 40.0°C
    *   coretemp-isa-0000 Core 27: 40.0°C
    *   coretemp-isa-0000 Core 28: 44.0°C
    *   coretemp-isa-0000 Core 29: 44.0°C
    *   coretemp-isa-0000 Core 30: 44.0°C
    *   coretemp-isa-0000 Core 31: 44.0°C
    *   acpitz-acpi-0 temp1: 27.8°C
    *   mt7921_phy0-pci-5a00 temp1: 48.0°C
    *   nvme-pci-5800 Composite: 50.9°C
    *   nvme-pci-5800 Sensor 1: 50.9°C
    *   nvme-pci-5800 Sensor 2: 59.9°C
    *   nvme-pci-5800 Sensor 3: 71.8°C

#### node04

*   **CPU**: 20 x 12th Gen Intel(R) i9-12900H (1 Socket)
*   **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
*   **Boot Mode**: EFI (Secure Boot)
*   **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
*   **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
*   **Network Configuration**:
    *   **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
    *   **eth0**: Network Device, Active: Yes, Autostart: No
    *   **eth1**: Network Device, Active: Yes, Autostart: No
    *   **spf0**: Unknown, Active: Yes, Autostart: No
    *   **spf1**: Unknown, Active: Yes, Autostart: No
    *   **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.64/24, Gateway: 10.16.207.1
    *   **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
    *   **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.234/24
    *   **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.234/24
    *   **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.234/24
    *   **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.234/24
    *   **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.234/24
    *   **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.234/24
*   **Disk Configuration**:
    *   **/dev/nvme0n1**: Type: nvme, Usage: partitions, Size: 1.92 TB, GPT: Yes, Model: SAMSUNG MZ1LB1T9HALS-00007, Serial: S436NC0R434304, S.M.A.R.T.: PASSED, Wearout: 13%
        *   **/dev/nvme0n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: LVM, Size: 1.65 TB, GPT: Yes
*   **Storage Pools**:
    *   **data**: Volume Group: pve, Size: 165.47 GiB
    *   **nvmethin01**: Volume Group: nvmethin01, Size: 1.61 TiB
*   **Sensor Readings**:
    *   coretemp-isa-0000 Package id 0: 47.0°C
    *   coretemp-isa-0000 Core 0: 43.0°C
    *   coretemp-isa-0000 Core 4: 42.0°C
    *   coretemp-isa-0000 Core 8: 44.0°C
    *   coretemp-isa-0000 Core 12: 45.0°C
    *   coretemp-isa-0000 Core 16: 47.0°C
    *   coretemp-isa-0000 Core 20: 43.0°C
    *   coretemp-isa-0000 Core 24: 43.0°C
    *   coretemp-isa-0000 Core 25: 43.0°C
    *   coretemp-isa-0000 Core 26: 43.0°C
    *   coretemp-isa-0000 Core 27: 43.0°C
    *   coretemp-isa-0000 Core 28: 46.0°C
    *   coretemp-isa-0000 Core 29: 46.0°C
    *   coretemp-isa-0000 Core 30: 46.0°C
    *   coretemp-isa-0000 Core 31: 46.0°C
    *   acpitz-acpi-0 temp1: 27.8°C
    *   mt7921_phy0-pci-5a00 temp1: 40.0°C
    *   nvme-pci-5800 Composite: 46.9°C
    *   nvme-pci-5800 Sensor 1: 46.9°C
    *   nvme-pci-5800 Sensor 2: 54.9°C
    *   nvme-pci-5800 Sensor 3: 65.8°C

#### node05

*   **CPU**: 16 x 12th Gen Intel(R) i5-12600H (1 Socket)
*   **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
*   **Boot Mode**: EFI (Secure Boot)
*   **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
*   **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
*   **Network Configuration**:
    *   **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
    *   **eth0**: Network Device, Active: Yes, Autostart: No
    *   **eth1**: Network Device, Active: Yes, Autostart: No
    *   **spf0**: Unknown, Active: Yes, Autostart: No
    *   **spf1**: Unknown, Active: Yes, Autostart: No
    *   **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.65/24, Gateway: 10.16.207.1
    *   **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
    *   **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.235/24
    *   **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.235/24
    *   **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.235/24
    *   **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.235/24
    *   **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.235/24
    *   **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.235/24
*   **Disk Configuration**:
    *   **/dev/nvme0n1**: Type: nvme, Usage: partitions, Size: 1.92 TB, GPT: Yes, Model: SAMSUNG MZ1LB1T9HALS-00007, Serial: S436NC0R34108, S.M.A.R.T.: PASSED, Wearout: 14%
        *   **/dev/nvme0n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: LVM, Size: 1.65 TB, GPT: Yes
    *   **/dev/nvme1n1**: Type: nvme, Usage: LVM, Size: 3.84 TB, GPT: No, Model: SAMSUNG MZALB3T8HALS-00003, Serial: S40PNE0M901781, S.M.A.R.T.: PASSED, Wearout: 0%
    *   **/dev/nvme2n1**: Type: nvme, Usage: partitions, Size: 1.88 TB, GPT: Yes, Model: MZ1LB1T9HBLS-000FB, Serial: S5XANA0R547952, S.M.A.R.T.: PASSED, Wearout: 11%
        *   **/dev/nvme2n... partition**: Type: LVM, Size: 1.61 TB, GPT: Yes
*   **Storage Pools**:
    *   **data**: Volume Group: pve, Size: 165.47 GiB
    *   **nvmethin01**: Volume Group: nvmethin01, Size: 1.61 TiB
    *   **nvmethin02**: Volume Group: nvmethin02, Size: 1.57 TiB
    *   **nvmethin04**: Volume Group: nvmethin04, Size: 3.81 TiB
*   **Sensor Readings**:
    *   coretemp-isa-0000 Package id 0: 44.0°C
    *   coretemp-isa-0000 Core 0: 41.0°C
    *   coretemp-isa-0000 Core 4: 41.0°C
    *   coretemp-isa-0000 Core 8: 40.0°C
    *   coretemp-isa-0000 Core 12: 39.0°C
    *   coretemp-isa-0000 Core 16: 42.0°C
    *   coretemp-isa-0000 Core 17: 42.0°C
    *   coretemp-isa-0000 Core 18: 42.0°C
    *   coretemp-isa-0000 Core 19: 42.0°C
    *   coretemp-isa-0000 Core 20: 44.0°C
    *   coretemp-isa-0000 Core 21: 44.0°C
    *   coretemp-isa-0000 Core 22: 44.0°C
    *   coretemp-isa-0000 Core 23: 44.0°C
    *   nvme-pci-5900 Composite: 47.9°C
    *   nvme-pci-5900 Sensor 1: 47.9°C
    *   nvme-pci-5900 Sensor 2: 54.9°C
    *   nvme-pci-5900 Sensor 3: 66.8°C
    *   acpitz-acpi-0 temp1: 27.8°C
    *   mt7921_phy0-pci-5c00 temp1: 44.0°C
    *   nvme-pci-5a00 Composite: 49.9°C
    *   nvme-pci-5a00 Sensor 1: 49.9°C
    *   nvme-pci-5a00 Sensor 2: 53.9°C
    *   nvme-pci-5a00 Sensor 3: 57.9°C
    *   nvme-pci-0100 Composite: 64.8°C
    *   nvme-pci-0100 Sensor 1: 64.8°C
    *   nvme-pci-0100 Sensor 2: 78.8°C
    *   nvme-pci-0100 Sensor 3: 94.8°C

#### node06

*   **CPU**: 20 x 13th Gen Intel(R) i9-13900H (1 Socket)
*   **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
*   **Boot Mode**: EFI (Secure Boot)
*   **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
*   **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
*   **Network Configuration**:
    *   **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
    *   **eth0**: Network Device, Active: Yes, Autostart: No
    *   **eth1**: Network Device, Active: Yes, Autostart: No
    *   **spf0**: Unknown, Active: Yes, Autostart: No
    *   **spf1**: Unknown, Active: Yes, Autostart: No
    *   **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.66/24, Gateway: 10.16.207.1
    *   **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
    *   **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.236/24
    *   **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.236/24
    *   **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.236/24
    *   **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.236/24
    *   **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.236/24
    *   **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.236/24
*   **Disk Configuration**:
    *   **/dev/nvme0n1**: Type: nvme, Usage: partitions, Size: 1.92 TB, GPT: Yes, Model: SAMSUNG MZ1LB1T9HALS-00007, Serial: S436NC0R434152, S.M.A.R.T.: PASSED, Wearout: 13%
        *   **/dev/nvme0n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: LVM, Size: 1.65 TB, GPT: Yes
*   **Storage Pools**:
    *   **data**: Volume Group: pve, Size: 165.47 GiB
    *   **nvmethin01**: Volume Group: nvmethin01, Size: 1.61 TiB
*   **Sensor Readings**:
    *   coretemp-isa-0000 Package id 0: 46.0°C
    *   coretemp-isa-0000 Core 0: 41.0°C
    *   coretemp-isa-0000 Core 4: 43.0°C
    *   coretemp-isa-0000 Core 8: 41.0°C
    *   coretemp-isa-0000 Core 12: 41.0°C
    *   coretemp-isa-0000 Core 16: 40.0°C
    *   coretemp-isa-0000 Core 20: 42.0°C
    *   coretemp-isa-0000 Core 24: 45.0°C
    *   coretemp-isa-0000 Core 25: 45.0°C
    *   coretemp-isa-0000 Core 26: 45.0°C
    *   coretemp-isa-0000 Core 27: 45.0°C
    *   coretemp-isa-0000 Core 28: 43.0°C
    *   coretemp-isa-0000 Core 29: 43.0°C
    *   coretemp-isa-0000 Core 30: 43.0°C
    *   coretemp-isa-0000 Core 31: 43.0°C
    *   acpitz-acpi-0 temp1: 27.8°C
    *   mt7921_phy0-pci-5a00 temp1: 44.0°C
    *   nvme-pci-5800 Composite: 48.9°C
    *   nvme-pci-5800 Sensor 1: 48.9°C
    *   nvme-pci-5800 Sensor 2: 55.9°C
    *   nvme-pci-5800 Sensor 3: 64.8°C

#### node07

*   **CPU**: 32 x AMD Ryzen 9 5950X 16-Core Processor (1 Socket)
*   **Kernel Version**: Linux 6.8.12-12-pve (2025-07-14T13:20Z)
*   **Boot Mode**: EFI (Secure Boot)
*   **Manager Version**: pve-manager/8.4.5/57892e8e6cb35b
*   **Repository Status**: Proxmox VE updates enabled, Non production-ready repository enabled
*   **Network Configuration**:
    *   **bond0**: Linux Bond, Active: Yes, Autostart: Yes, Ports/Slaves: spf0 spf1, Bond Mode: LACP (802.3ad)
    *   **eth0**: Network Device, Active: Yes, Autostart: No
    *   **eth1**: Network Device, Active: Yes, Autostart: No
    *   **spf0**: Unknown, Active: Yes, Autostart: No
    *   **spf1**: Unknown, Active: Yes, Autostart: No
    *   **vmbr0**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: eth0, CIDR: 10.16.207.67/24, Gateway: 10.16.207.1
    *   **vmbr1**: Linux Bridge, Active: Yes, Autostart: Yes, Ports/Slaves: bond0
    *   **vmbr1.10**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.10.237/24
    *   **vmbr1.20**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.20.237/24
    *   **vmbr1.30**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.30.237/24
    *   **vmbr1.40**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.40.237/24
    *   **vmbr1.50**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.50.237/24
    *   **vmbr1.60**: Linux VLAN, Active: Yes, Autostart: Yes, CIDR: 10.25.60.237/24
*   **Disk Configuration**:
    *   **/dev/nvme0n1**: Type: nvme, Usage: partitions, Size: 4.00 TB, GPT: Yes, Model: Fanxiang S660 4TB, Serial: FK232806224, S.M.A.R.T.: PASSED, Wearout: 3%
        *   **/dev/nvme0n... partition**: Type: BIOS boot, Size: 1.03 MB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: EFI, Size: 1.07 GB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: LVM, Size: 273.80 GB, GPT: Yes
        *   **/dev/nvme0n... partition**: Type: LVM, Size: 3.73 TB, GPT: Yes
    *   **/dev/sda**: Type: SSD, Usage: N/A, Size: 525.11 GB, GPT: No, Model: Crucial_CT525MX300SSD1, Serial: 1744137A9B51, S.M.A.R.T.: PASSED, Wearout: N/A
*   **Storage Pools**:
    *   **data**: Volume Group: pve, Size: 165.47 GiB
    *   **nvmethin01**: Volume Group: nvmethin01, Size: 3.69 TiB
*   **Sensor Readings**:
    *   k10temp-pci-00c3 Tctl: 35.5°C
    *   k10temp-pci-00c3 Tccd1: 39.0°C
    *   k10temp-pci-00c3 Tccd2: 31.0°C
    *   mlx5-pci-0400 sensor0: 86.0°C
    *   acpitz-acpi-0 temp1: 16.8°C
    *   acpitz-acpi-0 temp2: 16.8°C
    *   gigabyte_wmi-virtual-0 temp1: 43.0°C
    *   gigabyte_wmi-virtual-0 temp2: 42.0°C
    *   gigabyte_wmi-virtual-0 temp3: 35.0°C
    *   gigabyte_wmi-virtual-0 temp4: 24.0°C
    *   gigabyte_wmi-virtual-0 temp5: 36.0°C
    *   gigabyte_wmi-virtual-0 temp6: 61.0°C
    *   mlx5-pci-0401 sensor0: 86.0°C
    *   nvme-pci-0100 Composite: 37.9°C
    *   nvme-pci-0100 Sensor 1: 37.9°C

### Virtual Machines

*   **VM 1002 (mgmt-ansible01)**
    *   **Node**: node05
    *   **Tags**: infra, mgmt
    *   **IPs**: 10.25.10.7
    *   **Hardware**:
        *   Memory: 2.00 GiB/4.00 GiB
        *   Processors: 2 (2 sockets, 1 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-1002-disk-1,discard=on,iothread=1,size=32G
        *   Network Device (net0): virtio=BC:24:11:33:EC:29,bridge=vmbr1,tag=10
        *   EFI Disk: nvmethin01:vm-1002-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-1002-disk-2,size=4M,version=v2.0

*   **VM 1003 (radio-dc01)**
    *   **Node**: node01
    *   **Tags**: infra, mgmt, pdoc
    *   **IPs**: 10.25.10.2
    *   **Hardware**:
        *   Memory: 2.00 GiB/6.00 GiB
        *   Processors: 2 (2 sockets, 1 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: pc-i440fx-9.0
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): local-lvm:vm-1003-disk-1,discard=on,iothread=1,size=125G
        *   Network Device (net0): virtio=BC:24:11:8C:74:21,bridge=vmbr1,tag=10
        *   EFI Disk: local-lvm:vm-1003-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: local-lvm:vm-1003-disk-2,size=4M,version=v2.0

*   **VM 1004 (mgmt-veeam01)**
    *   **Node**: node05
    *   **Tags**: data, infra, mgmt
    *   **IPs**: 10.25.10.11
    *   **Hardware**:
        *   Memory: 8.00 GiB/16.00 GiB
        *   Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: pc-q35-9.0
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-1004-disk-0,backup=0,discard=on,iothread=1,size=125G
        *   Hard Disk (scsi1): nvmethin04:vm-1004-disk-0,size=1000G
        *   Network Device (net0): virtio=BC:24:11:EB:E6:90,bridge=vmbr1,tag=10
        *   EFI Disk: nvmethin01:vm-1004-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-1004-disk-2,size=4M,version=v2.0

*   **VM 1005 (mgmt-docker01)**
    *   **Node**: node02
    *   **Tags**: docker, mgmt
    *   **IPs**: 10.25.10.9
    *   **Hardware**:
        *   Memory: 8.00 GiB/24.00 GiB
        *   Processors: 6 (2 sockets, 3 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-1005-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-1005-disk-3,discard=on,iothread=1,size=100G
        *   Network Device (net0): virtio=BC:24:11:D5:B3:60,bridge=vmbr1,tag=10
        *   EFI Disk: nvmethin01:vm-1005-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-1005-disk-2,size=4M,version=v2.0

*   **VM 1006 (mgmt-sec01)**
    *   **Node**: node02
    *   **Tags**: mgmt, security
    *   **IPs**: 10.25.10.8
    *   **Hardware**:
        *   Memory: 4.00 GiB/12.00 GiB
        *   Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-1006-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-1006-disk-3,discard=on,iothread=1,size=100G
        *   Network Device (net0): virtio=BC:24:11:FF:B2:94,bridge=vmbr0,tag=10
        *   EFI Disk: nvmethin01:vm-1006-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-1006-disk-2,size=4M,version=v2.0

*   **VM 1007 (mgmt-agents01)**
    *   **Node**: node02
    *   **Tags**: ai-ml, dev, proj
    *   **IPs**: 10.25.10.10
    *   **Hardware**:
        *   Memory: 4.00 GiB/16.00 GiB
        *   Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-1007-disk-3,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-1007-disk-0,discard=on,iothread=1,size=100G
        *   Network Device (net0): virtio=BC:24:11:4D:35:5E,bridge=vmbr1,tag=10
        *   EFI Disk: nvmethin01:vm-1007-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-1007-disk-2,size=4M,version=v2.0

*   **VM 2001 (proj-dp01)**
    *   **Node**: node04
    *   **Tags**: data, proj
    *   **IPs**: 10.25.20.3
    *   **Hardware**:
        *   Memory: 2.00 GiB/16.00 GiB
        *   Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2001-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-2001-disk-3,discard=on,iothread=1,size=100G
        *   Network Device (net0): virtio=BC:24:11:43:78:3A,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2001-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2001-disk-2,size=4M,version=v2.0

*   **VM 2002 (proj-pg01)**
    *   **Node**: node06
    *   **Tags**: db, infra, proj
    *   **IPs**: 10.25.20.8
    *   **Hardware**:
        *   Memory: 8.00 GiB/48.00 GiB
        *   Processors: 8 (2 sockets, 4 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2002-disk-2,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-2002-disk-4,discard=on,iothread=1,size=250G
        *   Network Device (net0): virtio=BC:24:11:B0:1F:69,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2002-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2002-disk-3,size=4M,version=v2.0

*   **VM 2003 (radio-dc02)**
    *   **Node**: node03
    *   **Tags**: infra, mgmt, rodc
    *   **IPs**: 10.25.20.2
    *   **Hardware**:
        *   Memory: 2.00 GiB/6.00 GiB
        *   Processors: 2 (2 sockets, 1 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: pc-i440fx-9.0
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2003-disk-4,discard=on,format=raw,iothread=1,size=125G
        *   Network Device (net0): virtio=BC:24:11:4F:DE:D1,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2003-disk-3,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2003-disk-5,size=4M,version=v2.0

*   **VM 2004 (proj-dev01)**
    *   **Node**: node05
    *   **Tags**: dev, docker
    *   **IPs**: 10.25.20.7
    *   **Hardware**:
        *   Memory: 4.00 GiB/16.00 GiB
        *   Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2004-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin02:vm-2004-disk-0,discard=on,iothread=1,size=100G
        *   Network Device (net0): virtio=BC:24:11:19:D9:95,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2004-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2004-disk-2,size=4M,version=v2.0

*   **VM 2005 (proj-kasm01)**
    *   **Node**: node06
    *   **Tags**: proj, vdi
    *   **IPs**: 10.25.20.10
    *   **Hardware**:
        *   Memory: 8.00 GiB/24.00 GiB
        *   Processors: 6 (2 sockets, 3 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2005-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-2005-disk-3,discard=on,iothread=1,size=100G
        *   Network Device (net0): virtio=BC:24:11:D8:47:E6,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2005-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2005-disk-2,size=4M,version=v2.0

*   **VM 2006 (proj-rds01)**
    *   **Node**: node04
    *   **Tags**: infra, proj, vdi
    *   **IPs**: 10.25.20.6
    *   **Hardware**:
        *   Memory: 4.00 GiB/16.00 GiB
        *   Processors: 6 (2 sockets, 3 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: pc-i440fx-9.0
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2006-disk-1,discard=on,iothread=1,size=125G
        *   Network Device (net0): virtio=BC:24:11:EC:A8:99,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2006-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2006-disk-2,size=4M,version=v2.0

*   **VM 2007 (proj-fs01)**
    *   **Node**: node05
    *   **Tags**: data, infra, proj
    *   **IPs**: 10.25.20.11
    *   **Hardware**:
        *   Memory: 2.00 GiB/6.00 GiB
        *   Processors: 2 (2 sockets, 1 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2007-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin02:vm-2007-disk-0,discard=on,iothread=1,size=1500G
        *   Network Device (net0): virtio=BC:24:11:F7:9E:13,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2007-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2007-disk-2,size=4M,version=v2.0

*   **VM 2008 (proj-mon01)**
    *   **Node**: node05
    *   **Tags**: monitor, proj
    *   **IPs**: 10.25.20.9
    *   **Hardware**:
        *   Memory: 4.00 GiB/12.00 GiB
        *   Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2008-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-2008-disk-3,backup=0,discard=on,iothread=1,size=500G
        *   Network Device (net0): virtio=BC:24:11:C6:1F:61,bridge=vmbr1,tag=20
        *   Network Device (net1): virtio=BC:24:11:FB:AE:C8,bridge=vmbr0
        *   EFI Disk: nvmethin01:vm-2008-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2008-disk-2,size=4M,version=v2.0

*   **VM 2009 (proj-port01)**
    *   **Node**: node02
    *   **Tags**: docker, mgmt
    *   **IPs**: 10.25.20.22
    *   **Hardware**:
        *   Memory: 2.00 GiB/6.05 GiB
        *   Processors: 2 (2 sockets, 1 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2009-disk-1,discard=on,iothread=1,size=32G
        *   Network Device (net0): virtio=BC:24:11:AB:31:4D,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2009-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2009-disk-2,size=4M,version=v2.0

*   **VM 2010 (proj-fs03)**
    *   **Node**: node02
    *   **Tags**: data, infra, proj
    *   **IPs**: 10.25.20.17
    *   **Hardware**:
        *   Memory: 2.00 GiB/6.00 GiB
        *   Processors: 2 (2 sockets, 1 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2010-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin02:vm-2010-disk-0,discard=on,iothread=1,size=1500G
        *   Network Device (net0): virtio=BC:24:11:B0:FC:FF,bridge=vmbr0,tag=20
        *   EFI Disk: nvmethin01:vm-2010-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2010-disk-2,size=4M,version=v2.0

*   **VM 2011 (proj-fs02)**
    *   **Node**: node05
    *   **Tags**: data, infra, proj
    *   **IPs**: 10.25.20.20
    *   **Hardware**:
        *   Memory: 2.00 GiB/6.00 GiB
        *   Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: pc-i440fx-9.0
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2011-disk-1,discard=on,format=raw,iothread=1,size=125G
        *   Hard Disk (scsi1): nvmethin01:vm-2011-disk-3,discard=on,iothread=1,size=150G
        *   Network Device (net0): virtio=BC:24:11:09:71:9D,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2011-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2011-disk-2,size=4M,version=v2.0

*   **VM 2012 (proj-pgsql02)**
    *   **Node**: node04
    *   **Tags**: db, infra, proj
    *   **IPs**: 10.25.20.16
    *   **Hardware**:
        *   Memory: 4.00 GiB/16.00 GiB
        *   Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2012-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-2012-disk-3,discard=on,iothread=1,size=100G
        *   Network Device (net0): virtio=BC:24:11:25:2A:D3,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2012-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2012-disk-2,size=4M,version=v2.0

*   **VM 2014 (proj-docker01)**
    *   **Node**: node06
    *   **Tags**: docker, proj
    *   **IPs**: 10.25.20.14
    *   **Hardware**:
        *   Memory: 8.00 GiB/32.00 GiB
        *   Processors: 6 (2 sockets, 3 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2014-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-2014-disk-3,discard=on,iothread=1,size=100G
        *   Network Device (net0): virtio=BC:24:11:4D:6C:8B,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2014-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2014-disk-2,size=4M,version=v2.0

*   **VM 2015 (proj-fs04)**
    *   **Node**: node02
    *   **Tags**: data, infra, proj
    *   **IPs**: 10.25.20.23
    *   **Hardware**:
        *   Memory: 2.00 GiB/6.00 GiB
        *   Processors: 4 (2 sockets, 2 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: pc-i440fx-9.0
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2015-disk-1,discard=on,iothread=1,size=125G
        *   Network Device (net0): virtio=BC:24:11:73:26:5B,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2015-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2015-disk-2,size=4M,version=v2.0

*   **VM 2016 (proj-mongo01)**
    *   **Node**: node05
    *   **Tags**: data, infra, proj
    *   **IPs**: 10.25.20.18
    *   **Hardware**:
        *   Memory: 2.00 GiB/4.00 GiB
        *   Processors: 2 (2 sockets, 1 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2016-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-2016-disk-3,discard=on,iothread=1,size=100G
        *   Network Device (net0): virtio=BC:24:11:DA:9F:A8,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2016-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2016-disk-2,size=4M,version=v2.0

*   **VM 2017 (proj-milvus01)**
    *   **Node**: node07
    *   **Tags**: ai-ml, db, proj
    *   **IPs**: 10.25.20.19
    *   **Hardware**:
        *   Memory: 8.00 GiB/24.00 GiB
        *   Processors: 8 (2 sockets, 4 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2017-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-2017-disk-3,discard=on,iothread=1,size=250G
        *   Network Device (net0): virtio=BC:24:11:F9:82:61,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2017-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2017-disk-2,size=4M,version=v2.0

*   **VM 2018 (proj-node4j01)**
    *   **Node**: node07
    *   **Tags**: ai-ml, db, proj
    *   **IPs**: 10.25.20.21
    *   **Hardware**:
        *   Memory: 8.00 GiB/24.00 GiB
        *   Processors: 8 (2 sockets, 4 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-2018-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-2018-disk-4,discard=on,iothread=1,size=250G
        *   Hard Disk (scsi2): nvmethin01:vm-2018-disk-0,discard=on,iothread=1,size=100G
        *   Network Device (net0): virtio=BC:24:11:29:B6:52,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-2018-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-2018-disk-2,size=4M,version=v2.0

*   **VM 3001 (proj-k8s01)**
    *   **Node**: node01
    *   **Tags**: k8s, proj
    *   **IPs**: 10.25.20.4
    *   **Hardware**:
        *   Memory: 32.00 GiB/82.00 GiB
        *   Processors: 16 (2 sockets, 8 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-3001-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-3001-disk-3,discard=on,iothread=1,size=1000G
        *   Network Device (net0): virtio=BC:24:11:7F:95:52,bridge=vmbr1,tag=20
        *   EFI Disk: nvmethin01:vm-3001-disk-0,efitype=4m,pre-enrolled-keys=1,size=4M
        *   TPM State: nvmethin01:vm-3001-disk-2,size=4M,version=v2.0

*   **VM 3002 (proj-k8s02)**
    *   **Node**: node03
    *   **Tags**: k8s, proj
    *   **IPs**: 10.25.20.5
    *   **Hardware**:
        *   Memory: 32.00 GiB/82.00 GiB
        *   Processors: 16 (2 sockets, 8 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-3002-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-3002-disk-3,discard=on,iothread=1,size=1000G
        *   Network Device (net0): virtio=BC:24:11:C3:03:AA,bridge=vmbr0,tag=20
        *   EFI Disk: nvmethin01:vm-3002-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-3002-disk-2,size=4M,version=v2.0

*   **VM 3003 (proj-k8s03)**
    *   **Node**: node07
    *   **Tags**: k8s, proj
    *   **IPs**: 10.25.20.6
    *   **Hardware**:
        *   Memory: 32.00 GiB/82.00 GiB
        *   Processors: 16 (2 sockets, 8 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-3003-disk-1,discard=on,iothread=1,size=32G
        *   Hard Disk (scsi1): nvmethin01:vm-3003-disk-3,discard=on,iothread=1,size=1000G
        *   Network Device (net0): virtio=BC:24:11:96:E3:3B,bridge=vmbr0,tag=20
        *   EFI Disk: nvmethin01:vm-3003-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-3003-disk-2,size=4M,version=v2.0
        *   PCI Device (hostpci0): 0000:08:00.0

*   **VM 8001 (house-docker)**
    *   **Node**: node02
    *   **Tags**: docker, house
    *   **IPs**: None (only non-10.25.x.x subnets)
    *   **Hardware**:
        *   Memory: 2.00 GiB/6.00 GiB
        *   Processors: 2 (2 sockets, 1 cores) [host] [numa=1]
        *   BIOS: OVMF (UEFI)
        *   Display: Default
        *   Machine: q35,viommu=intel
        *   SCSI Controller: VirtIO SCSI single
        *   CD/DVD Drive: none,media=cdrom
        *   Hard Disk (scsi0): nvmethin01:vm-8001-disk-1,discard=on,iothread=1,size=32G
        *   Network Device (net0): virtio=BC:24:11:A5:8A:A6,bridge=vmbr1
        *   EFI Disk: nvmethin01:vm-8001-disk-0,efitype=4m,pre-enrolled-keys=1,size=528K
        *   TPM State: nvmethin01:vm-8001-disk-2,size=4M,version=v2.0

### Network Switches

#### labswitch02 (Primary Distribution switch)

*   **Model**: Mokerlink 2G16210GSM (16 x 2.5G RJ45 + 2 x 10G SFP+)
*   **Access URL**: http://labswitch02
*   **Port Mappings**:
    *   TE1 (port 17): labswitch03 port 12
    *   TE2 (port 18): labswitch01 port 12
    *   MGE1: node01, eth0
    *   MGE2: node01, eth1
    *   MGE3: node02, eth0
    *   MGE4: node02, eth1
    *   MGE5: node03, eth0
    *   MGE6: node03, eth1
    *   MGE7: node04, eth0
    *   MGE8: node04, eth1
    *   MGE9: node05, eth0
    *   MGE10: node05, eth1
    *   MGE11: node06, eth0
    *   MGE12: node06, eth1
    *   MGE13: node07, eth0
    *   MGE14: node07, eth0
    *   MGE15: pbs01.radioastronomy.io (Proxmox Backup Server)
    *   MGE16: Port 3 Fortigate 40F (uplink to internet, Central SNAT, No DNAT)
*   **VLAN Assignments**:
    *   VLAN10: Control Plane
    *   VLAN20: Project Work
    *   VLAN60: Migration

#### labswitch01 (Storage Switch01)

*   **Model**: Sodola SL-SWTG3C12F (12 x 10G SFP+)
*   **Access URL**: http://labswitch01
*   **Features**: Hybrid 10G port flexibility (8x10G SFP+ ports, 4x10GBase-T RJ45 ports), 240G backplane, LACP link aggregation, QoS traffic prioritization, VLAN segmentation, SNMP monitoring, Fan Cooling, 1U Rack-Mount Ready, Auto-MDI/MDIX, RJ45 ports support 10G/5G/2.5G/1G/100M speeds.
*   **Port Mappings (All SFP pairs are LACP, IP-MAC)**:
    *   TE1: node03 spf0
    *   TE2: node03 spf1
    *   TE3: node01 spf0
    *   TE4: node01 spf1
    *   TE5: node05 spf0
    *   TE6: node05 spf1
    *   TE7: node07 spf0
    *   TE8: node07 spf1
    *   TE9: node02 spf0
    *   TE10: node02 spf1
    *   TE11: Unused
    *   TE12: Port 18 labswitch02

#### labswitch03 (Storage Switch02)

*   **Model**: SL-SWTGW2C48NS (4 x RJ45 (TE1 - TE4), 8 x SFP (TE5-TE12))
*   **Access URL**: http://labswitch03
*   **Port Mappings (All SFP pairs are LACP, IP-MAC)**:
    *   TE1: Unused
    *   TE2: Unused
    *   TE3: Unused
    *   TE4: Unused
    *   TE5: node04 spf0
    *   TE6: node04 spf1
    *   TE7: node06 spf0
    *   TE8: node06 spf1
    *   TE9: Unused
    *   TE10: Unused
    *   TE11: Unused
    *   TE12: Port 17 labswitch02