pipeline {
    agent {label "mhadev && linux"}
    stages {
        stage("create debian packages") {
            steps {
                sh 'git clean -fdx .'
                sh 'mhamakedeb mahalia-extras.csv $(cat version) armhf'
                sh 'mkdir -p output/bionic'
                sh 'mv *.deb output/bionic'
                stash name: 'deb', includes: 'output/*/*.deb'
            }
        }
        stage("debian packages for apt") {
            agent {label "aptly"}
            steps {
                // receive all created deb packages from build
                unstash "deb"
                archiveArtifacts "output/*/*.deb"

                // Copies the new debs to the stash of existing debs,
                sh "make SUPPLY_DIR=output/ PROJECT=mahalia-extras"

                build job:         "/hoertech-aptly/master",
                      quietPeriod: 300,
                      wait:        false
            }
        }
    }

    // Email notification on failed build taken from
    // https://jenkins.io/doc/pipeline/tour/post/
    // multiple recipients are comma-separated:
    // https://jenkins.io/doc/pipeline/steps/workflow-basic-steps/#-mail-%20mail
    post {
        failure {
            mail to: 't.herzke@hoertech.de',
                 subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                 body: "Something is wrong with ${env.BUILD_URL}"
        }
    }
}
