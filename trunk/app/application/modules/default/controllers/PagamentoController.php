<?php

class PagamentoController extends Base_Controller_Action
{

    public function init ()
    {
        parent::init();
        $this->_helper->layout->disableLayout();
        if ($this->_session->usuario->tx_perfil != $this->view->originalController) {
            $this->_redirect('');
        }
    }

    public function indexAction ()
    {
        $this->_helper->layout->disableLayout();
        if ($this->_session->usuario->tx_perfil != $this->view->originalController) {
            $this->_redirect('');
        }
    }

    public function carregarAction ()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->_prepareJson(Doctrine_Core::getTable('TbPedidos')->listarPedidos($this->_getAllParams()));
    }

    public function confirmarAction ()
    {
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

                    $conn->commit();

                    if ($out[success] == true) {
                        /* Cliente do pedido */
                        $cliente = Doctrine_Core::getTable('TbPedidos')->cliente($this->_getParam('id_pedido'), 2/* Aguandando Confeccao */);
                        /* Notificacao via email */
                        $this->sendMailNotification(
                                array(
                                    template => 'padrao',
                                    email => $cliente['tx_email'],
                                    assunto => 'Confirmacao de Pagamento',
                                    message => array(
                                        nome => $cliente['nm_usuario'],
                                        mensagem => "<p>Estamos confirmando o pagamento do pedido <strong>#{$this->_getParam('id_pedido')}</strong>.</p>
                                        <p>Em breve iniciaremos o processo de confeccao de sua(s) camiseta(s)...</p>
                                        <p><strong>Obrigado!</strong></p>"
                                    )
                                )
                        );
                        /* Registrar Historico Atividades */
                        $this->registerHistoryActivity(array(atividade => 1/* Confirmacao Pagamento */, pedido => $this->_getParam('id_pedido')));
                    }
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

    public function cancelarAction ()
    {
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

                    $conn->commit();

                    if ($out[success] == true) {
                        /* Cliente do pedido */
                        $cliente = Doctrine_Core::getTable('TbPedidos')->cliente($this->_getParam('id_pedido'), 5/* Cancelado por falta de pagamento */);
                        /* Notificacao via email */
                        $this->sendMailNotification(
                                array(
                                    template => 'padrao',
                                    email => $cliente['tx_email'],
                                    assunto => 'Pedido Cancelado',
                                    message => array(
                                        nome => $cliente['nm_usuario'],
                                        mensagem => "<p>O pedido <strong>#{$this->_getParam('id_pedido')}</strong> foi cancelado por falta de pagamento.</p>
                                        <p>Se voce fez o pagamento do boleto e esta recebendo notificacao por favor entre em contato conosco respondendo este email.</p>
                                        <p><strong>Obrigado!</strong></p>"
                                    )
                                )
                        );
                        /* Registrar Historico Atividades */
                        $this->registerHistoryActivity(array(atividade => 2/* Cancelar Pagamento */, pedido => $this->_getParam('id_pedido')));
                    }
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