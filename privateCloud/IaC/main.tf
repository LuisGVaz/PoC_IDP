# IaC for creating Nodes for Kubernetes in Proxmox. 
# 
# Here should be a first step. Creating a Proxmox Template. Details in Documentation.

terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.8"
    }
  }
}
provider "proxmox" {
# TODO Document how to create the API access in PROXMOX -->>  https://austinsnerdythings.com/2021/09/01/how-to-deploy-vms-in-proxmox-with-terraform/
  pm_api_url = "https://prox-1u.home.fluffnet.net:8006/api2/json" # TODO --> Adapt the URI to the final proxmox URI. 
  # TODO Encrypt the token_id 
  pm_api_token_id = [secret] # TODO Add the tokenID from PROXMOX
  pm_api_token_secret = [secret] # TODO Add the scret from PROXOX
  pm_tls_insecure = true
}
resource "proxmox_vm_qemu" "kube-server" {
  count = 1
  name = "kube-server-0${count.index + 1}"
  target_node = "prox-1u"
  # thanks to Brian on YouTube for the vmid tip
  # http://www.youtube.com/channel/UCTbqi6o_0lwdekcp-D6xmWw
  vmid = "40${count.index + 1}"
  clone = "ubuntu-2004-cloudinit-template" # TODO put the current name of our minimal ubuntu image imported to PROXMOX
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
    size = "10G" # TODO Review if this is real space needed
    type = "scsi"
    storage = "local-zfs" # TODO change to local-lvm
    #storage_type = "zfspool"
    iothread = 1
  }
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  
  network {
    model = "virtio"
    bridge = "vmbr17" # TODO check if this bridge network exists
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ipconfig0 = "ip=10.98.1.4${count.index + 1}/24,gw=10.98.1.1" # TODO change the ip rang to the real one in our private network
  ipconfig1 = "ip=10.17.0.4${count.index + 1}/24"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
resource "proxmox_vm_qemu" "kube-agent" {
  count = 2
  name = "kube-agent-0${count.index + 1}"
  target_node = "prox-1u"
  vmid = "50${count.index + 1}"
  clone = "ubuntu-2004-cloudinit-template" # TODO put the current name of our minimal ubuntu image imported to PROXMOX
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
    size = "10G"
    type = "scsi"
    storage = "local-zfs" # TODO change to local-lvm
    #storage_type = "zfspool"
    iothread = 1
  }
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  
  network {
    model = "virtio"
    bridge = "vmbr17" # TODO check if this bridge network exists
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ipconfig0 = "ip=10.98.1.5${count.index + 1}/24,gw=10.98.1.1" # TODO change the ip rang to the real one in our private network
  ipconfig1 = "ip=10.17.0.5${count.index + 1}/24"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
resource "proxmox_vm_qemu" "kube-storage" {
  count = 1
  name = "kube-storage-0${count.index + 1}"
  target_node = "prox-1u"
  vmid = "60${count.index + 1}"
  clone = "ubuntu-2004-cloudinit-template" # TODO put the current name of our minimal ubuntu image imported to PROXMOX
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
    size = "20G"
    type = "scsi"
    storage = "local-zfs"
    #storage_type = "zfspool"
    iothread = 1
  }
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  
  network {
    model = "virtio"
    bridge = "vmbr17" # TODO check if this bridge network exists
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ipconfig0 = "ip=10.98.1.6${count.index + 1}/24,gw=10.98.1.1" # TODO put the current name of our minimal ubuntu image imported to PROXMOX
  ipconfig1 = "ip=10.17.0.6${count.index + 1}/24"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
