def gv

pipeline {
    agent any
    parameters{
        choice(name:"version", choices:["1.0","1.1"], description:"")
    }
    stages {
       
       stage("init") {
        steps{
            script{
                gv = load "script.groovy"
            }
        }
       }
       
        //build stage
        stage("build") {
            steps {
                script {
                    gv.buildJar()
                }
            }
        }

        stage("build docker image") {
            steps {
                script {
                    gv.buildImage()
                }
            }
        }

        stage("deploy") {
              input{
                message "input the version"
                parameters{
                    choice(name:"env", choices:["staging","production","testing"], description:"")
                }
            }   
            steps {
                script {
                    gv.deployApp()
                    echo "deployed to ${env}"  //this is not global thats why
                }
            }
        }
        //after the deployment of docker in Repo, server would pull image, run docker-compose and pull DB from dockerHub
    } 
    post{
        always{
            echo "version is ${params.version}"
        }
    }
}
