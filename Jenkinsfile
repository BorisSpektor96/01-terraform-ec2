pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID') 
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY') 
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning the Repo'
                git branch: 'main', url: 'https://github.com/BorisSpektor96/01-terraform-ec2.git' 
            }
        }

        stage('Terraform Init') {
            steps {
                echo ' Terraform init'
                sh 'terraform init' 
            }
        }

        stage('Terraform Plan') {
            steps {
                echo 'Terraform plan'
                sh 'terraform plan' 
            }
        }

        stage('Terraform Apply') {
            steps {
                echo 'Terraform apply auto'
                sh 'terraform apply -auto-approve' 
            }
        }
    }
}
