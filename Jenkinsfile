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
            steps{
		        script{
                    //store the var
                    def shellCmd= "bash ./shellCmd.sh"
                    //ssh for the scp file to EC2
                    sh "scp shellCmd.sh ec2-user@32.523.123.13:/home/ec2-user"
                    sh "scp docker-compose.yml ec2-user@32.523.123.13:/home/ec2-user"
                    //ssh to jenkins to run in EC2 with var
                    sh "ssh -o StrictHostKeyChecking=no <user>@<server> ${shellCmd}"
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
