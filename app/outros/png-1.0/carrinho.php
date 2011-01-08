<?php

session_start();
header('Content-type: text/json');

$path = "uploads/";
$d = dir($path);

$tamanho[0] = 'Pequena';
$tamanho[1] = 'Media';
$tamanho[2] = 'Grande';

$camisetas = array(
    '000000', //preto
    '1bbc81', //verde-limao
    '34a4c4', //verde-claro
    '171c46', //azul-escuro
    '344ca3', //azul-claro
    '520b0b', //marron
    '174621', //verde-escuro
    '717171', //cinza
    'a7bc1b', //amarelo-limao
    'a3346b', //rosa
    'a33434', //vermelho-suave
    'd83200', //laranja
    'f6d600', //amarelo
    'f60000', //vermelho
    'ffffff', //branco
);

$_SESSION['carrinho']['camiseta'];
$_POST['limit'] = 13;

//if ($_POST['acao'] == 'carregar-antigo') {
//    while ($name = $d->read()) {
//        $cont++;
//
//        if (!preg_match('/\.(jpg|gif|png)$/', $name)) {
//            continue;
//        }
//        $size = filesize($path . $name);
//        $lastmod = filemtime($path . $name) * 1000;
//        if ($cont <= $_POST['limit']) {
//            $id = $camisetas[$cont];
//            $q = $_SESSION['carrinho']['camiseta']['id'][$id] ? $_SESSION['carrinho']['camiseta']['id'][$id] : 1;
//            $images[] = array(
//                'id' => $id,
//                'nome' => $camisetas[rand(0, 13)],
//                'tamanho' => $tamanho[rand(0, 2)],
//                'cor' => $camisetas[rand(0, 13)],
//                'valor' => rand(24, 49) . '.99',
//                'quantidade' => $q,
//                'descricao' => md5(rand())
//            );
//        }
//    }
//    $d->close();
//
//    $o = array('totalCount' => $cont, 'images' => $images);
//
//    echo json_encode($o);
//}

if ($_POST['acao'] == 'carregar') {
    $cont = 0;
    // $images = null;
    while ($name = $d->read()) {
        if (!preg_match('/\.(jpg|gif|png)$/', $name)) {
            continue;
        }
        $id = substr($name, 0, 32);

        $size = filesize($path . $name);
        $lastmod = filemtime($path . $name) * 1000;
        if ($cont <= $_POST['limit'] && isset($_SESSION['carrinho']['camiseta'][$id]['id'])) {
            $cont++;
            $q = $_SESSION['carrinho']['camiseta'][$id]['quantidade'] ? $_SESSION['carrinho']['camiseta'][$id]['quantidade'] : 1;
            $images[] = array(
                'id' => $id,
                'nome' => $id,
                'tamanho' => $tamanho[rand(0, 2)],
                'cor' => $camisetas[rand(0, 13)],
                'valor' => rand(24, 49) . '.99',
                'quantidade' => $q,
                'descricao' => md5(rand())
            );
        }
    }

    if ($cont == 0) {
        $images = '';
    }

    $d->close();
    $o = array('totalCount' => $cont, 'totalCarrinho' => getTotalCarrinho(), 'images' => $images);
    echo json_encode($o);
}

if ($_POST['acao'] == 'quantidade') {
    if ($_POST['id'] && $_POST['quantidade']) {
        $_SESSION['carrinho']['camiseta'][$_POST['id']]['quantidade'] = $_POST['quantidade'];
        $o = array('success' => true, 'id' => $_POST['id'], 'quantidade' => $_SESSION['carrinho']['camiseta'][$_POST['id']]['quantidade']);
        echo '(' . json_encode($o) . ')';
    } else {
        $o = array('success' => false);
        echo '(' . json_encode($o) . ')';
    }
}

if ($_POST['acao'] == 'finalizar') {
    unset($_SESSION['carrinho']['camiseta']);
    $o = array('success' => true);
    echo '(' . json_encode($o) . ')';
}

if ($_POST['acao'] == 'remover') {
    if ($_POST['id']) {
        unset($_SESSION['carrinho']['camiseta'][$_POST['id']]);
        $o = array('success' => true, 'id' => $_SESSION['carrinho']['camiseta'][$_POST['id']]['id']);
        echo '(' . json_encode($o) . ')';
    } else {
        $o = array('success' => false);
        echo '(' . json_encode($o) . ')';
    }
}

if ($_POST['acao'] == 'adicionar') {
    if ($_POST['id']) {
        if ($_SESSION['carrinho']['camiseta'][$_POST['id']]['id']) {
            $_SESSION['carrinho']['camiseta'][$_POST['id']]['id'] = $_POST['id'];
            $_SESSION['carrinho']['camiseta'][$_POST['id']]['quantidade']++;
        } else {
            $_SESSION['carrinho']['camiseta'][$_POST['id']]['id'] = $_POST['id'];
            $_SESSION['carrinho']['camiseta'][$_POST['id']]['quantidade'] = 1;
        }
        $o = array('success' => true, 'id' => $_POST['id'], 'quantidade' => $_SESSION['carrinho']['camiseta'][$_POST['id']]['quantidade']);
    } else {
        $o = array('success' => false);
    }
    echo '(' . json_encode($o) . ')';
}

function getTotalCarrinho() {
    $total = 0;
    $base = 24.99;
    if (isset($_SESSION['carrinho']['camiseta'])) {
        foreach ($_SESSION['carrinho']['camiseta'] as $key => $value) {
            $aux = ($_SESSION['carrinho']['camiseta'][$key]['quantidade'] * $base);
            $total = ($total + $aux);
        }
    }
    return $total;
}
?>