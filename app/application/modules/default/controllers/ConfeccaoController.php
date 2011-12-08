<?php

class ConfeccaoController extends Base_Controller_Action
{

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
        $aParams = $this->_getAllParams();
        $aParams['sq_confeccionador'] = $this->_session->usuario->sq_usuario;
        $this->_prepareJson(Doctrine_Core::getTable('TbPedidos')->listarPedidos($aParams));
    }

    public function alocarAction ()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $out = Doctrine_Core::getTable('TbPedidos')->alocar($this->_session->usuario->sq_usuario);

        if ($out[success] == true) {
            /* Cliente do pedido */
            $cliente = Doctrine_Core::getTable('TbPedidos')->cliente($out[pedido], 2/* Aguandando Confeccao */);
            /* Notificacao via email */
            $this->sendMailNotification(
                    array(
                        template => 'padrao',
                        email => $cliente['tx_email'],
                        assunto => 'Confeccao do Pedido',
                        message => array(
                            nome => $cliente['nm_usuario'],
                            mensagem => "<p>Iniciamos agora a confeccao do pedido <strong>#{$out[pedido]}</strong>.</p>
                                        <p>Em breve estaremos finalizando o processo de confeccao de sua(s) camiseta(s)...</p>
                                        <p><strong>Obrigado!</strong></p>"
                        )
                    )
            );
            /* Registrar Historico Atividades */
            $this->registerHistoryActivity(array(atividade => 3/* Alocacao Pedido */, pedido => $out[pedido]));
        }

        $this->_prepareJson($out);
    }

    public function finalizarConfeccaoAction ()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $id_pedido = Doctrine_Core::getTable('TbPedidos')->checkAlocado($this->_session->usuario->sq_usuario);

        $out = Doctrine_Core::getTable('TbPedidos')->finalizarConfeccao($id_pedido, $this->_session->usuario->sq_usuario);

        if ($out[success] == true) {
            /* Cliente do pedido */
            $cliente = Doctrine_Core::getTable('TbPedidos')->cliente($id_pedido, 3/* Aguandando Despachar */);
            /* Notificacao via email */
            $this->sendMailNotification(
                    array(
                        template => 'padrao',
                        email => $cliente['tx_email'],
                        assunto => 'Confeccao Finalizada',
                        message => array(
                            nome => $cliente['nm_usuario'],
                            mensagem => "<p>Acabamos de finalizar a confeccao do pedido <strong>#{$id_pedido}</strong>.</p>
                                        <p>Em breve informaremos o codigo de rastreamento do seu pedido...</p>
                                        <p><strong>Obrigado!</strong></p>"
                        )
                    )
            );
            /* Registrar Historico Atividades */
            $this->registerHistoryActivity(array(atividade => 4/* Finalizar Confeccao do Pedido */, pedido => $id_pedido));
        }

        $this->_prepareJson($out);
    }

    public function carregarProdutosAction ()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $id_pedido = Doctrine_Core::getTable('TbPedidos')->checkAlocado($this->_session->usuario->sq_usuario);
        $this->_prepareJson(Doctrine_Core::getTable('TbPedidos')->listarProdutos($id_pedido));
    }

}