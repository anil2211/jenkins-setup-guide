# Jenkins Complete Learning Guide (Beginner to Advanced)

This guide is designed for **absolute beginners** and gradually moves you to **advanced Jenkins usage with real-world projects and working code**.

---

## 1. Introduction to Jenkins

### What is Jenkins?

Jenkins is an **open-source automation server** used to automate:

* Building applications
* Testing code
* Deploying software

This automation process is called **CI/CD (Continuous Integration / Continuous Deployment)**.

### Why Jenkins is Important?

* Automates repetitive tasks
* Detects bugs early
* Speeds up delivery
* Industry standard CI/CD tool

### Common Use Cases

* Build & test applications automatically
* Deploy apps to AWS, Docker, Kubernetes
* Run scheduled jobs

### Jenkins UI Overview

* **Dashboard**: List of jobs
* **New Item**: Create jobs
* **Manage Jenkins**: Configure system, plugins, users
* **Build History**: Job runs

### What is a Pipeline?

A pipeline defines **steps to build, test, and deploy code** written as code (Pipeline as Code).

---

## 2. Setting Up Jenkins

### System Requirements

* Java 11 or 17
* 2 GB RAM (minimum)
* Linux / Windows / macOS

---

### Jenkins Installation

#### Linux (Ubuntu)

```bash
sudo apt update
sudo apt install openjdk-17-jdk -y
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
sudo systemctl start jenkins
```

Access Jenkins:

```
http://<server-ip>:8080
```

#### Windows / macOS

