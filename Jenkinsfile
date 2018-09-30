node {
   def containerName = ''
   def port = ''
   
   stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
    
       //git credentialsId: 'git-creds', url: 'https://github.com/frankiev2/steady-test'
       git 'https://github.com/frankiev2/steady-test'
     
    }

    
   stage('Build Docker Image') {
       sh 'docker build -t andrewfl99/steady:${BUILD_NUMBER} .'
       
   }
    
   stage('Push Docker Image') {
       //withCredentials([string(credentialsId: 'docker-cred', variable: 'dockerHubPwd')]) {  
       //    sh "docker login -u andrewfl99 -p ${dockerHubPwd}"
       //}
       sh 'sudo docker push andrewfl99/steady'
       
   }
   
   stage('Run Container on AWS'){
       containerName = "steady-app"
       port = "5000"
       
       // Check Existing ContainerName and stop it if rebuilding
       sh "docker ps -f name=${containerName} -q | xargs --no-run-if-empty docker stop"
       // Remove Container if exist
       sh "docker ps -a -f name=${containerName} -q | xargs -r docker rm"
       // Run New Container
       sh "docker run -it -p ${port}:5000 -d --name ${containerName} andrewfl99/steady:${BUILD_NUMBER}"
       
   }
   
}
