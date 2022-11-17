This document contains all the information needed for run the Ansible Playbook and commission several K8s nodes on Proxmox


# Commisioning Kubernetes in the Proxmox #
[ansible]: https://img.shields.io/badge/Ansible-EE0000.svg?style=for-the-badge&logo=Ansible&logoColor=white---


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