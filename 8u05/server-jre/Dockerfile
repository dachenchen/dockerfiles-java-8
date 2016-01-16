FROM centos

MAINTAINER Lothar Wieske <lothar.wieske@gmail.com>

RUN yum update -y && \
    curl --insecure --junk-session-cookies --location --remote-name --silent --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u5-b13/server-jre-8u5-linux-x64.tar.gz  && \
    mkdir /usr/java/default && \
    tar xfz server-jre-8u5-linux-x64.tar.gz -C /usr/java/default && \
    alternatives --install /usr/bin/java java /opt/server-jre-8u5/bin/java 1 && \
    alternatives --install /usr/bin/jar  jar  /opt/server-jre-8u5/bin/jar  1 && \
    rm server-jre-8u5-linux-x64.tar.gz

ENV JAVA_HOME /opt/server-jre-8u5 \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8
