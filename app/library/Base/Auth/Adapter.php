<?php

class Base_Auth_Adapter implements Zend_Auth_Adapter_Interface {
    const NOT_FOUND_MESSAGE = "Account not found";
    const BAD_PW_MESSAGE = "Password is invalid";

    protected $user;
    protected $cpf;
    protected $senha;

    public function __construct($cpf, $senha) {
        $this->cpf = $cpf;
        $this->senha = $senha;
    }

    public function authenticate() {


        try {
            $this->user = PesPessoa::autenticar($this->cpf, $this->senha);
            if (is_null($this->user)) {
                throw new Exception();
            }
        } catch (Exception $e) {
            return $this->result(Zend_Auth_Result::FAILURE_CREDENTIAL_INVALID, $e->getMessage());
        }
        return $this->result(Zend_Auth_Result::SUCCESS);
    }

    public function result($code, $messages = array()) {
        if (!is_array($messages)) {
            $messages = array($messages);
        }

        return new Zend_Auth_Result(
                $code,
                $this->user,
                $messages
        );
    }

}