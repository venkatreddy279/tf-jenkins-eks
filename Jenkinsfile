pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials ('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-2"
    }

    stages {
        stage('CheckOut SCM') {
            steps {
                script {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/venkatreddy279/tf-jenkins-eks']])
                }
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    dir('eks') {
                        sh 'terraform init'
                    }
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    dir('eks') {
                        sh 'terraform plan'
                    }
                }
            }
        }
         stage('Terraform Apply') {
            steps {
                script {
                    dir('eks') {
                        sh 'terraform $action --auto-approve'
                    }
                }
            }
        }
    }
}