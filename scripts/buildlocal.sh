#!/usr/bin/env bash

for dir in 8u181/{jdk,jre,server-jre} 8u181/{jdk,jre,server-jre}/slim;
do
  echo ${dir} ; docker build ${dir}
done
