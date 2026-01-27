HR & Career-Transition (Interview-Ready Answers)

1. Tell me about yourself (Self-Introduction)

I am Anil Choudhary, a DevOps Engineer with around one year of hands-on experience working on a production-grade, Australia-based e-commerce platform at Delta 360 Services. My work focuses on CI/CD automation, AWS infrastructure management, and running containerized workloads on Kubernetes (EKS). I regularly collaborate with developers to deliver reliable, scalable deployments with minimal downtime. I’m actively involved in production monitoring and troubleshooting using tools like Prometheus and Grafana, and I follow GitOps practices with Argo CD.

2. Walk me through your background and current role
I began my career with a foundation in software and support roles, which gave me strong exposure to real-world production issues. Currently, at Delta 360 Services, I work as a DevOps Engineer supporting a live e-commerce system. My responsibilities include CI/CD automation with Jenkins, infrastructure provisioning using Terraform, Kubernetes operations on EKS, monitoring, and production support.

3. What kind of client or project have you worked on?
I’ve worked on a mid-scale, international e-commerce platform hosted on AWS that experiences seasonal traffic spikes. The project demands high availability, security, scalability, and zero/low-downtime deployments.

4. What environments have you supported?
I have supported development, staging, and production environments. I’m actively involved in production support, including monitoring, incident response, and post-deployment validation.

5. What was your role across the project lifecycle?
My role covered the full lifecycle: infrastructure provisioning, CI/CD pipeline design, deployments to Kubernetes, monitoring and alerting, troubleshooting incidents, and continuous improvement of reliability and performance.

6. What does production support mean in your role?
Production support means ensuring the live application is stable, secure, and highly available. It includes monitoring, responding to incidents, troubleshooting issues, coordinating with developers, and minimizing business impact.

7. How do developers and DevOps teams work together?
Developers focus on writing and testing application code. DevOps ensures smooth builds, deployments, and infrastructure reliability. We collaborate via Git repositories, CI/CD pipelines, shared dashboards, and regular communication. Code pushes trigger automated pipelines that build, test, and deploy applications.

8. Which tools are you most confident with and why?
I’m most confident with AWS, Jenkins, Docker, Kubernetes (EKS), Terraform, and Argo CD because I use them daily in production—for deployments, automation, monitoring, and troubleshooting.

9. What DevOps role are you looking for?
I’m looking for a DevOps role where I can work deeply with cloud infrastructure, CI/CD, Kubernetes, and automation, while owning production reliability and continuous improvement.

10. What motivated you to move from Python to DevOps?
I started as a Python intern working on backend development and API integrations, which gave me a strong understanding of application logic. Later, as a Technical Support Associate, I handled real production issues and learned the importance of system stability and reliability. After a short career gap due to family reasons, I wanted a role that combines development knowledge with infrastructure, automation, and production ownership—DevOps was a natural fit.

11. What part of DevOps do you enjoy the most?
I enjoy CI/CD automation and cloud infrastructure the most—especially building pipelines that improve deployment speed, reliability, and developer productivity.

12. What does production readiness mean to you?
Production readiness means the application is secure, scalable, monitored, properly logged, backed up, and has clear rollback and disaster recovery strategies in place.


=========================================================================================================================================================
Linux + Troubleshooting Interview Questions (7–37)
7. How do you check CPU usage in Linux?
I use top, htop, mpstat, or uptime to check CPU usage and load average.

8. How do you check memory usage?
I use free -h, top, vmstat, and htop to check RAM and swap usage.

9. How do you check disk usage?
I use df -h for disk space and du -sh to check directory sizes.

10. How do you check which process is consuming high CPU or memory?
Using top or htop, I sort by CPU or memory usage.

11. How do you check running processes?
I use ps -ef, ps aux, or top.

12. How do you stop a running process?
Using kill <PID> or kill -9 <PID> if the process does not stop normally.

13. What is load average in Linux?
It shows the average number of processes waiting for CPU over 1, 5, and 15 minutes.

