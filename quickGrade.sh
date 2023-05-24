#!/bin/bash

echo "Running quickGrade!"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

time=$(date)

echo "Creating temp file..."
touch temp.txt
# 1st line of temp.txt is time
echo $time >> temp.txt


echo "Getting data..."
dFiles=(data/*)
# 2nd line of temp.txt is number of test cases
echo ${#dFiles[@]} >> temp.txt


echo "Getting student code..."
sFiles=(studentCode/*)
# 3rd line of temp.txt is number of students
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
        stuOut="$( echo $input | java ${sFiles[j]}) "

        if [ $output == $stuOut ]; then
            result=$result+"P "
        else
            result=$result+"F "
        fi
    done

    # each line is results for one test case
    echo $result >> temp.txt
done


echo "Creating output file..."
#cp -v .config/template.html "$time".html