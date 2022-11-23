
# TODO Add the code for create the ssh key and copy that to the IaC vars.tf I think here something is needed for automate it and not do manually
# TODO ADD git
# TODO ADD terraform
# TODO ADD ansible
# TODO ADD docker
# TODO ADD kubectl - Completed when moved to terraform
# TODO ADD helm

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

resource "proxmox_vm_qemu" "bastion" {
  count = 1
  name = "bastion"
  target_node = var.proxmox_host
  vmid = "999"

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
  ipconfig0 = "ip=192.168.1.51/24,gw=192.168.1.1" 
  ipconfig1 = "ip=192.168.1.51/24"
  searchdomain = "rhone.lan"
  nameserver = "192.168.1.41"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}