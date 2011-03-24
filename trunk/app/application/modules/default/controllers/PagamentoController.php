<?php

class PagamentoController extends Base_Controller_Action {

    public function init() {
        parent::init();
        $this->_helper->layout->disableLayout();
        if ($this->_session->usuario->tx_perfil != $this->view->originalController) {
            $this->_redirect('');
        }
    }

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

    public function confirmarAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        if ($this->getRequest()->isPost()) {
            if ($this->_getParam('id_pedido')) {

                try {
                    $conn = Doctrine_Manager::connection();
                    $conn->beginTransaction();

                    $query1 = Doctrine_Query::create()
                                    ->update('TbPedidos')
                                    ->set('sq_status', '?', 2) //status de aguardando confeccao
                                    ->where('sq_status = ?', 1) //status de aguardando pagamento
                                    ->andWhere('sq_pedido = ?', $this->_getParam('id_pedido'))
                                    ->andWhere('st_ativo = ?', true);

                    if ($query1->execute() > 0) {
                        $out = array(success => true);
                    } else {
                        $out = array(success => false, error => 'O pagamento deste pedido ja foi confirmado!');
                    }

//                    $query2 = Doctrine_Query::create()
//                                    ->update('TbTelefones')
//                                    ->set('nu_ddd', '?', $this->_getParam('dd_celular'))
//                                    ->set('nu_telefone', '?', Base_Util::onlyNumbers($this->_getParam('nu_celular')))
//                                    ->where('sq_usuario = ?', $this->_session->usuario->sq_usuario)
//                                    ->andWhere('tp_telefone = ?', 'Celular')
//                                    ->andWhere('st_ativo = ?', true);
//                    $query2->execute();
//
//                    $query3 = Doctrine_Query::create()
//                                    ->update('TbTelefones')
//                                    ->set('nu_ddd', '?', $this->_getParam('dd_residencial'))
//                                    ->set('nu_telefone', '?', Base_Util::onlyNumbers($this->_getParam('nu_residencial')))
//                                    ->where('sq_usuario = ?', $this->_session->usuario->sq_usuario)
//                                    ->andWhere('tp_telefone = ?', 'Residencial')
//                                    ->andWhere('st_ativo = ?', true);
//                    $query3->execute();

                    $conn->commit();
                } catch (Doctrine_Exception $e) {
                    $conn->rollback();
                    $out = array(success => false, error => $e->getMessage());
                }
            } else {
                $out = array(success => false, error => 'Nao foi possivel identificar o numero do pedido!');
            }
            $this->_prepareJson($out);
        }
    }

    public function cancelarAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        if ($this->getRequest()->isPost()) {
            if ($this->_getParam('id_pedido')) {

                try {
                    $conn = Doctrine_Manager::connection();
                    $conn->beginTransaction();

                    $query1 = Doctrine_Query::create()
                                    ->update('TbPedidos')
                                    ->set('sq_status', '?', 5)//status de finalizado por falta de pagamento
                                    ->where('sq_status = ?', 1)//status de aguardando pagamento
                                    ->andWhere('sq_pedido = ?', $this->_getParam('id_pedido'));

                    if ($query1->execute() > 0) {
                        $out = array(success => true);
                    } else {
                        $out = array(success => false, error => 'O pagamento deste pedido ja foi cancelado!');
                    }

//                    $query2 = Doctrine_Query::create()
//                                    ->update('TbTelefones')
//                                    ->set('nu_ddd', '?', $this->_getParam('dd_celular'))
//                                    ->set('nu_telefone', '?', Base_Util::onlyNumbers($this->_getParam('nu_celular')))
//                                    ->where('sq_usuario = ?', $this->_session->usuario->sq_usuario)
//                                    ->andWhere('tp_telefone = ?', 'Celular')
//                                    ->andWhere('st_ativo = ?', true);
//                    $query2->execute();
//
//                    $query3 = Doctrine_Query::create()
//                                    ->update('TbTelefones')
//                                    ->set('nu_ddd', '?', $this->_getParam('dd_residencial'))
//                                    ->set('nu_telefone', '?', Base_Util::onlyNumbers($this->_getParam('nu_residencial')))
//                                    ->where('sq_usuario = ?', $this->_session->usuario->sq_usuario)
//                                    ->andWhere('tp_telefone = ?', 'Residencial')
//                                    ->andWhere('st_ativo = ?', true);
//                    $query3->execute();

                    $conn->commit();
                } catch (Doctrine_Exception $e) {
                    $conn->rollback();
                    $out = array(success => false, error => $e->getMessage());
                }
            } else {
                $out = array(success => false, error => 'Nao foi possivel identificar o numero do pedido!');
            }
            $this->_prepareJson($out);
        }
    }

}