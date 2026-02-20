Kubernetes Cluster Setup using kubeadm (AWS)
Architecture
Control Plane (Master): 1 EC2 instance
Worker Nodes: 1 (can scale to 3+ later)
OS: Ubuntu 20.04 / 22.04
Container Runtime: containerd
CNI: Calico

1. AWS EC2 SETUP
Instances to Create

Create two separate EC2 instances:

Role	Instance Name	Example Hostname
Control Plane	k8s-master	master
Worker Node	k8s-worker-1	worker
EC2 Configuration

AMI: Ubuntu Server 20.04 LTS
Instance Type: t2.medium or higher
Storage: 10 GB gp2/gp3
Key Pair: your .pem key
Network: Same VPC & subnet
Security Group: Same SG for all nodes

2. SECURITY GROUP RULES

Open the following ports:

Port	Protocol	Source	Description
22	TCP	Your IP / 0.0.0.0/0	SSH
6443	TCP	Worker CIDR	Kubernetes API
10250	TCP	Worker CIDR	Kubelet
179	TCP	Node CIDR	Calico BGP
8080	TCP	0.0.0.0/0	App access

⚠️ For production, never use 0.0.0.0/0 everywhere.

3. SET HOSTNAMES
On Master Node
sudo hostnamectl set-hostname master
exit
# Reconnect
On Worker Node
sudo hostnamectl set-hostname worker
exit
# Reconnect
4. COMMON SETUP (RUN ON ALL NODES)
Disable Swap
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab
Load Kernel Modules
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

Verify:

lsmod | grep -E "overlay|br_netfilter"
Sysctl Configuration
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo sysctl --system
5. INSTALL CONTAINERD (ALL NODES)
sudo apt-get update
sudo apt-get install -y ca-certificates curl

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
-o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y containerd.io
Configure containerd
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' \
/etc/containerd/config.toml

sudo systemctl restart containerd
sudo systemctl enable containerd
6. INSTALL KUBERNETES COMPONENTS (ALL NODES)
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key \
| sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] \
https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /" \
| sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
7. INITIALIZE CLUSTER (MASTER ONLY)
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
Configure kubectl
mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
8. INSTALL CNI (CALICO)
kubectl apply -f \
https://raw.githubusercontent.com/projectcalico/calico/v3.26.0/manifests/calico.yaml
9. JOIN WORKER NODE

On master, get join command:

kubeadm token create --print-join-command

On worker:

sudo kubeadm join <MASTER_PRIVATE_IP>:6443 \
--token <token> \
--discovery-token-ca-cert-hash sha256:<hash> \
--cri-socket unix:///run/containerd/containerd.sock
10. VERIFY CLUSTER (MASTER)
kubectl get nodes

You should see:

master   Ready
worker   Ready
11. DEPLOY NOTES APP
mkdir notes-app && cd notes-app
kubectl create namespace notes-app-ns
Deployment
kubectl apply -f deployment.yml
kubectl get pods -n notes-app-ns
Service
kubectl apply -f service.yml
Access App
kubectl port-forward \
-n notes-app-ns \
--address 0.0.0.0 \
service/notes-app-service 8080:80

Access:

http://<EC2-PUBLIC-IP>:8080
12. COMMON TROUBLESHOOTING

Nodes Not Ready → Check CNI

Pods Pending → Check security group & Calico

kubelet error → journalctl -u kubelet


KUBEADM

each parts has the instance
like work node has the 3  instance saperate 
control plane 1 instance saperate

aws insatnce create
one worker and one master
name-k8s adm server,ubuntu,pem key
allow all trafic,10 gb volume

launch two saperate istance on aws

give name

sudo hostnamectl set-hostname master
exit
again join

sudo hostnamectl set-hostname worker
exit
again join

in both instance run this command
sudo swapoff -a 

on master node and worker node
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf overlay br_netfilter EOF overlay br_brnetfilter

sudo modprobe overlay
sudo modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge=nf-call-iptables=1
net.bridge.bridge=nf-call-iptables=1
net.ipv4.ip_forward
EOF
net.bridge.bridge-nf-call-iptables=1
net.bridge.bridge-nf-call-iptables=1
net.ipv4.ip_forward

sudo systemctl --system

ls mod | grep br_netfilter

sudo apt-get update

sudo apt-get install -y ca-certificates curl

sudo install -m 0755 -d /etc/apt/keyring sudo curl -fsSl https://downloads.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

Kubeadm Installation Guide
==========================

This guide outlines the steps needed to set up a Kubernetes cluster using kubeadm.

------------------------------------------------------------

PREREQUISITES
-------------
- Ubuntu OS (Xenial or later)
- sudo privileges
- Internet access
- t2.medium instance type or higher

------------------------------------------------------------

AWS SETUP
---------
1. Ensure that all instances are in the same Security Group.
2. Expose port 6443 in the Security Group to allow worker nodes to join the cluster.
3. Expose port 22 in the Security Group to allow SSH access to manage the instance.

------------------------------------------------------------

TO DO THE ABOVE SETUP
---------------------
Step 1: Identify or Create a Security Group

1. Log in to the AWS Management Console
   - Go to the EC2 Dashboard

2. Locate Security Groups
   - In the left menu under "Network & Security", click on "Security Groups"

