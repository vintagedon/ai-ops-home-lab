#########################################################################
# Script Name: create-ansible-user.sh
# Description: Creates an Ansible user on a Linux system with no password 
#              and SSH key-based authentication only. The script checks 
#              if the user already exists and exits if it does.
# Author: vintagedon (https://github.com/vintagedon)
# Date Created: 2024-09-01
# Last Modified: 2024-09-01
# Version: 1.1
#
# Usage: ./create-ansible-user.sh
#
# Output: Configures the specified user with passwordless sudo access
#         and sets up SSH key authentication.
#
# Dependencies: 
#   - Bash shell
#   - User must have sudo privileges to run this script
#
# Warning: The SSH key in this script is an example. You must replace it 
#          with your own SSH public key for secure access.
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

#!/bin/sh

# Variables
ANSIBLE_USERNAME="ansibleuser"  # Name of the Ansible user
ANSIBLE_USERID=$(shuf -i 100-999 -n 1)  # Generate a random UID between 100 and 999
ANSIBLE_HOMEDIR_PARENT="${ANSIBLE_HOMEDIR_PARENT:-/home}"  # Parent directory for the user's home
ANSIBLE_HOMEDIR="${ANSIBLE_HOMEDIR_PARENT}/${ANSIBLE_USERNAME}"  # Home directory path

# SSH key for the Ansible user
# Replace the SSH key below with your own SSH public key for secure access.
ANSIBLE_SSHKEY=$(cat <<EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK6pfuVQPH0sIgEP4WescdWy8OuTdYWl0yQjrvTSPn55 ansibleuser@host
EOF
)

# Check if the user already exists
if id "$ANSIBLE_USERNAME" >/dev/null 2>&1; then
  echo "User '$ANSIBLE_USERNAME' already exists. Exiting."
  exit 1
fi

# Create the Ansible user
useradd \
  --uid "$ANSIBLE_USERID" \
  --home-dir="$ANSIBLE_HOMEDIR" \
  --create-home \
  --user-group \
  --system \
  "$ANSIBLE_USERNAME"

# Grant the user passwordless sudo access
printf '%%%s ALL=(ALL) NOPASSWD:ALL\n' "$ANSIBLE_USERNAME" > /etc/sudoers.d/$ANSIBLE_USERNAME

# Configure SSH key-based authentication
mkdir --mode=0700 "$ANSIBLE_HOMEDIR/.ssh"
chown $ANSIBLE_USERNAME:$ANSIBLE_USERNAME -R "$ANSIBLE_HOMEDIR/.ssh"
printf "%s\n" "$ANSIBLE_SSHKEY" > "$ANSIBLE_HOMEDIR/.ssh/authorized_keys"
chmod 0500 "$ANSIBLE_HOMEDIR/.ssh/authorized_keys"
chown $ANSIBLE_USERNAME:$ANSIBLE_USERNAME -R "$ANSIBLE_HOMEDIR/.ssh/authorized_keys"
