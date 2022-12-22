# jenkins-pipeline

- Create a designated server to run jenkins script using docker
  1) run a jenkins container in the server with mounted volumes 
  2) inside jenkins container install npm and node, also install docker
      - This is to run cmds inside the jenkins container for automation purposes
  3) Configure Jenkins in port <server>:8080 to run scripts 
      - Tried running scripts using freestyle jobs and pipeline jobs
      - run pipeline jobs with parameters, variables, groovy
      - run multipipeline jobs
