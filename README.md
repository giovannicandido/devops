# Devops

Devops tools

## Quick start

```bash

docker run --name devops -it -v $(pwd):/home/user giovannicandido/devops bash

cd /home/user

mkdir ~/.ssh
mkdir ~/.kube
cp .ssh/* ~/.ssh
cp .kube/config ~/.kube

```

Explanation: This will open a interactive shell container using docker and will share your current folder inside the /home/user folder.

Here we copy the files we need to authenticate (ssh keys and kubernetes) to the root user (your current user).

You are good to go.

Tools:

* Kubectl
* Ansible
* helm
* jq - Json command line parser

Random Examples:

```bash
ansible i inventory all -m raw -a 'apt install python'
ansible i inventory all -m raw -a 'curl https://releases.rancher.com/install-docker/18.09.2.sh | sh'
ansible i inventory all -m raw -a 'apt upgrade -y'

helm init --client-only
helm plugin install https://github.com/rimusz/helm-tiller
helm tiller start
helm install --name nginx stable/nginx-ingress
helm tiller stop

kubectl get nodes
kubectl get nodes -o json | jq '.items[].metadata.annotations'

```

Have fun!
