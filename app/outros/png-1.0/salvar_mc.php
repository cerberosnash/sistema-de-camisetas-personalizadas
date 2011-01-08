<?php

session_start();
header('Content-type: text/json');

if ($_SESSION['upload']['crop'] === true) {
    if ($_POST['tamanho'] && $_POST['cor'] && $_POST['nome'] && $_POST['descricao'] && $_SESSION['upload']['imagem']) {
        $out = array('success' => true,
            'crop' => true, 'id' => substr($_SESSION['upload']['imagem'], 0, 32));
        unset($_SESSION['upload']['imagem']);
    } else {
        $out = array('success' => false,
            'crop' => true);
    }
} else {
    $out = array('success' => false,
        'crop' => false);
}

echo '(' . json_encode($out) . ')';
?>