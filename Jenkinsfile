pipeline {
  agent any
  environment {
    HOME = '.'
    PATH = "/usr/bin/chromedriver:/usr/bin/google-chrome:$PATH"
  }
  
  stages {
    def tag = sh(returnStdout: true, script: "git tag --contains | head -1").trim()
    stage('Initialize') {
      steps {
        sh '''
          echo "PATH = ${PATH}"
          echo tag
          sed -i "s/.*REACT_APP_VERSION.*/REACT_APP_VERSION=tag/" .env.production
        '''
      }
    }
  }
}
