# Install kubctl in your system and manage the kubernetes cluster remotely #
---
![UBUNTU] ![KUBERNETES] ![COFFEE]

[UBUNTU]: https://img.shields.io/badge/Ubuntu-E95420.svg?style=for-the-badge&logo=Ubuntu&logoColor=white
[KUBERNETES]: https://img.shields.io/badge/Kubernetes-326CE5.svg?style=for-the-badge&logo=Kubernetes&logoColor=white
[COFFEE]: https://img.shields.io/badge/CoffeeScript-2F2625.svg?style=for-the-badge&logo=CoffeeScript&logoColor=white

# Dowloading an specific version of Kubectl, let's do this (currently using 1.23.6)

* Download the Binary
```bash
$ curl -LO https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl
```

* Download the checksum file and check if everything was fine
```bash
$ curl -LO "https://dl.k8s.io/v1.23.6/bin/linux/amd64/kubectl.sha256"
$ echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
```
The expected result is ```kubectl ok```

```bash
$ sudo cp ./kubectl /usr/bin/
$ sudo chmod +x /usr/bin/kubectl
```
And now check if everything is working properly
```bash
$ kubectl version
Client Version: version.Info{Major:"1", Minor:"23", GitVersion:"v1.23.6", 
GitCommit...
```

---
# Install from UBUNTU Repo in the last version.
(if you did the previous step, jump this one)

```bash
$ sudo apt-get update
$ sudo apt-get install -y ca-certificates curl
```

If you use Debian 9 (stretch) or earlier you would also need to install apt-transport-https:

```bash
$ sudo apt-get install -y apt-transport-https
```

Download the Google Cloud public signing key:
```bash
$ sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
```

Add the Kubernetes apt repository:
```bash
$ echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

Update apt package index with the new repository and install kubectl:
```bash
$ sudo apt-get update
$ sudo apt-get install -y kubectl
```
---
# Configure the remote cluster management

Download the Kubernetes configuration to the bastion server

```bash
 $ scp -r etham@192.168.1.61:/home/etham/.kube .
 ```

 Copy the dowload configuration to $Home
```bash
$ cp -r .kube/ /home/etham/
```

# Check if the connection is ok
```bash
$ kubectl version
Client Version: version.Info{Major:"1", Minor:"23", GitVersion:"v1.23.6", GitCommit:"ad3338546da947756e8a88aa6822e9c11e7eac22", GitTreeState:"clean", BuildDate:"2022-04-14T08:49:13Z", GoVersion:"go1.17.9", Compiler:"gc", Platform:"linux/amd64"}
Server Version: version.Info{Major:"1", Minor:"23", GitVersion:"v1.23.14", GitCommit:"3321ffc07d2f046afdf613796f9032f4460de093", GitTreeState:"clean", BuildDate:"2022-11-09T13:32:47Z", GoVersion:"go1.17.13", Compiler:"gc", Platform:"linux/amd64"}
```


