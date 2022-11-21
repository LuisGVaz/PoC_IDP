# Install kubctl in your system and manage the kubernetes cluster remotely #
---
![UBUNTU] ![KUBERNETES] ![COFFEE]

[UBUNTU]: https://img.shields.io/badge/Ubuntu-E95420.svg?style=for-the-badge&logo=Ubuntu&logoColor=white
[KUBERNETES]: https://img.shields.io/badge/Kubernetes-326CE5.svg?style=for-the-badge&logo=Kubernetes&logoColor=white
[COFFEE]: https://img.shields.io/badge/CoffeeScript-2F2625.svg?style=for-the-badge&logo=CoffeeScript&logoColor=white


```bash
sudo apt-get update
sudo apt-get install -y ca-certificates curl
```

If you use Debian 9 (stretch) or earlier you would also need to install apt-transport-https:

```bash
sudo apt-get install -y apt-transport-https
```

Download the Google Cloud public signing key:
```bash
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
```

Add the Kubernetes apt repository:
```bash
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

Update apt package index with the new repository and install kubectl:
```bash
sudo apt-get update
sudo apt-get install -y kubectl
```

Download the Kubernetes configuration to the bastion server

```bash
 scp -r etham@192.168.1.61:/home/etham/.kube .
 ```

 Copy the dowload configuration to $Home
```bash
cp -r .kube/ /home/etham/
```

