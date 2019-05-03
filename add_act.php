<?php 
    require("Database.php");


    /**
     * REDIRECTION 404
     */
    function redirect404()
    {
        header('HTTP/1.0 404 Not Found');
        exit();
    }


    /**
     * INSERTION DE DONNEES DANS LA TABLE Actionneur
     */
    function insertAct()
    {
        $dataAct = [
            'name'        => $_POST['name'],
            'type'        => $_POST['type'],
            'description' => $_POST['descr'],
        ];

       $db    = new Database();
       $query = "INSERT INTO actionneur(nom, type_actionneur, description) VALUES (:name, :type, :description)";
       $db->insert($query, $dataAct);
    }


    /**
     * INSERTION DE DONNEES DANS LA TABLE Actionneur2Zone
     */
    function insertLinkToZone($data)
    {
        $db        = new Database();
        $act       = $data['actName'];
        $zone      = $data['zone'];
        $tmp       = [];

        $query   = "SELECT AZ.id_actionneur, AZ.id_zone 
                    FROM actionneur A JOIN actionneur2zone AZ ON A.id_actionneur=AZ.id_actionneur
                                      JOIN zone Z ON AZ.id_zone=Z.id_zone
                    WHERE A.nom ='$act'";

        $result  = $db->select($query);
        foreach($result as $lines) {
            $tmp = $lines;
        }

        $query = "INSERT INTO actionneur2zone(id_actionneur, id_zone) VALUES(:id_actionneur, :id_zone)";
        $db->insert($query, $tmp);
    }


    if(!empty($_POST)) 
    {
        // $dataLink = [
        //     'actName' => $_POST['name'],
        //     'zone'   => $_POST['zone']
        // ];

        insertAct();
        //insertLinkToZone($dataLink);      // Ne semble pas fonctionner avec les insertion a la suite

        unset($_POST);
        header('Location: gestion_batiment.php?page=3');   // Refresh de la page
        exit();
    }
    else {
        redirect404();
    }

?>