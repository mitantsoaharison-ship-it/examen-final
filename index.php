<?php
    $adding_student = false;
    if(isset($_GET['etu'])) $adding_student = true;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page de Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <!-- Message de mise en contexte -->
        <form action="traitement-login.php" method="post">
            <?php if ($adding_student) {?>
            <div class="form-group">
                <input class="form-control" type="text" name="nom" placeholder="entrer un nom..." value="Mita">
            </div>
            <?php } ?>
            <div class="form-group">
                <input class="form-control" type="text" name="etu" value="<?= $adding_student ? $_GET['etu'] : 4635 ?>" placeholder="ETU00...">
            </div>
            <div class="form-group">
                <input class="form-control" type="submit" value="Confirmer">
            </div>
        </form>
    </div>
</body>
</html>