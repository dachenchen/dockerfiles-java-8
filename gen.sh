#!/bin/bash

updates=("" "u5" "u11" "u20" "u25" "u31" "u40" "u45" "u51" "u60")
builds=("132" "5" "12" "26" "17" "13" "26" "14" "16" "27")

length=${#updates[@]}

for (( i=1; i<${length}+1; i++ ));
do
  u=${updates[$i-1]}
  b=${builds[$i-1]}
  mkdir jdk-8${u} jre-8${u} server-jre-8${u}
  cat Dockerfile.jdk        >jdk-8${u}/Dockerfile
  sed -i '' -e s/UPDATE/${u}/g   jdk-8${u}/Dockerfile
  sed -i '' -e s/BUILD/${b}/g    jdk-8${u}/Dockerfile
  cat Dockerfile.jre        >jre-8${u}/Dockerfile
  sed -i '' -e s/UPDATE/${u}/g   jre-8${u}/Dockerfile
  sed -i '' -e s/BUILD/${b}/g    jre-8${u}/Dockerfile
  cat Dockerfile.server-jre >server-jre-8${u}/Dockerfile
  sed -i '' -e s/UPDATE/${u}/g   server-jre-8${u}/Dockerfile
  sed -i '' -e s/BUILD/${b}/g    server-jre-8${u}/Dockerfile
done
