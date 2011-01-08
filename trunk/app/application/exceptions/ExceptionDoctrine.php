<?php

class ExceptionDoctrine extends Doctrine_Exception {

    public static function toString($e) {
        switch ($e->getCode()) {
            case 22:
                return 'sintaxe inválida da entrada para o inteiro<br>' . $e->getMessage() . get_class($e);

            default :
                return "default - Message";
        }
    }

}