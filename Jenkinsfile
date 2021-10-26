pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('bradfordio1-dockerhub')
    }
    stages {
        stage ('DockerHub Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Build Docker Image - spring-petclinic-angular') {
            steps {
                //
                sh "cd spring-petclinic-angular && docker build -t spring-petclinic-angular . "
                sh "docker tag spring-petclinic-angular bradfordio1/spring-petclinic-angular:latest"
                sh "docker push bradfordio1/spring-petclinic-angular:latest"
                
            }
        }
        stage('Deploy') {
            steps {
                //
                sh "docker run --rm -p 8080:8080 bradfordio1/spring-petclinic-angular:latest"
            }
        }
    }
}
