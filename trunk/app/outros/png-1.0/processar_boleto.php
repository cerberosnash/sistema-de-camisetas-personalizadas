<?php

session_start();
header('Content-type: text/json');

if ($_POST['cd_pedido']) {
    $_SESSION['boleto']['cd_pedido'] = $_POST['cd_pedido'];
    $out = array(
        array('success' => true, 'proccess' => true)
    );
} else {
    $out = array(
        array('success' => false)
    );
}

echo json_encode($out);
?>