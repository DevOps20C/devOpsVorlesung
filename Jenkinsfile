node {
    def app

    stage('Clone repository') {
        /* Cloning the git repository defined in the Jenkins job configuration to the local workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
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
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://public-registry.amtmann.de', 'public-argon-registry') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
