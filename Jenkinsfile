node {
    def WORKSPACE = "/var/lib/jenkins/workspace/"
    def dockerImageTag = "tesraildanamon${env.BUILD_NUMBER}"

try{
     notifyBuild('STARTED')
     stage('Clone Repo') {
        // for display purposes
        // Get some code from a GitHub repository
        git url: 'https://github.com/sigitsigatechnologies/tesdanamon.git',
            credentialsId: 'sigitsigatechnologies',
            branch: 'main'
     }
      stage('Build docker') {
             dockerImage = docker.build("tesraildanamon:${env.BUILD_NUMBER}")
      }

      stage('Deploy docker'){
              echo "Docker Image Tag Name: ${dockerImageTag}"
              sh "docker stop tesraildanamon || true && docker rm tesraildanamon || true"
              sh "docker run --name tesraildanamon -d -p 8081:8081 tesraildanamon:${env.BUILD_NUMBER}"
      }
}catch(e){
    currentBuild.result = "FAILED"
    throw e
}finally{
    notifyBuild(currentBuild.result)
 }
}

def notifyBuild(String buildStatus = 'STARTED'){

// build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESSFUL'
  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def now = new Date()
  // message
  def subject = "${buildStatus}, Job: ${env.JOB_NAME} FRONTEND - Deployment Sequence: [${env.BUILD_NUMBER}] "
  def summary = "${subject} - Check On: (${env.BUILD_URL}) - Time: ${now}"
  def subject_email = "Spring boot Deployment"
  def details = """<p>${buildStatus} JOB </p>
    <p>Job: ${env.JOB_NAME} - Deployment Sequence: [${env.BUILD_NUMBER}] - Time: ${now}</p>
    <p>Check console output at "<a href="${env.BUILD_URL}">${env.JOB_NAME}</a>"</p>"""

}