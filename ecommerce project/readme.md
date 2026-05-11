Complete End-to-End DevOps Project Architecture – QBShop E-Commerce Platform
Project Overview

This project demonstrates a complete production-style DevOps implementation for a cloud-native e-commerce application named QBShop (QualityBytes E-Commerce) deployed on AWS Cloud using modern DevOps tools and practices.

The project covers:

Infrastructure as Code (Terraform)
CI/CD Automation (Jenkins)
Shared Jenkins Libraries
Containerization (Docker)
Kubernetes Orchestration (Amazon EKS)
GitOps Deployment (ArgoCD)
Ingress Management (NGINX Ingress Controller)
Security Scanning (Trivy)
Monitoring & Observability (Prometheus + Grafana)
DNS Mapping (GoDaddy)
Helm Package Management
AWS Cloud Integration
GitHub Repositories
Main Application Repository

QualityBytes Ecommerce Repository

Jenkins Shared Library Repository

(Used for reusable Jenkins pipeline functions and CI/CD standardization)

Example:

Common build stages
Docker build/push methods
Kubernetes deployment functions
Security scan utilities
Complete DevOps Workflow
Phase 1 — AWS Infrastructure Setup
Step 1: Create Host EC2 Instance

A main EC2 instance is created on AWS which acts as the Host Server / Bastion Server.

Configuration
Component	Value
Instance Name	QBShop
Instance Type	t2.xlarge
OS	Ubuntu
Security Group	Allow HTTP, HTTPS, SSH
Purpose	Terraform + AWS CLI + kubectl + Management
Step 2: Connect to EC2
ssh -i key.pem ubuntu@<PUBLIC_IP>
Phase 2 — Application Source Code Setup
Clone Application Repository
git clone https://github.com/satyams-git/qualitybytes-Ecomerce.git
cd qualitybytes-Ecomerce
Phase 3 — Install Required Tools
System Update
sudo apt update -y
Install Terraform
sudo apt-get update
sudo apt-get install -y gnupg software-properties-common

Add HashiCorp Repository:

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform -y

Verify:

terraform --version
Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
-o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install

Verify:

aws --version
Configure AWS CLI
Create IAM User

Create IAM User with:

Programmatic Access
AdministratorAccess (for learning/demo purposes)

Generate:

Access Key
Secret Key

Configure:

aws configure

Verify:

aws s3 ls
Generate SSH Key Pair
ssh-keygen -f qualibytes-key
chmod 400 qualibytes-key
Phase 4 — Infrastructure Provisioning Using Terraform

Navigate to Terraform Directory:

cd terraform
Initialize Terraform
terraform init
Validate Configuration
terraform validate
Preview Infrastructure
terraform plan
Create Infrastructure
terraform apply --auto-approve
Infrastructure Created

Terraform provisions:

Resource	Purpose
VPC	Networking
Public Subnets	EKS + Jenkins
EKS Cluster	Kubernetes
Worker Nodes	Application Pods
Jenkins EC2	CI/CD Server
Security Groups	Access Control
IAM Roles	AWS Permissions
View Terraform Outputs
terraform output

Outputs include:

Jenkins Public IP
EKS Cluster Name
VPC IDs
Node Group Info
Phase 5 — Jenkins Setup
Open Jenkins
http://<JENKINS_PUBLIC_IP>:8080
Verify Jenkins Service
sudo systemctl status jenkins
Get Jenkins Initial Password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
Install Jenkins Plugins

Install:

Docker
Docker Pipeline
Git
Pipeline Stage View

Restart Jenkins after installation.

Phase 6 — EKS Cluster Configuration
Configure kubectl Access

On Host Server:

aws eks --region ap-south-1 update-kubeconfig \
--name qualitybytes-eks-cluster
Install kubectl
sudo snap install kubectl --classic

Verify:

kubectl get nodes
Verify EKS Nodes
kubectl get nodes

Expected:

2 worker nodes running
Infrastructure Summary

At this stage:

