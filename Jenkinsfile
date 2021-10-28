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
        stage('Build and Push Docker Image') {
            steps {
                //
                sh "cd spring-petclinic-angular && docker build -t spring-petclinic-angular . "
                sh "docker tag spring-petclinic-angular bradfordio1/spring-petclinic-angular:latest"
                sh "docker push bradfordio1/spring-petclinic-angular:latest"
                
            }
        }
        stage('Deploy app to EKS') {
            steps {
                //
                sh "aws eks --region eu-west-1 update-kubeconfig --name QA_teamB_cluster"
                sh "cd Kubernetes && kubectl apply -f nginx.yaml && kubectl apply -f backend.yaml && sleep 5 && kubectl apply -f frontend.yaml"
                sh "kubectl get services"
            }
        }
    }
}
