<?php

class ClienteController extends Base_Controller_Action {

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        //$this->_helper->viewRenderer->setNoRender();
        if ($this->_autenticacao->perfil != $this->view->originalController) {
            $this->_redirect('');
        }
    }

}