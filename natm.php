<!DOCTYPE html>

<html>
    <head>
        <title id="title">NATM SIMPLEGRADER DEMONSTRATION</title>
        <link rel="stylesheet" type="text/css" href="./css/table.css" />
        <script type="text/javascript" src="./css/sorta.js"></script>
    </head>

    <body>
  
    <h1>NATM SIMPLEGRADER DEMONSTRATION</h1>

    <div>
        <p>Your task is simple.  Write a java program where, given three side lengths of a possible triangle, you must determine whether or not the triangle is valid.</br>
        Print "true" if valid triangle and "false" if invalid triangle.
        </p>
    </div>

    <div>
        <p>For example: </br>

        <strong>INPUT:</strong></br>
        3 2 4</br>

        <strong>OUTPUT:</strong></br>
        false
        </p>
    </div>

    <h2><strong><em>Are you up for the challenge?</em></strong></h2>

    <div class="table-wrapper">
    <h3>Scoreboard:</h3>

    <?php
        $db = new SQLite3('grading.sqlite');
        $query = $db->query('SELECT * FROM wow');
        
        $firstRow = true;
        echo '<table class="fl-table" id="sorttable">';
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
        echo '</table>';
        echo '</div>';

    ?>

    <script>
        sorta(document.getElementById("sorttable"));
    </script>

    </body>

</html>