14. How do you check server uptime?
Using uptime or who -b.

15. How do you check open ports in Linux?
I use:

ss -tulnp
socket statistics,tcp,udp,listening ports only,show port number,processname and PID
netstat -tulnp
lsof -i // 
lsof -i :port

16. How do you check logs in Linux?
I use tail, less, cat, and grep on log files inside /var/log.

Example:
tail -f /var/log/syslog

17. What do you do if an application is not responding?
I check:
CPU & memory usage
Application logs
Process status
Restart the service if required

18. How do you restart a service?
Using:
systemctl restart service-name

19. How do you check service status?
systemctl status service-name

20. What happens when disk becomes full?
Applications may crash, logs stop writing, and services can fail.

21. How do you free disk space?
Remove old logs

Clear unused files

Rotate logs using logrotate

22. What issues can cause high CPU usage?
Infinite loops

Heavy background jobs

Application bugs

Too many running processes

23. What issues can cause high memory usage?
Memory leaks

Large applications

Too many running services

24. What happens when Linux runs out of memory?
System becomes slow

Uses swap memory

OOM Killer may kill processes

25. What is swap memory?
Swap is disk space used as virtual memory when RAM is full.

26. What is the OOM Killer?
It automatically kills processes when the system runs out of memory.

27. How do you check network connectivity?
Using ping, curl, wget, or telnet.

28. How do you check IP address?
ip a
or
ifconfig

29. How do you check DNS issues?
Using nslookup, dig, or ping domain-name.

30. How do you check file permissions?
Using:
ls -l

31. What are Linux file permissions?
Read (r)
Write (w)
Execute (x)

32. How do you give write permission to a file?
chmod +w filename
or
chmod 644 filename

33. How do you change file ownership?
chown user:group filename

34. How do you search for a word inside a file?
Using grep:
grep "error" filename

35. What command is used to check hardware info?
I use top, free, lsblk, and lscpu.

36. How do you troubleshoot a slow Linux server?
I check:
CPU usage
Memory usage
Disk I/O
Network latency
Application logs

37. What is your general Linux troubleshooting approach?
Understand the issue → check logs → check resources → identify root cause → fix → monitor.

=========================================================================================================

GITOPS Interview Questions

1. What is GitOps?
GitOps is a deployment methodology where Git is the single source of truth for infrastructure and application configuration.

2. Why GitOps instead of traditional deployment?
Because GitOps provides:
Better version control
Easy rollback
Improved security
Automated synchronization

3. Which GitOps tool did you use?
I used Argo CD for GitOps-based Kubernetes deployments.

4. What is Argo CD?
Argo CD is a Kubernetes-native GitOps tool that continuously monitors Git repositories and ensures the cluster state matches the desired configuration.

5. How does Argo CD work?
Watches Git repository
Pulls Kubernetes manifests
Applies them to the cluster
Detects and fixes drift automatically

6. Jenkins vs Argo CD (Difference)?
Jenkins	                Argo CD
CI-focused	            CD-focused
Push-based	            Pull-based
Builds Docker images	Deploys to Kubernetes
Pipeline-driven	        Git-driven

7. How CI/CD + GitOps work together in your project?
Jenkins handled CI by building and pushing Docker images.
Argo CD handled CD by deploying updated Kubernetes manifests from Git to EKS.

8. Where do you store Kubernetes manifests?
In a Git repository, which is monitored by Argo CD.

9. How do you manage secrets in GitOps?
Kubernetes Secrets
Jenkins Credentials
Secrets are never stored directly in Git

10. What happens if deployment fails?
Check Jenkins logs or Argo CD sync status
Roll back using Git history
Fix issue and redeploy

11. How do you roll back deployments in GitOps?
By reverting the Git commit and syncing Argo CD, which automatically restores the previous stable state.

12. What is pipeline failure handling?
Identify failed stage
Check logs
Fix configuration or code
Re-run pipeline

