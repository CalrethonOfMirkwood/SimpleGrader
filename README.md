# SimpleGrader

A simple grader designed for my CSA class.  CSA tri3 final project.


## Overview

This program runs 

`css/` contains javascript and css files (modificaiton optional)
`data/` will contain the test cases.  **YOU MUST PREPARE YOUR OWN TEST CASE DATA\***
`studentCode/` will contain the students' code. **YOU MUST MOVE IN THE FILES YOU WANT TO GRADE**
`simpleGrader.sh` is the script that will run the grader and the php server that displays grading output
`index.php` is the php file that will display the output
`grading.splite` will be created when the program is run, and will contain a table with grading output that the php server will read

*\*See step 1 below for specific instructions for creating test cases*

## How to run

1. Create test case datasets, put them in `data/`
- The input/output pair must have the same filename, and the file extensions must be `.in` and `.out` respectively
- Test cases will be run in alphanumerical order

2. Get student code and put in `studentCode/`
- Students will be sorted and displayed in alphabetical order of the filename

3. Run `simpleGrader.sh`.  Move to step 4 once the php server has started. (there will be a console notification)

4. In a browser, go to `localhost:8000/`.  You should see the grading output.

^ It's a simple as that!