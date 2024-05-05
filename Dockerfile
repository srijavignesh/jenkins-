# Use the official Tomcat 9 image as the base image
FROM tomcat:9

# Set environment variables
ENV TOMCAT_PORT 8081

# Remove the default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the WAR file to the webapps directory
COPY "/var/lib/jenkins/workspace/job2/webapp/target/webapp.war" /usr/local/tomcat/webapps/ROOT.war

# Expose the port that Tomcat will run on
EXPOSE ${TOMCAT_PORT}

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
