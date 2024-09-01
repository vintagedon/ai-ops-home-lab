#!/bin/bash

#########################################################################
# Script Name: proxmox-vm-report.sh
# Description: Generates a report of running VMs on a Proxmox node,
#              excluding containers and template VMs.
# Author: vintagedon (https://github.com/vintagedon)
# Date Created: 2024-09-01
# Last Modified: 2024-09-01
# Version: 1.0
#
# Usage: ./proxmox-vm-report.sh
#
# Output: Generates a report file at /root/vm_list_report.txt and
#         displays the report in the terminal.
#
# Dependencies: 
#   - Proxmox VE (tested on version 8.x)
#   - Bash shell
#   - Standard Unix utilities (awk, grep, sed)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# AI Assistance:
# This script was developed with the assistance of GPT-4o.
#
#########################################################################

# Output file
output_file="/root/vm_list_report.txt"

# Start of the report
echo "VM Name | Sockets | Cores/Socket | Total vCPUs | Memory (MB) | Primary Net | Primary Disk ID | Primary Disk Size" > "$output_file"
echo "-------- | ------- | ------------ | ----------- | ----------- | ----------- | --------------- | -----------------" >> "$output_file"

# Loop over each VM ID
for vmid in $(qm list | awk '{if(NR>1) print $1}'); do
    # Check if the VM is running
    vm_status=$(qm status $vmid | grep -oP 'status: \K(\w+)')
    if [ "$vm_status" != "running" ]; then
        continue
    fi

    vm_config=$(qm config "$vmid")

    # Extract information
    vm_name=$(echo "$vm_config" | grep '^name:' | cut -d ' ' -f 2)
    cores=$(echo "$vm_config" | grep '^cores:' | cut -d ' ' -f 2)
    sockets=$(echo "$vm_config" | grep '^sockets:' | awk '{print $2}' || echo "1")
    memory=$(echo "$vm_config" | grep '^memory:' | cut -d ' ' -f 2)
    net=$(echo "$vm_config" | grep '^net0:' | cut -d ',' -f 1 | cut -d '=' -f 2)
    virtio0_id=$(echo "$vm_config" | grep '^virtio0:' | cut -d ',' -f 1 | cut -d '=' -f 2)
    virtio0_size=$(echo "$vm_config" | grep '^virtio0:' | grep 'size=' | sed 's/.*size=\([^,]*\).*/\1/')

    # Default to 1 if no sockets entry is found
    sockets="${sockets:-1}"

    # Calculate total vCPUs
    let vcpus=cores*sockets

    # Append information to the file
    echo "$vm_name | $sockets | $cores | $vcpus | $memory | $net | $virtio0_id | $virtio0_size" >> "$output_file"
done

# Print the report to the terminal
cat "$output_file"

# Completion message
echo "VM list report generated and displayed above."
