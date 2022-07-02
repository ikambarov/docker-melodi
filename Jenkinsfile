node('docker'){
    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USER')]) {
        stage("Build"){
            checkout scm
            sh "docker build -t $DOCKERHUB_USER/melodi:latest ."
        }

        stage("Build"){
            sh '''
                docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PASSWORD
                docker push $DOCKERHUB_USER/melodi:latest
            '''
        }
    }
}
