<?php

class AutenticacaoController extends Base_Controller_Action {

    public function init() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }

    public function autenticarAction() {

        if ($this->getRequest()->isPost()) {
            try {
                // $session = new Zend_Session_Namespace('autenticacao');
                /* implementar */
                $this->_autenticacao->usuario->tx_perfil = strtolower('cliente');
                $this->_autenticacao->usuario->sq_usuario = 1;

                $out = array('success' => true, 'url' => '/camisetas/' . $this->_autenticacao->perfil, perfil => $this->_autenticacao->perfil);
            } catch (Exception $e) {
                $out = array(
                    success => false,
                    error => $e->getMessage()
                );
            }
        } else {
            $out = array(
                success => false,
                error => 'Parametros passados de forma inválida!'
            );
        }
        $callback = '(' . json_encode($out) . ')';
        $this->_response->appendBody($callback);
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

        $callback = '(' . json_encode($out) . ')';
        $this->_response->appendBody($callback);
    }

}