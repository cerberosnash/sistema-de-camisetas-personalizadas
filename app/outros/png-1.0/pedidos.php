<?php

session_start();
header('Content-type: text/json');


$out = array('totalCount' => 2,
    'pedidos' => array(array('sq_pedido' => 1,
            'cd_pedido' => '0000001'), array(
            'sq_pedido' => 2,
            'cd_pedido' => '0000002'))
);


echo json_encode($out);
?>