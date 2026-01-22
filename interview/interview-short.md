1. How do you check CPU, memory, and disk usage in Linux?

CPU

top, htop, btop

mpstat

ps aux --sort=-%cpu

Memory

free -h

vmstat

top

Disk

df -h (disk space)

du -sh /path (directory usage)

lsblk

2. Application is not responding on a server. What steps will you take?

Structured Troubleshooting Approach:

Check server health

CPU, memory, disk (top, free -h, df -h)

Check application process

ps aux | grep app

systemctl status service

Check logs

Application logs

journalctl -u service

Check network & ports

ss -tulnp

curl localhost:port

Check dependencies

Database, cache, APIs

Restart service (if needed)

Monitor after fix

3. Difference between process and service
Process	Service
Running instance of a program	Managed background process
Started manually or automatically	Managed by systemd
Ends when user exits	Auto-restart possible
Example: Java process	Example: Jenkins, Docker
4. How do you analyze logs in Linux?

tail -f logfile

less logfile

grep ERROR logfile

awk, sed for filtering

journalctl -u service

5. Self-Introduction (Confident & Professional)

Thank you for giving me this opportunity.
My name is Anil Choudhary, and I am from Indore.
I am a DevOps Engineer with around 1 year of hands-on experience working on a production-grade Australian e-commerce application through Delta 360 Services.

My primary responsibilities include automating CI/CD pipelines, managing AWS infrastructure, and supporting containerized applications running on Kubernetes (EKS). I have worked extensively with Jenkins, Docker, Terraform, and Argo CD.

I am actively involved in monitoring and troubleshooting production issues using Prometheus and Grafana, and I collaborate closely with developers to ensure smooth, reliable, and zero-downtime deployments.

Overall, my focus has been on improving deployment reliability, reducing manual effort, and maintaining a stable production environment, while continuously learning DevOps best practices.

Thank you.

6. Roles & Responsibilities (Project)

Designed & maintained CI/CD pipelines using Jenkins & GitHub Actions

Provisioned AWS infrastructure using Terraform (IaC)

Deployed applications on Kubernetes (EKS)

Configured NGINX Ingress, HTTPS, SSL

Managed stateless & stateful workloads (including databases)

Implemented GitOps using Argo CD

Monitoring & alerting using Prometheus & Grafana

Production issue support (pods, pipelines, performance)

7. Walk me through your background & project

Company: Delta 360 Services

Client: Australian e-commerce

Environment: Production, Staging

Role: DevOps Engineer

Responsibility: CI/CD, Infra, Kubernetes, Monitoring, Production Support

8. What kind of project/client?

International e-commerce platform

High availability & zero-downtime requirements

AWS-hosted production system

9. What environments did you support?

Development

Staging

Production (active support)

10. Role in project lifecycle

Infrastructure provisioning

CI/CD automation

Deployment & monitoring

Production support & optimization

11. Developer vs DevOps responsibilities

Developers

Code

Unit testing

Bug fixes

DevOps

CI/CD

Infrastructure

Deployments

Monitoring

Security

Reliability

12. Tools you used most & why?

Jenkins – CI/CD automation

Docker – containerization

Kubernetes (EKS) – orchestration & scalability

Terraform – infrastructure as code

Argo CD – GitOps deployments

Prometheus & Grafana – monitoring

13. Why Argo CD? Objective & outcome

Why

GitOps approach

Declarative deployments

Auto-sync & rollback

Outcome

Faster deployments

Reduced human errors

Better visibility & consistency

14. What is production support?

Ensuring that live applications:

Remain stable

Are highly available

Are secure

Perform well

Minimal downtime & business impact

15. What is DevOps?

DevOps is a culture and practice that combines development and operations to deliver software faster, reliably, and continuously using automation.

16. Why DevOps as a career?

Automation mindset

Cloud & scalability

High demand

Continuous learning

Impact on business reliability

17. Check network ports

ss -tulnp

netstat -tulnp

lsof -i :port

18. How do you check errors?

Application logs

System logs

journalctl

Monitoring alerts

19. When do you use awk or sed?

Log filtering

Parsing structured text

Extracting fields

20. Monolithic server troubleshooting

Check CPU, memory, disk

Check application logs

Restart services

Check ports

Database connectivity

21. Identify high CPU process

top

htop

ps aux --sort=-%cpu

22. Why use journalctl?

Complete logs of systemd services

Persistent logs

Easy filtering by time & service

23. Permissions required to write logs

Write permission on directory

Proper ownership or group access

24. CI/CD pipeline explanation

Code pushed to GitHub

Jenkins pipeline triggered

Build & test

Docker image creation

Push to registry

Deploy via Kubernetes / Argo CD

25. Jenkins pipeline triggers

Git webhook

PR merge

Scheduled builds

Manual trigger

26. Pipeline failure handling

Check logs

Identify stage failure

Rollback if required

Coordinate with developers

Fix & re-run

27. What problems does Docker solve?

Environment consistency

Dependency isolation

Faster deployments

Portability

28. How do you coordinate with developers?

Slack / meetings

Deployment windows

Rollback planning

Log sharing

29. Linux issues causing high CPU/memory

Infinite loops

Heavy cron jobs

Memory leaks

Misconfigured services

30. How do you divide a pipeline into stages?

Checkout

Build

Test

Image build

Push

Deploy

Verify

31. Docker image vs container
Image	Container
Blueprint	Running instance
Static	Dynamic
Read-only	Read-write
32. Important Dockerfile instructions

FROM

RUN

COPY

WORKDIR

CMD / ENTRYPOINT

33. Lightweight & prod-ready images

Multi-stage builds

Distroless images

Remove unused packages

34. Kubernetes benefits for uptime

Auto-healing

Rolling updates

Load balancing

Scaling

35. EKS vs EC2 containers

Managed control plane

High availability

Easier scaling

Better security

36. Why Terraform?

Infrastructure as Code

Version control

Reproducibility

Automation

37. Terraform state protection

S3 backend

Versioning

DynamoDB locking

Restricted access

38. Grafana role

Visualization

Dashboards

Alerting

Observability

39. Metrics indicating unhealthy app

High latency

Error rate

Pod restarts

CPU/memory spikes

40. Pods restarting continuously – debugging

kubectl describe pod

kubectl logs

Check probes

Check resources

Fix config & redeploy