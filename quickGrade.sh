#!/bin/bash

echo "Running quickGrade!"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

time=$(date)


echo "Creating temp file..."
len=${#sCode[@]}
touch temp.txt
echo $time >> temp.txt


echo "Getting data..."
files=()
data=./data
for f in "$data"/*.in; do
    files+=("$f")
done
echo ${#files[@]} >> temp.txt


echo "Getting student code..."
data=()
dir=./studentCode
for f in "$dir"/*; do
    sCode+=("$f")
    echo ${f%".java"} >> temp.txt
done


echo "Running student code..."
for (( i=0; i<${#files[@]}; i=$i+2 ))
do
    result=""

    input="${#files[i]}"
    output="${#files[i+1]}"

    for (( j=0; j<$len; j++ ))
        do
        stuOut="$(echo $input| java -cp ${#files[i]} 2>&1 )"
        
        if [ "$output" == "$stuOut" ]; then
            result="$result"+"P "
        else
            result="$result"+"F "
        fi
        done

    echo "$result" >> temp.txt
    unset result
done



echo "Creating output file..."
cp -v .config/template.html "$time".html