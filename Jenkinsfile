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
                    //define the EC2 instance
                    def dockerCmd = "docker run -d -p 3000:3080 amirdockerrepo/try.app:1.0"
                    //run the cmd
                    sshagent(['ec2-cred']){
                        sh "ssh -o StrictHostKeyChecking=no amiraini@172.23.251.223 ${dockerCmd}"
                    }
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
