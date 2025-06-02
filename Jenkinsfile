pipeline {
    agent any

    environment {
        AWS_CREDS = credentials('aws-credentials')
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
            withEnv([
              "AWS_ACCESS_KEY_ID=${env.AWS_CREDS_USR}",
              "AWS_SECRET_ACCESS_KEY=${env.AWS_CREDS_PSW}"
                 ]) {
                  sh 'terraform apply -auto-approve -var="key_name=your-ssh-key-name"'
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
