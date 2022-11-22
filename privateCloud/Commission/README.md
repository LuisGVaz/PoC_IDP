This document contains all the information needed for run the Ansible Playbook and commission several K8s nodes on Proxmox


# Commisioning Kubernetes in the Proxmox #
![PROXMOX] ![TERRAFORM] ![ANSIBLE]  ![KUBERNETES] ![COFFEE]

[ANSIBLE]: https://img.shields.io/badge/Ansible-EE0000.svg?style=for-the-badge&logo=Ansible&logoColor=white
[PROXMOX]: https://img.shields.io/badge/Proxmox-E57000.svg?style=for-the-badge&logo=Proxmox&logoColor=white
[TERRAFORM]: https://img.shields.io/badge/Terraform-7B42BC.svg?style=for-the-badge&logo=Terraform&logoColor=white
[KUBERNETES]: https://img.shields.io/badge/Kubernetes-326CE5.svg?style=for-the-badge&logo=Kubernetes&logoColor=white
[COFFEE]: https://img.shields.io/badge/CoffeeScript-2F2625.svg?style=for-the-badge&logo=CoffeeScript&logoColor=white




## How to use Ansible
// TODO how to install __ansible__

## Enable Ansible for comunicate with hosts

```bash 
$ ansible -i ansible-hosts.txt all -u etham -m ping
```
Take care if you don't build the bastion from scratch. It's possible the authorizedkeys has the previous hash and you couldn't get access to the new workers nodes.
If this case then apply :
```bash
ssh-keygen -f "/home/etham/.ssh/known_hosts" -R "192.168.1.61"
ssh-keygen -f "/home/etham/.ssh/known_hosts" -R "192.168.1.71"
ssh-keygen -f "/home/etham/.ssh/known_hosts" -R "192.168.1.72"
```

## Install dependencies

```bash 
$ ansible-playbook -i ansible-hosts.txt ansible-kubernetes-dependencies.yml
```

## Initializing the Cluster
```bash 
ansible-playbook -i ansible-hosts.txt ansible-ini-cluster.yml
```

Now, the master is up and running. It's time to launch the join command.
```bash
ansible-playbook -i ansible-hosts.txt ansible-join-com.yaml
```