13. What benefits did CI/CD give to your project?
Faster releases
Reduced manual errors
Consistent deployments
Better reliability


========================================================================================================================================
🐳 DOCKER – Interview Questions & Answers (Detailed & Practical)
1. What is Docker and why do we use it?
Docker is a containerization platform that allows us to package an application along with its dependencies into a single unit called a container.
We use Docker to:
Avoid “works on my machine” issues
Ensure consistency across dev, test, and prod
Enable faster deployments
Improve scalability and portability

Real-world example:
The same Docker image runs identically on a developer laptop, Jenkins server, and Kubernetes production cluster.

2. What problems does Docker solve?
Docker solves:
Environment inconsistency
Dependency conflicts
Manual deployment errors
Slow application setup
Portability issues
Before Docker, apps failed due to OS/library mismatches. Docker standardizes runtime environments.

3. Why did you containerize your application?
We containerized the application to ensure:
Same behavior across environments
Faster CI/CD deployments
Easy scaling on Kubernetes
Isolation between services
It also simplified rollback and version management.
Example: A Java app runs the same in development, testing, and production using Docker.


4. Difference between Docker Image and Docker Container
Docker Image	Docker Container
Static template	Running instance
Read-only	Read-write
Built once	Created from image
Blueprint	Actual running app
One-liner:
“An image is a template; a container is a running application created from that image.”

5. How do you manage Docker image versions?
I manage Docker image versions using proper tagging like version numbers or build IDs, and avoid using the latest tag in production.
I manage Docker images using proper tagging, such as:
Semantic versions: v1.0.1
Git commit IDs
Environment tags (dev, stage, prod)
🚫 I avoid using latest in production to prevent unexpected deployments.

6. How do you tag Docker images?
Example:
docker build -t myapp:v1.2.0 .
docker tag myapp:v1.2.0 myrepo/myapp:v1.2.0
docker push myrepo/myapp:v1.2.0

7. What is Dockerfile?
A Dockerfile is a text file that contains instructions to build a Docker image.
It defines:
Base image
Application code
Dependencies
Startup command

8. Important Dockerfile instructions
Common Dockerfile instructions:
FROM – base image
WORKDIR – working directory
COPY – copy files
RUN – install dependencies
EXPOSE – open ports
CMD / ENTRYPOINT – start application

9. What does a basic Dockerfile look like?
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "app.py"]

10. How do you reduce Docker image size?
I reduce image size by:
Using lightweight base images (alpine, slim)
Multi-stage builds
Removing unnecessary packages
Combining RUN commands
Using .dockerignore
Best practice:
Smaller images = faster builds + better security.

11. What is a multi-stage Docker build?
Multi-stage builds allow separating build-time dependencies from runtime dependencies.
This helps:
Reduce image size
Improve security
Remove compilers/tools from final image

12. What is .dockerignore and why is it used?
.dockerignore prevents unnecessary files (logs, node_modules, .git) from being added to the image.
This:
Reduces image size
Improves build speed

13. What Docker-related issues have you faced?
I have faced:
Large image sizes
Container crashes due to memory limits
Port conflicts
Environment variable issues
Disk space exhaustion on nodes
I fixed them by optimizing Dockerfiles, adjusting resource limits, and cleaning unused images.

14. Container crashes after deployment – how do you debug?
I check:
Container logs → docker logs <container-id>
Exit code → docker inspect
Resource limits (CPU/memory)
Environment variables
Application startup command

15. How do you check Docker logs?
docker logs container-id
docker logs -f container-id

16. How do you check running containers?
docker ps
docker ps -a

17. How do you stop and remove containers?
docker stop container-id
docker rm container-id

18. How do you clean unused Docker resources?
docker system prune
docker image prune
docker volume prune

19. What is Docker Hub?
Docker Hub is a container registry used to store and share Docker images.
In my project, Jenkins pushed images to Docker Hub, and Kubernetes pulled them during deployment.

