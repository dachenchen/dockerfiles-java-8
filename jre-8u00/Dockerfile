FROM centos

MAINTAINER Lothar Wieske <lothar.wieske@gmail.com>

RUN yum update -y

RUN curl --insecure --junk-session-cookies --location --remote-name --silent --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8-b132/jre-8-linux-x64.rpm

RUN yum localinstall -y jre-8-linux-x64.rpm
RUN rm jre-8-linux-x64.rpm

ENV JAVA_HOME /usr/java/default
