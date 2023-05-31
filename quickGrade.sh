#!/bin/bash

echo "Running quickGrade!"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"


echo "Getting data..."
dFiles=(data/*)
cases=$(expr ${#dFiles[@]} / 2)


echo "Getting student code..."
cd studentCode
sFiles=(*)
cd ..
len=${#sFiles[@]}


# creating database
rm grading.sqlite
s=""
for (( i=1; i<cases+1; i++ )) {
    s="${s}, TC${i} varchar(1)"
}
sqlite3 grading.sqlite "CREATE TABLE wow (Name varchar(30), Score varchar(10)${s} );"


echo "Running student code..."
for (( i=0; i<$len; i++ )) do
    result=""
    score=0

    for (( j=0; j<$cases; j++ )) do
        input=$(cat "${dFiles[i*2]}")
        output=$(cat "${dFiles[i*2+1]}")

        stuOut=$(echo $input | java ./studentCode/${sFiles[i]})

        # update to read each line
        if [ "$output" == "$stuOut" ]; then
            result="${result}, 'P'"
            score=$(expr ${score} + 1)
        else
            result="${result}, 'X'"
        fi
    done

    # each line is results for one test case
    sqlite3 grading.sqlite "INSERT INTO wow VALUES ('${sFiles[i]%".java"}', '${score}/${cases}'${result});"
done


echo "Starting php server..."
php -S localhost:8000
