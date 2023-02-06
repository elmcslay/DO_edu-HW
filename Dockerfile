FROM ubuntu:20.04

RUN rm -rf /etc/apt/sources.list
APT /etc/apt/sources.list /etc/apt/

RUN apt update
RUN apt install git -y
#RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install tomcat9 -y

EXPOSE 8080

RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /var/local
RUN mvn package /var/local/
RUN cp /var/local/target/hello-1.0.war /var/lib/tomcat9/webapps/


#CMD ["/bin/bash"]
CMD ["catalina.sh", "run"]