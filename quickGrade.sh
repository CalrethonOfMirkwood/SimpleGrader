#!/bin/sh

$ echo Running quickGrade\!

# for each test case in data,
# 1. Save input of test case as a bash variable

data=()
dir=./data
for f in "$dir"/*.in; do
    data+=("$f")
done

code=()
dir=./studentCode
for f in "$dir"/*; do
    code+=("$f")
done

# then run it for every file in studentCode:
# 2. Run the code with input
# 3. Save the output of student code as a bash variable
# 4. Compare actual output to expected output
# 5. Update XML table