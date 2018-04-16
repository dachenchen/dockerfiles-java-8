#!/usr/bin/env bash

for dir in {8u161,8u162}/{jdk,jre,server-jre} {8u161,8u161}/{jdk,jre,server-jre}/slim;
do
  echo ${dir} ; docker build ${dir}
done
