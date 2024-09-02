# Create Ansible User Script 🔐

## Table of Contents
- [Create Ansible User Script 🔐](#create-ansible-user-script-)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Features ✨](#features-)
  - [Requirements 🛠️](#requirements-️)
  - [Installation 📥](#installation-)
  - [Usage 🚀](#usage-)
  - [Security Considerations 🛡️](#security-considerations-️)
  - [License 📜](#license-)
  - [Contributing 🤝](#contributing-)

## Overview

The `create-ansible-user.sh` script automates the process of creating a dedicated user for Ansible operations on Linux systems within a cluster. This user is configured with enhanced security measures, including passwordless sudo access and SSH key-based authentication only.

## Features ✨

- Creates a dedicated Ansible user with a randomly generated UID
- Configures passwordless sudo access for the Ansible user
- Sets up SSH key-based authentication for secure remote access
- Checks for existing user to prevent conflicts
- Customizable home directory location

## Requirements 🛠️

- Linux operating system
- Bash shell
- Root or sudo privileges to run the script

## Installation 📥

1. Clone this repository or download the `create-ansible-user.sh` script.
2. Place the script in a suitable location on your Linux host, e.g., `/root/scripts/`.
3. Make the script executable:
   ```bash
   chmod +x /root/scripts/create-ansible-user.sh
   ```

## Usage 🚀

1. **Important**: Before running the script, replace the example SSH key in the script with your own public SSH key:
   ```bash
   # Open the script in a text editor
   nano /root/scripts/create-ansible-user.sh

   # Find the ANSIBLE_SSHKEY variable and replace the key
   ANSIBLE_SSHKEY=$(cat <<EOF
   ssh-ed25519 YOUR_ACTUAL_PUBLIC_KEY_HERE ansible@your-control-node
   EOF
   )
   ```

2. Run the script with root privileges:
   ```bash
   sudo /root/scripts/create-ansible-user.sh
   ```

3. The script will create the Ansible user and configure the necessary permissions and SSH access.

## Security Considerations 🛡️

- The script creates a system user with a randomly generated UID, reducing predictability.
- SSH key-based authentication is enforced, and password authentication is disabled for this user.
- The user is granted passwordless sudo access, which is necessary for many Ansible operations but should be used judiciously.
- Ensure that you keep the private SSH key secure and never share it.
- Regularly audit and rotate SSH keys as part of your security practices.

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

For more information on this script or other setup utilities, please refer to our [main documentation](../../../docs/README.md).