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
        $this->_prepareJson(Doctrine_Core::getTable('TbPedidos')->cliente($this->_getParam('id_pedido')));
    }

    public function finalizarPostagemAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->_prepareJson(Doctrine_Core::getTable('TbPedidos')->finalizarPostagem($this->_getParam('id_pedido'), $this->_getParam('cd_rastreamento')));
    }

}