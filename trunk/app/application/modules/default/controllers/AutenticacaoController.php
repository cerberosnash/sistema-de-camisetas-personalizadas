<?php

class AutenticacaoController extends Base_Controller_Action {

    public function init() {
        parent::init();
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }

    public function autenticarAction() {
        if ($this->getRequest()->isPost()) {
            try {
                $usuario = Doctrine_Core::getTable('TbUsuarios')->autenticar($this->_getParam('tx_email'), $this->_getParam('tx_senha'));

                if (count($usuario) > 0) {

                    $this->_session->usuario->sq_usuario = $usuario[0]['sq_usuario'];
                    $this->_session->usuario->tx_perfil = strtolower($usuario[0]['tx_perfil']);
                    $this->_session->usuario->nm_usuario = $usuario[0]['nm_usuario'];
                    $this->_session->usuario->nu_cpf = $usuario[0]['nu_cpf'];
                    $this->_session->usuario->dd_residencial = $usuario[0]['dd_residencial'];
                    $this->_session->usuario->nu_residencial = $usuario[0]['nu_residencial'];
                    $this->_session->usuario->dd_celular = $usuario[0]['dd_celular'];
                    $this->_session->usuario->nu_celular = $usuario[0]['nu_celular'];
                    $this->_session->usuario->sq_municipio = $usuario[0]['sq_municipio'];
                    $this->_session->usuario->nu_cep = $usuario[0]['nu_cep'];
                    $this->_session->usuario->tx_endereco = $usuario[0]['tx_endereco'];
                    $this->_session->usuario->tx_email = $usuario[0]['tx_email'];
                    $this->_session->usuario->tx_senha = $usuario[0]['tx_senha'];
                    $out = array(success => true, url => '/camisetas/' . $this->_session->usuario->tx_perfil, perfil => $this->_session->usuario->tx_perfil);
                   // var_dump($this->_session->usuario);
                } else {
                    $out = array(success => false);
                }
            } catch (Exception $e) {
                $out = array(success => false, error => $e->getMessage());
            }
        } else {
            $out = array(success => false, error => 'Parametros passados de forma inválida!');
        }
        $this->_prepareJson($out);
    }

    public function recuperarAction() {

        $session = new Zend_Session_Namespace('autenticacao');

        if ($this->getRequest()->isPost()) {
            if ($this->_getParam('email') && ($this->_getParam('captcha') == $session->security_code)) {
                $out = array(success => true, code => $session->security_code);
            } else {
                $out = array(success => false, code => $session->security_code);
            }
        } else {
            $out = array(
                success => false,
                error => 'Parametros passados de forma inválida!'
            );
        }
        $this->_prepareJson($out);
    }

}