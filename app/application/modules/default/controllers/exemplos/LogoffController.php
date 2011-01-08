<?php

class LogoffController extends Base_Controller_Action {

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(); //suppress auto-rendering
        if ($_SESSION['profissional']['sq_profissional']) {
            $this->setMCA();
            $this->gravarLog();
        }
        $this->encerrarSessao();
    }

    public function encerrarSessao() {
        session_start();
        $_SESSION = array();
        session_destroy();
        $this->_redirect("/login");
    }

    public function gravarLog() {
        $objLog = new Base_Log();
        $objLog->escreveLog(13,
                $this->MCA['module'],
                $this->MCA['controller'],
                $this->MCA['action'],
                null,
                0,
                $a = array(),
                'Efetuou Logoff',
                $_SESSION['profissional']['sq_profissional']
        );
    }

}