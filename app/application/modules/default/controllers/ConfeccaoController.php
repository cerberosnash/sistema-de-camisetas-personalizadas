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
        $aParams = $this->_getAllParams();
        $aParams['sq_confeccionador'] = $this->_session->usuario->sq_usuario;
        $this->_prepareJson(Doctrine_Core::getTable('TbPedidos')->listarPedidos($aParams));
    }

    public function alocarAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->_prepareJson(Doctrine_Core::getTable('TbPedidos')->alocar($this->_session->usuario->sq_usuario));
    }

    public function finalizarConfeccaoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $id_pedido = Doctrine_Core::getTable('TbPedidos')->checkAlocado($this->_session->usuario->sq_usuario);
        $this->_prepareJson(Doctrine_Core::getTable('TbPedidos')->finalizarConfeccao($id_pedido, $this->_session->usuario->sq_usuario));
    }

    public function carregarProdutosAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $id_pedido = Doctrine_Core::getTable('TbPedidos')->checkAlocado($this->_session->usuario->sq_usuario);
        $this->_prepareJson(Doctrine_Core::getTable('TbPedidos')->listarProdutos($id_pedido));
    }

}