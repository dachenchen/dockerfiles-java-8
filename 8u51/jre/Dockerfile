FROM centos

MAINTAINER Lothar Wieske <lothar.wieske@gmail.com>

RUN yum update -y && \
    curl --insecure --junk-session-cookies --location --remote-name --silent --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jre-8u51-linux-x64.rpm && \
    yum localinstall -y jre-8u51-linux-x64.rpm && \
    rm jre-8u51-linux-x64.rpm

ENV JAVA_HOME=/usr/java/default
