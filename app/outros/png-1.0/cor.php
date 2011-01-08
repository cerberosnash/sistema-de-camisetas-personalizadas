<?php

session_start();
header('Content-type: text/json');
if ($_POST['cor'] && $_SESSION['upload']['crop']) {
    $_SESSION['upload']['cor'] = $_POST['cor'];
    $out = array('success' => true, 'cor' => $_SESSION['upload']['cor']);
} else {
    $_SESSION['upload']['cor'] = 'ffffff';
    $out = array('success' => false, 'cor' => $_SESSION['upload']['cor']);
}

echo '(' . json_encode($out) . ')';
?>