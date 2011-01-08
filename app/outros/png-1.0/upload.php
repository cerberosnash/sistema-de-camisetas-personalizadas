<?php

include "classes/m2brimagem.php";
session_start();

ini_set("memory_limit", "250M");
set_time_limit(0);
$md5 = md5(microtime() . rand(1, 99999999)) . '.png';
$imagem = isset($_FILES['imagem']) ? $_FILES['imagem'] : NULL;
if ($imagem['tmp_name']) {
    $imagesize = getimagesize($imagem['tmp_name']);
    if ($imagesize !== false) {
        if (move_uploaded_file($imagem['tmp_name'], 'temp/' . $md5)) {
            $oImg = new m2brimagem('temp/', $md5);
            if ($oImg->valida() == 'OK') {
                $oImg->grava('temp/', $md5);
                $_SESSION['upload']['imagem'] = $md5;
            }
        }
    }
}

$out = array('success' => true,
    'file' => $_SESSION['upload']['imagem']);

echo json_encode($out);
?>