Resource	Count
Jenkins Instance	1
Host Server	1
EKS Cluster	1
Worker Nodes	2
VPC	1
Phase 7 — Git Workflow
Create Development Branch
git branch dev
git checkout -b dev
git switch dev
Phase 8 — Jenkins Shared Library Integration

The Jenkins pipeline uses a Shared Library hosted on GitHub.

Benefits:

Reusable pipeline code
Centralized CI/CD logic
Reduced Jenkinsfile complexity
Easier maintenance
Jenkins Credentials Setup
GitHub Credentials

Add:

Username
GitHub Personal Access Token
DockerHub Credentials

Add:

DockerHub Username
DockerHub Password

Credential ID:

docker-hub-credentials
Configure Global Shared Library

Navigate:

Manage Jenkins
→ Configure System
→ Global Trusted Pipeline Libraries

Configuration:

Field	Value
Name	shared
Default Branch	main
Retrieval Method	Modern SCM
SCM	Git
Repository URL	Shared Library GitHub Repo
Create Jenkins Pipeline Job
Job Name
QBShop

Enable:

Pipeline
Discard Old Builds
Max Builds = 3
Add GitHub Project URL

Add repository URL.

Add Jenkins Pipeline Script

Pipeline stages include:

CI/CD Pipeline Stages
1. Code Checkout

Pull latest code from GitHub.

2. Trivy Security Scan

Used for:

Vulnerability scanning
Misconfiguration detection
Dependency scanning

Example:

trivy fs .

Container Scan:

trivy image qbshop:latest
3. Docker Build
docker build -t qbshop .
4. Docker Push
docker push <dockerhub-user>/qbshop:latest
5. Kubernetes Manifest Update

Image tag updated automatically.

6. GitOps Trigger

ArgoCD detects changes and deploys automatically.

Phase 9 — ArgoCD Installation
Create Namespace
kubectl create namespace argocd
Install ArgoCD
kubectl apply -n argocd -f \
https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
Verify Pods
kubectl get pods -n argocd
Expose ArgoCD Using NodePort
kubectl patch svc argocd-server -n argocd \
-p '{"spec": {"type": "NodePort"}}'
Get Service Port
kubectl get svc -n argocd
Get Initial Admin Password
kubectl -n argocd get secret argocd-initial-admin-secret \
-o jsonpath="{.data.password}" | base64 -d
Login to ArgoCD
http://<NODE_IP>:<NODEPORT>

Username:

admin
Install ArgoCD CLI
VERSION=$(curl -s https://api.github.com/repos/argoproj/argo-cd/releases/latest \
| grep tag_name | cut -d '"' -f 4)

curl -sSL -o argocd \
"https://github.com/argoproj/argo-cd/releases/download/${VERSION}/argocd-linux-amd64"

chmod +x argocd

sudo mv argocd /usr/local/bin/
Login via CLI
argocd login <IP>:<PORT>
Add Kubernetes Cluster to ArgoCD
kubectl config get-contexts
argocd cluster add <EKS_CLUSTER_ARN>

Verify:

argocd cluster list
Create ArgoCD Application
Application Details
Field	Value
App Name	qbshop
Sync Policy	Manual/Auto
Path	kubernetes
Namespace	qbshop
Repository	GitHub Repo

Enable:

Auto Create Namespace
Prune Resources
Phase 10 — Ingress Controller Setup
Create Namespace
kubectl create namespace ingress-nginx
Install Helm
curl -fsSL -o get_helm.sh \
https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

chmod +x get_helm.sh

./get_helm.sh
Install NGINX Ingress Controller
helm repo add ingress-nginx \
https://kubernetes.github.io/ingress-nginx

helm repo update
helm install nginx-ingress-controller \
ingress-nginx/ingress-nginx \
--namespace ingress-nginx \
--set controller.service.type=LoadBalancer
Verify Services
kubectl get svc -n ingress-nginx
Phase 11 — Cert Manager Installation

Used for:

