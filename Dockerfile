# Use a base image with the Java runtime and Tomcat
FROM tomcat:9-jre11

# Remove the default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from your local machine into the image
COPY target/*.war /usr/local/tomcat/webapps/app.war

# Expose the port Tomcat will run on (default is 8080)
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
