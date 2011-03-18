<?php

class PagamentoController extends Base_Controller_Action {

    public function init() {
        parent::init();
        if ($this->_session->perfil != $this->view->originalController) {
            //$this->_redirect('/');
        }
    }

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        if ($this->_session->usuario->tx_perfil != $this->view->originalController) {
            $this->_redirect('');
        }
    }

}