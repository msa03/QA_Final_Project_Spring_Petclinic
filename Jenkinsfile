pipeline {
    agent any
    stages {
        stage('Build Docker Image - spring-petclinic-angular') {
            steps {
                //
                sh "cd spring-petclinic-angular && ls"
                sh "docker build -t spring-petclinic-angular:latest . "
                sh "docker push bradfordio1/spring-petclinic-angular"
                
            }
        }
        stage('Deploy') {
            steps {
                //
                sh "docker run --rm -p 8080:8080 bradfordio1/spring-petclinic-angular"
            }
        }
    }
}