20. How do you authenticate Docker in Jenkins?
Using Jenkins Credentials Manager:
Docker Hub username & token
Referenced securely in Jenkins pipeline

21. What happens if image version mismatch occurs?
It can deploy the wrong application version.
To avoid this, we:
Use explicit tags
Avoid latest
Maintain versioned manifests

22. Docker vs Virtual Machines
Docker	VM
Lightweight	Heavy
Shares OS kernel	Separate OS
Fast startup	Slow
Better density	Lower density

23. Docker in CI/CD – how did you use it?
In Jenkins:
Build Docker image
Tag with version
Push to Docker Hub
Deploy via Kubernetes
Docker is the backbone of our CI/CD pipeline.

24. Why Docker with Kubernetes?
Docker packages the app, Kubernetes runs and manages it.
Docker = build & package
Kubernetes = run & orchestrate

25. One strong interview closing line
“Docker helped us standardize application packaging, reduce deployment failures, and seamlessly integrate with Jenkins and Kubernetes for reliable production releases.”


🐳 Docker Commands – Complete Guide (Topic-Wise)
1️⃣ Docker Version & System Info
docker --version
docker version
docker info


📌 Shows Docker version, client/server info, storage driver, running containers.

2️⃣ Docker Help & Command Reference
docker help
docker <command> --help


📌 Displays all available Docker commands and usage.

3️⃣ Docker Image Management
🔹 List Images
docker images
docker image ls

🔹 Pull Image from Docker Hub
docker pull nginx
docker pull ubuntu:20.04

🔹 Build Image from Dockerfile
docker build -t myapp:1.0 .

🔹 Remove Image
docker rmi image_id
docker image rm image_id

🔹 Remove Unused Images
docker image prune
docker image prune -a

🔹 Inspect Image
docker inspect image_name
docker history image_name

4️⃣ Docker Container Management
🔹 List Containers
docker ps          # running containers
docker ps -a       # all containers

🔹 Run Container
docker run nginx
docker run -d nginx
docker run -it ubuntu bash
docker run --name mycontainer nginx

🔹 Start / Stop / Restart Container
docker start container_id
docker stop container_id
docker restart container_id

🔹 Remove Container
docker rm container_id
docker rm -f container_id

🔹 Inspect Container
docker inspect container_id

5️⃣ Container Interaction & Debugging
🔹 Execute Command Inside Container
docker exec -it container_id bash

🔹 View Container Logs
docker logs container_id
docker logs -f container_id

🔹 Attach to Container
docker attach container_id

🔹 Copy Files
docker cp file.txt container_id:/path
docker cp container_id:/path/file.txt .

6️⃣ Docker Networking
🔹 List Networks
docker network ls

🔹 Create Network
docker network create mynetwork

🔹 Connect / Disconnect Container
docker network connect mynetwork container_id
docker network disconnect mynetwork container_id

🔹 Inspect Network
docker network inspect mynetwork

7️⃣ Docker Volumes & Storage
🔹 List Volumes
docker volume ls

🔹 Create Volume
docker volume create myvolume

🔹 Use Volume in Container
docker run -v myvolume:/data nginx

🔹 Bind Mount
docker run -v /host/path:/container/path nginx

🔹 Remove Volume
docker volume rm myvolume
docker volume prune

8️⃣ Docker System Cleanup
docker system df
docker system prune
docker system prune -a
docker system prune --volumes


📌 Frees disk space by removing unused containers, images, networks, volumes.

9️⃣ Docker Registry & Image Push
🔹 Login to Docker Hub
docker login

🔹 Tag Image
docker tag myapp:1.0 username/myapp:1.0

🔹 Push Image
docker push username/myapp:1.0

🔟 Docker Compose Commands
🔹 Start Services
docker-compose up
docker-compose up -d

🔹 Stop Services
docker-compose down

🔹 View Status
docker-compose ps

🔹 Logs
docker-compose logs

🔹 Build Services
docker-compose build

