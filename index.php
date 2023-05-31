<!DOCTYPE html>

<html>
    <head>
        <title id="title">Grading output</title>
    </head>

    <body>
  
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
