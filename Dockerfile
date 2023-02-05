FROM ubuntu:20.04

RUN apt update
RUN apt install git -y
#RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install tomcat9 -y

EXPOSE 8080

CMD ["/bin/bash"]