1️⃣1️⃣ Docker Stats & Monitoring
docker stats
docker top container_id
docker events

1️⃣2️⃣ Docker Security & Resource Limits
docker run --memory="512m" nginx
docker run --cpus="1.5" nginx
docker run --read-only nginx

1️⃣3️⃣ Docker Save & Load
docker save -o image.tar image_name
docker load -i image.tar

1️⃣4️⃣ Docker Export & Import
docker export container_id > container.tar
docker import container.tar myimage

1️⃣5️⃣ Docker Buildx (Multi-Arch Builds)
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm64 -t myapp .

🔥 Most Important Docker Commands (Interview Focus)
docker run
docker build
docker ps
docker exec
docker logs
docker pull / push
docker-compose up / down
docker system prune
🎯 Pro Tip for Interviews
Be ready to explain:
Difference between Image vs Container
CMD vs ENTRYPOINT
COPY vs ADD
Volume vs Bind Mount
Bridge vs Host Network
Multi-stage Dockerfile



===================================================================================================================================================
☸️ KUBERNETES & EKS – Interview Questions & Answers
🔹 What is Kubernetes?
Kubernetes is a container orchestration platform used to deploy, scale, manage, and heal containerized applications automatically.
🔹 High-Level Kubernetes Architecture
Kubernetes follows a master–worker (control plane–node) architecture:

        ┌───────────────────────┐
        │     Control Plane      │
        │ (Master Components)    │
        └─────────┬─────────────┘
                  │
        ┌─────────┴─────────────┐
        │      Worker Nodes      │
        │   (Application Pods)   │
        └───────────────────────┘


🔹 1️⃣ Control Plane (Master Node)
The control plane manages the cluster and makes global decisions.

🔹 a) API Server (kube-apiserver)
Entry point to the cluster
All commands (kubectl, CI/CD, UI) go through API Server
Validates requests and updates cluster state
💡 Interview line:
API Server is the brain gateway of Kubernetes.

🔹 b) etcd
Distributed key-value database
Stores cluster state
Pods
Deployments
ConfigMaps
Secrets
💡 If etcd is lost → cluster state is lost.

🔹 c) Scheduler
Decides which node will run a Pod
Considers:
CPU & memory availability
Node labels & taints
Affinity rules
💡 Scheduler does not run pods, it only assigns them.

🔹 d) Controller Manager
Ensures desired state = actual state
Runs controllers like:
Deployment controller
ReplicaSet controller
Node controller
📌 Example:
If a pod crashes → controller creates a new one.

🔹 2️⃣ Worker Nodes
Worker nodes run the actual application workloads.
Each worker node contains:

🔹 a) kubelet
Agent running on each node
Talks to API Server
Ensures pods are running as defined
📌 kubelet = node-level manager

🔹 b) Container Runtime
Runs containers inside pods
Examples:
Docker
containerd
CRI-O

🔹 c) kube-proxy
Handles networking & service communication
Enables:
Load balancing
Service-to-pod communication

🔹 3️⃣ Pod (Smallest Unit)
Pod = one or more containers
Containers in a pod:
Share IP
Share storage
Communicate via localhost
📌 Kubernetes never runs containers directly, it runs pods.

🔹 4️⃣ How Kubernetes Works (End-to-End Flow)
📌 Step-by-Step Example (Production Flow)
1️⃣ Developer pushes code to Git
2️⃣ CI/CD pipeline builds Docker image
3️⃣ Image is pushed to registry
4️⃣ Deployment YAML is applied (kubectl apply)
5️⃣ API Server receives request
6️⃣ Desired state is stored in etcd
7️⃣ Scheduler selects best node
8️⃣ kubelet pulls image & starts pod
9️⃣ kube-proxy routes traffic
🔁 If pod crashes → controller recreates it

🔹 5️⃣ How Kubernetes Ensures High Availability

✔ Self-healing (auto-restart pods)
✔ Auto-scaling (HPA)
✔ Rolling updates
✔ Load balancing
✔ Multi-node architecture

