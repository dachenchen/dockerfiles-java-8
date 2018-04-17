#!/usr/bin/env bash

for dir in {8u171,8u172}/{jdk,jre,server-jre} {8u171,8u171}/{jdk,jre,server-jre}/slim;
do
  echo ${dir} ; docker build ${dir}
done