SSL/TLS Certificates
HTTPS Enablement
Install Cert Manager
helm repo add jetstack https://charts.jetstack.io
helm install cert-manager jetstack/cert-manager \
--namespace cert-manager \
--create-namespace \
--version v1.12.0 \
--set installCRDs=true
Verify Pods
kubectl get pods -n cert-manager
Phase 12 — Application Deployment
Verify Namespace
kubectl get ns
Verify Pods
kubectl get pods -n qbshop
Verify Services
kubectl get svc -n qbshop
Verify Persistent Volumes
kubectl get pv
Verify PVC
kubectl get pvc -n qbshop
Debug Pods
kubectl describe pod <pod-name> -n qbshop

Logs:

kubectl logs <pod-name> -n qbshop
Phase 13 — Domain Mapping

Using GoDaddy DNS.

Add CNAME Record

Example:

qbshop.sriv.shop

Point domain to:

LoadBalancer External IP
Phase 14 — Monitoring Stack
Install Prometheus + Grafana
Add Helm Repositories
helm repo add prometheus-community \
https://prometheus-community.github.io/helm-charts
helm repo update
Create Namespace
kubectl create namespace prometheus
Install Monitoring Stack
helm install stable \
prometheus-community/kube-prometheus-stack \
-n prometheus
Verify Resources
kubectl get pods -n prometheus
kubectl get svc -n prometheus
Expose Prometheus
kubectl edit svc stable-kube-prometheus-sta-prometheus \
-n prometheus

Change:

type: ClusterIP

To:

type: LoadBalancer
Expose Grafana
kubectl edit svc stable-grafana -n prometheus

Change:

type: ClusterIP

To:

type: LoadBalancer
Get Grafana Password
kubectl get secret --namespace prometheus stable-grafana \
-o jsonpath='{.data.admin-password}' | base64 -d; echo
Access Grafana
http://<EXTERNAL_IP>:<PORT>

Username:

admin

Password:

Retrieved from Kubernetes secret
Monitoring Features
Prometheus

Used for:

Metrics collection
Kubernetes monitoring
Node monitoring
Pod health
Grafana

Used for:

Dashboards
Visualization
Cluster analytics
Alert monitoring
Security Implementation
Trivy Security Scanning

Integrated inside Jenkins Pipeline.

Scans:

Source code
Docker images
Vulnerabilities
Secrets
Misconfigurations
DevOps Tools Used
Tool	Purpose
AWS EC2	Compute
Terraform	IaC
Jenkins	CI/CD
Docker	Containerization
Kubernetes	Orchestration
Amazon EKS	Managed Kubernetes
ArgoCD	GitOps
Helm	Kubernetes Package Manager
Trivy	Security Scanning
Prometheus	Monitoring
Grafana	Visualization
NGINX Ingress	Traffic Routing
Cert Manager	SSL
GitHub	Source Control
Project Architecture Flow
Developer Push Code
        ↓
GitHub Repository
        ↓
Jenkins Pipeline Trigger
        ↓
Trivy Security Scan
        ↓
Docker Build
        ↓
DockerHub Push
        ↓
Kubernetes Manifest Update
        ↓
ArgoCD Detects Changes
        ↓
Deploys to Amazon EKS
        ↓
NGINX Ingress Exposes Application
        ↓
Domain Mapping via GoDaddy
        ↓
Monitoring with Prometheus + Grafana
Key DevOps Concepts Demonstrated
CI/CD Automation

Fully automated build and deployment pipeline.

GitOps Deployment

ArgoCD continuously syncs Kubernetes manifests with GitHub.

Infrastructure as Code

Terraform provisions complete AWS infrastructure.

Security Integration

Trivy ensures vulnerability scanning during CI.

Scalability

Amazon EKS provides scalable Kubernetes orchestration.

Monitoring & Observability

Prometheus and Grafana provide production-grade monitoring.

Cleanup

Destroy Infrastructure:

terraform destroy
Final Outcome

This project successfully demonstrates:

End-to-end DevOps lifecycle
Production-style CI/CD pipeline
Secure cloud-native deployment
Kubernetes orchestration
GitOps methodology
Monitoring and observability
Infrastructure automation
Scalable e-commerce deployment on AWS