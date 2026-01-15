# jenkins-setup-guide
In this project, Jenkins is configured with both freestyle jobs and Jenkins Pipeline to implement continuous integration and continuous deployment (CI/CD).


🔁 CI/CD Automation Tools Overview
Popular CI/CD Tools

GitLab CI/CD

GitHub Actions

Jenkins

Bitbucket Pipelines

Azure DevOps Pipelines

AWS CodePipeline

👉 Learning Path

GitLab

GitHub Actions

Jenkins (Main Focus)

🔧 What is Jenkins?

Open-source (free) CI/CD automation tool

Written in Java

Used for:

Continuous Integration (CI)

Continuous Deployment / Delivery (CD)

🔄 CI/CD Concepts
Continuous Integration (CI)

Developers frequently commit code to a shared repository (GitHub)

Jenkins automatically:

Pulls code

Builds it

Runs tests

Continuous Deployment (CD)

After successful build & tests:

Application is automatically deployed to servers

📌 High-Level CI/CD Flow
Developer
   |
   | (Code Commit)
   v
GitHub Repository
   |
   v
Jenkins
   |
   |--> Build
   |--> Test
   |--> Deploy
   |
   |--> Logs
   |--> Notifications
   |--> Email Alerts

🧱 Key Jenkins Components
1️⃣ Jenkins Controller (Master)

Central server

Manages:

Jobs

Pipelines

Plugins

Credentials

Agents

2️⃣ Jenkins Agents (Nodes / Slaves)

Execute jobs

Used for:

Distributed builds

Scaling

Multiple environments (Linux, Windows, Docker)

3️⃣ Plugins

Extend Jenkins functionality

Examples:

Git

GitHub

Pipeline

Email Extension

Docker

4️⃣ Credential Manager

Securely stores:

GitHub tokens

SSH keys

Passwords

Cloud credentials

5️⃣ Pipelines

CI/CD defined as code

Written in Groovy

Stored as a Jenkinsfile

📄 Jenkinsfile (Pipeline as Code)

Written in Groovy

Two types:

Declarative

Scripted

Example:

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

☁️ Jenkins Setup on AWS (EC2)
Step 1️⃣ Launch EC2 Instance

OS: Ubuntu

Instance Type: t2.micro (Free Tier)

Create & download PEM key

Step 2️⃣ Set PEM Key Permission (Local)
chmod 400 jenkins-training.pem

Step 3️⃣ Login to EC2
ssh -i "jenkins-training.pem" ubuntu@<EC2-PUBLIC-IP>

⚙️ Jenkins Installation (Official LTS)
Step 4️⃣ Update System
sudo apt update

Step 5️⃣ Install Java
sudo apt install fontconfig openjdk-21-jre
java -version

Step 6️⃣ Add Jenkins Repository
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

Step 7️⃣ Install Jenkins
sudo apt update
sudo apt install jenkins

Step 8️⃣ Start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

Step 9️⃣ Get Initial Admin Password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

🌐 Jenkins UI Access
Step 🔟 Open Port 8080 (AWS Security Group)

Inbound Rule:

Port: 8080

Source: Your IP / 0.0.0.0/0 (training only)

Step 1️⃣1️⃣ Access Jenkins
http://<EC2-PUBLIC-IP>:8080
***********************************************************************************************************************
📘 Session notes-app project
🔧 EC2 Preparation – Docker Installation
sudo apt update
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker

Allow Jenkins to Use Docker
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins


✔ Allows Jenkins to run Docker commands without sudo

🧩 Jenkins Job Types

1️⃣ Freestyle Project

Simple shell-based jobs

2️⃣ Pipeline

CI/CD as code (Jenkinsfile)

Declarative / Scripted

3️⃣ Multi-Configuration (Matrix)

Runs across multiple environments

4️⃣ Folder

Organizes jobs

5️⃣ Multibranch Pipeline

Auto-detects branches

6️⃣ Organization Folder

Scans entire GitHub organization

🛠️ Freestyle CI/CD Example (Docker + Nginx)

Build & deploy Docker container using Jenkins Freestyle job.

Execute Shell Script
#!/bin/bash
set -e

docker build -t nginx-frontend:latest .
docker stop nginx-frontend-app || true
docker rm nginx-frontend-app || true
docker run -d --name nginx-frontend-app -p 9090:80 nginx-frontend:latest

📘 Session 43 – 28/10/2025
🚀 Jenkins Declarative Pipeline (Notes App)

Project: Notes App
Pipeline Type: Declarative

Pipeline Features

Git checkout

Docker build

Container deployment

Deployment verification

pipeline {
    agent any

    environment {
        IMAGE_NAME = "notes-app:latest"
        CONTAINER_NAME = "notes-app"
        PORT = "9092"
        HOST = "<EC2-PUBLIC-IP>"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/your-org/notes-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop $CONTAINER_NAME || true'
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -d --name $CONTAINER_NAME -p $PORT:80 $IMAGE_NAME'
            }
        }

        stage('Verify Deployment') {
            steps {
                sh 'curl http://$HOST:$PORT'
            }
        }
    }
}

✅ What This Project Demonstrates

✔ CI/CD concepts
✔ Jenkins architecture
✔ Jenkins on AWS EC2
✔ Freestyle & Pipeline jobs
✔ Docker-based deployment
✔ GitHub webhook integration
✔ Real-world DevOps workflow