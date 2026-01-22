session 50

Kubernetes Setup & Tools
Ways to Run Kubernetes (IMPORTANT INTERVIEW TOPIC)

Kubernetes can be run using different tools depending on use case.

1️⃣ kubeadm (Production / Self-Managed)
Definition
kubeadm is a tool used to set up production-grade Kubernetes clusters on VMs or bare-metal servers.
Key Points
Used in real production environments
Full control over control plane and worker nodes
Requires manual configuration (networking, HA, upgrades)
Common in on-premises and self-managed EC2 clusters
📌 Interview Line
kubeadm is used for production-grade, self-managed Kubernetes clusters.

2️⃣ Minikube (Basic / Learning)
Definition
Minikube runs a single-node Kubernetes cluster locally.
Key Points
Best for beginners
Easy to install
Not suitable for production
Usually runs inside a VM or container
📌 Use Case
Learning Kubernetes basics.

3️⃣ KIND (Kubernetes IN Docker)
Definition
KIND runs Kubernetes inside Docker containers.
Key Points
Multi-node cluster possible
Very fast setup
Mostly used in CI/CD pipelines
Not production-ready
📌 Interview Line
KIND is mainly used for testing Kubernetes manifests and CI/CD pipelines.

4️⃣ Managed Kubernetes (Cloud)
Examples
AWS → EKS
Azure → AKS
GCP → GKE
Key Points
Control plane managed by cloud provider
High availability by default
Most preferred option in enterprises
📌 Interview Line
In real companies, managed Kubernetes like EKS or AKS is preferred.

Practical: Kubernetes Setup Using KIND on EC2
Step 1: Launch EC2 Instance
Ubuntu 20.04 / 22.04
Minimum: 2 vCPU, 4 GB RAM
Open required ports (SSH)

Step 2: Create a Non-Root User (Best Practice)
sudo useradd -m -s /bin/bash anil
sudo passwd anil
sudo usermod -aG sudo anil
getent passwd anil
su - anil

Step 3: Update the System
sudo apt-get update

Step 4: Install Docker (Required for KIND)

Why Docker?
KIND uses Docker containers as Kubernetes nodes.
sudo apt-get install docker.io -y
sudo systemctl enable --now docker
sudo systemctl status docker

Step 5: Add User to Docker Group
sudo usermod -aG docker $USER
newgrp docker

Step 6: Verify Docker Installation
docker run --rm hello-world

Kubernetes System Configuration (VERY IMPORTANT)
These settings are required for Kubernetes networking.

Step 7: Enable br_netfilter Module
echo 'br_netfilter' | sudo tee /etc/modules-load.d/br_netfilter.conf
sudo modprobe br_netfilter

Allows iptables to see bridged network traffic used by Pods.

Step 8: Apply sysctl Network Settings
cat <<EOF | sudo tee /etc/sysctl.d/kubernetes.conf
net.bridge.bridge-nf-call-ip6tables=1
net.bridge.bridge-nf-call-iptables=1
net.ipv4.ip_forward=1
EOF

sudo sysctl --system

📌 Interview Question
Why is ip_forward required?
👉 Enables Pod-to-Pod and service networking.

Step 9: Disable Swap (MANDATORY)
sudo swapoff -a
sudo sed -i '/\sswap\s/s/^/#/' /etc/fstab

📌 Interview Question
Why swap must be disabled?
👉 Kubernetes requires predictable memory behavior.

Install Kubernetes Tools
Step 10: Install kubectl (Kubernetes CLI)
curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client

Step 11: Install KIND
curl -Lo kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
chmod +x kind
sudo mv kind /usr/local/bin/
kind version

Create Kubernetes Cluster Using KIND
Step 12: Create Project Directory
mkdir kubernetes
cd kubernetes

Step 13: Create Cluster Configuration File
vim cluster.yml

kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
  - role: worker
  - role: worker
  - role: worker

Step 14: Create the Cluster
kind create cluster --config cluster.yml --name my-cluster

Step 15: Verify Cluster
kubectl get nodes
kubectl get namespaces

Working with Namespaces (VERY COMMON INTERVIEW TASK)
Create Namespace Using Command
kubectl create namespace test-ns
kubectl get ns

Delete Namespace
kubectl delete namespace test-ns

Create Namespace Using YAML (BEST PRACTICE)
namespace.yml
apiVersion: v1
kind: Namespace
metadata:
  name: nginx-ns

kubectl apply -f namespace.yml
kubectl get ns

📌 Interview Line

In production, namespaces are created using YAML for version control.

“For learning I use Minikube, for CI testing I use KIND, for production on EC2 I use kubeadm, and in cloud I prefer managed Kubernetes like EKS or AKS.”

