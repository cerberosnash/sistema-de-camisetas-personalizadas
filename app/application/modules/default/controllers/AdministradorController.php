<?php

class AdministradorController extends Base_Controller_Action {

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }

    public function init() {
        if ($this->_session->usuario->tx_perfil != $this->view->originalController) {
//  $this->_redirect('');
            echo 'Acesso Restrito';
        }
    }

}