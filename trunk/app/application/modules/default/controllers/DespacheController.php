<?php

class DespacheController extends Base_Controller_Action {

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

    public function guiaAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        if ($this->_getParam('pedido')) {
            $PHPJasperXML = new Base_PHPJasperXML();
            $PHPJasperXML->debugsql = false;

            $array = Doctrine_Core::getTable('TbPedidos')->cliente($this->_getParam('pedido'));
            $array['pedido'] = $this->_getParam('pedido');
            $array['profissional'] = $this->_session->usuario->nm_usuario;

            $PHPJasperXML->arrayParameter = $array;
            $PHPJasperXML->xml_dismantle(simplexml_load_file('../library/PHPJasperXML/Templates/GuiaPostagem.jrxml'));

            $PHPJasperXML->transferDBtoArray();
            $PHPJasperXML->outpage("I");    //page output method I:standard output  D:Download file
        }
    }

    public function informacoesClienteAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->_prepareJson(Doctrine_Core::getTable('TbPedidos')->cliente($this->_getParam('id_pedido'), 3/* Aguardando Despachar */));
    }

    public function finalizarPostagemAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $out = Doctrine_Core::getTable('TbPedidos')->finalizarPostagem($this->_getParam('id_pedido'), $this->_getParam('cd_rastreamento'));

        if ($out[success] == true) {
            /* Cliente do pedido */
            $cliente = Doctrine_Core::getTable('TbPedidos')->cliente($this->_getParam('id_pedido'), 4/* Aguandando Despachar */);
            /* Notificacao via email */
            $this->sendMailNotification(
                    array(
                        template => 'padrao',
                        email => $cliente['tx_email'],
                        assunto => "Rastreamento do Pedido #{$this->_getParam('id_pedido')}",
                        message => array(
                            nome => $cliente['nm_usuario'],
                            mensagem => "<p>Este é o codigo de rastreamento do seu pedido <strong><a href='" . URL_SEARCH_CORREIOS . "{$this->_getParam('cd_rastreamento')}'>{$this->_getParam('cd_rastreamento')}</a></strong>.</p>
                                        <p>A equipe do Camisetas Personalizadas agradece a preferencia.</p>
                                        <p><strong>Obrigado!</strong></p>"
                        )
                    )
            );
            /* Registrar Historico Atividades */
            $this->registerHistoryActivity(array(atividade => 5/* Finalizar Postagem do Pedido */, pedido => $this->_getParam('id_pedido')));
        }

        $this->_prepareJson($out);
    }

}