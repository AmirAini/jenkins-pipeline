def gv

pipeline {
    agent any
    	parameters{
			boolean(name:"executeTest", defaultValue:true, description:"")
			choice(name:"VERSION", choices:["1.0","1.1"], description:"")
   }
    stages {
       
       //test stage
       stage("test"){
        when{
				expression{
          //put param
					params.executeTest == true
				}
			}
        steps{
            //where the scripts run (according to CLI)
            echo "example: npm test"
        }
       }
        //build stage
        stage("build") {
            steps {
                script {
                    echo "example: npm build"
                    echo "deploying version ${params.version}"
                    //gv.buildJar()
                }
            }
        }
        stage("build docker image") {
            steps {
                script {
                    echo "exmaple: docker build -t <name>:<tag>"
                    //gv.buildImage()
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    echo "example: docker push <domainRegistery (AWS ECR)>:name"
                    //gv.deployApp()
                }
            }
        }
        //after the deployment of docker in Repo, server would pull image, run docker-compose and pull DB from dockerHub
    }   
}