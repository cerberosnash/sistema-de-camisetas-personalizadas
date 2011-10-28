<?php

include '../application/Bootstrap.php';

$configSection = getenv('PLACES_CONFIG') ? getenv('PLACES_CONFIG') : 'prod';
$bootstrap = new Bootstrap($configSection);
$bootstrap->runApp();