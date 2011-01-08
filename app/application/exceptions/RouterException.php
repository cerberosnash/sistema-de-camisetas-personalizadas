<?php

/**
 * Database Exception.
 * 
 * @author cralos
 * @since 08/03/2009
 * @version 0.1
 */
class RouterException extends Exception {

    /**
     * Exception overload.
     *
     * @access public
     * @param $x_msg
     */
    public static function Exception($e) {

        if ($e instanceof TestException) {//MySQL exception
            throw new TestException($e);
        } else if ($e instanceof Doctrine_Exception) {//Postgres exception
            return ExceptionDoctrine::toString($e);
        } else if ($e instanceof Exception_Postgres) {//Firebird exception
            throw new Exception_Postgres($e);
        } else if ($e instanceof Exception) {//Firebird exception
            throw new Exception($e);
        } else {
            throw new TestException($e);
        }
    }

}