# Infrastructure As Code for PROXMOX
---
![PROXMOX] ![TERRAFORM] ![COFFEE]

[PROXMOX]: https://img.shields.io/badge/Proxmox-E57000.svg?style=for-the-badge&logo=Proxmox&logoColor=white
[TERRAFORM]: https://img.shields.io/badge/Terraform-7B42BC.svg?style=for-the-badge&logo=Terraform&logoColor=white
[COFFEE]: https://img.shields.io/badge/CoffeeScript-2F2625.svg?style=for-the-badge&logo=CoffeeScript&logoColor=white


This document contains all the information needed for apply the terraform script and create several K8s nodes on Proxmox

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
// TODO Add the server endpoint where the terraform is executed.