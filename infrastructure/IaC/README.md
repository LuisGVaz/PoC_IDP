# Infrastructure As Code for PROXMOX
---
![PROXMOX] ![TERRAFORM] ![COFFEE]

[PROXMOX]: https://img.shields.io/badge/Proxmox-E57000.svg?style=for-the-badge&logo=Proxmox&logoColor=white
[TERRAFORM]: https://img.shields.io/badge/Terraform-7B42BC.svg?style=for-the-badge&logo=Terraform&logoColor=white
[COFFEE]: https://img.shields.io/badge/CoffeeScript-2F2625.svg?style=for-the-badge&logo=CoffeeScript&logoColor=white


This document contains all the information needed for apply the terraform script and create several K8s nodes on Proxmox

* **PROXMOX SERVER**:  macon.rhone.lan, 192.168.1.41
* We are using 192.168.1.41 _macon.rhone.lan_ as DNS Server with DNSMasq inside.

* Using the terraform provider telmate --> https://registry.terraform.io/providers/Telmate/proxmox/latest/docs

This terraform creates all the infrastructure needed for deploy a K8s cluster :
- 1 k8s-controler
- 2 k8s-nodes
- 1 k8s-DATA_storage

This terraforms should be executed from the BASTION Server.
// TODO Create Terrraform for create the Bastion Server. Now it's full manually created.

## How to install Terraform

// TODO Add the terraform installation process.

## Create a user and a API secret in PROXMOX is needed #

// TODO How to create user and API token for automation.

## How to configure main.tf and how to apply

### Change the memory size and CPU
At this moment, you could find for every single VM this configuration. You copuld change it regarding your Proxomox Server capabilities. Feel free to update it in by your own.

```code
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 4096
  scsihw = "virtio
 ```

### Network Configuration
Remember the scrip is creating a set of nodes then the IP configuration is performed by :
AAA.BBB.CCC.DD+(d+1). You could change all the previous digits but not the summarized formula if you want to mantain the purpose of the script.

```code
  ipconfig0 = "ip=192.168.1.6${count.index + 1}/24,gw=192.168.1.1" 
  ipconfig1 = "ip=192.168.1.6${count.index + 1}/24"
  searchdomain = "rhone.lan"
  nameserver = "192.168.1.41"
```

## Applying this terraforms

Go first to the terraform files folder

### Initialize the Terraform if this is your first time.
```bash
$ terraform init
```
### Check if the scripts are ready
```bash
$ terraform plan
```

### Apply the configuration
```bash
$ terraform apply
```
---

## Destroying the current running configuration

```bash
$ terraform destroy
```

