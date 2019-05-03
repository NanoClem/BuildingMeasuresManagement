

<div style="padding:15px;">
    <form method="post" name="formAct" action="add_act.php">

        <h1>Ajouter un actionneur</h1>

        <!-- NOM ACTIONNEUR -->
        <label>Nom</label> : <input type="text" id="name" name="name" placeholder="Nom" size="30" required /> <br/>

        <!-- TYPE ACTIONNEUR -->
        <label>Type</label> : <input type="text" id="type" name="type" placeholder="type" size="30" required /> <br/>

        <!-- DESCRIPTION -->
        <textarea id="descr" name="descr" placeholder="Description" required></textarea> <br/>

        <!-- ZONE -->
        <label>Zone</label> : <select name="zone" size="1">
            <?php 
                require('Database.php');

                $db     = new Database();
                $query  = "SELECT nom FROM zone";
                $result = $db->select($query);

                foreach($result as $data) {
                        foreach($data as $line) {
                            echo "<option>$line</option>";
                        }
                }
            ?>
        </select> <br/> <br/>

        <input type="submit" value="Ajouter" />
    </form>
</div>

