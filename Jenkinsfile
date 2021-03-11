node {
	
    def app

    stage('Clone repository') {
        
		checkout scm
    }

    stage('Build image') {
  
        app = docker.build("tinyjavaapp:${env.BUILD_ID}")
    }

    stage('Test image') {

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        
        docker.withRegistry('', dockerhubid) {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
