#!/bin/bash

echo "Running quickGrade!"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

time=$(date)

echo "Creating temp file..."
rm temp.txt
touch temp.txt
# line 0 of temp.txt is time
echo $time >> temp.txt


echo "Getting data..."
dFiles=(data/*)
# line 1 of temp.txt is number of test cases
cases=$(expr ${#dFiles[@]} / 2)
echo $cases >> temp.txt


echo "Getting student code..."
sFiles=(studentCode/*)
# line 2 of temp.txt is number of students
len=${#sFiles[@]}
echo $len >> temp.txt


echo "Running student code..."
for (( i=0; i<$cases; i++ )) do
    echo "Running test case $(expr $i + 1)"

    result=""
    
    input=$(cat "${dFiles[i*2]}")
    output=$(cat "${dFiles[i*2+1]}")


    for (( j=0; j<$len; j++ )) do
        stuOut=$(echo $input | java ./${sFiles[j]})

        # update to read each line
        if [ "$output" == "$stuOut" ]; then
            result="$result"P
        else
            result="$result"X
        fi
    done

    # each line is results for one test case
    echo $result >> temp.txt
done


for f in studentCode/*; do
    echo ${f%".java"} >> temp.txt
done


echo "Creating output file..."
cp -v .config/template.html "$time".html