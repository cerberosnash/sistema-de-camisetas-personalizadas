<?php

class ExceptionMessage extends Exception {

    public static function toString($e) {
        switch ($e->getCode()) {
            case 23505:
                return substr($e->getMessage(), 125);

            default :
                return "default - Message";
        }
    }

}

