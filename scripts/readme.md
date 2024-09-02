# 🛠️ Utility Scripts

This directory contains utility scripts for the AI-Ops Home Lab project. These scripts are designed to assist with various tasks related to system management, reporting, and maintenance.

## 📋 Script Index

| Script Name | Description | Usage |
|-------------|-------------|-------|
| vm_report.sh | Generates a report of running VMs on a Proxmox node, excluding containers and template VMs. | `./vm_report.sh` |

## 🚀 Usage

To use a script:

1. Ensure you have the necessary permissions.
2. Navigate to the utils directory.
3. Run the script using the command provided in the "Usage" column above.

Example:
```bash
cd utils
chmod +x vm_report.sh
./vm_report.sh
```

## 📝 Script Details

### vm_report.sh
- **Purpose**: Provides a detailed report of running VMs on a Proxmox node.
- **Output**: Generates a report at `/root/vm_list_report.txt` and displays it in the terminal.
- **Note**: Excludes containers and VMs marked as templates.

## 🤝 Contributing

Feel free to contribute new utility scripts or improvements to existing ones. Please follow the established coding standards and include appropriate documentation.

## 📄 License

All scripts in this directory are licensed under the Apache License 2.0. See the individual script headers or the project's LICENSE file for more details.

---

Last updated: 2024-09-01
Maintained by: [@vintagedon](https://github.com/vintagedon)
