<?php

    include('./inc/function.php');
    $liste = get_liste_produit();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acceuil</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
    <div class="d-flex flex-wrap gap-3 justify-content-start">
    <table class="table">
        <thead>
            <tr>
                <th>Produit</th>
                <th>Prix</th>
                <th>Quantité</th>
                <th>Etudiant</th>
                <th>Acheter</th>
            </tr>
        </thead>
        <tbody>
    <?php foreach ($liste as $produit) { ?>
            <tr>
                <td><?= $produit['produit'] ?></td>
                <td><?= $produit['prix_vente'] ?></td>
                <td><?= $produit['quantite_dispo'] ?></td>
                <td><?= $produit['nom'] ?></td>
                <td> <a href="traitement-achat.php?id='<?= $produit['id_produit'] ?>'">Achat</a></td>
            </tr>
        <?php } ?>
            </tbody>
        </table>
</div>
    </div>
</body>
</html>