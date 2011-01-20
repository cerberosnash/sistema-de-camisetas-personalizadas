<?php

class ClienteController extends Base_Controller_Action {

    public function indexAction() {
         echo $this->_session->perfil . 'teste';
        $this->_helper->layout->disableLayout();
        //$this->_helper->viewRenderer->setNoRender();
        if ($this->_session->perfil != $this->view->originalController) {

            echo $this->_session->perfil ;
//  $this->_redirect('');
        }
    }

}