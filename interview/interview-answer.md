1. Tell me something about yourself (Self-Introduction)
 
   Thank you for giving me this opportunity.
   My name is Anil Choudhary, and I am from Indore.
   I am a DevOps Engineer with around one year of hands-on experience working on a production-grade Australian e-commerce application through Delta 360 Services.

   My primary responsibilities include automating CI/CD pipelines, managing AWS infrastructure, and supporting containerized applications running on Kubernetes.
   I have worked extensively with Jenkins, Docker, Terraform, Kubernetes (EKS), Prometheus, Grafana, and Argo CD.

  I am actively involved in production monitoring and troubleshooting, and I work closely with development teams to ensure smooth, reliable, and minimal-downtime deployments.
  My focus has always been on improving reliability, reducing manual effort, and maintaining stable production environments while continuously learning DevOps best practices.

2. What are your roles and responsibilities in your project?
  My key responsibilities include designing and maintaining CI/CD pipelines using Jenkins and GitHub Actions, provisioning AWS infrastructure using Terraform, and deploying applications on Kubernetes using EKS.
  I configured NGINX ingress, HTTPS, and managed both stateless and stateful workloads, including databases.
  I also implemented GitOps-based deployments using Argo CD and monitored production systems using Prometheus and Grafana.
  Additionally, I supported production issues such as pod failures, pipeline failures, and performance problems.

3. Walk me through your background and current role at Delta 360 Services.

   I have recently worked  as a DevOps Engineer at Delta 360 Services, where I support an Australian e-commerce client.
   My role involves CI/CD automation, infrastructure provisioning, Kubernetes management, monitoring, and production support.

4. What kind of client or project have you been working on?
   I have been working on a production-grade international e-commerce platform hosted on AWS.
   The project requires high availability, scalability, security, and minimal downtime.

5. What environments have you supported?
  I have supported development, staging, and production environments.
  I am actively involved in production support as well.

6. What was your role in the project lifecycle?
   My  role covered infrastructure provisioning, CI/CD automation, deployment, monitoring, troubleshooting, and continuous improvement throughout the project lifecycle.

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
ss-itulnp(socket statistics,tcp,udp,listening ports only,show port number,processname and PID),Quick port check
lsof- lists which process is using which network port. Best for conflicts
kill -9 <PID>

18. How do you check errors?
I check application logs, system logs, service logs, and monitoring alerts to identify errors.

19. When do you use awk or sed?
I use awk and sed mainly for log analysis, filtering specific fields, and processing large log files efficiently.
awk=>	Data extraction, reporting, column-based processing
Use awk when you need to work with fields/columns, perform logic, or generate reports.

sed=>	Search, replace, edit text (line-based editing)
Use sed when you need to edit text, replace strings, or modify files line by line.

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

Check CPU usage & load-top,Check load average-uptime
top and uptime

Check memory usage-free -h
Check memory usage in detail-vmstat 1 5
free -h, ymstate 1 5

