#!/bin/bash

rm -rf jdk* jre* server-jre*

# Full Version Strings
versions=(
  1.8.0_11-b12
  1.8.0_20-b26
  1.8.0_25-b17
  1.8.0_31-b13
  1.8.0_40-b26
  1.8.0_45-b14
  1.8.0_51-b16
  1.8.0_60-b27
  1.8.0_65-b17
  1.8.0_66-b17
)

updates=(    "" "u5" )
builds=(  "132" "13" )

length=${#versions[@]}+1

for (( i=2; i<${length}+1; i++ ));
do
  updates[$i]="u"${versions[$i-2]:6:2}
  builds[$i]=${versions[$i-2]:10:2}
done

length=${#updates[@]}

for (( i=1; i<${length}+1; i++ ));
do
  u=${updates[$i-1]}
  b=${builds[$i-1]}
  echo "/ U = " ${u} "/ B = " ${b}
  mkdir jdk-8${u} jre-8${u} server-jre-8${u}
  cat Dockerfile.jdk           >jdk-8${u}/Dockerfile
  sed -i '' -e s/UPDATE/${u}/g  jdk-8${u}/Dockerfile
  sed -i '' -e s/BUILD/${b}/g   jdk-8${u}/Dockerfile
  cat Dockerfile.jre           >jre-8${u}/Dockerfile
  sed -i '' -e s/UPDATE/${u}/g  jre-8${u}/Dockerfile
  sed -i '' -e s/BUILD/${b}/g   jre-8${u}/Dockerfile
  cat Dockerfile.server-jre    >server-jre-8${u}/Dockerfile
  sed -i '' -e s/UPDATE/${u}/g  server-jre-8${u}/Dockerfile
  sed -i '' -e s/BUILD/${b}/g   server-jre-8${u}/Dockerfile
done