3. Create a New Security Group
   - Click on "Create Security Group"
   - Provide the following details:
     - Name: Kubernetes-Cluster-SG
     - Description: A brief description for the security group (mandatory)
     - VPC: Select the appropriate VPC for your instances (default is acceptable)

4. Add Rules to the Security Group
   - Allow SSH Traffic (Port 22)
     - Type: SSH
     - Port Range: 22
     - Source: 0.0.0.0/0 (Anywhere) or your specific IP

   - Allow Kubernetes API Traffic (Port 6443)
     - Type: Custom TCP
     - Port Range: 6443
     - Source: 0.0.0.0/0 (Anywhere) or specific IP ranges

5. Save the Rules
   - Click on "Create Security Group" to save the settings

Step 2: Select the Security Group While Creating Instances
   - When launching EC2 instances, under "Configure Security Group", select the existing security group (Kubernetes-Cluster-SG)

Note: Security group settings can be updated later as needed.

------------------------------------------------------------

EXECUTE ON BOTH MASTER AND WORKER NODES
---------------------------------------

1. Disable Swap
   sudo swapoff -a

2. Load Necessary Kernel Modules
   cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
   overlay
   br_netfilter
   EOF

   sudo modprobe overlay
   sudo modprobe br_netfilter

3. Set Sysctl Parameters
   cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
   net.bridge.bridge-nf-call-iptables  = 1
   net.bridge.bridge-nf-call-ip6tables = 1
   net.ipv4.ip_forward                 = 1
   EOF

   sudo sysctl --system
   lsmod | grep br_netfilter
   lsmod | grep overlay

4. Install Containerd
   sudo apt-get update
   sudo apt-get install -y ca-certificates curl
   sudo install -m 0755 -d /etc/apt/keyrings
   sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
   sudo chmod a+r /etc/apt/keyrings/docker.asc

   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

   sudo apt-get update
   sudo apt-get install -y containerd.io

   containerd config default | sed -e 's/SystemdCgroup = false/SystemdCgroup = true/' -e 's/sandbox_image = "registry.k8s.io\/pause:3.6"/sandbox_image = "registry.k8s.io\/pause:3.9"/' | sudo tee /etc/containerd/config.toml

   sudo systemctl restart containerd
   sudo systemctl status containerd

5. Install Kubernetes Components
   sudo apt-get update
   sudo apt-get install -y apt-transport-https ca-certificates curl gpg

   curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

   echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

   sudo apt-get update
   sudo apt-get install -y kubelet kubeadm kubectl
   sudo apt-mark hold kubelet kubeadm kubectl

------------------------------------------------------------

EXECUTE ONLY ON THE MASTER NODE
-------------------------------

1. Initialize the Cluster
   sudo kubeadm init

2. Set Up Local kubeconfig
   mkdir -p "$HOME"/.kube
   sudo cp -i /etc/kubernetes/admin.conf "$HOME"/.kube/config
   sudo chown "$(id -u)":"$(id -g)" "$HOME"/.kube/config

3. Install a Network Plugin (Calico)
   kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.0/manifests/calico.yaml

4. Generate Join Command
   kubeadm token create --print-join-command

Copy this generated token for use in the next step.

------------------------------------------------------------

EXECUTE ON ALL WORKER NODES
---------------------------

1. Perform Pre-flight Checks
   sudo kubeadm reset pre-flight checks

2. Join the Cluster
   sudo kubeadm join <private-ip-of-control-plane>:6443 --token <token> --discovery-token-ca-cert-hash sha256:<hash> --cri-socket "unix:///run/containerd/containerd.sock" --v=5

Note:
1. Add sudo at the beginning of the command.
2. Add --v=5 at the end for verbose output.

Example:
   sudo kubeadm join 172.31.10.100:6443 --token abcdef.0123456789abcdef --discovery-token-ca-cert-hash sha256:1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef --cri-socket "unix:///run/containerd/containerd.sock" --v=5

------------------------------------------------------------

VERIFY CLUSTER CONNECTION (ON MASTER NODE)
------------------------------------------
   kubectl get nodes

------------------------------------------------------------

VERIFY CONTAINER STATUS ON WORKER NODE
--------------------------------------
Check container status using Docker or containerd tools.

------------------------------------------------------------


Ports to Open
| Port  | Protocol | Source    | Description                        |
| ----- | -------- | --------- | ---------------------------------- |
| 22    | TCP      | 0.0.0.0/0 | SSH                                |
| 6443  | TCP      | 0.0.0.0/0 | Kubernetes API server              |
| 10250 | TCP      | 0.0.0.0/0 | Kubelet API                        |
| 8080  | TCP      | 0.0.0.0/0 | For your app (port-forward access) |
| 179   | TCP      | 0.0.0.0/0 | Calico BGP (if using Calico)       |
| 8472  | UDP      | 0.0.0.0/0 | Flannel VXLAN (if using Flannel)   |



install container D



only on master node
sudo kubeadm init



kubectl get nodes on master

mkdir notes-app
cd notes-app
kubectl create ns notes-app-ns

kubectl get ns

sudo vim deployment.yml


kubectl apply -f deployment.yml
kubectl get pods -n notes-app-ns

sudo vim service.yml

kubectl apply -f service.yml

kubectl  port-forward -n notes-app-ns -address=0.0.0.0 service/notes-app-service 8080:80


