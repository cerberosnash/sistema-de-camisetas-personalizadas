<?php

class ExceptionMessage {

    static $objError = array();

    public static function toString(Exception $e) {
        if (Zend_Db_Table::getDefaultAdapter() instanceof Zend_Db_Adapter_Pdo_Mysql) {//MySQL exception message
         } else if (Zend_Db_Table::getDefaultAdapter() instanceof Zend_Db_Adapter_Pdo_Pgsql) {//Postgres exception message
            switch ($e->getCode()) {
                case 23505:
                    ExceptionMessage::$objError = array('getTrace' => $e->getTrace(), 'getMessage' => $e->getCode() . " - " . AB_MSG_DB_ERROR_INVALID_PK);
                    break;
                case 23503:
                case 23000:
                    ExceptionMessage::$objError = array('getTrace' => $e->getTrace(), 'getMessage' => $e->getCode() . " - " . KT_MSG_DB_ERROR_CONSTRAINT_VIOLATION);
                    break;
                case 22004:
                case 23502:
                    ExceptionMessage::$objError = array('getTrace' => $e->getTrace(), 'getMessage' => $e->getCode() . " - " . KT_MSG_DB_ERROR_NOT_NULL);
                    break;
                case 42703:
                    ExceptionMessage::$objError = array('getTrace' => $e->getTrace(), 'getMessage' => $e->getCode() . " - " . KT_MSG_DB_ERROR_INVALID_COLUMN);
                    break;
                case 22001:
                    ExceptionMessage::$objError = array('getTrace' => $e->getTrace(), 'getMessage' => $e->getCode() . " - " . KT_MSG_DB_ERROR_DATA_EXCEED);
                    break;
                case 22003:
                    ExceptionMessage::$objError = array('getTrace' => $e->getTrace(), 'getMessage' => $e->getCode() . " - " . KT_MSG_DB_ERROR_OUT_OF_RANGE);
                    break;
                case 54011:
                case 54023:
                    ExceptionMessage::$objError = array('getTrace' => $e->getTrace(), 'getMessage' => $e->getCode() . " - " . KT_MSG_DB_ERROR_INVALID_ARG);
                    break;
                case 01007:
                case 42501:
                    ExceptionMessage::$objError = array('getTrace' => $e->getTrace(), 'getMessage' => $e->getCode() . " - " . KT_MSG_DB_ERROR_NO_GRANT);
                    break;
                case 42601:
                    ExceptionMessage::$objError = array('getTrace' => $e->getTrace(), 'getMessage' => $e->getCode() . " - " . KT_MSG_DB_ERROR_SYNTAX);
                    break;
                default:
                    ExceptionMessage::$objError = array('getTrace' => $e->getTrace(), 'getMessage' => $e->getCode() . " - " . $e->getMessage());
                    break;
            }
        } else if (Zend_Db_Table::getDefaultAdapter() instanceof Zend_Db_Adapter_Firebird) {//Firebird exception
            /*
             *
             *
             *
             */
        }

        return ExceptionMessage::setLogError(ExceptionMessage::$objError['getTrace'], ExceptionMessage::$objError['getMessage']);
    }

    public static function setLogError($trace, $mensagem) {

        //retira possíveis quebras de linha
        $mensagem = str_replace(array("\n\r", "\n", "\r"), " ", $mensagem);
        $mensagem = str_replace("", " ", $mensagem);

        $objLog = new Base_Log();
        $objLog->escreveLogError($trace, trim($mensagem));
        return $mensagem;
    }

}

/* * */
?>

