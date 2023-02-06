FROM tomcat:9.0.71-jre11-temurin-focal

RUN rm -rf /etc/apt/sources.list
ADD sources.list /etc/apt/

ENV TZ=Europe/Moscow

RUN apt update
#RUN apt install default-jdk -y
RUN apt install maven -y 
#RUN apt install tomcat9 -y
RUN apt install git -y

EXPOSE 8080

WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn package
RUN cp /tmp/target/hello-1.0.war /var/lib/tomcat9/webapps/


#CMD ["/bin/bash"]
CMD ["catalina.sh", "run"]