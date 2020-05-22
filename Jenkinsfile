pipeline {
        agent any
        stages {
        stage('Setup environment') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Lint python code') {
            steps {
                sh 'pylint --disable=R,C,W1203 app.py'
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