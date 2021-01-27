<?php

try {
    $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
    $db = new PDO('mysql:host=localhost;dbname=games', 'root', '', $pdo_options);
    //$sql = 'SELECT * FROM news';
    //$sql = 'SELECT auteur, titre, contenu FROM news';

    $sql = 'SELECT UPPER(nom) AS nom_maj FROM jeux_video';

    $requete = $db->query('SELECT UPPER(nom) AS nom_maj FROM jeux_video');
    while ($donnees = $requete->fetch()) {
        echo $donnees['nom_maj'] . '<br />';
    }
    $requete->closeCursor();
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}
?>