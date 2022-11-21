#!/usr/bin/env bash

# Creating Templates for PROXMOX Server
#
# Author : Luis Gomez for Ubitransport
# November 2022


sudo apt update -y
echo "-----------------------------------------------------------------------------------"
echo "Let's install the libgests. It allows us to install things inside of a Cloud image. Very useful for avoid manual actions after installation"
echo "-----------------------------------------------------------------------------------"
sudo apt install libguestfs-tools -y
echo "-----------------------------------------------------------------------------------"
echo "Dowloading ubuntu cloud image. Version 22.04. Please, use the best version for you"
echo "-----------------------------------------------------------------------------------"
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
echo "-----------------------------------------------------------------------------------"
echo "Preparing the Cloud image : Add qemu-guest-agent and resizing to 32G. Please, uptdate this parameter as your convenience"
echo "-----------------------------------------------------------------------------------"
sudo virt-customize -a jammy-server-cloudimg-amd64.img --install qemu-guest-agent 
echo "Take care with the disk resize action now. It'll block the possibility to modify in the Terraform definition for every single type of node"
sudo qemu-img resize jammy-server-cloudimg-amd64.img 32G
echo "-----------------------------------------------------------------------------------"
echo "Creating a New templated based on the imaged created"
echo "-----------------------------------------------------------------------------------"
sudo qm create 9000 --name "ubuntu-2204-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
sudo qm importdisk 9000 jammy-server-cloudimg-amd64.img local-lvm
sudo qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9000-disk-0
sudo qm set 9000 --boot c --bootdisk scsi0
sudo qm set 9000 --ide2 local-lvm:cloudinit 
sudo qm set 9000 --serial0 socket --vga serial0
sudo qm set 9000 --agent enabled=1
sudo qm template 9000
rm jammy-server-cloudimg-amd64.img
echo "-----------------------------------------------------------------------------------"
echo "WARNING! >> Don't forget to add your user and ssh keys in the Cloud-init"
echo "It's time to clone the template as a new VM"
echo "-----------------------------------------------------------------------------------"