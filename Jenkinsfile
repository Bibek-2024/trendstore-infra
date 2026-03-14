pipeline {
    agent any
    
    environment {
        DOCKER_HUB_USER = "bibekdec2022"
        IMAGE_NAME = "trend-app"
        DOCKER_CRED_ID = "dockerhub-creds" 
        CLUSTER_NAME = "trendstore-cluster"
        REGION = "ap-south-1"
    }

    stages {
        stage('Docker Build') {
            steps {
                sh "docker build -t ${DOCKER_HUB_USER}/${IMAGE_NAME}:${BUILD_NUMBER} ."
                sh "docker tag ${DOCKER_HUB_USER}/${IMAGE_NAME}:${BUILD_NUMBER} ${DOCKER_HUB_USER}/${IMAGE_NAME}:latest"
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CRED_ID}", passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh "docker push ${DOCKER_HUB_USER}/${IMAGE_NAME}:${BUILD_NUMBER}"
                    sh "docker push ${DOCKER_HUB_USER}/${IMAGE_NAME}:latest"
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                script {
                    sh "aws eks update-kubeconfig --region ${REGION} --name ${CLUSTER_NAME}"
                    sh "kubectl apply -f kubernetes/deployment.yaml"
                    sh "kubectl apply -f kubernetes/service.yaml"
                    sh "kubectl rollout restart deployment/trendstore-deployment"
                }
            }
        }
    }
}
