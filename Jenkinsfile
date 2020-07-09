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
          def tag = sh(returnStdout: true, script: "git tag --contains | head -1").trim()
          echo "tag"
          sh 'sed -i "s/.*REACT_APP_VERSION.*/REACT_APP_VERSION=${GIT_TAG_NAME}/" .env.production'
        '''
      }
    }
  }
}
