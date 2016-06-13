FROM centos

MAINTAINER Lothar Wieske <lothar.wieske@gmail.com>

RUN yum update -y && \
    curl --insecure --junk-session-cookies --location --remote-name --silent --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u60-b27/server-jre-8u60-linux-x64.tar.gz  && \
    mkdir -p /usr/java/default && \
    tar xfz server-jre-8u60-linux-x64.tar.gz -C /usr/java/default && \
    alternatives --install /usr/bin/java java /usr/java/default/server-jre1.8.0_60/bin/java 1 && \
    alternatives --install /usr/bin/jar  jar  /usr/java/default/server-jre1.8.0_60/bin/jar  1 && \
    rm server-jre-8u60-linux-x64.tar.gz && \
    yum clean all

ENV JAVA_HOME=/usr/java/server-jre1.8.0_60/ \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8
