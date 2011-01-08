<?php

session_start();
include 'classes/ImageEdit.php';
if (!$_SESSION['upload']['cor']) {
    $_SESSION['upload']['cor'] = 'ffffff';
}
if ($_SESSION['upload']['imagem']) {
    $img = new ImageEdit('imagens/cores/#' . $_SESSION['upload']['cor'] . '.png');
    if ($_GET["imagem"]) {
        $_SESSION['upload']['imagem'] = $_GET["imagem"];
    }

    $img->addimage('uploads/' . $_SESSION['upload']['imagem'], 310, 250);

    $img->resize($_GET['tamanho']);
    $img->output("png", null, 9);
}
?>