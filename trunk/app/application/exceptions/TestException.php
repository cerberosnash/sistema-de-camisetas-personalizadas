<?php

class TestException extends Exception {

    private $_code;
    private $_message;

    private function _init($e) {
        $this->_code = $e->getCode();
        $this->_message = $e->getMessage();
    }

    public function __construct(Exception $e) {
        $this->_init($e);
        parent::__construct($this->_message, $this->_code, $e->getPrevious());
    }

    public function log() {
        return 'salvo...';
    }

    public function errorMessage() {

        switch ($this->_code) {

            case 22:
                return 'AGora vai karaiiiiiiiiiiii..............';
                break;

            default :
                return 'caiu na vala...';
                break;
        }
    }

}
