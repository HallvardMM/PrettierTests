#!/bin/bash

echo "Bash version ${BASH_VERSION}..."
echo "This creates five times as many files :)"

mkdir -p ManyDifferentFiles

rm -rf ManyDifferentFiles/*

for ((i=1;i<=$1;i++))
do
    touch "./ManyDifferentFiles/file${i}.js"
    echo 'var option = {Hello: "reader", This: { is: "a", weird: "formatted", text: "!",},};' >> "./ManyDifferentFiles/file${i}.js"
    touch "./ManyDifferentFiles/file${i}.md"
    echo '_Look,_ mark *down* is formatted *too!*' >> "./ManyDifferentFiles/file${i}.md"
    touch "./ManyDifferentFiles/file${i}.css"
    echo ".center {text-align: center;color: red;}" >> "./ManyDifferentFiles/file${i}.css"
    touch "./ManyDifferentFiles/file${i}.json"
    echo '{ "allOn": "Single", "Line": "example", "Is": "cool", "needs": "to", "be": "longer"}' >> "./ManyDifferentFiles/file${i}.json"
    touch "./ManyDifferentFiles/file${i}.ts"
    echo 'interface MyInterface {foo(): string,bar: Array<number>,}' >> "./ManyDifferentFiles/file${i}.ts"


done

echo "Finished creating files!"
