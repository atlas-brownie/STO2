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
          tag=$(git describe --tags)
          echo ${tag}
          sed -i "s/.*REACT_APP_VERSION.*/REACT_APP_VERSION=${tag}/" .env.production
        '''
      }
    }
  }
}
