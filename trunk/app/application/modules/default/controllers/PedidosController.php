<?php

class PedidosController extends Base_Controller_Action
{

    public function init ()
    {
        parent::init();
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }

    public function carregarAction ()
    {
        $pedidos = array();
        if ($this->getRequest()->isPost()) {
            if (isset($this->_session->usuario)) {
                try {
                    $pedidos = Doctrine_Core::getTable('TbPedidos')->findByDql("sq_usuario = {$this->_session->usuario->sq_usuario} AND sq_status = 1 AND st_ativo = true")->toArray();

                    foreach ($pedidos as $key => $value) {
                        $pedidos[$key]['cd_pedido'] = $pedidos[$key]['sq_pedido'] . '-' . str_replace('-', '', $pedidos[$key]['dt_pedido']) . '-' . str_replace('.', '-', $pedidos[$key]['vl_pedido']);
                    }

                    $out = array(success => true, totalCount => count($pedidos), pedidos => $pedidos);
                } catch (Doctrine_Exception $e) {
                    $out = array(success => false, error => $e->getMessage());
                }
            } else {
                $out = array(success => false, error => 'Nao foi possivel recuperar as informacoes do usuario!');
            }
        } else {
            $out = array(success => false, error => 'Parametros passados de forma invalida!');
        }
        $this->_prepareJson($out);
    }

    public function processarAction ()
    {
        $pedidos = array();
        if ($this->getRequest()->isPost()) {
            if ($this->_session->usuario->sq_usuario && $this->_getParam('nm_banco') && $this->_getParam('sq_pedido')) {
                try {
                    $pedido = Doctrine_Core::getTable('TbPedidos')
                            ->findByDql("sq_pedido = {$this->_getParam('sq_pedido')} AND sq_usuario = {$this->_session->usuario->sq_usuario} AND sq_status = 1 AND st_ativo = true limit 1")
                            ->toArray();
                    $pedido[0]['banco'] = $this->_getParam('nm_banco');
                    $this->_session->boletos = $pedido[0];
                    $out = array(success => true);
                } catch (Doctrine_Exception $e) {
                    $out = array(success => false, error => "$e");
                }
            } else {
                $out = array(success => false, error => 'Nao foi possivel recuperar as informacoes do usuario!');
            }
        } else {
            $out = array(success => false, error => 'Parametros passados de forma invalida!');
        }
        $this->_prepareJson($out);
    }

    public function boletoAction ()
    {

        /* Cliente do pedido */
        $cliente = Doctrine_Core::getTable('TbPedidos')->cliente($this->_session->boletos['sq_pedido'], 1/* Aguandando Pagamento */);

        switch ($this->_session->boletos['banco']) {
            case 'BB':
                $dias_de_prazo_para_pagamento = 7;
                $taxa_boleto = 2.95;
                // $vl_cobrado = $this->_session->boletos['vl_pedido'];
                $id_pedido = $this->_session->boletos['sq_pedido'];
                $vl_boleto = $this->_session->boletos['vl_pedido'];
                $nm_cliente = $cliente['nm_usuario'];
                $nu_cep = $cliente['nu_cep'];
                $tx_uf = $cliente['nm_uf'];
                $tx_municipio = $cliente['nm_municipio'];
                $tx_endereco = $cliente['tx_endereco'];
                require_once CONFIG_PATH . "boletos.php";
                new BoletoBB($configuracaoBoletos['BancoDoBrasil']);
                break;

            default:
                break;
        }
    }

}