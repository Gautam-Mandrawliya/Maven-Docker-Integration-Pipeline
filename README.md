# Maven-Docker-Integration-Pipeline: Continuous Integration and Deployment Pipeline for MyApp

This repository contains the Jenkins pipeline script for automating the continuous integration and deployment of the MyApp application. The pipeline is designed to build, test, deploy to a testing environment, build a Docker image, and push it to Docker Hub.

## Overview

The Jenkins pipeline is structured into several stages:

1. **Test:**
   - Maven is used to execute tests for the MyApp application.

2. **Build:**
   - The application is built using Maven, and the resulting WAR (Web Application Archive) files are archived.

3. **Deploy to Test:**
   - The built WAR files are deployed to a testing environment using the specified Tomcat server.

4. **Build Docker Image and Push to Docker Hub:**
   - The Docker image is built using the Docker tool and labeled with the Git commit hash.
   - The image is then pushed to Docker Hub using credentials securely stored in Jenkins.

<!--
5. **Deploy to Docker Swarm Cluster (Commented Out):**
   - This stage is currently commented out, but it provides an example of how to deploy the application to a Docker Swarm cluster.
   - It includes the option to prompt for confirmation before deploying to production.
-->

## Prerequisites

Before running the pipeline, ensure the following tools are available in the Jenkins environment:

- Maven (configured as 'Maven-Tool' in Jenkins)
- Docker (configured as 'Docker' in Jenkins)
- Credentials for Tomcat deployment ('tomcat/tomcat-9')
- Credentials for Docker Hub ('DockerHub')

## Usage

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Gautam-Mandrawliya/Maven-Docker-Integration-Pipeline.git
   ```

2. **Configure Jenkins:**
   - Set up Jenkins with the necessary tools and credentials for Maven, Docker, Tomcat, and Docker Hub.

3. **Create Jenkins Pipeline:**
   - Create a new pipeline in Jenkins and use the content of `Jenkinsfile` as the pipeline script.

4. **Run the Pipeline:**
   - Trigger the pipeline manually or set up a webhook to run it automatically on code changes.

## Notes

- Adjust the URLs, credentials, and other parameters in the pipeline script to match your specific environment.
- Uncomment and customize the "Deploy to Docker Swarm Cluster" stage if applicable.


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
