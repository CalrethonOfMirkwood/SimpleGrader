<!DOCTYPE html>

<html>
    <head>
        <title id="title">NATM SIMPLEGRADER DEMONSTRATION</title>
        <link rel="stylesheet" type="text/css" href="./css/table.css" />
        <script type="text/javascript" src="./css/sorta.js"></script>
    </head>

    <body>
  
    <h1>SimpleGrader Output</h1>

    </br>

    <div class="table-wrapper">
    <h3>Scores:</h3>

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