pipeline {
  agent any
  environment {
    HOME = '.'
    PATH = "/usr/bin/chromedriver:/usr/bin/google-chrome:$PATH"
  }
  
  stages {
    stage('Initialize') {
      steps {
        sh '''
          echo "PATH = ${PATH}"
          node -v
          npm -v
        '''
      }
    }

    stage('Build') {
      steps {
        sh 'npm install'
        sh 'npm audit fix'
      }
    }

    stage('Test') {
      steps {
        sh 'npm run test'
      }
    }
    
    stage('Maven JUnit Test'){
      steps {
        sh 'mvn test'
      }
      post {
        always {
          junit 'target/surefire-reports/*.xml'
        }
      }
    }

    stage('Code Quality') {
      steps {
        script {
          def scannerHome = tool 'AWSSonarQube';
          withSonarQubeEnv("SonarQubeServer") {
            sh "${tool("AWSSonarQube")}/bin/sonar-scanner"
                  }
                }
             }
          }

    stage('Cleanup Old Docker Artifacts'){
      steps{
        sh 'docker image prune -f'
        sh 'docker volume prune -f'
        sh 'docker container prune -f'
      }
    }

    stage('Build Docker Image'){
      steps {
        script {
          docker.build('node-hello-world')
          }
      }
    }
    
    stage('Deploy Docker Image on AWS'){
      steps {
        script{
          docker.withRegistry('https://940093668739.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:tflucker-aws-credentials'){
            docker.image('node-hello-world').push('latest')
          }
        }
      }
    }
    stage('Remove unused docker image'){
      steps{
        sh "docker image prune -f"
      }
    }
  }
