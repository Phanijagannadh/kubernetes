##artifact build stage
FROM maven AS buildstage
RUN mkdir /maven_files
COPY sourcefiles/  maven_files/
RUN mvn clean install    ## artifact -- .war

### tomcat deploy stage
FROM tomcat
WORKDIR /usr/local/tomcat/webapps
COPY --from=buildstage /maven_files/target/*.war .
EXPOSE 8080  