* Download from [https://www.jenkins.io/download/](https://www.jenkins.io/download/)
* Install like normal software

### Post Installation

* Unlock Jenkins
* Install **Suggested Plugins**
* Create Admin User

---

## 3. Jenkins Architecture

### Components

* **Jenkins Master**: Controls jobs
* **Agent (Slave)**: Executes jobs
* **Executor**: Runs builds
* **Job**: Task definition

### Flow

Code → Jenkins → Agent → Build → Test → Deploy

---

## 4. Creating Your First Jenkins Job (Freestyle)

### Steps

1. New Item → Freestyle Project
2. Source Code Management → Git
3. Add Repository URL
4. Build Step → Execute Shell

```bash
echo "Hello Jenkins"
```

5. Save → Build Now

---

## 5. Pipeline as Code

### Declarative vs Scripted

| Declarative | Scripted |
| ----------- | -------- |
| Easy        | Flexible |
| Recommended | Advanced |

### Simple Declarative Pipeline

```groovy
pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building...'
      }
    }
    stage('Test') {
      steps {
        echo 'Testing...'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying...'
      }
    }
  }
}
```

---

## 6. Jenkins + AWS Integration

### IAM Setup

* Create IAM User
* Attach policies: EC2FullAccess, S3FullAccess
* Generate Access Keys

### Store Credentials in Jenkins

Manage Jenkins → Credentials → Add AWS keys

### Deploy to EC2 Example

```groovy
stage('Deploy') {
  steps {
    sh '''
    ssh ubuntu@EC2-IP "docker run -d nginx"
    '''
  }
}
```

### Upload to S3

```bash
aws s3 cp index.html s3://my-bucket/
```

---

## 7. Advanced Jenkins Features

### Jenkinsfile

Stored inside repo

```groovy
pipeline {
  agent any
  stages {
    stage('Build') {
      steps { sh 'mvn clean install' }
    }
  }
}
```

### Essential Plugins

* Git
* Pipeline
* Docker
* AWS
* Blue Ocean

### Triggers

* GitHub Webhook
* Poll SCM
* Cron Schedule

```bash
H/5 * * * *
```

### Parallel Stages

```groovy
parallel {
  stage('Unit Test') { steps { sh 'npm test' }}
  stage('Lint') { steps { sh 'npm run lint' }}
}
```

### Master-Agent Setup

* Add node
* SSH-based agent

---

## 8. Monitoring & Maintenance

### Monitoring

* Jenkins logs
* Disk usage plugin
* Prometheus + Grafana

### Backup

Backup:

```
/var/lib/jenkins
```

---

## 9. Learning Resources

### Free Resources

* Jenkins Docs
* Jenkins YouTube Channel
* GitHub Jenkinsfile examples

---

## 10. Assessment

### Beginner Quiz

1. What is CI/CD?
2. Difference between job and pipeline?

### Practical Task

* Create Jenkins pipeline with 3 stages

---

## 11. Real-World Projects

### Project 1: CI Pipeline

* Git + Maven + Jenkins

### Project 2: Docker Deployment

* Build Docker image
* Push to DockerHub

### Project 3: AWS EC2 Deployment

* Jenkins → EC2

### Common Issues

* Port 8080 blocked
* Java version mismatch
* Permission denied on agent

---

## Final Goal

After completing this guide, you will be **job-ready for Jenkins & CI/CD roles**.


#########################################################################################################################################################



# Jenkins Complete Learning Guide (Beginner to Advanced)

This guide is designed for **absolute beginners** and systematically takes you to an **advanced, real-world Jenkins level**. By the end, you will be able to design, build, secure, and maintain **production-grade CI/CD pipelines** used in real companies.

---

## 1. Introduction to Jenkins

### What is Jenkins?

Jenkins is an **open-source automation server** written in Java. It is primarily used to automate the software development lifecycle, including:

* **Building applications** (compile code, package artifacts)
* **Testing code** (unit, integration, regression tests)
* **Deploying software** (to servers, cloud, containers, Kubernetes)

This automated workflow is known as **CI/CD (Continuous Integration and Continuous Deployment/Delivery)**.

---

### Why Jenkins is Important in the IT Industry?

Modern software development demands **speed, reliability, and consistency**. Jenkins enables this by:

* Eliminating manual build and deployment steps
* Detecting bugs early through automated testing
* Enforcing consistent build standards
* Supporting DevOps and Agile practices
* Integrating with almost every DevOps tool

Jenkins is widely used by **startups, enterprises, and cloud-native companies**, making it a critical skill for DevOps engineers.

---

### Common Real-World Use Cases

* Automatically build and test code on every Git commit
* Deploy applications to **AWS EC2, S3, EKS**
* Build and push **Docker images**
* Deploy applications to **Kubernetes clusters**
* Run scheduled jobs (cron-based automation)
* Infrastructure automation pipelines

---

### Jenkins User Interface Overview

After logging into Jenkins, you will see:

* **Dashboard** – Displays all jobs and pipelines
* **New Item** – Create Freestyle, Pipeline, Multibranch jobs
* **Build History** – Shows previous build executions
* **Manage Jenkins** – Core configuration section:

  * Plugins
  * Nodes & Clouds
  * Credentials
  * Security & Users

Understanding the UI is essential before building pipelines.

---

### What is a Jenkins Pipeline?

A **Jenkins Pipeline** is a set of automated steps written as code that defines:

* How code is built
* How tests are executed
* How applications are deployed

Pipelines are written in **Groovy** and stored in a file called **Jenkinsfile**, enabling:

* Version control
* Code review
* Reproducible builds

---

## 2. Setting Up Jenkins

### System Requirements

Minimum requirements:

* Java **11 or 17** (mandatory)
* 2 GB RAM (4 GB recommended)
* 10 GB disk space
* Linux / Windows / macOS

Recommended for production:

* Linux (Ubuntu / Amazon Linux)
* Dedicated VM or EC2 instance

---

### Jenkins Installation

#### Jenkins Installation on Linux (Ubuntu)

```bash
sudo apt update
sudo apt install openjdk-17-jdk -y
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
```

Access Jenkins:

```
http://<server-ip>:8080
```

---

#### Jenkins Installation on Windows / macOS

* Download installer from: [https://www.jenkins.io/download/](https://www.jenkins.io/download/)
* Install as a normal application
* Jenkins runs as a background service

---

### Post-Installation Configuration

1. Unlock Jenkins using initial admin password
2. Install **Suggested Plugins**
3. Create Admin User
4. Configure:

   * System settings
   * Email notifications
   * Tool installations (Git, Maven, JDK)

---

## 3. Jenkins Architecture

### Core Components Explained

* **Jenkins Controller (Master)**

  * Manages jobs, pipelines, users
  * Schedules builds

* **Jenkins Agent (Slave)**

  * Executes build tasks
  * Can run on remote machines

* **Executor**

  * A slot that runs a build

* **Job / Pipeline**

  * Defines what Jenkins should execute

---

### Execution Flow

```
Developer → Git Commit
          → Jenkins Controller
          → Agent
          → Build → Test → Deploy
```

This distributed model allows Jenkins to scale efficiently.

---

## 4. Creating Your First Jenkins Job (Freestyle Project)

### Step-by-Step

1. Click **New Item**
2. Enter Job Name → Select **Freestyle Project**
3. Configure Source Code Management (Git)
4. Add Build Step → Execute Shell

```bash
echo "Hello Jenkins – First Job"
```

5. Save → Click **Build Now**

You have successfully created your first Jenkins job.

---

## 5. Pipeline as Code (Core Jenkins Skill)

### Declarative vs Scripted Pipelines

| Feature        | Declarative    | Scripted       |
| -------------- | -------------- | -------------- |
| Syntax         | Simple         | Complex        |
| Use Case       | Most pipelines | Advanced logic |
| Recommendation | ✅ Yes          | ⚠ Advanced     |

---

### Simple Declarative Pipeline Example

```groovy
pipeline {
  agent any
  stages {
    stage('Build') {
      steps { echo 'Building application' }
    }
    stage('Test') {
      steps { echo 'Running tests' }
    }
    stage('Deploy') {
      steps { echo 'Deploying application' }
    }
  }
}
```

---

## 6. Jenkins + AWS Integration

### AWS IAM Setup

1. Create IAM User
2. Attach policies:

   * AmazonEC2FullAccess
   * AmazonS3FullAccess
3. Generate Access Key & Secret Key

---

### Store AWS Credentials in Jenkins

* Manage Jenkins → Credentials → Global
* Add **AWS Credentials**

---

### Deploy Application to EC2 (Example)

```groovy
stage('Deploy') {
  steps {
    sh '''
    ssh ubuntu@EC2_IP "docker run -d -p 80:80 nginx"
    '''
  }
}
```

---

### Upload Artifacts to S3

```bash
aws s3 cp target/app.jar s3://my-bucket/app.jar
```

---

## 7. Advanced Jenkins Features

### Jenkinsfile (Production Standard)

A Jenkinsfile is stored in Git alongside application code.

```groovy
pipeline {
  agent any
  stages {
    stage('Build') { steps { sh 'mvn clean install' } }
    stage('Test') { steps { sh 'mvn test' } }
  }
}
```

---

### Essential Jenkins Plugins

* Git & GitHub Integration
* Pipeline
* Docker & Docker Pipeline
* Kubernetes
* AWS Credentials
* Blue Ocean
* Prometheus Metrics

---

### Build Triggers

* GitHub Webhooks
* Poll SCM
* Cron-based schedules

```bash
H/5 * * * *
```

---

### Parallel Pipeline Execution

```groovy
parallel {
  stage('Unit Tests') { steps { sh 'npm test' } }
  stage('Lint') { steps { sh 'npm run lint' } }
}
```

---

### Jenkins Master–Agent Setup

* Configure agents using SSH
* Run builds on separate machines
* Improves performance & scalability

---

## 8. Monitoring, Security & Maintenance

### Monitoring Jenkins

* Jenkins system logs
* Prometheus + Grafana
* Disk Usage plugin

---

### Backup & Recovery

Critical directory:

```
/var/lib/jenkins
```

Backup includes:

* Jobs
* Credentials
* Plugins

---

## 9. Learning Resources

### Free Learning Resources

* Official Jenkins Documentation
* Jenkins YouTube Channel
* GitHub Jenkinsfile repositories
* Jenkins Community Forums

---

## 10. Assessment & Practice

### Beginner Quiz

1. What is CI/CD?
2. Jenkins job vs pipeline?
3. What is Jenkinsfile?

### Practical Assignment

* Create a 3-stage Jenkins pipeline
* Integrate Git repository

---

## 11. Real-World Projects (Industry Style)

### Project 1: CI Pipeline

* Git + Maven + Jenkins
* Automated build & test

### Project 2: Docker CI/CD

* Build Docker image
* Push to DockerHub

### Project 3: AWS Deployment

* Jenkins → EC2 → Docker

---

### Common Jenkins Issues & Fixes

* Jenkins not starting → Java version mismatch
* Port 8080 blocked → Security Group issue
* Permission denied → Incorrect user permissions

---

## Final Outcome

After completing this guide, you will be:

* Confident with Jenkins fundamentals
* Able to write real CI/CD pipelines
* Capable of handling Jenkins in production
* **Job-ready for DevOps / CI-CD roles**
