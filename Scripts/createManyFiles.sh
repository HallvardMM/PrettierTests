#!/bin/bash

echo "Bash version ${BASH_VERSION}..."

mkdir -p ManyFiles

rm -rf ManyFiles/*

for ((i=1;i<=$1;i++))
do
    touch "./ManyFiles/file${i}.js"
    echo 'var option = {Hello: "reader", This: { is: "a", weird: "formatted", text: "!",},};' >> "./ManyFiles/file${i}.js"
done

echo "Finished creating files!"
