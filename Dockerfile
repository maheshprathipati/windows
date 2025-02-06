FROM ubuntu:latest
RUN apt-get update \
    && apt-get install -y openjdk-11-jdk \
    && apt-get install -y maven \
    && wget https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.2/bin/apache-tomcat-11.0.2.tar.gz \
    && tar -vxzf apache-tomcat-11.0.2.tar.gz \
    && rm -rf apache-tomcat-11.0.2.tar.gz \
    && mv apache-tomcat-11.0.2 /usr/local/tomcat/ \
    && rm -rf /var/lib/apt/lists/*
COPY target/gamutkart.war /usr/local/tomcat/webapps/
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]



