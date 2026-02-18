☁️ AWS + IAM + VPC + Networking (Interview-Ready)
1. What is AWS?
Answer:
AWS (Amazon Web Services) is a cloud computing platform that provides on-demand services such as compute, storage, networking, databases, monitoring, and security.
It allows organizations to build and scale applications globally with high availability, pay-as-you-go pricing, and minimal infrastructure management.
Real-world example:
Hosting a production e-commerce application using EC2/EKS for compute, S3 for storage, IAM for security, VPC for networking, and CloudWatch for monitoring.
🔐 IAM (Identity and Access Management)
2. What is IAM in AWS?
Answer:
IAM (Identity and Access Management) is an AWS service used to securely manage access to AWS resources.
It controls who can access what resources and what actions they can perform.
IAM provides:
Users
Groups
Roles
Policies
Best practice: Always follow least privilege access.
3. What are IAM Users?
Answer:
IAM users represent individual human users or applications that need long-term access to AWS.
Authentication methods:
Password (AWS Console)
Access key & secret key (CLI / SDK)
Production best practice:
Avoid IAM users for applications; use IAM roles instead.
4. What are IAM Policies?
Answer:
IAM policies are JSON documents that define permissions.
They specify:
Effect (Allow / Deny)
Action (e.g., s3:GetObject)
Resource (ARN)
Condition (optional)
Types:
AWS-managed policies
Customer-managed policies
Inline policies
5. What are IAM Roles?
Answer:
IAM roles provide temporary credentials to AWS services or applications without using access keys.
Common use cases:
EC2 accessing S3
EKS pods accessing AWS services
Jenkins accessing AWS securely
Why roles are better than access keys:
No hardcoded secrets
Automatic credential rotation
More secure and scalable
6. Can EC2 create an S3 bucket without access keys?
Answer:
✅ Yes.
By attaching an IAM role with S3 permissions to the EC2 instance, it can access or create S3 buckets without any access key configuration.
This is the recommended and secure approach.
7. How do you manage secure access in AWS?
Answer:
I manage secure access using:
IAM roles instead of access keys
Least-privilege IAM policies
MFA for IAM users
Separate roles for dev, stage, and prod
Regular IAM audits
🌐 VPC & Networking
8. What is a VPC?
Answer:
A VPC (Virtual Private Cloud) is an isolated virtual network inside AWS where we launch resources securely.
In a VPC, we control:
CIDR block
Subnets
Route tables
Internet & NAT gateways
Security groups and NACLs
9. Why do companies use VPC in real projects?
Answer:
Companies use VPC to:
Isolate workloads
Control inbound and outbound traffic
Improve security
Meet compliance requirements
Separate public and private resources
Industry practice:
Most companies avoid default VPCs and create custom VPCs.
10. What is a Custom VPC and why is it preferred?
Answer:
A custom VPC gives full control over:
IP ranges (CIDR)
Subnet design
Routing
Security rules
Why preferred over default VPC:
Better security architecture
Environment isolation
Production-ready design
11. What is a CIDR block?
Answer:
CIDR (Classless Inter-Domain Routing) defines a range of IP addresses for a VPC or subnet.
Example:
10.0.0.0/16 → VPC
10.0.1.0/24 → Subnet
12. What is a Subnet?
Answer:
A subnet is a logical division of a VPC.
Each subnet belongs to one Availability Zone (AZ).
Why required:
High availability
Fault tolerance
Network segmentation
Public and private separation
13. Difference between Public and Private Subnet?
Public Subnet	Private Subnet
Route to Internet Gateway	No direct internet access
Public IP assigned	No public IP
ALB, Bastion, NAT	EC2, EKS, DB
Internet accessible	Secure & isolated
14. What is an Internet Gateway?
Answer:
An Internet Gateway enables communication between VPC resources and the internet.
Only subnets with a route to IGW are public subnets.
15. What is a NAT Gateway?
Answer:
A NAT Gateway allows private subnet resources to access the internet for updates without being publicly exposed.
Used for:
EC2 in private subnet
EKS worker nodes
16. What is a Route Table?
Answer:
A route table defines how traffic flows within the VPC.
Example:
0.0.0.0/0 → IGW (public)
0.0.0.0/0 → NAT Gateway (private)
17. What is a Security Group?
Answer:
Security Groups are stateful firewalls at the instance or ENI level.
They control:
Inbound traffic
Outbound traffic
Best practice:
Open only required ports like 80, 443, 22.
18. What is NACL?
Answer:
Network ACLs are stateless firewalls at the subnet level.
Difference from Security Groups:
Stateless
Apply to entire subnet
Explicit allow and deny rules
19. How do you design a production-ready AWS network?
Answer:
A typical production design includes:
Custom VPC
Multi-AZ subnets
Public subnets for ALB/NAT
Private subnets for EC2/EKS
IAM roles for access
Least-privilege security groups
🖥️ EC2 (Elastic Compute Cloud)
20. What is EC2?
Answer:
EC2 provides resizable virtual servers to run applications in the cloud.
21. What are EC2 instance types?
Answer:
General purpose (t3)
Compute optimized (c5)
Memory optimized (r5)
Storage optimized (i3)
22. What is an AMI?
Answer:
An AMI is a template that contains:
OS
Software
Configuration
Used to launch EC2 instances.
23. How do you secure EC2 instances?
Answer:
Use IAM roles
Restrict security groups
Disable root login
Patch OS regularly
📦 S3 (Simple Storage Service)
24. What is S3?
Answer:
Amazon S3 is an object storage service used to store unlimited data securely.
25. What are S3 buckets and objects?
Answer:
Bucket → container
Object → file stored in bucket
26. How do you secure S3?
Answer:
IAM & bucket policies
Block public access
Enable encryption
Use versioning
27. What is S3 versioning?
Answer:
Versioning keeps multiple versions of objects for recovery and rollback.
28. What is an S3 lifecycle policy?
Answer:
Automatically moves data to cheaper storage or deletes old data.
☸️ EKS (Elastic Kubernetes Service)
29. What is EKS?
Answer:
EKS is AWS-managed Kubernetes service.
30. Full form of EKS?
Answer:
Elastic Kubernetes Service
31. Advantages of EKS over EC2 containers?
Answer:
Managed control plane
Auto-scaling
Self-healing
Rolling updates
High availability
32. How do pods access AWS services in EKS?
Answer:
Using IAM Roles for Service Accounts (IRSA).
33. Why AWS is suitable for DevOps?
Answer:
AWS provides:
Managed services
Strong IAM integration
Infrastructure as Code
Automation-friendly APIs
High scalability
34. Common AWS mistakes to avoid (Interview Bonus)
Answer:
Using root account
Hardcoding access keys
Everything in public subnet
No monitoring
Over-permission IAM policies
=====================================================================================================
📌 Focus Areas: Terraform | Monitoring | DevSecOps
🔹 SECTION 1: TERRAFORM (Infrastructure as Code – IaC)
1. Why did you choose Terraform for infrastructure provisioning?
Answer:
Terraform is used because it enables Infrastructure as Code (IaC), allowing infrastructure to be defined, managed, and versioned using declarative configuration files. This ensures consistency, automation, and repeatability across environments.
Key benefits:
Declarative configuration (desired state)
Version-controlled infrastructure using Git
Repeatable and predictable deployments
Cloud-agnostic (AWS, Azure, GCP, Kubernetes)
Easy automation and rollback
Real-world example:
I used Terraform to provision AWS EKS clusters, EC2 instances, IAM roles, VPCs, subnets, and security groups, ensuring identical infrastructure across 
dev, staging, and production environments.
2. How do you store and protect Terraform state?
Answer:
Terraform state is stored remotely using:
Amazon S3 for centralized and durable storage
DynamoDB for state locking to prevent concurrent updates
Best practices:
Enable S3 versioning
Enable encryption (SSE-S3 or SSE-KMS)
Restrict access using IAM policies
Separate state files for each environment
3. What is Terraform state and why is it important?
Answer:
Terraform state tracks:
Existing infrastructure resources
Their current configuration
Dependencies between resources
Terraform uses the state file to determine what resources need to be created, updated, or deleted. Without state, Terraform cannot safely manage 
infrastructure changes.
4. Difference between terraform plan and terraform apply
Answer:
terraform plan → Shows a preview of changes without applying them
terraform apply → Executes and applies the changes
Best practice:
Always review terraform plan before applying changes, especially in production.
5. What are Terraform providers?
Answer:
Providers are plugins that allow Terraform to interact with APIs of cloud platforms and services.
Common providers:
AWS
Azure
GCP
Kubernetes
Example:
provider "aws" {
  region = "ap-south-1"
}
6. What are Terraform modules?
Answer:
Modules are reusable Terraform configurations that help:
Reduce code duplication
Improve maintainability
Enforce organizational standards
Real-world usage:
Reusable modules were created for:
VPC
EKS
IAM roles
7. How do you manage multiple environments in Terraform?
Answer:
Separate backend/state files
Environment-specific variable files
Separate AWS accounts (best practice)
Note: Terraform workspaces are suitable for small setups but not recommended for large production systems.
8. How do you handle secrets in Terraform?
Answer:
Never hardcode secrets
Use:
AWS Secrets Manager
Environment variables
Encrypted variable files
IAM roles
9. When do you use terraform destroy?
Answer:
Used mainly for:
Temporary test environments
Non-production cleanup
Never used in production without proper approvals and backups.
10. Can Terraform work with Kubernetes?
Answer:
Yes. Terraform can:
Provision Kubernetes clusters (EKS)
Manage Kubernetes resources using the Kubernetes provider
11. What is the Terraform lifecycle?
Answer:
Terraform follows:
init → Initialize backend and providers
plan → Preview changes
apply → Apply changes
destroy → Remove infrastructure
12. How do you ensure Terraform code quality?
Answer:
Use terraform fmt
Use terraform validate
Code reviews
CI/CD integration
🔹 SECTION 2: MONITORING (Prometheus, Grafana, Observability)
13. What role does monitoring play in DevOps?
Answer:
Monitoring ensures:
Application availability
Performance visibility
Faster incident detection
SLA/SLO compliance
Reduced MTTR
14. What monitoring tools have you used?
Answer:
Prometheus → Metrics collection
Grafana → Visualization and alerting
15. What is Prometheus?
Answer:
Prometheus is an open-source time-series monitoring system that:
Scrapes metrics from targets
Stores data in TSDB
Supports alerting via Alertmanager
16. How does Prometheus collect metrics?
Answer:
Prometheus uses a pull-based model, scraping metrics from /metrics endpoints at defined intervals.
17. What is Grafana?
Answer:
Grafana is a visualization tool used to:
Build dashboards
Analyze metrics
Create alerts
18. What metrics indicate an unhealthy application?
Answer:
High CPU or memory usage
Increased response latency
High error rates (5xx)
Pod restarts
Failed health checks
19. How do you monitor Kubernetes workloads?
Answer:
Prometheus metrics
Grafana dashboards
Kubernetes events
Pod and container logs
20. Pods keep restarting – how do you debug?
Answer:
kubectl describe pod
kubectl logs
Check liveness/readiness probes
Verify resource limits
Check Kubernetes events
21. What is alerting and why is it important?
Answer:
Alerting proactively notifies teams about issues before they impact users, reducing downtime and MTTR.
22. Difference between monitoring and logging?
Answer:
Monitoring → Metrics and trends
Logging → Detailed event data
23. What is observability?
Answer:
Observability combines metrics, logs, and traces to understand system behavior and diagnose issues quickly.
🔹 SECTION 3: DEVSECOPS (Security in CI/CD)
24. What is DevSecOps?
Answer:
DevSecOps integrates security into every stage of the DevOps lifecycle, making security a shared responsibility.
25. Why is DevSecOps important?
Answer:
Early vulnerability detection
Reduced security risks
Faster secure releases
Compliance readiness
26. What security tools have you used?
Answer:
SonarQube → Code quality and security scanning
Trivy → Container and dependency vulnerability scanning
27. How did you integrate SonarQube in Jenkins?
Answer:
Installed SonarQube plugin
Configured authentication tokens
Added Sonar scan stage in Jenkins pipeline
Enforced Quality Gate checks
28. What happens if SonarQube Quality Gate fails?
Answer:
The pipeline fails immediately, preventing insecure or poor-quality code from reaching production.
29. Why did you use Trivy?
Answer:
Trivy scans:
Docker images
OS packages
Application dependencies
It detects vulnerabilities before deployment.
30. At which stage do you run Trivy?
Answer:
After Docker image build and before pushing to the registry or deployment.
31. How do you secure secrets in CI/CD pipelines?
Answer:
Jenkins Credentials Manager
Kubernetes Secrets
IAM roles
AWS Secrets Manager
32. How do IAM roles improve security?
Answer:
IAM roles eliminate static credentials and provide temporary, least-privilege access to AWS resources.
33. What is shift-left security?
Answer:
Shift-left security means identifying and fixing vulnerabilities early in the development lifecycle instead of after deployment.
34. How do you ensure compliance in DevSecOps?
Answer:
Automated security scans
Enforced quality gates
IAM least-privilege access
Audit logs and monitoring
==========================================================================
🌍 Terraform Commands – Complete Guide (Topic-Wise)
🔹 1. Terraform Installation & Version
terraform version
Shows installed Terraform version and provider versions
Used to verify compatibility in CI/CD pipelines
🔹 2. Terraform Help & Documentation
terraform help
terraform <command> -help
Lists all Terraform commands and flags
🔹 3. Initialization Commands
✅ Initialize Terraform Working Directory
terraform init
Downloads providers
Initializes backend (S3, local, etc.)
Prepares modules
Common flags:
terraform init -upgrade
terraform init -reconfigure
terraform init -backend-config=backend.tfvars
🔹 4. Terraform Formatting & Validation
Format Terraform Files
terraform fmt
terraform fmt -recursive
Validate Configuration
terraform validate
Checks syntax and configuration errors
Does not access cloud APIs
🔹 5. Terraform Planning
Preview Infrastructure Changes
terraform plan
Save plan output:
terraform plan -out=tfplan
Use variables:
terraform plan -var-file=dev.tfvars
🔹 6. Terraform Apply (Provision Infrastructure)
terraform apply
Apply saved plan:
terraform apply tfplan
Auto-approve (CI/CD only):
terraform apply -auto-approve
🔹 7. Terraform Destroy (Delete Infrastructure)
terraform destroy
Auto-approve:
terraform destroy -auto-approve
⚠️ Best Practice:
Never run destroy in production without approval.
🔹 8. Terraform State Management Commands
List Resources in State
terraform state list
Show Resource Details
terraform state show aws_instance.example
Remove Resource from State (Not Infrastructure)
terraform state rm aws_instance.example
Move Resource in State
terraform state mv old_name new_name
🔹 9. Terraform Workspace Commands
terraform workspace list
terraform workspace show
terraform workspace new dev
terraform workspace select prod
terraform workspace delete dev
📌 Used for small multi-environment setups
🔹 10. Terraform Output Commands
terraform output
terraform output vpc_id
terraform output -json
Displays values defined in output.tf
🔹 11. Terraform Variable Commands
terraform console
Interactive Terraform expression testing
🔹 12. Terraform Providers & Dependency Lock
terraform providers
terraform providers lock
Manages provider versions
Ensures reproducible builds
🔹 13. Terraform Import
terraform import aws_instance.example i-1234567890abcdef
Imports existing infrastructure into Terraform state
Does not create configuration automatically
🔹 14. Terraform Graph
terraform graph | dot -Tpng > graph.png
Visualizes resource dependency graph
🔹 15. Terraform Refresh
terraform refresh
Updates state file with real infrastructure status
⚠️ Deprecated in newer versions (merged into plan)
🔹 16. Terraform Taint & Untaint
terraform taint aws_instance.example
terraform untaint aws_instance.example
Forces resource recreation on next apply
⚠️ Deprecated (use -replace instead)
🔹 17. Terraform Replace (New Method)
terraform apply -replace="aws_instance.example"
Safer replacement of resources
🔹 18. Terraform Lock & Unlock
terraform force-unlock LOCK_ID
Used when Terraform state is locked due to crashed operation
🔹 19. Terraform Backend Commands
terraform init -migrate-state
Migrates state between backends
🔹 20. Terraform Debugging
TF_LOG=TRACE terraform apply
TF_LOG_PATH=terraform.log terraform apply
Used for deep troubleshooting
🔹 21. Terraform CI/CD Usage Commands
terraform init
terraform validate
terraform plan
terraform apply
Typical CI/CD flow:
Init
Validate
Plan
Apply (manual approval for prod)
🔹 22. Most Important Terraform Commands (Interview Focus)
Command	         Purpose
init	         Initialize working directory
plan	          Preview changes
apply	          Provision infrastructure
destroy	          Delete resources
fmt	              Format code
validate	      Validate configuration
state list   	  View managed resources
import           Import existing infra
workspace     	 Manage environments
============================================================================
🐧 Linux Interview Questions & Answers (DevOps Focused)
🔹 SECTION 1: LINUX BASICS
1. What is Linux?
Answer:
Linux is an open-source, Unix-like operating system kernel used widely in servers, cloud platforms, containers, and DevOps environments. It is stable, secure, and highly customizable.
DevOps context:
Most cloud services (AWS EC2, EKS nodes, Docker containers) run on Linux.
2. Why is Linux preferred in DevOps?
Answer:
Linux is preferred because it offers:
Stability & performance
Strong networking & process control
Native support for DevOps tools (Docker, Kubernetes, Jenkins)
Powerful CLI for automation
3. What is the Linux kernel?
Answer:
The kernel is the core of the OS that manages:
CPU scheduling
Memory
Disk I/O
Device drivers
Networking
4. Difference between Linux and Unix?
Answer:
Linux	               Unix
Open source	           Mostly proprietary
Free	               Paid
Widely used in cloud 	Limited usage
🔹 SECTION 2: FILE SYSTEM & DIRECTORY STRUCTURE
5. Important Linux directories?
Answer:
Directory	Purpose
/	Root
/etc	Config files
/var/log	Logs
/home	User files
/bin	Essential commands
/usr	Applications
/tmp	Temporary files
6. Difference between absolute and relative path?
Answer:
Absolute: /var/log/nginx/access.log
Relative: ../log/access.log
7. How do you find a file in Linux?
find / -name file.txt
locate file.txt
🔹 SECTION 3: FILE & DIRECTORY PERMISSIONS
8. Explain Linux permissions
Answer:
Linux permissions have:
Read (4)
Write (2)
Execute (1)
Example:
-rwxr-xr--
9. Change permissions?
chmod 755 file.txt
chmod u+x file.sh
10. Change ownership?
chown user:group file.txt
11. What permission is needed to write logs?
Answer:
Write (w) + execute (x) on directory
Write (w) on log file
🔹 SECTION 4: PROCESS MANAGEMENT
12. What is a process?
Answer:
A process is a running instance of a program.
13. How do you check running processes?
ps -ef
top
htop
14. Kill a process?
kill PID
kill -9 PID
15. Difference between process and service?
Answer:
Process	Service
Runs manually	Managed by systemd
No auto-restart	Auto-restart supported
16. Check service status?
systemctl status nginx
🔹 SECTION 5: CPU, MEMORY & DISK MONITORING
17. Check CPU usage?
top
htop
uptime
18. Check memory usage?
free -h
vmstat 1 5
19. Check disk usage?
df -h
du -sh /var/log/*
20. What is load average?
Answer:
Load average shows the number of processes waiting for CPU.
🔹 SECTION 6: LOG MANAGEMENT
21. Where are logs stored?
Answer:
Mostly under /var/log
22. How do you check logs?
tail -f app.log
less app.log
23. What is journalctl?
journalctl -u nginx
Used for systemd service logs.
24. Real-world log troubleshooting?
Answer:
When app fails:
App logs
Service logs
System logs
Monitoring alerts
🔹 SECTION 7: NETWORKING
25. Check open ports?
ss -tulnp
netstat -tulnp
lsof -i
26. Check connectivity?
ping
curl
telnet
27. Find which process is using a port?
lsof -i :8080
28. Difference between TCP and UDP?
Answer:
TCP	UDP
Reliable	Fast
Connection-oriented	Connectionless
🔹 SECTION 8: PACKAGE MANAGEMENT
29. Install package (Ubuntu)?
apt install nginx
30. Update system?
apt update && apt upgrade
🔹 SECTION 9: USER & GROUP MANAGEMENT
31. Create user?
useradd anil
passwd anil
32. Add user to sudo group?
usermod -aG sudo anil
🔹 SECTION 10: SHELL & SCRIPTING
33. What is shell scripting?
Answer:
Automating tasks using shell scripts.
34. Shebang?
#!/bin/bash
35. Why scripting is important for DevOps?
Answer:
Used for automation, cron jobs, CI/CD tasks, and server maintenance.
🔹 SECTION 11: SEARCH & TEXT PROCESSING
36. grep usage?
grep "error" app.log
37. awk vs sed?
Answer:
awk: Column-based processing
sed: Search & replace
🔹 SECTION 12: CRON & AUTOMATION
38. What is cron?
Answer:
Cron schedules tasks automatically.
39. Edit cron job?
crontab -e
40. Example cron job?
0 2 * * * backup.sh
🔹 SECTION 13: BOOT & SYSTEM SERVICES
41. What is systemd?
Answer:
systemd manages services and system startup.
42. Start service on boot?
systemctl enable nginx
🔹 SECTION 14: DEVOPS REAL-WORLD SCENARIOS
43. App not responding but server is up?
Answer:
Check process
Check port
Check logs
Check CPU/memory
Restart service
44. Disk full issue?
Answer:
df -h
du -sh /var/log/*
Clean logs or rotate logs.
45. High CPU usage?
Answer:
Identify process → optimize → restart → scale if needed
🔹 SECTION 15: LINUX SECURITY
46. How do you secure Linux servers?
Answer:
Disable root login
Use SSH keys
Firewall (ufw/iptables)
Least privilege access
47. What is sudo?
Answer:
Allows controlled administrative access.
🔹 SECTION 16: LINUX + DEVOPS TOOLS
48. Why Linux for Docker & Kubernetes?
Answer:
Containers use Linux kernel features like namespaces & cgroups.
49. Where do Kubernetes logs live?
Answer:
Node logs + container logs via kubectl logs.
🔹 SECTION 17: MOST IMPORTANT COMMANDS (MUST REMEMBER)
top, htop, free, df, du
ps, kill, systemctl
grep, awk, sed
journalctl
ss, netstat, lsof