#!/bin/bash

echo "Bash version ${BASH_VERSION}..."

touch ./LargeFile/large.js

> ./LargeFile/large.js

for ((i=1;i<=$1;i++))
do
   echo 'var option = {Hello: "reader", This: { is: "a", weird: "formatted", text: "!",},};' >> ./LargeFile/large.js
done

echo "Finished creating file!"