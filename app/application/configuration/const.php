<?php

//Constantes do OASIS
//Constantes de Configuração
//Definindo a constante com endereço do sistema...
$systemName = str_ireplace('/public/index.php', '', $_SERVER['PHP_SELF']);
define('SYSTEM_PATH', "http://{$_SERVER['HTTP_HOST']}{$systemName}");
define('SYSTEM_PATH_ABSOLUTE', "{$_SERVER['DOCUMENT_ROOT']}{$systemName}");
//Constante para verificação se o sistema já esta instalado.
define("K_INSTALL", "S");
//TODO colocar na instalacao
define("K_LANGUAGE", "pt_br");
// Constante para o endereço de rodapé
define('SYSTEM_NAME', str_replace('/', '', $systemName));

// Constante Diretorio Boletos
define('BOLETO_PATH', "http://{$_SERVER['HTTP_HOST']}{$systemName}/library/Util/Boletos/");