pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Dafavored/welcome-app.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Deploy') {
            steps {
                // Deployment steps, e.g., deploying to a server or artifact repository
                echo 'Deploying the application...'
            }
        }
    }
}
