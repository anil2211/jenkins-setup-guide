🔥 JENKINS INTERVIEW QUESTIONS & ANSWERS

(Beginner to Advanced – DevOps Role)

🟢 BASIC LEVEL (FOUNDATION)
1. What is Jenkins?
Answer:
Jenkins is an open-source CI/CD automation tool used to automate building, testing, and deploying applications.

2. What does CI/CD mean?
Answer:
CI (Continuous Integration): Automatically building and testing code whenever changes are pushed
CD (Continuous Deployment/Delivery): Automatically deploying tested code to servers

3. Why do we use Jenkins?
Answer:
Automates repetitive tasks
Detects bugs early
Faster releases
Supports DevOps culture
Integrates with Git, Docker, AWS, Kubernetes

4. Is Jenkins free?
Answer:
Yes, Jenkins is open-source and free.

5. Which language is Jenkins written in?
Answer:
Jenkins is written in Java.

6. On which port Jenkins runs by default?
Answer:
Port 8080

7. What are Jenkins jobs?
Answer:
A Jenkins job is a task or project that Jenkins executes, such as build, test, or deploy.

8. Types of Jenkins jobs?
Answer:
Freestyle Project
Pipeline
Multibranch Pipeline
Folder
External Job

9. What is a Freestyle job?
Answer:
A traditional Jenkins job where configuration is done through the UI.

10. What is Jenkins pipeline?
Answer:
A Jenkins pipeline is a code-based way to define CI/CD steps using a Jenkinsfile.

🟡 INTERMEDIATE LEVEL (CORE DEVOPS SKILLS)

11. What is Jenkinsfile?
Answer:
A Jenkinsfile is a file that contains pipeline code written in Groovy and stored in Git.
📌 Benefits:
Version controlled
Reusable
Auditable

12. Declarative vs Scripted Pipeline?
Answer:
Declarative	Scripted
Simple syntax	Complex
Less flexible	Highly flexible
Recommended	Advanced use

13. Sample Declarative Pipeline?
pipeline {
  agent any
  stages {
    stage('Build') {
      steps { echo 'Building...' }
    }
  }
}

14. What is Jenkins architecture?
Answer:
Jenkins uses a Master–Agent (Controller–Agent) architecture.

15. What is Jenkins Master?
Answer:
The master:
Manages jobs
Schedules builds
Stores configuration

16. What is Jenkins Agent?
Answer:
Agents execute build tasks sent by the master.

17. Why use Jenkins agents?
Answer:
Load distribution
Scalability
Different OS builds
Faster execution

18. What is executor in Jenkins?
Answer:
An executor is a slot that runs a build on a node.

19. How do you trigger Jenkins jobs?
Answer:
Manual
GitHub Webhook
Poll SCM
Cron schedule

20. What is Poll SCM?
Answer:
Jenkins periodically checks Git for changes.
H/5 * * * *

🟠 ADVANCED LEVEL (DEVOPS INTERVIEW FOCUS)
21. How Jenkins integrates with Git?
Answer:
Using:
Git plugin
Webhooks
Jenkinsfile in repo

22. What are Jenkins plugins?
Answer:
Plugins extend Jenkins functionality.
Examples:
Git
Docker
Kubernetes
AWS Credentials
Blue Ocean

23. How do you secure Jenkins?
Answer:
Enable authentication
Role-based access control
Use credentials store
Disable anonymous access
HTTPS

24. Where Jenkins stores data?
Answer:
/var/lib/jenkins

25. How to backup Jenkins?
Answer:
Backup:
/var/lib/jenkins
Jobs
Plugins
Credentials

26. How Jenkins integrates with Docker?
Answer:
Build Docker images
Run containers
Push images to DockerHub
Use Docker agents

27. Docker pipeline example?
stage('Docker Build') {
  steps {
    sh 'docker build -t myapp .'
  }
}

28. Jenkins + Kubernetes integration?
Answer:
Jenkins runs in K8s
Dynamic agents via Kubernetes plugin
Deploy apps using kubectl/Helm

29. What is Blue Ocean?
Answer:
A modern Jenkins UI for visualizing pipelines.

30. What is Multibranch Pipeline?
Answer:
Automatically creates pipelines for each Git branch.

🔴 REAL-WORLD / SCENARIO-BASED QUESTIONS
31. How do you deploy to AWS using Jenkins?
Answer:
Create IAM user
Store AWS credentials in Jenkins
Use AWS CLI / SSH
Deploy to EC2 / S3 / EKS

32. How Jenkins handles credentials?
Answer:
Using Credentials Manager:
Username/password
SSH keys
AWS keys
Tokens

33. How do you restrict job access?
Answer:
Using:
Role-based Authorization Strategy
Folder-based permissions

34. How to handle failures in Jenkins pipeline?
Answer:
Post blocks
Notifications
Retry logic

post {
  failure {
    mail to: 'team@company.com'
  }
}

35. What is parallel execution?
Answer:
Running multiple stages at the same time.
parallel {
  stage('Test') { steps { sh 'npm test' } }
  stage('Lint') { steps { sh 'npm lint' } }
}

36. How Jenkins supports DevOps?
Answer:
CI/CD automation
Infrastructure integration
Monitoring support
Faster feedback loops

37. Jenkins vs GitHub Actions?
Answer:
Jenkins: Highly customizable, self-hosted
GitHub Actions: Cloud-native, simpler

38. Jenkins common issues?
Answer:
Java version mismatch
Permission denied
Plugin conflicts
Disk space issues

39. How to scale Jenkins?
Answer:
Add agents
Use Kubernetes dynamic agents
Separate master & builds

40. Jenkins production best practices?
Answer:
Use agents
Backup regularly
Minimal plugins
Secure credentials
Monitor performance