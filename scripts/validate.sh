#!/bin/bash

# Short Version Numbers
versions=(
  "00"
  "92"
)

length=${#versions[@]}

for (( i=0; i<${length}; i++ ));
do
  version=${versions[length-$i-1]}
  for j in "jdk" "jre" "server-jre"
  do
    for k in "" "-slim"
    do
      docker pull lwieske/java-8:${j}-8u${version}${k} > /dev/null 2>&1
      echo "***>" lwieske/java-8:${j}-8u${version}${k} "<***"
      docker run -i -t lwieske/java-8:${j}-8u${version}${k} more /etc/os-release | grep PRETTY_NAME
      docker run -i -t lwieske/java-8:${j}-8u${version}${k} java -version | grep version
      docker run -i -t lwieske/java-8:${j}-8u${version}${k} printenv JAVA_HOME
      docker rmi "lwieske/java-8:${j}-8u${version}${k}"  > /dev/null 2>&1
    done
  done
  echo ""
done
