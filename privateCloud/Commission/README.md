This document contains all the information needed for run the Ansible Playbook and commission several K8s nodes on Proxmox


# Commisioning Kubernetes in the Proxmox #
![PROXMOX] ![TERRAFORM] ![ANSIBLE]  ![KUBERNETES] ![COFFEE]

[ANSIBLE]: https://img.shields.io/badge/Ansible-EE0000.svg?style=for-the-badge&logo=Ansible&logoColor=white
[PROXMOX]: https://img.shields.io/badge/Proxmox-E57000.svg?style=for-the-badge&logo=Proxmox&logoColor=white
[TERRAFORM]: https://img.shields.io/badge/Terraform-7B42BC.svg?style=for-the-badge&logo=Terraform&logoColor=white
[KUBERNETES]: https://img.shields.io/badge/Kubernetes-326CE5.svg?style=for-the-badge&logo=Kubernetes&logoColor=white
[COFFEE]: https://img.shields.io/badge/CoffeeScript-2F2625.svg?style=for-the-badge&logo=CoffeeScript&logoColor=white




## How to use Ansible
// TODO how to install ansible

## Install dependencies

```bash 
$ ansible-playbook -i ansible-hosts.txt kubernetes-dependencies.yml
```

## Initializing the Cluster
```bash 
ansible-playbook -i ansible-hosts.txt ini-cluster.yml
```