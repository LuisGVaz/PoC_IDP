# ADDING APPLICATOINS #
![KUBERNETES] ![COFFEE]

[KUBERNETES]: https://img.shields.io/badge/Kubernetes-326CE5.svg?style=for-the-badge&logo=Kubernetes&logoColor=white
[COFFEE]: https://img.shields.io/badge/CoffeeScript-2F2625.svg?style=for-the-badge&logo=CoffeeScript&logoColor=white


# INSTALL ArgoCD with Helm Charts #
// TODO We need to write an Ansible Playbook for automate all this tasks.
## Follow next instructions ##



* Create the ArgoCD Namespace
```bash
$ kubectl create ns argocd
```
* then, apply the latest manifest
```bash
$ kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
* wait for the container argocd-server-* to be ready
```bash
$ kubectl wait --for condition=ready pod $(kubectl get pods -n argocd | awk ‘{if ($1 ~ “argocd-server-”) print $1}’) -n argocd
```



# Uninstalling ArgoCD
```bash
$ kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