📌 Result: Zero / minimal downtime

🔹 6️⃣ Kubernetes Architecture Diagram (Interview Explanation)
kubectl / CI-CD
     |
 API Server
     |
  etcd  ←→ Controller Manager
     |
 Scheduler
     |
 Worker Nodes
  ├── kubelet
  ├── container runtime
  └── kube-proxy
        |
       Pods

🔹 8️⃣ One-Line Interview Answer (Very Important)
“Kubernetes works by continuously matching the desired state defined in YAML files with the actual state of the cluster using its control plane components, ensuring scalability, availability, and self-healing.”

🔹 9️⃣ EKS Note (Bonus Interview Point)
In Amazon EKS:
AWS manages:
Control plane
API Server
etcd
We manage:
Worker nodes
Applications
Networking & IAM


1. What is Kubernetes?
Kubernetes is an open-source container orchestration platform used to deploy, manage, scale, and operate containerized applications automatically.
It helps with:
Auto-scaling
Self-healing
Load balancing
Rolling updates
Zero-downtime deployments
In our project, Kubernetes managed Docker containers running microservices for a production e-commerce platform.

2. What is EKS? Full form of EKS
EKS stands for Elastic Kubernetes Service.
EKS is AWS’s managed Kubernetes service where AWS manages:
Control plane
High availability
Security patches
Kubernetes upgrades
This allows us to focus on application deployment instead of cluster management.

3. Why did you use EKS instead of running containers directly on EC2?
Answer:
Compared to EC2-based containers, EKS provided:
Managed Kubernetes control plane
High availability across AZs
Auto-healing of pods
Auto-scaling
Built-in load balancing
Secure IAM integration
Rolling updates with zero downtime
EKS reduced operational overhead and improved production reliability.

4. How does Kubernetes help avoid downtime?
Answer:
Kubernetes avoids downtime using:
ReplicaSets (multiple pod replicas)
Rolling updates
Health checks (liveness & readiness probes)
Self-healing (restarts failed pods)
Load balancing via Services
If one pod fails, traffic automatically shifts to healthy pods.

5. Explain Kubernetes architecture
Answer:
Kubernetes architecture consists of Control Plane and Worker Nodes.
Control Plane Components:
API Server – Entry point for all cluster operations
Scheduler – Decides where pods should run
Controller Manager – Maintains desired vs actual state
etcd – Key-value store for cluster data
Worker Node Components:
kubelet – Communicates with control plane
Container runtime – Runs containers (Docker/containerd)
kube-proxy – Handles networking and service routing

6. What is a Pod?
Answer:
A Pod is the smallest deployable unit in Kubernetes.
It can contain:
One container (most common)
Or multiple tightly coupled containers
All containers in a pod share:
Network
Storage
IP address

7. How do you deploy an application in Kubernetes?
Answer:
I deploy applications using:
Deployment → manages pod replicas and updates
Service → exposes the application
Steps:
Create Deployment YAML
Apply using kubectl apply
Expose via Service (ClusterIP / LoadBalancer)

8. Difference between Deployment and Pod
Answer:
Pod is a single running instance
Deployment manages multiple pods and handles:
Scaling
Rolling updates
Rollbacks
In production, we always use Deployments, not standalone Pods.

9. What is a Kubernetes Service?
Answer:
A Service provides a stable network endpoint to access pods.
Types:
ClusterIP – Internal communication
NodePort – Exposes via node IP
LoadBalancer – External access (used in EKS)

10. How does load balancing work in Kubernetes?
Answer:
Kubernetes Services distribute traffic across multiple pod replicas.
In EKS:
AWS Load Balancer routes traffic
kube-proxy forwards traffic to healthy pods
This ensures high availability.

11. What are ConfigMaps and Secrets?
Answer:
ConfigMap – Stores non-sensitive configuration (env variables)
Secret – Stores sensitive data (passwords, tokens)
They help keep configuration separate from application code.

