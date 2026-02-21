Terraform – Detailed Interview Notes
What is Terraform?

Terraform is an Infrastructure as Code (IaC) tool developed by HashiCorp.
It allows you to define, provision, and manage infrastructure using code instead of manual processes.

Infrastructure includes:

Servers (EC2, VM)

Networks (VPC, Subnets, Load Balancers)

Databases (RDS, DynamoDB, Azure SQL)

Storage, DNS, IAM, etc.

Infrastructure as Code (IaC)

IaC means managing infrastructure using configuration files that can be:

Version controlled (Git)

Reviewed

Reused

Automated

Benefits of IaC

No manual setup

Faster deployments

Consistency across environments

Easy rollback

Reduced human errors

Traditional Infrastructure Setup (Before Terraform)

Earlier infrastructure provisioning was:

Manual process

Multiple teams involved

Time-consuming

Error-prone

Traditional Workflow

Business Team – Defines requirement

Business Analyst – Creates documentation

Solution Architect – Designs infrastructure

Procurement Team – Purchases hardware/licenses

Infrastructure Team

Field Engineer – Server setup

Network Engineer – Network configuration

Backup Engineer – Backup setup

Problems

Long delivery cycles

Manual configuration

Human errors

No standardization

Difficult scaling

How DevOps & Terraform Solve This

Terraform automates infrastructure provisioning by:

Using code instead of tickets

Enabling self-service infrastructure

Supporting CI/CD pipelines

Maintaining infrastructure state

Terraform Language – HCL

Terraform uses HCL (HashiCorp Configuration Language).

HCL Features

Human-readable

Declarative (what you want, not how)

Supports variables and functions

Easier than JSON/YAML

Terraform also supports JSON, but HCL is preferred.

Multi-Cloud Support

Terraform is cloud-agnostic, meaning it works with:

AWS

Azure

Google Cloud

Oracle Cloud

On-prem (VMware)

👉 Unlike AWS CloudFormation, which is AWS-only, Terraform works across multiple clouds.

Terraform Architecture (Important for Interviews)
Core Components

Provider

Plugin that allows Terraform to interact with cloud APIs

Example: AWS provider

Resource

Actual infrastructure objects

Example: EC2 instance, VPC

State File

Tracks real infrastructure

Stored locally or remotely (S3, Terraform Cloud)

Module

Reusable Terraform code

Improves standardization

Terraform Workflow

terraform init

Initializes project

Downloads providers

terraform plan

Shows execution plan

No changes applied

terraform apply

Creates or updates infrastructure

terraform destroy

Deletes infrastructure

Terraform Installation (Ubuntu / Debian)
Step 1: Update System & Install Required Packages
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
Step 2: Install HashiCorp GPG Key
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
Step 3: Verify GPG Key Fingerprint
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
Step 4: Add HashiCorp Repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com \
$(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" \
| sudo tee /etc/apt/sources.list.d/hashicorp.list
Step 5: Install Terraform
sudo apt update
sudo apt-get install terraform
Step 6: Verify Installation
terraform --version
Example Use Case: AWS EC2 Instance Creation

Terraform can:

Launch EC2 instances

Attach security groups

Configure IAM roles

Create VPC & subnets
—all using a single configuration.