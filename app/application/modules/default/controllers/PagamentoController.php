<?php

class PagamentoController extends Base_Controller_Action {

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        if ($this->_session->perfil != $this->view->originalController) {
            $this->_redirect('');
        }
    }

}