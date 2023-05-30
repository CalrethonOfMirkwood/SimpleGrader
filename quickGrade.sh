#!/bin/bash

echo "Running quickGrade!"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

time=$(date)


echo "Getting data..."
dFiles=(data/*)
cases=$(expr ${#dFiles[@]} / 2)


echo "Getting student code..."
sFiles=(studentCode/*)
len=${#sFiles[@]}

# creating sqlite database
sqlite3 grading.db "CREATE TABLE '$time' ( id int, name varchar(30), result varchar($len));"

echo "Running student code..."
for (( i=0; i<$len; i++ )) do
    result=""

    for (( j=0; j<$cases; j++ )) do
        input=$(cat "${dFiles[i*2]}")
        output=$(cat "${dFiles[i*2+1]}")

        stuOut=$(echo $input | java ./${sFiles[i]})

        # update to read each line
        if [ "$output" == "$stuOut" ]; then
            result="$result"P
        else
            result="$result"X
        fi
    done

    # each line is results for one test case
    sqlite3 grading.db "INSERT INTO '$time' VALUES ( $i, '${sFiles[i]%".java"}', '$result');"
done

echo "Creating output file..."
cp -v .config/template.html "$time".html