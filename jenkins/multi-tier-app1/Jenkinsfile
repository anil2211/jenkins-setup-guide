pipeline {
    agent any

    environment {
        NET = "notes-net"
        DB_CONTAINER = "notes-db"
        BACKEND_CONTAINER = "notes-backend"
        FRONTEND_CONTAINER = "notes-frontend"
        BACKEND_IMAGE = "notes-backend:${BUILD_NUMBER}"
        FRONTEND_PORT = "8080"
        DB_ROOT_PASS = "rootpassword"
        DB_NAME = "notesdb"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out GitHub repo..."
                checkout scm
            }
        }

        stage('Prepare Environment') {
            steps {
                sh '''
                docker network inspect $NET >/dev/null 2>&1 || docker network create $NET
                docker rm -f $DB_CONTAINER $BACKEND_CONTAINER $FRONTEND_CONTAINER >/dev/null 2>&1 || true
                '''
            }
        }

        stage('Start Database') {
            steps {
                sh '''
                docker run -d --name $DB_CONTAINER \
                  --network $NET \
                  -e MYSQL_ROOT_PASSWORD=$DB_ROOT_PASS \
                  -e MYSQL_DATABASE=$DB_NAME \
                  -v notes-data:/var/lib/mysql \
                  -v "$WORKSPACE/db-init":/docker-entrypoint-initdb.d \
                  mysql:8.0
                '''
            }
        }

        stage('Build Backend') {
            steps {
                dir('backend') {
                    sh 'docker build -t $BACKEND_IMAGE .'
                }
            }
        }

        stage('Run Backend') {
            steps {
                sh '''
                docker run -d --name $BACKEND_CONTAINER \
                  --network $NET \
                  -e DB_HOST=$DB_CONTAINER \
                  -e DB_USER=root \
                  -e DB_PASS=$DB_ROOT_PASS \
                  -e DB_NAME=$DB_NAME \
                  $BACKEND_IMAGE
                '''
            }
        }

        stage('Run Frontend') {
            steps {
                sh '''
                docker run -d --name $FRONTEND_CONTAINER \
                  --network $NET \
                  -p $FRONTEND_PORT:80 \
                  -v "$WORKSPACE/frontend/index.html":/usr/share/nginx/html/index.html:ro \
                  -v "$WORKSPACE/frontend/default.conf":/etc/nginx/conf.d/default.conf:ro \
                  nginx:latest
                '''
            }
        }

        stage('Verify') {
            steps {
                sh '''
                sleep 6
                curl -f http://localhost:$FRONTEND_PORT || (echo "App not responding" && exit 1)
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Deployment SUCCESS: Access app at http://<EC2-PUBLIC-IP>:$FRONTEND_PORT"
        }
        failure {
            echo "❌ Deployment FAILED. Debug with docker logs."
            sh 'docker ps -a'
        }
    }
}
