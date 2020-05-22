pipeline {
        agent any
        stages {
        stage('Setup environment') {
            steps {
                withPythonEnv('python3'){
                    sh 'pip install -r requirements.txt'
                }
            }
        }
        stage('Lint python code') {
            steps {
                withPythonEnv('python3'){
                    sh 'pylint --disable=R,C,W1203 app.py'
                }
            }
        }
        stage('Lint Docker file') {
            steps {
                sh 'wget -O hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && chmod +x hadolint'
                sh './hadolint Dockerfile'
            }
        }
        stage('Upload to AWS') {
            steps {
                withAWS(region:'us-west-2', credentials:'aws-static') {
                    sh 'echo "Uploading content with AWS credentials"'
                    // s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'index.html', bucket:'static-bucket-gabriellllo')
                }
            }
        }
    }
}