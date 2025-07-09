pipeline {
  agent any
  environment {
    REGISTRY = "your-docker-registry"
    IMAGE_TAG = "latest"
  }
  stages {
    stage('Lint & Build') {
      steps {
        sh 'docker-compose build'
      }
    }
    stage('Trivy Scan') {
      steps {
        sh './security/trivy-scan.sh'
      }
    }
    stage('Dependency Check') {
      steps {
        sh 'dependency-check.sh --project cms-synergy --scan .'
      }
    }
    stage('SonarQube Analysis') {
      steps {
        sh 'sonar-scanner -Dproject.settings=security/sonar/sonar-project.properties'
      }
    }
    stage('Push Images') {
      steps {
        sh 'docker-compose push'
      }
    }
    stage('Deploy') {
      steps {
        sh './scripts/deploy.sh'
      }
    }
  }
}