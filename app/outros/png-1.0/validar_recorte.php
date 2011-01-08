<?php

session_start();
header('Content-type: text/json');

if ($_SESSION['upload']['crop']) {
    $out = array('success' => $_SESSION['upload']['crop']);
} else {
    $out = array('success' => false);
}

echo '(' . json_encode($out) . ')';
?>