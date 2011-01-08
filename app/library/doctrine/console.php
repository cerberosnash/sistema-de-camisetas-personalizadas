<?php

try {
    define('DSN', 'pgsql://postgres:postgres@localhost/sgdoc');
    require_once 'Doctrine.php';
    spl_autoload_register(array('Doctrine', 'autoload'));
    Doctrine_Manager::connection(DSN, 'sandbox');
    Doctrine_Manager::getInstance()->setAttribute('model_loading', 'conservative');
    $config = array('data_fixtures_path' => 'D:\Arquivos de Programas\Xampp\htdocs\estrutura\application\modules\default\doctrine/data/fixtures',
        'sql_path' => 'D:\Arquivos de Programas\Xampp\htdocs\estrutura\application\modules\default\doctrine/data/sql',
        'models_path' => 'D:\Arquivos de Programas\Xampp\htdocs\estrutura\application\modules\default\doctrine/models',
        'migrations_path' => 'D:\Arquivos de Programas\Xampp\htdocs\estrutura\application\modules\default\doctrine\migrations',
        'yaml_schema_path' => 'D:\Arquivos de Programas\Xampp\htdocs\estrutura\application\modules\default\doctrine\schema'
    );
    $cli = new Doctrine_Cli($config);
    $cli->run($_SERVER['argv']);
} catch (Exception $e) {
    echo $e;
}


/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
