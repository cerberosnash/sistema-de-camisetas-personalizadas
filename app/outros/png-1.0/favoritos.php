<?php

session_start();
header('Content-type: text/json');
$path = "favoritos/";
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

if ($_POST['acao'] == 'carregar') {
    $cont = 0;
    while ($name = $d->read()) {
        $cont++;
        //$images = null;
        $id = substr($name, 0, 32);
        if (!preg_match('/\.(png)$/', $name)) {
            continue;
        }
        $size = filesize($path . $name);
        $lastmod = filemtime($path . $name) * 1000;
        if ($cont <= $_POST['limit']) {
            $images[] = array(
                'id' => $id,
                'nome' => $id,
                'tamanho' => $tamanho[rand(0, 2)],
                'cor' => $camisetas[rand(0, 0)],
                'valor' => rand(24, 49) . '.99',
                'criacao' => $lastmod,
                'vendidas' => rand(1, 200),
                'descricao' => md5(rand())
            );
        }
    }

    if ($cont == 0) {
        $images = '';
    }

    $d->close();

    $o = array('totalCount' => $cont, 'images' => $images);

    echo json_encode($o);
}

if ($_POST['acao'] == 'remover') {
    if ($_POST['id']) {
        unset($_SESSION['carrinho'][$_POST['id']]);
        $o = array('success' => true, 'id' => $_POST['id']);
        echo '(' . json_encode($o) . ')';
    } else {
        $o = array('success' => false);
        echo '(' . json_encode($o) . ')';
    }
}

if ($_POST['acao'] == 'adicionar') {
    if ($_POST['id']) {
        $o = array('success' => true, 'id' => $_POST['id']);
    } else {
        $o = array('success' => false);
    }
    echo '(' . json_encode($o) . ')';
}
?>