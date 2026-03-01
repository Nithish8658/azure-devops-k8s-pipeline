pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "378658/azure-devops-k8s-pipeline:v1"
    }

    stages {

        stage('Checkout') {
            steps {
                git url: 'https://github.com/378658/azure-devops-k8s-pipeline.git',
                    branch: 'main',
                    credentialsId: 'github-token-cred' // Use the ID from Step 2
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} -f docker/Dockerfile ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds',
                                usernameVariable: 'DOCKER_USER',
                                passwordVariable: 'DOCKER_PASS')]) {

                    sh """
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push ${DOCKER_IMAGE}
                    """
                }
            }
        }
    }
}