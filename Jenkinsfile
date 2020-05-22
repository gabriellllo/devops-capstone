pipeline {
        environment {
            registry = "gabriellllo/flaskapp"
            registryCredential = 'dockerhubID'
            dockerImage = ''
        }
        agent any
        stages {
        stage('Lint python code') {
            steps {
                withPythonEnv('python3'){
                    sh 'pip install -r requirements.txt'
                    sh 'pip install pylint'
                    sh 'pylint --disable=R,C,W1203 app.py'
                }
            }
        }
        stage('Lint Docker file') {
            steps {
                sh 'hadolint Dockerfile'
            }
        }
        stage('Build image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }        
        stage('Push image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Remove local image') {
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
        stage('Deploy to cluster') {
            steps {
                withAWS(region:'us-west-2', credentials:'aws-static') {
                    sh 'echo "Uploading content with AWS credentials"'
                    // s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'index.html', bucket:'static-bucket-gabriellllo')
                }
            }
        }
    }
}