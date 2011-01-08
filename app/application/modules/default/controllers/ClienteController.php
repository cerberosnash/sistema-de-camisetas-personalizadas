<?php

class ClienteController extends Base_Controller_Action {

    public function indexAction() {
         echo $this->_autenticacao->perfil . 'teste';
        $this->_helper->layout->disableLayout();
        //$this->_helper->viewRenderer->setNoRender();
        if ($this->_autenticacao->perfil != $this->view->originalController) {

            echo $this->_autenticacao->perfil ;
//  $this->_redirect('');
        }
    }

}