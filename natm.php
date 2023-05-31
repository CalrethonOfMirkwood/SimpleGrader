<!DOCTYPE html>

<html>
    <head>
        <title id="title">NATM SIMPLEGRADER DEMONSTRATION</title>
    </head>

    <body>
  
    <h1>NATM SIMPLEGRADER DEMONSTRATION</h1>

    <p>Your task is simple.  Write a java program where, given three side lengths of a possible triangle, you must determine whether or not the triangle is valid.</br>
    Print "true" if valid triangle and "false" if invalid triangle.
    </p>
    
    </br>

    <p>For example: </br>

    <strong>INPUT:</strong></br>
    3 2 4</br>

    <strong>OUTPUT:</strong></br>
    false
    </p>

    <h2><strong><em>Are you up for the challenge?</em></strong></h2>


    <h3>Scoreboard:</h3>

    <?php
        $db = new SQLite3('grading.sqlite');
        $query = $db->query('SELECT * FROM wow');
        
        $firstRow = true;
        echo '<div class="table-responsive"><table class="table">';
        while ($row = $query->fetchArray(SQLITE3_ASSOC)) {
            if ($firstRow) {
                echo '<thead><tr>';
                foreach ($row as $key => $value) {
                    echo '<th>'.$key.'</th>';
                }
                echo '</tr></thead>';
                echo '<tbody>';
                $firstRow = false;
            }
        
            echo '<tr>';
            foreach ($row as $value) {
                echo '<td>'.$value.'</td>';
            }
            echo '</tr>';
        }
        echo '</tbody>';
        echo '</table></div>';

    ?>

    </body>

</html>