pipeline {
    agent any
    tools {
        maven 'Maven-Tool'
    	dockerTool 'Docker'
    }

    stages {
        stage('Test') {
        // Build the stagging area
            steps {
                echo "Testing..."
                sh 'mvn test'
            }
            post {
                failure {
                    echo "Failed to Testing Stage!!"
                }
            }
        }
        stage('Build') {
        // Build the image    
            steps {
                echo "Building..."
                sh 'mvn package'
                archiveArtifacts artifacts: '**/*.war', followSymlinks: false
            }
            post {
                failure {
                    echo "Failed to Building Stage!!"
                }
            }
        }
        stage('DeployToTest') {
        // Deploy to Testing Environment!
            steps {
            // Deploy war file in container
                echo 'Deploy to Testing Environment...'
                deploy adapters: [tomcat9(credentialsId: 'tomcat/tomcat-9', path: '', url: 'http://172.31.33.144:8080')], contextPath: 'app', war: '**/*.war'
            }
            post {
                failure {
                    echo "Failed to Testing Environment!"
                }
            }
        }
	
	stage('Build DockerImage && PushImageRegistry') {
	   steps {
	   // Build the container image
		script {
		   def dockerUser = "gautamregar"
		   dockerImage = docker.build("${dockerUser}/myapp:${env.BUILD_ID}", "--label \"GIT_COMMIT=${env.GIT_COMMIT}\" .")
		}
		// Push the container image to Docker Hub
		withCredentials([usernamePassword(credentialsId: 'DockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) 
            	{
            	script {
                    docker.withRegistry('https://registry.hub.docker.com', 'DockerHub')
                    {
                        dockerImage.push()
                    }
                }
	    }	
        }
    }
    
//	stage('Deploy to DockerSwarmCluster') {
//	    agent none
//          input {
//        	message "Should we continue?"
//          	ok "Yes, we should."
//          	submitter "alice,bob"
//          }
//         steps {
	   // Connect to the first remote Docker host
//	   #######[docker.withServer ('tcp://192.168.10.100:2375', 'docker1-certs')]#####
//	   docker.withServer ('tcp://192.168.10.100:2375') {
	   // Pull and run the container image from Docker Hub as a swarm service with 3 replicas
//	   script {
//		dockerContainer = docker.image("gautamregar/myapp:${env.BUILD_ID}").run("--mode replicated --replicas 3 -p 8000:8080")
//	     }
//	  }
//    	}
//    	post {
//         failure {
//             echo "Failed to Production Environment!"
//           }
//       }
// }
    }
	    
   post {
        success {
            echo "Success!"
          }
        failure {
            echo "Failed!"
          }
       aborted {
           echo "Aborted!"
         } 
      }
}
	
