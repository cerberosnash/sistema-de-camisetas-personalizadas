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

    public function carregarUsuarioLogadoAction() {

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
        $file = file_get_contents("../application/modules/{$this->view->originalModule}/views/scripts/{$this->view->originalController}/{$this->view->originalAction}.js");
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

    public function getTemplateMail($aParams) {
        $file = (file_get_contents(SYSTEM_EMAIL_TEMPLATES . "{$aParams['template']}.html"));

        switch ($aParams['template']) {

            case 'padrao':
                $search = array("{{NOME}}", "{{MENSAGEM}}", "{{POSTIT}}");
                $replace = array($aParams['message']['nome'], $aParams['message']['mensagem'], SYSTEM_PATH . "/public/img/templates/email/postit.png");
                break;

            case 'recuperar-senha':
                $search = array("{{NOME}}", "{{SENHA}}", "{{POSTIT}}");
                $replace = array($aParams['message']['nome'], $aParams['message']['senha'], SYSTEM_PATH . "/public/img/templates/email/postit.png");
                break;
        }

        return str_replace($search, $replace, $file);
    }

    public function sendMailNotification($aParams) {
        if (EMAIL_NOTIFICATION_CLIENT) {
            $mail = new Base_PHPMailer();
            $mail->AddAddress($aParams['email']);
            $mail->Subject = $aParams['assunto'];
            $mail->MsgHTML($this->getTemplateMail($aParams));
            if (!$mail->Send()) {
                return false;
            }
        }
        return true;
    }

    public function registerHistoryActivity($aParams) {
        $conn = Doctrine_Manager::connection();
        $conn->beginTransaction();

        /* Novo Historico */
        $historico = new TbHistoricoAtividades();
        $historico->sq_usuario = $this->_session->usuario->sq_usuario;
        $historico->sq_atividade = $aParams['atividade'];
        $historico->sq_pedido = $aParams['pedido'];
        $historico->save();

        $conn->commit();
    }

}