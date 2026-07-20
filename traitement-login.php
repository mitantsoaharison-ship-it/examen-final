<?php

    include('./inc/function.php');
    $etu = $_POST['etu'];
    if (isset($_POST['nom'])) ajout_membre($etu, $_POST['nom']);
    session_start();
    $_SESSION['user'] = check_login($etu);
    
    header('location: acceuil.php')

?>