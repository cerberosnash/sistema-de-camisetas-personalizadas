<?php

session_start();
header('Content-type: text/json');

if ($_POST['email'] && ($_POST['captcha'] == $_SESSION['security_code'])) {
    $out = array('success' => true);
} else {
    $out = array('success' => false);
}

echo '[' . json_encode($out) . ']';
?>