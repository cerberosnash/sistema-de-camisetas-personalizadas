<?php

session_start();
$_SESSION['cliente']["success"] = true;
$_SESSION['cliente']["nome"] = "Michael Fernandes Rodrigues";
$_SESSION['cliente']["cpf"] = "737.623.851-49";
$_SESSION['cliente']["ddd_residencial"] = "061";
$_SESSION['cliente']["tel_residencial"] = "3434-6810";
$_SESSION['cliente']["ddd_celular"] = "061";
$_SESSION['cliente']["tel_celular"] = "9145-5842";
$_SESSION['cliente']["uf"] = "Distrito Federal";
$_SESSION['cliente']["municipio"] = "Recanto das Emas";
$_SESSION['cliente']["cep"] = "72610-512";
$_SESSION['cliente']["endereco"] = "Quadra 205 Conjunto 12 Casa 06";
$_SESSION['cliente']["email"] = "cerberosnash@gmail.com";
$_SESSION['cliente']["senha"] = "123456";
//$_SESSION['cliente']["acVDEmail"] = "cerberosnash@gmail.com";
//$_SESSION['cliente']["acVDSenha"] = "123456";
//$_SESSION['cliente']["acCaptcha"] = "9657";


if ($POST['salvar']) {
    $_SESSION['cliente']["success"] = true;
    $_SESSION['cliente']["nome"] = $_POST['acNome'];
    $_SESSION['cliente']["cpf"] = $_POST['acCPF'];
    $_SESSION['cliente']["ddd_residencial"] = $_POST['acDDResidencial'];
    $_SESSION['cliente']["tel_residencial"] = $_POST['acNUResidencial'];
    $_SESSION['cliente']["ddd_celular"] = $_POST['acDDCelular'];
    $_SESSION['cliente']["tel_celular"] = $_POST['acNUCelular'];
    $_SESSION['cliente']["uf"] = $_POST['acUF'];
    $_SESSION['cliente']["municipio"] = $_POST['acMunicipio'];
    $_SESSION['cliente']["cep"] = $_POST['acCEP'];
    $_SESSION['cliente']["endereco"] = $_POST['acEndereco'];
    $_SESSION['cliente']["email"] = $_POST['acEmail'];
    $_SESSION['cliente']["senha"] = $_POST['acSenha'];
} else {
    echo '(' . json_encode($_SESSION) . ')';
}
?>