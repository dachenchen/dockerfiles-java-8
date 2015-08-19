FROM centos

MAINTAINER Lothar Wieske <lothar.wieske@gmail.com>

RUN yum update -y
RUN yum install -y tar

RUN curl --insecure --junk-session-cookies --location --remote-name --silent --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u60-b27/server-jre-8u60-linux-x64.tar.gz

RUN mkdir /opt/server-jre-8u60
RUN tar xfz server-jre-8u60-linux-x64.tar.gz -C /opt/server-jre-8u60

RUN yum remove -y tar

RUN alternatives --install /usr/bin/java java /opt/server-jre-8u60/bin/java 1
RUN alternatives --install /usr/bin/jar  jar  /opt/server-jre-8u60/bin/jar  1

RUN rm server-jre-8u60-linux-x64.tar.gz

ENV JAVA_HOME /opt/server-jre-8u60