12. How do you store secrets securely in Kubernetes?
Answer:
I use:
Kubernetes Secrets
AWS Secrets Manager (preferred for production)
IAM roles for service accounts (IRSA)
Avoid hardcoding secrets in YAML files.

13. What happens if a pod keeps restarting? How do you debug?
Answer:
I follow these steps:
kubectl get pods
kubectl describe pod <pod-name>
kubectl logs <pod-name>
Check:
Resource limits
Environment variables
Liveness/readiness probes
Image version

14. How do you check logs of a running pod?
Answer:
kubectl logs pod-name
kubectl logs pod-name -c container-name
For previous crashes:
kubectl logs pod-name --previous

15. What are liveness and readiness probes?
Answer:
Liveness probe → Checks if container should be restarted
Readiness probe → Checks if pod can receive traffic
These probes prevent traffic going to unhealthy pods.

16. How do you scale applications in Kubernetes?
Answer:
Manually:
kubectl scale deployment app-name --replicas=5
Automatically:
Horizontal Pod Autoscaler (HPA)
Based on CPU/memory metrics

17. What is self-healing in Kubernetes?
Answer:
If a pod crashes or node fails, Kubernetes:
Automatically restarts the pod
Recreates pods on healthy nodes
Maintains desired replica count
This improves reliability in production.

18. How do rolling updates work in Kubernetes?
Answer:
During deployment:
Old pods are terminated gradually
New pods are created step-by-step
Traffic is shifted only to healthy pods
This ensures zero downtime deployments.

19. How do you expose applications externally in EKS?
Answer:
Using:
Service type LoadBalancer
AWS Application Load Balancer (ALB)
Ingress Controller (optional)

20. What is GitOps and how does it relate to Kubernetes?
Answer:
GitOps means:
Git is the single source of truth
Kubernetes manifests are stored in Git
Tools like Argo CD sync Git state to the cluster
This makes deployments:
Auditable
Repeatable
Easy to roll back

21. How did you use Argo CD with Kubernetes?
Answer:
Stored Kubernetes YAMLs in Git
Argo CD monitored Git repository
Automatically synced changes to EKS
Enabled rollback by reverting Git commits
22. Kubernetes issues you faced in production
Answer:
I faced:
Pods restarting due to memory limits
Image version mismatch
Misconfigured environment variables
Service connectivity issues
I fixed them by adjusting resource limits, correcting configs, and redeploying safely.

23. Difference between Docker and Kubernetes
Answer:
Docker builds and runs containers
Kubernetes manages containers at scale
Docker = packaging
Kubernetes = orchestration

24. Why Kubernetes is important in production?
Answer:
Because it provides:
High availability
Auto-scaling
Self-healing
Zero-downtime deployments
Efficient resource usage
These are critical for business-critical applications.
25. One strong interview closing line
“Kubernetes, especially with EKS, helped us run production workloads reliably with auto-scaling, self-healing, and zero-downtime deployments while reducing operational overhead.”
==========================================================================================
Kubernetes Commands – Complete Guide (Interview + Practical)
🔹 1. Cluster & Context Commands
kubectl version                  → Check Kubernetes client & server version
kubectl cluster-info             → Cluster details (API server, CoreDNS)
kubectl config get-contexts      → List all clusters/contexts
kubectl config use-context context-name  → Switch cluster

kubectl get nodes  → List worker nodes
kubectl describe node node-name   → Node details (CPU, memory, conditions)

🔹 2. Namespace Commands
💡 Always specify namespace in production.

kubectl get namespaces
kubectl get namespaces
kubectl delete namespace dev
kubectl get pods -n namespace-name

🔹 3. Pod Commands (Most Important)

kubectl get pods
kubectl get pods -o wide
kubectl describe pod pod-name
kubectl logs pod-name
kubectl logs pod-name -c container-name
kubectl logs pod-name --previous                  → Logs of crashed container
kubectl exec -it pod-name -- /bin/bash             → Access running container
kubectl delete pod pod-name

