#!/bin/bash

echo "Running quickGrade!"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

time=$(date)

echo "Creating temp file..."
touch temp.txt
# line 0 of temp.txt is time
echo $time >> temp.txt


echo "Getting data..."
dFiles=(data/*)
# line 1 of temp.txt is number of test cases
echo $(expr ${#dFiles[@]} / 2) >> temp.txt


echo "Getting student code..."
sFiles=(studentCode/*)
# line 2 of temp.txt is number of students
len=${#sFiles[@]}
echo $len >> temp.txt


echo "Running student code..."
for (( i=0; i<${#dFiles[@]}; i=$i+2 )) do
    result=""
    
    input=$(cat "${dFiles[i]}")
    output=$(cat "${dFiles[i+1]}")

    echo "input"+$input
    echo "output"+$output

    for (( j=0; j<$len; j++ )) do
        stuOut=$(echo $input | java ${sFiles[j]})

        # update to read each line
        if [ "$output" == "$stuOut" ]; then
            result="$result"P
        else
            result="$result"X
        fi
    done

    # each line is results for one test case
    echo ${sFiles[j]} >> temp.txt
done


for f in "$dir"/*; do
    sCode+=("$f")
    echo ${f%".java"} >> temp.txt
done


echo "Creating output file..."
cp -v .config/template.html "$time".html