<?php

session_start();
header('Content-type: text/json');

if ($_SESSION['autenticacao']['captcha']) {
    $out = array(
        array('success' => true, 'code' => $_SESSION['autenticacao']['captcha'])
    );
} else {
    $out = array(
        array('success' => false)
    );
}

echo json_encode($out);
?>