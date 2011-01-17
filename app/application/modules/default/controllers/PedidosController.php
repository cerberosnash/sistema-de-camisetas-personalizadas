<?php

class PedidosController extends Base_Controller_Action {

    public function init() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        /* debuggar */
        $this->_autenticacao->usuario->sq_usuario = 1;
    }

    public function carregarAction() {
        //if ($this->getRequest()->isPost()) {
        //if ($this->_getParam('sq_produto') && $this->_autenticacao->usuario->sq_usuario) {
        try {
            $pedidos = Doctrine_Core::getTable('TbPedidos')->findByDql('sq_usuario = 1 AND sq_status = 1 AND st_ativo = true')->toArray();

            foreach ($pedidos as $key => $value) {
                $pedidos[$key]['cd_pedido'] = $pedidos[$key]['sq_pedido'] . '-' . str_replace('-', '', $pedidos[$key]['dt_pedido']) . '-' . str_replace('.', '-', $pedidos[$key]['vl_pedido']);
            }


// var_dump($rows);
            if ($rows > 0) {
                $out = array(success => true, id => $this->_getParam('sq_produto'));
            } else {
                $out = array(success => false);
            }
        } catch (Doctrine_Exception $e) {
            $out = array(success => false, error => $e);
        }
        //    } else {
        $out = array(totalCount => count($pedidos), pedidos => $pedidos);
        // }
        $this->_prepareJson($out);
        //}
    }

}