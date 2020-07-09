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
          echo "${TAG_NAME}"
          sed -i "s/.*REACT_APP_VERSION.*/REACT_APP_VERSION=${TAG_NAME}/" .env.production
        '''
      }
    }
  }
}
