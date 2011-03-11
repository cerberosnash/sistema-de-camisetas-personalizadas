<?php

class Base_Controller_Action extends Zend_Controller_Action {

    protected $_session;

    public function init() {
        session_start();
        $this->startAutenticacao();
    }

    public function startAutenticacao() {
        if (!isset($_SESSION['Zend_Session_Namespace'])) {
            $this->_session = $_SESSION['Zend_Session_Namespace'] = new Zend_Session_Namespace('autenticacao');
        } else {
            $this->_session = $_SESSION['Zend_Session_Namespace'];
        }
    }

    public function carregarUsuarioAction() {

        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        if ($this->getRequest()->isPost()) {
            if (!$this->_getParam('campo')) {
                $usuario = $this->_session->usuario;
                $usuario->tx_senha = Base_Util::md6_decode($usuario->tx_senha);
                $out = array(success => true, usuario => $usuario);
                unset($usuario);
            } else {
                if (isset($this->_session->usuario->{$this->_getParam('campo')})) {
                    $out = array(success => true, campo => $this->_session->usuario->{$this->_getParam('campo')});
                } else {
                    $out = array(success => false, error => 'Campo invalido!');
                }
            }
        } else {
            $out = array(success => false, error => 'Paramentros passados de forma invalida!');
        }
        $this->_prepareJson($out);
    }

    protected function _prepareJson($out) {
        $callback = '(' . json_encode($out) . ')';
        $this->_response->appendBody($callback);
    }

    public function startEXTJS($default=true) {
        $file = "../application/modules/" . $this->view->originalModule . "/views/scripts/"
                . $this->view->originalController . "/" . $this->view->originalAction . ".js";

        $file = (file_get_contents($file));

        if ($default === true) {
            $this->_response->appendBody(($file));
        } else if ($default === false) {
            $this->view->out = $file;
        }
    }

    public function fixErrorString($string) {
        return iconv("iso-8859-1", "utf-8", $string);
    }

    public function errorEXTJS($error) {
        $file = ROOT_DIR . "/application/modules/" . $this->view->originalModule . "/views/scripts/error/error.js";
        $file = utf8_encode(file_get_contents($file));
        $search = array("{{TITLE}}", "{{MESSAGE}}");
        $replace = array('Ocorreu um Erro', $error);
        $file = str_replace($search, $replace, $file);
        $this->view->out = $file;
    }

    public function templateRecuperarSenha($nm_usuario, $tx_senha) {
        $file = (file_get_contents(SYSTEM_EMAIL_TEMPLATES . $this->view->originalAction . '.html'));
        $search = array("{{NOME}}", "{{SENHA}}", "{{POSTIT}}");
        $replace = array($nm_usuario, Base_Util::md6_decode($tx_senha), SYSTEM_PATH . "/public/img/templates/email/recuperar-senha/postit.png");
        $file = str_replace($search, $replace, $file);
        return $file;
    }

}