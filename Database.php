<?php
  require('config_bd.php');


  class Database {

    public $PDO_BDD;


    /**
     * CONSTRUCTEUR DE CLASSE Database
     * Construit l'objet PDO et le connecte a la BDD
     */
    public function __construct() {
      $this->connect();
    }


    /**
     * DESTRUCTEUR DE CLASSE Database
     * Deconnecte de la BDD l'objet PDO
     */
    public function __destruct() {
      $this->disconnect();
    }


    /**
     * CONNEXION A LA BASE DE DONNEES
     * Nouvel objet PDO avec gestion d'erreurs
     */
    private function connect() {
      try {
        $this->PDO_BDD = new PDO('mysql:host='.DB_HOST.';port='.DB_PORT.';dbname='.DB_DATABASE, DB_USERNAME, DB_PASSWORD);
        $this->PDO_BDD->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);   // rapport d'erreurs : emet des exceptions
        $this->PDO_BDD->exec("SET NAMES 'utf8'");                                  // codage utilise
      }
      catch(Exception $e) {
        echo 'Erreur : '.$e->getMessag().'<br/>';
        echo 'N° : '.$e->getCode();
        exit();
      }
    }


    /**
     * SELECTIONNE LES DONNEES ISSUES DE LA REQUETE
     * @return : renvoie le resultat sous forme de tableau associatif
     */
    public function queryDB($sql) {
      try {
        $query = $this->PDO_BDD->prepare($sql);   // preparation de la requete (contre les injections)
        $query->execute();                        // execution de la requete
      }
      catch(Exception $e) {
        die('<div style="font-weight:bold; color:red">Erreur : '.$e->getMessage().'</div>');
      }

      return $query->fetchAll(PDO::FETCH_ASSOC);  // chaque ligne est un tableau indexe
    }


    /**
     * FERMER LA CONNEXION
     */
    public function disconnect()
    {
      $this->PDO_BDD = null;
    }


    /**
     * AFFICHE LES CAPTEURS PRESENTS DANS UNE ZONE
     * @param area : zone dont on recherche les capteurs
     */
    public function printQuery($sql) {

      // EXECUTION DE LA REQUETE
      $dataTab = $this->queryDB($sql);

      // AFFICHAGE DES RESULTATS
      echo '<table style="text-align:left; border-collapse:separate;  border-spacing:8px 8px;">
              <tr>
                <th>ID</th> <th>Nom</th> <th>Type</th> <th>Description / Unite</th>
              </tr>';
        foreach($dataTab as $line) {
          echo '<tr>';
            foreach($line as $data)
              echo '<td>'.$data.'</td>';
          echo '</tr>';
        }
      echo '</table>';
    }


    /**
     * AFFICHE LES ACTIONNEURS DANS UNE ZONE
     *
     */


  }

?>
