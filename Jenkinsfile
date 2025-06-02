pipeline {
    agent any

    environment {
        AWS_CREDS = credentials('aws-cred')    
        GIT_CRED = credentials('git-cred')      
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: "${env.GIT_CRED}", url: 'https://github.com/aniljeenapati/demo-repo.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([file(credentialsId: 'ec2-ssh-key', variable: 'PEM_FILE')]) {
                    withEnv([
                        "AWS_ACCESS_KEY_ID=${env.AWS_CREDS_USR}",
                        "AWS_SECRET_ACCESS_KEY=${env.AWS_CREDS_PSW}"
                    ]) {
                        sh '''
                        echo "Using PEM file: $PEM_FILE"

                        terraform apply -auto-approve -var="key_name=anil-keypair"
                        '''
                    }
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline completed."
        }
    }
}
