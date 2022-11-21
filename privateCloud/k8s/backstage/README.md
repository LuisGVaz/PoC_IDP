
# BACSTAGE IN KUBERNETES #
---
![KUBERNETES] ![COFFEE]

[COFFEE]: https://img.shields.io/badge/CoffeeScript-2F2625.svg?style=for-the-badge&logo=CoffeeScript&logoColor=white
[KUBERNETES]: https://img.shields.io/badge/Kubernetes-326CE5.svg?style=for-the-badge&logo=Kubernetes&logoColor=white
* Configuring secrets base64

```bash
$ echo -n "your_user_or_password" | base64
```

* Configuring the Postgress Persistent Storage on Local but in Production we could choose other kind of External Persistent Volume. Keep on eye on it.

* Steps for building the Backstage deployment

    * Building a Docker image
    * Storing the Docker image on a container registry
    * Referencing the image in a Kubernetes Deployment YAML
    * Applying that Deployment to a Kubernetes cluster