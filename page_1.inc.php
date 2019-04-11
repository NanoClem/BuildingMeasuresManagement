<?php
  require('Database.php');

  if( isset($_GET['salle']) )
  {
    $db    = new Database();
    $salle = $_GET['salle'];

    // CAPTEURS DANS LA ZONE
    $sqlCapt = "SELECT id_capteur, C.nom, type_capteur, unite
                FROM capteur C JOIN zone Z ON C.id_zone=Z.id_zone
                WHERE Z.nom = '$salle'";

    // ACTIONNEURS DANS LA ZONE
    $sqlAct = "SELECT A.id_actionneur, A.nom, type_actionneur, description
               FROM actionneur A JOIN actionneur2zone AZ ON A.id_actionneur=AZ.id_actionneur
                                 JOIN zone Z ON AZ.id_zone=Z.id_zone
               WHERE Z.nom = '$salle'";


    // MISE EN FORME
    echo '<div style="float:left; padding:18px; display:inline-block;">';
    echo    '<h3>CAPTEURS</h3>';
    echo    $db->printQuery($sqlCapt);
    echo '</div> <br/>';

    echo '<div style="display:inline-block;">';
    echo    '<h3>ACTIONNEURS</h3>';
    echo    $db->printQuery($sqlAct);
    echo '</div> <br/>';
    echo '<br/> <br/>';
  }
?>

<style>
<?php include 'page_1.inc.css'; ?>
</style>

<ul id="etage2">
<li id="c206"><a href="?page=1&salle=C206"><span>c206</span></a></li>
<li id="c207"><a href="?page=1&salle=C207"><span>c207</span></a></li>
<li id="c208"><a href="?page=1&salle=C208"><span>c208</span></a></li>
<li id="c209"><a href="?page=1&salle=C209"><span>c209</span></a></li>
<li id="c210"><a href="?page=1&salle=C210"><span>c210</span></a></li>
<li id="c213"><a href="?page=1&salle=C213"><span>c213</span></a></li>
<li id="c214"><a href="?page=1&salle=C214"><span>c214</span></a></li>
<li id="c215"><a href="?page=1&salle=C215"><span>c215</span></a></li>
</ul>
