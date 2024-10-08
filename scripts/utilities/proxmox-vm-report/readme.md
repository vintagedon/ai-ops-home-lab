# Proxmox VM Report Script 📊

## Table of Contents
- [Proxmox VM Report Script 📊](#proxmox-vm-report-script-)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Features ✨](#features-)
  - [Requirements 🛠️](#requirements-️)
  - [Installation 📥](#installation-)
  - [Usage 🚀](#usage-)
  - [Output 📄](#output-)
  - [Example VM List Report](#example-vm-list-report)
    - [Table Explanation](#table-explanation)
  - [License 📜](#license-)
  - [Contributing 🤝](#contributing-)

## Overview

The `proxmox-vm-report.sh` script generates a comprehensive report of running virtual machines (VMs) on a Proxmox node. It excludes containers and template VMs, focusing on active, running instances to provide a clear snapshot of current VM usage.

## Features ✨

- Lists only running VMs, excluding containers and templates
- Provides detailed information for each VM:
  - VM Name
  - Number of CPU Sockets
  - Cores per Socket
  - Total vCPUs
  - Allocated Memory (in MB)
  - Primary Network Interface
  - Primary Disk ID
  - Primary Disk Size
- Generates a formatted report file
- Displays the report in the terminal for immediate viewing

## Requirements 🛠️

- Proxmox VE (tested on version 8.x)
- Bash shell
- Standard Unix utilities (awk, grep, sed)

## Installation 📥

1. Clone this repository or download the `proxmox-vm-report.sh` script.
2. Place the script in a suitable location on your Proxmox host, e.g., `/root/scripts/`.
3. Make the script executable:
   ```bash
   chmod +x /root/scripts/proxmox-vm-report.sh
   ```

## Usage 🚀

Run the script with root privileges:

```bash
sudo /root/scripts/proxmox-vm-report.sh
```

## Output 📄

The script generates two outputs:

1. A report file saved at `/root/vm_list_report.txt`
2. The same report displayed in the terminal

The report is formatted as a Markdown table for easy reading and potential integration with other documentation tools.

## Example VM List Report

This is an example of the VM list report generated by the script.

| VM Name    | Sockets | Cores/Socket | Total vCPUs | Memory (MB) | Primary Net       | Primary Disk ID               | Primary Disk Size |
|------------|---------|--------------|-------------|-------------|-------------------|-------------------------------|-------------------|
| vm01       | 2       | 4            | 8           | 8192        | 52:54:00:AB:CD:EF | local-lvm:vm-1001-disk-0      | 50G               |
| vm02       | 1       | 2            | 2           | 4096        | 52:54:00:12:34:56 | local-lvm:vm-1002-disk-0      | 32G               |
| vm03       | 4       | 8            | 32          | 32768       | 52:54:00:98:76:54 | local-lvm:vm-1003-disk-0      | 100G              |
| vm04       | 1       | 4            | 4           | 2048        | 52:54:00:65:43:21 | local-lvm:vm-1004-disk-0      | 20G               |
| vm05       | 2       | 2            | 4           | 4096        | 52:54:00:89:AB:CD | local-lvm:vm-1005-disk-0      | 40G               |

### Table Explanation

- **VM Name**: The name of the virtual machine.
- **Sockets**: Number of CPU sockets assigned to the VM.
- **Cores/Socket**: Number of CPU cores per socket.
- **Total vCPUs**: Total virtual CPUs assigned to the VM (calculated as Sockets x Cores/Socket).
- **Memory (MB)**: Amount of memory allocated to the VM in megabytes.
- **Primary Net**: The MAC address of the primary network interface.
- **Primary Disk ID**: Identifier for the primary virtual disk of the VM.
- **Primary Disk Size**: Size of the primary disk.

## License 📜

This script is licensed under the Apache License, Version 2.0. See the [LICENSE](../../../LICENSE) file in the root of this repository for the full license text.

## Contributing 🤝

Contributions to improve the script are welcome! Please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/my-new-feature`)
3. Make your changes
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin feature/my-new-feature`)
6. Create a new Pull Request

Please ensure your code adheres to our [coding standards](../../../CONTRIBUTING.md) and include tests if applicable.

---

For more information on this script or other utilities, please refer to our [main documentation](../../../docs/README.md).