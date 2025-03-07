pipeline{
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws_security')
        AWS_SECRET_ACCESS_KEY = credentials('aws_security')
    }

    stages{
        stage "initialize terraform"{
            steps{
                sh 'terraform init'
            }
        }
        stage "format"{
            steps{
                sh 'terraform fmt'
            }
        }
        stage "validate"{
            steps{
                sh 'terraform validate'
            }
        }
        stage "plan"{
            steps{
                sh 'terraform plan'
            }
        }
        stage "apply"{
            steps{
                sh 'terraform apply'
            }
        }
    }
}