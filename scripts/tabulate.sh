#!/bin/bash

# Short Version Numbers
versions=(
  "00"
  "05"
  "11"
  "20"
  "25"
  "31"
  "40"
  "45"
  "51"
  "60"
  "65"
  "66"
  "71"
  "72"
  "73"
  "74"
  "77"
)

length=${#versions[@]}

for (( i=0; i<${length}; i++ ));
do
  version=${versions[length-$i-1]}
  echo "### 8u${version}"
  echo ""
  echo "| Image | Badge |"
  echo "| ----- | ----- |"
  for j in "jdk" "jre" "server-jre"
  do
    for k in "" "-slim"
    do
      docker pull "lwieske/java-8:${j}-8u${version}${k}" > /dev/null 2>&1
      size=`docker images "lwieske/java-8:${j}-8u${version}${k}" | tail -1 | awk '{printf "%3.0f\n", $7}'`
      docker rmi "lwieske/java-8:${j}-8u${version}${k}"  > /dev/null 2>&1
      echo "| lwieske/java-8:${j}-8u${version}${k} | [![](https://img.shields.io/badge/size-${size}MB-blue.svg)]() |"
    done
  done
  echo ""
done
