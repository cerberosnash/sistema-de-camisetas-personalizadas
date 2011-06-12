<?php

// Constantes do Sistema
$systemName = str_ireplace('/public/index.php', '', $_SERVER['PHP_SELF']);
define('SYSTEM_PATH', "http://{$_SERVER['HTTP_HOST']}{$systemName}");
define('SYSTEM_PATH_ABSOLUTE', "{$_SERVER['DOCUMENT_ROOT']}{$systemName}");
define('SYSTEM_NAME', str_replace('/', '', $systemName));
define('BOLETO_PATH', "http://{$_SERVER['HTTP_HOST']}{$systemName}/library/Util/Boletos/");
define('CONFIG_PATH', SYSTEM_PATH_ABSOLUTE . "/application/configuration/");

//Informacoes da Empresa
define('NOME_EMPRESA', "Camisetas Personalizadas");
define('TELEFONE_EMPRESA', "(61) 9145-5842");
define('ENDERECO_EMPRESA', "Av. Vitoria e Conquista eh so querer Loja 1-15");
define('MUNICIPIO_EMPRESA', "Recanto das Emas");
define('UF_EMPRESA', "Distrito Federal");
define('CNPJ_EMPRESA', "12.610.417/0001-94");

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

//Rastramento de Correspondencias do Correio
define('URL_SEARCH_CORREIOS', 'http://websro.correios.com.br/sro_bin/txect01$.Inexistente?P_LINGUA=001&P_TIPO=002&P_COD_LIS=');

//Email suporte ao Cliente
define('EMAIL_SUPPORT_CLIENT', "sistema.camisetas.personalizadas@gmail.com");

//Preco padrao para camisetas criadas pelos clientes
define('PRICE_DEFAULT_CAMISETA', 29.99);