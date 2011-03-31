<?php

// Constantes do Sistema
$systemName = str_ireplace('/public/index.php', '', $_SERVER['PHP_SELF']);
define('SYSTEM_PATH', "http://{$_SERVER['HTTP_HOST']}{$systemName}");
define('SYSTEM_PATH_ABSOLUTE', "{$_SERVER['DOCUMENT_ROOT']}{$systemName}");
define('SYSTEM_NAME', str_replace('/', '', $systemName));
define('BOLETO_PATH', "http://{$_SERVER['HTTP_HOST']}{$systemName}/library/Util/Boletos/");

// Constantes PHPMAILER
define('SYSTEM_EMAIL_USER', "sistema.camisetas.personalizadas@gmail.com");
define('SYSTEM_EMAIL_PASS', "doctrine");
define('SYSTEM_EMAIL_ADDRESS_FROM', "sistema.camisetas.personalizadas@gmail.com");
define('SYSTEM_EMAIL_NAME_FROM', "Camisetas Personalizadas");
define('SYSTEM_SMTP_HOST', "ssl://smtp.gmail.com");
define('SYSTEM_SMTP_PORT', 465);
define('SYSTEM_SMTP_DEBUGGER', false);
define('SYSTEM_EMAIL_TEMPLATES', SYSTEM_PATH_ABSOLUTE . '/public/templates/email/');

//Constantes PHPJasperXML
define('PHPJasperXML_HOST', "localhost");
define('PHPJasperXML_DB', "camisetas");
define('PHPJasperXML_USER', "postgres");
define('PHPJasperXML_PASS', "postgres");
define('PHPJasperXML_DRIVER', "psql");
define('PHPJasperXML_PORT', 5432);
define('PHPJasperXML_VERSION', "0.7c");
define('PHPJasperXML_LIBPDF', "fpdf");