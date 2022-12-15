node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        dir('devops') {
            app = docker.build("public-registry.amtmann.de/devops-jenkins")
        }
    }

    stage('Test image') {
        app.inside {
            sh 'pytest ./devops/tests/devopstest.py'
        }
    }

    stage('Push image') {
        /* push the image with two tags:
         * first, incremental build number from Jenkins
         * second, the 'latest' tag.
         * pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://public-registry.amtmann.de', 'public-argon-registry') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
