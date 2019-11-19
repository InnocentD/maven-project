pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                sh 'mvn clean package'
                sh 'docker build . -t marvenwebapp'
            }
        }
    }
    post {
        always {
            echo 'I will always say Hello again!'
        }
    }
}