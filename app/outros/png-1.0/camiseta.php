<?php

ob_start('ob_gzhandler');

include 'classes/ImageEdit.php';
$img = new ImageEdit('imagens/cores/#' . $_GET['cor'] . '.png');
$img->addimage('uploads/' . $_GET["imagem"] . '.png', 310, 250);
$img->resize($_GET['tamanho']);
$img->output("png", null, 9);
?>