1. Tell me something about yourself (Self-Introduction)
Thank you for giving me this opportunity.
My name is Anil Choudhary, and I am from Indore.
I am a DevOps Engineer with around one year of hands-on experience working on a production-grade Australian e-commerce application through Delta 360 Services.

My primary responsibilities include automating CI/CD pipelines, managing AWS infrastructure, and supporting containerized applications running on Kubernetes.
I have worked extensively with Jenkins, Docker, Terraform, Kubernetes (EKS), Prometheus, Grafana, and Argo CD.

I am actively involved in production monitoring and troubleshooting, and I work closely with development teams to ensure smooth, reliable, and zero-downtime deployments.
My focus has always been on improving reliability, reducing manual effort, and maintaining stable production environments while continuously learning DevOps best practices.

2. What are your roles and responsibilities in your project?
My key responsibilities include designing and maintaining CI/CD pipelines using Jenkins and GitHub Actions, provisioning AWS infrastructure using Terraform, and deploying applications on Kubernetes using EKS.
I configured NGINX ingress, HTTPS, and managed both stateless and stateful workloads, including databases.
I also implemented GitOps-based deployments using Argo CD and monitored production systems using Prometheus and Grafana.
Additionally, I supported production issues such as pod failures, pipeline failures, and performance problems.

3. Walk me through your background and current role at Delta 360 Services
I am currently working as a DevOps Engineer at Delta 360 Services, where I support an Australian e-commerce client.
My role involves CI/CD automation, infrastructure provisioning, Kubernetes management, monitoring, and production support.

4. What kind of client or project have you been working on?
I have been working on a production-grade international e-commerce platform hosted on AWS.
The project requires high availability, scalability, security, and minimal downtime.

5. What environments have you supported?
I have supported development, staging, and production environments.
I am actively involved in production support as well.

6. What was your role in the project lifecycle?
My role covered infrastructure provisioning, CI/CD automation, deployment, monitoring, troubleshooting, and continuous improvement throughout the project lifecycle.

7. How do you analyze logs in Linux?
I usually start with tail -f to monitor logs in real time.
For detailed analysis, I use less, grep, awk, and sed to filter specific errors or patterns.
For system and service logs, I rely on journalctl, which gives complete logs of systemd services.

8. What is the difference between a process and a service?
A process is a running instance of a program, like a Java or Python application started manually or automatically.
A service is a managed background process controlled by the system, usually using systemctl.
Services are designed to start at boot, restart automatically, and run continuously, whereas normal processes may stop once the session ends.

9. What steps will you take if an application is not responding on a server?
First, I check system resources like CPU, memory, and disk to ensure the server is healthy.
Next, I verify whether the application process or service is running using ps or systemctl status.
Then, I analyze application and service logs to identify errors.
I also check network connectivity and whether the required port is listening.
If needed, I restart the service and monitor it closely.
Finally, I coordinate with developers if it’s an application-level issue.

10. As a DevOps Cloud Support Engineer, how do you check CPU and disk usage in Linux?
As a DevOps support engineer, the first thing I check is system health.
For CPU usage, I usually use commands like top, htop, or ps aux --sort=-%cpu to identify high CPU-consuming processes.
For disk usage, I use df -h to check disk space availability and du -sh to identify directories consuming more space.
These commands help me quickly understand whether system resource issues are affecting the application.

11. What parts were handled by developers vs DevOps?
.
Developers handled application code, feature development, and unit testing.
DevOps managed CI/CD pipelines, infrastructure, deployments, monitoring, security, and production reliability.

12. Which tools did you use most frequently and why?
I used Jenkins for CI/CD automation, Docker for containerization, Kubernetes for orchestration, Terraform for infrastructure provisioning, Argo CD for GitOps deployments, and Prometheus and Grafana for monitoring and alerting.

13. Why did you use Argo CD? What did you achieve?
We used Argo CD to implement GitOps.
It allowed us to manage deployments declaratively using Git as the single source of truth.
After implementing Argo CD, deployments became more consistent, automated, and reliable, with easy rollback capabilities.

14. What does production support mean in your role?
Production support means ensuring that live applications remain stable, available, secure, and performant while minimizing downtime and business impact.

15. What is DevOps according to you?
DevOps is a culture and practice that combines development and operations to deliver software faster, reliably, and continuously using automation and collaboration.

16. Why did you choose DevOps as a career?
I chose DevOps because I enjoy automation, problem-solving, and working with cloud technologies.
DevOps plays a critical role in application reliability and scalability, and it offers continuous learning opportunities.

17. How do you check network ports?
I use ss -tulnp, netstat -tulnp, or lsof -i to check open ports and listening services.