get → describe → logs → exec

🔹 4. Deployment Commands
kubectl get deployments
kubectl describe deployment deployment-name
kubectl apply -f deployment.yaml
kubectl delete deployment deployment-name
kubectl rollout status deployment deployment-name
kubectl rollout history deployment deployment-name
kubectl rollout undo deployment deployment-name
kubectl scale deployment deployment-name --replicas=5

🔹 5. Service Commands
kubectl get services
kubectl describe service service-name
kubectl expose deployment app-name --type=LoadBalancer --port=80
kubectl delete service service-name

Service Types:
ClusterIP
NodePort
LoadBalancer

🔹 6. ConfigMap & Secret Commands
kubectl get configmaps
kubectl describe configmap config-name
kubectl create configmap app-config --from-literal=ENV=prod

Secrets
kubectl get secrets
kubectl describe secret secret-name
kubectl create secret generic db-secret \
--from-literal=username=admin \
--from-literal=password=pass123

Never store secrets in Git in plain text.

🔹 7. Resource Monitoring Commands
kubectl top nodes
kubectl top pods
👉 Requires metrics-server

🔹 8. Events & Troubleshooting
kubectl get events
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl describe pod pod-name

→ Shows:
ImagePullBackOff
CrashLoopBackOff
OOMKilled

🔹 9. YAML & Apply Commands
kubectl apply -f file.yaml
kubectl delete -f file.yaml
kubectl get pod pod-name -o yaml
kubectl explain pod
kubectl explain deployment.spec

💡 Interview Tip:
Declarative approach is preferred in production.

🔹 10. Scaling & Autoscaling
kubectl scale deployment app --replicas=3
kubectl autoscale deployment app --min=2 --max=10 --cpu-percent=70
kubectl get hpa

🔹 11. Ingress Commands
kubectl get ingress
kubectl describe ingress ingress-name
kubectl apply -f ingress.yaml

Used for:
Path-based routing
Host-based routing

🔹 12. Job & CronJob Commands
kubectl get jobs
kubectl get cronjobs
kubectl describe job job-name
kubectl delete job job-name

Used for:
Backups
Batch processing
Scheduled tasks

🔹 13. Node & Pod Scheduling
kubectl cordon node-name
kubectl uncordon node-name
kubectl drain node-name
→ Used during maintenance

🔹 14. Context & Security
kubectl auth can-i create pods
kubectl config view
kubectl config current-context

🔹 15. Common Production Debug Commands (Must-Know)
kubectl get all
kubectl get pods --watch
kubectl describe pod pod-name | grep -i error
kubectl logs pod-name | tail -50

🔹 16. Kubernetes Error States (Interview Favorite)
Error	                         Meaning
CrashLoopBackOff	        App crashing
ImagePullBackOff	        Image not found
OOMKilled	                Memory limit exceeded
Pending	                    No resources
ErrImagePull	            Registry issue

🔹 17. One-Line Interview Summary
“I use kubectl to manage deployments, troubleshoot pods, analyze logs, scale applications, and maintain production stability on Kubernetes and EKS.”


===========================================================================================================================================

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


=============================================================================================================================================

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
I used Terraform to provision AWS EKS clusters, EC2 instances, IAM roles, VPCs, subnets, and security groups, ensuring identical infrastructure across dev, staging, and production environments.

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

Terraform uses the state file to determine what resources need to be created, updated, or deleted. Without state, Terraform cannot safely manage infrastructure changes.

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


=================================================================================================
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
Command	Purpose
init	Initialize working directory
plan	Preview changes
apply	Provision infrastructure
destroy	Delete resources
fmt	Format code
validate	Validate configuration
state list	View managed resources
import	Import existing infra
workspace	Manage environments



=====================================================================================================

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

Linux	Unix
Open source	Mostly proprietary
Free	Paid
Widely used in cloud	Limited usage
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