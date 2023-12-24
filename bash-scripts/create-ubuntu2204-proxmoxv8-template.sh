# Name: create-ubuntu2204-proxmox-template.sh
# Description: Simple bash script to download and configure
#              a ready-to-use VM template for Ubuntu 22.04
#              on Proxmox v8+
# Prerequisites: Proxmox v8+
# Usage: sh create-ubuntu2204-proxmox-template.sh
# Notes: not all VM creation settings are exposed in this script
#
# Project: https://github.com/vintagedon/proxmoxlab/tree/main/bash-scripts
# License: Apache-2.0

# Variables
#
# The below values may be changed to suit your environment
# Default values are sane, minimal values; when the template
# is cloned to make a new VM, all values can be manipulated
#
# Default Template Specs:
# VM ID 9001, 1 core, 1GB RAM, UEFI, storage on local-lvm, network on vmbr0
#
# Clarifications
# vm_img_folder: absolute path to store the downloaded .img file
# vm_guest_trim: freeze/thaw guest filesystems on backup for consistency
# vm_datastore: name of datastore to store template VM
# vm_ssh_keys: absolute path to the SSH public key to install on the template
# if you already have SSH keys for your Proxmox host as root, use
# /etc/pve/pub_keys/pub_key.pub

vm_img_folder='./' #absolute path to store the downloaded cloud image
vm_username='beardinthecloud'
vm_ssh_key=/root/id_rsa.pub #see Clarifications
vm_id=9001 #VM ID; it's over 9000!
vm_name='ubuntu-2204-cloudinit-template' #name of template
vm_os_type='l26' #l26 = Linux (Kernel 2.6-6.x), 
vm_memory=1024 #amount of RAM
vm_cpu_type='host' #if running Proxmox in a cluster, this value may be different
vm_sockets=1 #number of CPU sockets
vm_cores=1 #number of CPU cores
vm_volume_size='32G' #volume size for VM template
vm_quemu_agent=1 #0 = false, 1 = true
vm_datastore='local-lvm'
vm_network_bridge='vmbr0'
vm_dhcp=1 #0 = false, 1 = true
vm_ip='10.0.0.100/24' #VM IP address if vm_dhcp=0 (false)
vm_gateway='10.0.0.1' #VM Gateway address if vm_dhcp=0 (false)
vm_vlan=0 #vlan_tag, leave 0 for untagged
vm_freeze_os_on_backup=0 #0 = false, 1 = true
vm_guest_trim=1 #0 = false, 1 = true
vm_description='Ubuntu 22.04 CloudInit Template'
cloud_image_filename='jammy-server-cloudimg-amd64.img'
ubuntu2204_cloud_image_URL='https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img'
text_color_green='\x1b[32;1m'
text_color_yellow='\x1b[33;1m'
text_color_green='\x1b[32;1m'
text_no_color='\x1b[0m'

# Simple function to print "Done", in the color green, reset the color to no color + new line
function function_print_done { printf "${text_color_green}Done.${text_no_color}\n\n"; }

# download latest Ubuntu 22.04 Cloud Image
printf "${text_color_green}###################################\n# Proxmox Ubuntu 22.04 Cloud-Init #\n#    Template Creation Script     #\n###################################${text_no_color}\n\n"
printf "${text_color_yellow}Downloading ${vm_description}...${text_no_color}\n"
wget -P "${vm_img_folder}" "${ubuntu2204_cloud_image_URL}"
function_print_done

# Create VM disk
# If unsized, a cloud-image ony begins with a 2GB disk
# Let's set it to something more realistic
printf "${text_color_yellow}Creating disk...${text_no_color}"
qemu-img resize jammy-server-cloudimg-amd64.img $vm_volume_size
function_print_done

# Create "base" VM to further configure
# Minimal specs, since template specs can be configured @ VM creation
printf "${text_color_yellow}Creating base VM ...${text_no_color}"
qm create $vm_id --name $vm_name --ostype l26
function_print_done

# Set VM specs
# --cpu: sets the CPU type; default value 'host' passes the host's CPU thru
# if running Proxmox in a cluster, this value may be different
# my cluster cputype is 'x86-64-v2-AES', for example
printf "${text_color_yellow}Setting VM specs ...${text_no_color}\n"
qm set $vm_id --memory $vm_memory --cores $vm_cores --cpu cputype=$vm_cpu_type

# configure VM display
# many cloud images only support a serial console display type
printf "${text_color_yellow}Configuring VM Display...${text_no_color}\n"
qm set $vm_id --serial0 socket --vga serial0

# set boot device as virtio block device
# import the cloud image we resized
# set discard=on to passthru SSD TRIM commands
# https://forum.proxmox.com/threads/turn-on-discard-option.89208/
printf "${text_color_yellow}Setting boot device ...${text_no_color}"
qm set $vm_id --scsi0 ${vm_datastore}:0,import-from="$(pwd)/${cloud_image_filename}",discard=on
function_print_done

# Set SCSI device as default boot device, using virtio scsi single
printf "${text_color_yellow}Configuring boot device ...${text_no_color}"
qm set $vm_id --boot order=scsi0 --scsihw virtio-scsi-single
function_print_done

# Set VM agent flag to true, enable 'Automatric TRIM after VM move/migration'
# Enable filesystem freeze/thaw on backup
qm set $vm_id --agent enabled=1,fstrim_cloned_disks=1,freeze-fs-on-backup=1

# create a single virtio NIC on the proper bridge
printf "${text_color_yellow}Configuring VM Network...${text_no_color}"
qm set $vm_id --net0 virtio,bridge=$vm_network_bridge
function_print_done

# add a cloud-init device (CD-ROM) as IDE2
qm set $vm_id --ide2 ${vm_datastore}:cloudinit

# setup network for VM, either DHCP or static
if [ ${vm_dhcp} = 1 ]; then
    printf "${text_color_yellow}Configuring DHCP...${text_no_color/n}"
    qm set $vm_id --ipconfig0 "ip6=auto,ip=dhcp"
else
    printf "${text_color_yellow}Configuring static IP ...${text_no_color/n}"
    qm set $vm_id --ipconfig0 ip=$vm_ip,gw=$vm_gateway
fi
function_print_done

# set VM VLAN if needed
if [ ${vm_vlan} > 0  ]; then
    printf "${text_color_yellow}Setting VLAN...${text_no_color}/n"
    qm set $vm_id --trunks=$vm_vlan
    function_print_done
fi
function_print_done

# create a user for login
printf "${text_color_yellow}Creating User and SSH keys...${text_no_color}/n"
qm set $vm_id --ciuser $vm_username

# import SSH keys
qm set $vm_id --sshkeys $vm_ssh_key
function_print_done

# convert the VM to a template
printf "${text_color_yellow}Coverting VM $(vm_id) to a template...${text_no_color}/n"
qm template $vm_id
function_print_done
