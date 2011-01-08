<?php

session_start();
$_SESSION['upload']['crop'] = false;

if ($_POST) {
    include "classes/m2brimagem.php";
    $oImg = new m2brimagem('temp', $_SESSION['upload']['imagem']);
   // echo $oImg->valida();
    if ($oImg->valida() == 'OK') {
        $oImg->posicaoCrop($_POST['x'], $_POST['y']);
        $oImg->redimensiona($_POST['w'], $_POST['h'], 'crop');
        $oImg->redimensiona(420, 525, '');
        $oImg->grava('uploads', $_SESSION['upload']['imagem']);
        $_SESSION['upload']['crop'] = true;
    }
}



$out = array('success' => $_SESSION['upload']['crop']);

header('Content-type: text/json');
echo json_encode($out);
?>