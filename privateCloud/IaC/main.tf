# IaC for creating Nodes for Kubernetes in Proxmox. 
# 
# Here should be a first step. Creating a Proxmox Template. template.sh is in the Proxmox_template folder.

terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}
provider "proxmox" {
  pm_api_url = var.pm_api_url 
  pm_api_token_id = var.token_id
  pm_api_token_secret = var.token_secret
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "k8s-controler" {
  count = 1
  name = "k8s-controler-0${count.index + 1}"
  target_node = var.proxmox_host
  vmid = "10${count.index + 1}"
  clone = var.template_name 
  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 4096
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"
  disk {
    slot = 0
    size = "32G" 
    type = "scsi"
    storage = var.storageloc
    iothread = 1
  }
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  
  network {
    model = "virtio"
    bridge = "vmbr0" 
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ipconfig0 = "ip=192.168.1.6${count.index + 1}/24,gw=192.168.1.1" 
  ipconfig1 = "ip=192.168.1.6${count.index + 1}/24"
  searchdomain = "rhone.lan"
  nameserver = "192.168.1.41"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
resource "proxmox_vm_qemu" "k8s-node" {
  count = 2
  name = "k8s-node-0${count.index + 1}"
  target_node = var.proxmox_host
  vmid = "50${count.index + 1}"
  
  clone = var.template_name
  
  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 4096
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"
  disk {
    slot = 0
    size = "32G"
    type = "scsi"
    storage = var.storageloc
    iothread = 1
  }
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  
  network {
    model = "virtio"
    bridge = "vmbr0" 
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ipconfig0 = "ip=192.168.1.7${count.index + 1}/24,gw=192.168.1.1" 
  ipconfig1 = "ip=192.168.1.7${count.index + 1}/24"
  searchdomain = "rhone.lan"
  nameserver = "192.168.1.41"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
resource "proxmox_vm_qemu" "k8s-storage" {
  count = 1
  name = "k8s-storage-0${count.index + 1}"
  target_node = var.proxmox_host
  vmid = "60${count.index + 1}"

  clone = var.template_name
  
  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 4096
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"
  disk {
    slot = 0
    size = "32G"
    type = "scsi"
    storage = var.storageloc
    iothread = 1
  }
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ipconfig0 = "ip=192.168.1.8${count.index + 1}/24,gw=192.168.1.1" 
  ipconfig1 = "ip=192.168.1.8${count.index + 1}/24"
  searchdomain = "rhone.lan"
  nameserver = "192.168.1.41"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
