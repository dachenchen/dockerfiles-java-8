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

#updates=(    ""  "5" )
#builds=(  "132" "13" )

updates=( )
builds=( )

length=${#versions[@]}

for (( i=0; i<${length}; i++ ));
do
  updates[$i]=${versions[$i]:6:2}
  builds[$i]=${versions[$i]:10:2}
done

length=${#updates[@]}

for (( i=1; i<${length}+1; i++ ));
do
  u=${updates[$i-1]}
  b=${builds[$i-1]}
  mkdir -p 8u${u}
  for pkg in jdk jre server-jre
  do
    mkdir -p 8u${u}/${pkg}/slim
    cat Dockerfile.${pkg}                 >8u${u}/${pkg}/Dockerfile
    sed -i '' -e s/UPDATE/${u}/g           8u${u}/${pkg}/Dockerfile
    sed -i '' -e s/BUILD/${b}/g            8u${u}/${pkg}/Dockerfile
    cat Dockerfile.slim                   >8u${u}/${pkg}/slim/Dockerfile
    sed -i '' -e s/GLIBCVERSION/2.21-r2/g  8u${u}/${pkg}/slim/Dockerfile
    sed -i '' -e s/JAVAPACKAGE/${pkg}/g    8u${u}/${pkg}/slim/Dockerfile
    sed -i '' -e s/JAVAUPDATE/${u}/g       8u${u}/${pkg}/slim/Dockerfile
    sed -i '' -e s/JAVABUILD/${b}/g        8u${u}/${pkg}/slim/Dockerfile
  done
done
