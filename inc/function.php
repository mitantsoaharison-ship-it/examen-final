<?php

function dbconnect()
{
    static $connect = null;

    if ($connect === null) {
        $connect = mysqli_connect('localhost', 'root', '', 'base');

        if (!$connect) {
            die('Erreur de connexion à la base de données : ' . mysqli_connect_error());
        }

        mysqli_set_charset($connect, 'utf8mb4');
    }

    return $connect;
}

function get_all_lines($sql){
    //echo $sql;
    $req = mysqli_query(dbconnect(),$sql );
    if (!$req) {
        die('Erreur SQL : ' . mysqli_error(dbconnect()));
    }
    $result = array();
    while ($line = mysqli_fetch_assoc($req)) {
        $result[] = $line;
    }
    mysqli_free_result($req);
    return $result;
}

function get_one_line($sql){

    $req = mysqli_query(dbconnect(),$sql );
    if (!$req) {
        die('Erreur SQL : ' . mysqli_error(dbconnect()));
    }
    $result = mysqli_fetch_assoc($req);
    mysqli_free_result($req);
    return $result;
}


function execute_query($sql)
{
    $req = mysqli_query(dbconnect(), $sql);
    if (!$req) {
        die('Erreur SQL : ' . mysqli_error(dbconnect()));
    }
    return $req;
}

function check_login($etu)
{
    $req = "SELECT * FROM membre WHERE numero_etu=".$etu;
    $membre = get_one_line($req);
    if ($membre == null) 
    {
        echo "Ajout dans la base"; // Fonction ajout dans la base
        header('location: index.php?etu='.$etu);
    }
    return $membre;
}

function ajout_membre($etu, $nom)
{
    // $req = "INSERT INTO membre VALUES ()"
    $req = "INSERT INTO membre VALUES (null, '%s', %d, null)";
    $req = sprintf($req, $nom, $etu);
    echo $req;
    execute_query($req);
}

function get_liste_produit()
{
    $req = "SELECT m.nom,
                m.numero_etu,
                p.nom AS produit,
                pm.id_produit,
                pm.prix_vente,
                pm.quantite_dispo,
                pm.date_dispo
            FROM membre m
                JOIN produit_membre pm ON m.id_membre = pm.id_membre
                JOIN produit p ON pm.id_produit = p.id_produit ORDER BY m.numero_etu;";
    $result = get_all_lines($req);
    return $result;
}