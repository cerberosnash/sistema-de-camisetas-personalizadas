<?php

session_start();
header('Content-type: text/json');

if ($_POST['email'] == 'cerberosnash@gmail.com' && $_POST['senha'] == '123456' && $_POST['captcha'] == $_SESSION['security_code']) {
    $out = array('success' => true,
        'nome' => 'Gabriela Benigno',
        'perfil' => 'Cliente');
} else {
    $out = array('success' => false);
}

echo '[' . json_encode($out) . ']';
?>
