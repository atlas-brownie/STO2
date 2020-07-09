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
          echo ${GIT_TAG}
          sh 'sed -i "s/.*REACT_APP_VERSION.*/REACT_APP_VERSION=${GIT_TAG}/" .env.production'
        '''
      }
    }
  }
}
