#!/usr/bin/env bash

for dir in 8u131/*;
do
  echo ${dir}
  docker build ${dir}
done

for dir in 8u131/*/*;
do
  echo ${dir}
  docker build ${dir}
done
