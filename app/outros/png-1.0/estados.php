<?php

header('Content-type: text/json');
$out = array('totalCount' => 27,
    'estados' => array('sq_uf' => 1,
        'nm_uf' => 'Distrito Federal')
);

echo json_encode($out);
?>
