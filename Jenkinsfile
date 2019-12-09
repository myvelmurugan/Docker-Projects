pipeline {

  environment {
    registry = "172.31.15.193:5000/myvel123/flask"
    registry_mysql = "172.31.15.193:5000/myvel123/mysql"
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/myvelmurugan/Docker-Projects.git'
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    
     stage('current directory') {
      steps{
         sh 'pwd'
      }
    }
    
    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( "" ) {
            dockerImage.push()
          }
        }
      }
    }

    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "frontend.yaml", kubeconfigId: "mykubeconfig")
        }
      }
    }

  }

}
