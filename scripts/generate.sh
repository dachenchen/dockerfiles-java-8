#!/bin/bash

rm -rf jdk* jre* server-jre*

# Full Version Strings
# omitted as they complicate processing
#   1.8.0-b132
#   1.8.0_5-b13
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
  1.8.0_71-b15
  1.8.0_72-b15
  1.8.0_73-b02
  1.8.0_74-b02
  1.8.0_77-b03
  1.8.0_91-b14
  1.8.0_92-b14
  1.8.0_101-b13
  1.8.0_102-b14
)

################################################################################
# 8u00
################################################################################
for pkg in jdk jre server-jre
do
  mkdir -p 8u00/${pkg}/slim
  cat Dockerfile.${pkg}                 >8u00/${pkg}/Dockerfile
  sed -i '' -e s/_JAVAUPDATE//g          8u00/${pkg}/Dockerfile
  sed -i '' -e s/uJAVAUPDATE//g          8u00/${pkg}/Dockerfile
  sed -i '' -e s/JAVABUILD/132/g         8u00/${pkg}/Dockerfile
  cat Dockerfile.slim                   >8u00/${pkg}/slim/Dockerfile
  sed -i '' -e s/GLIBCVERSION/2.23-r3/g  8u00/${pkg}/slim/Dockerfile
  sed -i '' -e s/JAVAPACKAGE/${pkg}/g    8u00/${pkg}/slim/Dockerfile
  sed -i '' -e s/JAVAUPDATE//g           8u00/${pkg}/slim/Dockerfile
  sed -i '' -e s/u\$\{JAVA_UPDATE\}//g   8u00/${pkg}/slim/Dockerfile
  sed -i '' -e s/JAVABUILD/132/g         8u00/${pkg}/slim/Dockerfile
done

################################################################################
# 8u05
################################################################################
for pkg in jdk jre server-jre
do
  mkdir -p 8u05/${pkg}/slim
  cat Dockerfile.${pkg}                 >8u05/${pkg}/Dockerfile
  sed -i '' -e s/_JAVAUPDATE/_05/g       8u05/${pkg}/Dockerfile
  sed -i '' -e s/uJAVAUPDATE/u5/g        8u05/${pkg}/Dockerfile
  sed -i '' -e s/JAVABUILD/13/g          8u05/${pkg}/Dockerfile
  cat Dockerfile.slim                   >8u05/${pkg}/slim/Dockerfile
  sed -i '' -e s/GLIBCVERSION/2.23-r3/g  8u05/${pkg}/slim/Dockerfile
  sed -i '' -e s/JAVAPACKAGE/${pkg}/g    8u05/${pkg}/slim/Dockerfile
  sed -i '' -e s/JAVAUPDATE/5/g          8u05/${pkg}/slim/Dockerfile
  sed -i '' -e s/JAVABUILD/13/g          8u05/${pkg}/slim/Dockerfile
done

################################################################################
# 8u11...
################################################################################

updates=( )
builds=( )

length=${#versions[@]}

for (( i=0; i<${length}; i++ ));
do
    version=versions[$i]
    if [ ${#version} == 11 ]
    then
        updates[$i]=${version:6:2}
        builds[$i]=${version:10:2}
    else
        updates[$i]=${version:6:3}
        builds[$i]=${version:11:2}
    fi
done

echo $updates

exit

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
    sed -i '' -e s/JAVAUPDATE/${u}/g       8u${u}/${pkg}/Dockerfile
    sed -i '' -e s/JAVABUILD/${b}/g        8u${u}/${pkg}/Dockerfile
    cat Dockerfile.slim                   >8u${u}/${pkg}/slim/Dockerfile
    sed -i '' -e s/GLIBCVERSION/2.23-r3/g  8u${u}/${pkg}/slim/Dockerfile
    sed -i '' -e s/JAVAPACKAGE/${pkg}/g    8u${u}/${pkg}/slim/Dockerfile
    sed -i '' -e s/JAVAUPDATE/${u}/g       8u${u}/${pkg}/slim/Dockerfile
    sed -i '' -e s/JAVABUILD/${b}/g        8u${u}/${pkg}/slim/Dockerfile
  done
done
