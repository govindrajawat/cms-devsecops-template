pipeline {
  agent any
  environment {
    REGISTRY = "your-docker-registry"
    IMAGE_TAG = "${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
    SLACK_CHANNEL = '#your-slack-channel'
    EMAIL_RECIPIENTS = 'devops@example.com'
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
      when {
        branch 'main'
      }
      steps {
        sh 'docker-compose push'
      }
    }
    stage('Blue/Green Deploy') {
      when {
        branch 'main'
      }
      steps {
        sh './scripts/bluegreen-deploy.sh'
      }
    }
    stage('Deploy (Non-Prod)') {
      when {
        not { branch 'main' }
      }
      steps {
        sh './scripts/deploy.sh'
      }
    }
  }
  post {
    always {
      script {
        try {
          slackSend channel: env.SLACK_CHANNEL, message: "${env.JOB_NAME} #${env.BUILD_NUMBER} finished with status: ${currentBuild.currentResult}"
        } catch (e) {
          echo 'Slack notification failed.'
        }
        try {
          emailext subject: "${env.JOB_NAME} #${env.BUILD_NUMBER} - ${currentBuild.currentResult}", body: "Build completed. See Jenkins for details.", to: env.EMAIL_RECIPIENTS
        } catch (e) {
          echo 'Email notification failed.'
        }
      }
    }
    failure {
      script {
        slackSend channel: env.SLACK_CHANNEL, message: "${env.JOB_NAME} #${env.BUILD_NUMBER} failed."
      }
    }
  }
}