node {
    stage("git checkout"){
        git credentialsId: 'github', url: 'https://github.com/mukeshr-29/devops-project-8.git'

    }
    stage("copy docker file to ansible server"){
        sshagent(['ansible']){
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.0.165'
            sh 'scp /var/lib/jenkins/workspace/project-8/Dockerfile ubuntu@10.0.0.165:/home/ubuntu'
        }
    stage("build the image"){
        sshagent(['ansible']){
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.0.165 cd /home/ubuntu/'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.0.165 docker image build -t $JOB_NAME:v1.$BUILD_ID .'
            }
        }
    stage("docker image tagging"){
        sshagent(['ansible']){
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.0.165 cd /home/ubuntu/'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.0.165 docker image tag $JOB_NAME:v1.$BUILD_ID mukeshr29/$JOB_NAME:v1.$BUILD_ID'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.0.165 docker image tag $JOB_NAME:v1.$BUILD_ID mukeshr29/$JOB_NAME:latest'
            }
        }
        stage("push image to dockerhub"){
            sshagent(['ansible']){
                withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]){
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.0.165 docker login -u mukeshr29 -p ${dockerhub}'
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.0.165 docker image push mukeshr29/$JOB_NAME:v1.$BUILD_ID'
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.0.165 docker image push mukeshr29/$JOB_NAME:latest'
                }
            }

        }
    }
}