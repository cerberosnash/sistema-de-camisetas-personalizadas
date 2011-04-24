<?php

class ConfeccaoController extends Base_Controller_Action {

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        if ($this->_session->usuario->tx_perfil != $this->view->originalController) {
            $this->_redirect('');
        }
    }

    public function carregarAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->_prepareJson(Doctrine_Core::getTable('TbPedidos')->listarPedidos($this->_getAllParams()));
    }

}