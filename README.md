## Dockerfiles for Oracle Java 8

jdk+jre+server-jre 8u00+8u05+8u11+8u20+8u25+8u31+8u40+8u45++8u51+8u60


**Dockerfiles** for [Oracle Java 8](http://www.oracle.com/technetwork/java/index.html)
for Docker Automated/Trusted Builds.

### GitHub Repository

* [dockerfiles-java-8](https://github.com/lwieske/dockerfiles-java-8)

### Dependencies

* [centos](https://registry.hub.docker.com/_/centos/)

### Usage Java 8

    docker run -i -t lwieske/java-8 bash

### Java 8 Example

    docker run -i -t lwieske/java-8 bash

    $ java -version

### Automation

The __gen.sh__ script may be used to generate folders and files.
