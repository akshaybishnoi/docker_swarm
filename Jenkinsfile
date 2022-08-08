node{

    stage("git checkout"){

        git url: 'https://github.com/akshaybishnoi/docker_swarm.git',branch: 'main'
    }

    stage("docker build"){

        sh 'docker build -t akshaykumar29/img1 . --target img1'
        sh 'docker build -t akshaykumar29/img2 . --target img2'

    }

    stage("docker login and push"){

        withCredentials([string(credentialsId: 'docker-ki', variable: 'docker-ki')]) {
            sh "docker login -u akshaykumar29 -p ${docker-ki}"

}
        sh 'docker push akshaykumar29/img1'
        sh 'docker push akshaykumar29/img2'
    }

    stage("remove image"){
        sh 'docker rmi -f $(docker images -a -q)'
    }

    stage("deploy"){
        sshagent(['ssh-ki']) {
    sh 'scp -o StrictHostKeyChecking=no docker-compose.yml ubuntu@35.154.122.73'
    sh 'ssh -o StrictHostKeyChecking=no ubuntu@35.154.122.73 docker stack deploy --prune --compose-file docker-compose.yml teststack'
}
    }
}
