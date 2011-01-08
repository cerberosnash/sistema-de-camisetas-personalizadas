<?php

header('Content-type: text/json');

if ($_POST['sq_uf'] == 1) {
    $out = array('totalCount' => 2,
        'municipios' => array(array('sq_municipio' => 1,
                'nm_municipio' => 'Recanto das Emas'), array(
                'sq_municipio' => 2,
                'nm_municipio' => 'Riacho Fundo'))
    );
}

echo json_encode($out);
?>