18. How do you check errors?
I check application logs, system logs, service logs, and monitoring alerts to identify errors.

19. When do you use awk or sed?
I use awk and sed mainly for log analysis, filtering specific fields, and processing large log files efficiently.

20. How do you troubleshoot a monolithic server (no Kubernetes)?
I check system resources, application processes, logs, service status, network ports, and database connectivity, then restart services if required.

21. How do you identify high CPU-consuming processes?
I use top, htop, and ps aux --sort=-%cpu to identify processes consuming high CPU.

22. Why do we use journalctl?
journalctl provides complete logs of systemd services, which helps in detailed troubleshooting and root-cause analysis.

23. What permissions are required for an application to write logs?
The application needs write permission on the directory or log file, along with proper ownership or group access.

24. Explain the CI/CD pipeline you worked on
Code is pushed to GitHub, which triggers the Jenkins pipeline using webhooks.
The pipeline builds the application, runs tests, creates Docker images, pushes them to a registry, and deploys them to Kubernetes using Argo CD.

25. Which tools are you most confident with?
I am most confident with Jenkins, Docker, Kubernetes, Terraform, AWS, Prometheus, Grafana, and Argo CD.

26. What responsibilities did you have in a live production project?
I handled CI/CD pipelines, deployments, monitoring, incident response, troubleshooting, and ensured production stability.

27. What commands do you use to check Linux server health?
I use top, htop, free -h, df -h, uptime, and vmstat.

28. How do you check average load?
I use uptime or top to check the system load average.

29. How is a system service different from a normal process?
A system service is managed by systemd, runs in the background, and can auto-restart, while a normal process runs independently.

30. Where do you usually check when an application fails on Linux?
I check application logs first, then system logs and service logs.

31. How does code move from GitHub to production?
Code is pushed to GitHub, which triggers the CI pipeline.
The pipeline builds, tests, containerizes the application, and deploys it to Kubernetes using Argo CD.

32. What actions trigger Jenkins pipelines?
Git webhooks, code commits, pull request merges, scheduled jobs, or manual triggers.

33. If a pipeline breaks during deployment, how do you respond?
I analyze pipeline logs, identify the failed stage, roll back if required, fix the issue, and re-run the pipeline.

34. What problems does Docker solve?
Docker solves environment consistency, dependency conflicts, deployment issues, and portability problems.

35. How do you coordinate with developers during deployments?
I coordinate using meetings, Slack communication, deployment windows, and shared monitoring dashboards.

36. What Linux-level issues can cause high CPU or memory usage?
Heavy cron jobs, infinite loops, memory leaks, misconfigured applications, or background scripts.

37. How do you divide a pipeline into stages?
I divide it into checkout, build, test, image build, push, deploy, and verification stages.

38. How do you manage Docker image versions?
I use versioned tags like semantic versioning and avoid using the latest tag in production.

39. Difference between Docker image and container?
A Docker image is a static template, while a container is a running instance of that image.

40. Important Dockerfile instructions?
FROM, RUN, COPY, WORKDIR, CMD, and ENTRYPOINT.

41. How do you keep Docker images lightweight?
By using multi-stage builds, distroless images, and removing unnecessary packages.

42. Container-related issues you faced?
I faced issues like incorrect environment variables, port mismatches, and image size problems, which I fixed by updating Dockerfiles and deployment configs.

43. Describe your project briefly
It was an Australian e-commerce platform deployed on AWS using Jenkins, Docker, Kubernetes, Terraform, Prometheus, Grafana, and Argo CD.

44. What motivated you to focus on DevOps and AWS?
My interest in automation, cloud infrastructure, and scalable systems motivated me to choose DevOps and AWS.

45. What DevOps role are you targeting next?
I am targeting a mid-level DevOps Engineer role with deeper cloud and Kubernetes responsibilities.

46. Where do you look first when an application fails?
I first check application logs, then service status and system metrics.

47. How does Kubernetes help avoid downtime?
Kubernetes provides auto-healing, rolling updates, scaling, and load balancing.

48. What advantages did EKS give over EC2 containers?
Managed control plane, high availability, better security, and easier scaling.

49. Why Terraform for infrastructure provisioning?
Terraform provides Infrastructure as Code, version control, repeatability, and automation.

50. How do you store and protect Terraform state?
Using S3 with versioning and DynamoDB for state locking.

51. What role does Grafana play?
Grafana provides visualization, dashboards, and alerting for system observability.

52. What metrics indicate an unhealthy application?
High latency, error rates, CPU/memory spikes, pod restarts, and failed health checks.

53. Pods keep restarting – how do you debug?
I use kubectl describe pod, kubectl logs, check probes, resource limits, and configuration issues.