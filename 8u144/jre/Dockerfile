FROM centos

MAINTAINER Lothar Wieske <lothar.wieske@gmail.com>

RUN yum update -y && \
    curl --insecure --junk-session-cookies --location --remote-name --silent --header "Cookie: oraclelicense=accept-securebackup-cookie" https://archive.org/download/jre-8u144-linux-x64/jre-8u144-linux-x64.rpm && \
    yum localinstall -y jre-8u144-linux-x64.rpm && \
    rm jre-8u144-linux-x64.rpm && \
    yum clean all

ENV JAVA_HOME=/usr/java/jre1.8.0_144/ \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8
