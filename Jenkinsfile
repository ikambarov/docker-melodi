if(env.BRANCH_NAME == master){
    tag = "latest"
}
else{
    tag = env.BRANCH_NAME
}

node('docker'){
    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USER')]) {
        stage("Build"){
            checkout scm
            sh "docker build -t $DOCKERHUB_USER/melodi:${tag} ."
        }

        stage("Build"){
            sh '''
                docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PASSWORD
                '''
                
            sh """
                docker push $DOCKERHUB_USER/melodi:${tag}
            """
        }
    }
}