Disk usage=>df -h
Directory-level usage =>du -sh /var/log/*
df -h, du -sh /var/log/*

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

54. Difference between top and htop command
top is a basic command-line utility that shows real-time system processes, CPU, memory, and load. It’s available by default on most Linux systems.
htop is an enhanced, interactive version. It provides a user-friendly UI, color-coded metrics, easier process navigation, and allows actions like killing processes using keyboard shortcuts. htop is not installed by default.

55. Application not responding but server is reachable. How do you check it?
First, I verify server reachability using ping or ssh.
Then I check:
Application process status (ps, systemctl status)
Application port availability (netstat, ss, lsof)
Application logs
CPU and memory usage (top, htop)
Disk space (df -h)
If needed, I restart the application after identifying the root cause.

56. How do you check application logs in Linux?
Logs are usually stored under /var/log.
I use:
tail -f logfile
less logfile

cat logfile
For system services:
journalctl -u service-name

57. What permissions are required to write logs in a directory?
The application user must have write (w) and execute (x) permission on the directory.
Typically permission would be:
Directory: 755 or 775
Log file: 644 or 664

58. How do you check which ports are open?
I use:
netstat -tulnp
ss -tulnp
lsof -i :port
nmap for remote servers

59. Walk me through your background and how you moved towards DevOps
I started my career as a android developer and after that python developer where I worked on application development and deployments. Over time, I became involved in build automation, deployments, and environment management. That exposure made me interested in CI/CD, cloud infrastructure, and automation, which led me to transition into a DevOps role.

60. What motivated you to move from python to DevOps?
I wanted to work on the end-to-end lifecycle of applications. DevOps allows me to automate builds, deployments, monitoring, and scaling, which has a direct impact on system reliability and delivery speed.

61. What kind of applications were at Delta 360 Services?
We mainly worked on enterprise web applications and microservices, built using devops tools like Jenkins and deployed on cloud infrastructure with Docker and Kubernetes.

62. What part of DevOps did you enjoy the most?
I enjoyed CI/CD automation and cloud infrastructure management, especially building pipelines that improve deployment speed and reliability.

63. How do you check logs of failing applications or pods?
For Kubernetes:
kubectl logs pod-name
kubectl logs pod-name -c container-name
kubectl describe pod pod-name
Also, I check events and monitoring dashboards.

64. Where do you store AWS credentials in Jenkins?
AWS credentials are stored in Jenkins Credentials Manager as:
Access Key & Secret Key
or
IAM role (preferred for security)

65. How do you reduce Docker image size?
Use lightweight base images like alpine
Multi-stage builds
Remove unnecessary files
Combine RUN commands
Use .dockerignore

66. What was your ownership in CI/CD and infrastructure?
I owned:
CI/CD pipeline creation and maintenance
Jenkins configuration
Docker image builds
Kubernetes deployments
AWS infrastructure automation

67. How do you check logs for a failing application or container?
there are different ways to check the logs first is the GUI based and second is command based but some tools not provide the GUI like the k8s

For Docker:
docker logs container-id
docker inspect container-id

For Kubernetes:
kubectl logs
kubectl describe

68. How did you handle Docker versioning?
We used semantic versioning and tagged images with:
Application version
Git commit ID
Environment tags (dev, stage, prod)

69. SonarQube integration in pipeline – how do you do it?
I integrated SonarQube in Jenkins using:
Sonar Scanner plugin
Configured Sonar server and tokens
Added Sonar scan stage in pipeline
Enforced Quality Gate checks

70. What happens if SonarQube quality gate fails?
The pipeline fails immediately and deployment is stopped, ensuring poor-quality or vulnerable code does not reach production.

71. Why did you add Trivy scanning before deployment?
Trivy helps detect security vulnerabilities in Docker images and dependencies before deployment, improving application security and compliance.

72. Difference between Docker image and running container
A Docker image is a static template.
A container is a running instance of an image.

73. Docker issues faced in production
yes there i many times I faced the issues like the:
1. High image size
2. Container crashes due to memory limits
3. Image version mismatch
4. Disk space issues on nodes

74. Tell me about your transition from software to DevOps
I started my career as a android developer and after that python developer where I worked on application development and deployments. Over time, I became involved in build automation, deployments, and environment management. That exposure made me interested in CI/CD, cloud infrastructure, and automation, which led me to transition into a DevOps role.

I wanted to work on the end-to-end lifecycle of applications. DevOps allows me to automate builds, deployments, monitoring, and scaling, which has a direct impact on system reliability and delivery speed.

I gradually moved by handling deployments, automating builds, learning cloud platforms, and eventually taking ownership of infrastructure and CI/CD pipelines.

75. Which DevOps tools are you confident in and why?
Jenkins – CI/CD
Docker – containerization
Kubernetes – orchestration
AWS – cloud infrastructure

76. Why do we containerize applications? (Example)
Containerization ensures:
Consistency across environments
Faster deployments
No environment issues
Scalability
Reliability
Example: A Java app runs the same in development, testing, and production using Docker.

77. What does production readiness mean?
Production readiness means the application is:
Secure
Scalable
Monitored
Properly logged
Backed up
Has rollback and disaster recovery plans

“During my Python internship, 
I worked on integrating multiple APIs for a chatbot application. 
My role involved consuming REST APIs, 
handling requests and responses, 
implementing error handling, and 
ensuring reliable communication between the chatbot and external services using Python.”
