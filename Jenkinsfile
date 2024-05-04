pipeline {
    environment {
        repository = 'anys34/jenkins_study'
        registryCredential = 'docker'
        dockerImage = ''
    }

    agent any

    stages {
        stage('git clone') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/anys34/Jenkins-CI-CD'
            }
        }

        stage('test') {
            steps {
                sh './gradlew test'
            }
        }

        stage('build') {
            steps {
                sh './gradlew bootJar'
            }
        }

        stage('docker build') {
            steps {
                script {
                    dockerImage = docker.build(repository)
                }
            }
        }

        stage('docker push') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}