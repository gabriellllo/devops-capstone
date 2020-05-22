pipeline {
        agent any
        stages {
        stage('Setup environment') {
            steps {
                sh 'python3 -m venv ~/.devops'
                sh '. ~/.devops/bin/activate'
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