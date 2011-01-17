<?php

class CarrinhoController extends Base_Controller_Action {

    private $carrinho;

    public function init() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->startCarrinho();
        /* debuggar */
        $this->_autenticacao->usuario->sq_usuario = 1;
    }

    private function startCarrinho() {
        $this->carrinho = new Zend_Session_Namespace('carrinho');
    }

    public function carregarAction() {
        try {
            $images = array(); //corrige o bug que ExtJs que processa uma chave do json nula
            $cont = 0; //corrige o bug que ExtJs que processa uma chave do json nula
            $find = array();
            if (count($this->carrinho->camiseta) > 0) {
                foreach ($this->carrinho->camiseta as $key => $value) {
                    $current = Doctrine_Core::getTable('TbProdutos')->findBy('sq_produto', $this->carrinho->camiseta[$key]->sq_produto)->toArray();
                    $current[0]['qt_produto'] = $this->carrinho->camiseta[$key]->nu_quantidade;
                    $this->carrinho->camiseta[$key]->vl_produto = $current[0]['vl_produto'];
                    $temp = array(
                        sq_produto => $current[0]['sq_produto'],
                        ds_produto => $current[0]['ds_produto'],
                        nm_produto => $current[0]['nm_produto'],
                        vl_produto => $current[0]['vl_produto'],
                        tm_produto => $current[0]['tm_produto'],
                        co_produto => $current[0]['co_produto'],
                        hs_produto => $current[0]['hs_produto'],
                        qt_produto => $current[0]['qt_produto']
                    );
                    $images[$cont] = array_merge($find, $temp);
                    $cont++;
                }
            }
            $out = array(totalCount => $cont, totalCarrinho => $this->valorTotal(), images => $images);
        } catch (Doctrine_Exception $e) {
            $out = array(success => false, error => $e);
        }
        $this->_prepareJson($out);
    }

    public function adicionarAction() {
        if ($this->getRequest()->isPost() && $this->_getParam('sq_produto')) {
            if ($this->carrinho->camiseta[$this->_getParam('sq_produto')]->sq_produto) {
                $this->carrinho->camiseta[$this->_getParam('sq_produto')]->sq_produto = $this->_getParam('sq_produto');
                $this->carrinho->camiseta[$this->_getParam('sq_produto')]->nu_quantidade++;
            } else {
                $this->carrinho->camiseta[$this->_getParam('sq_produto')]->sq_produto = $this->_getParam('sq_produto');
                $this->carrinho->camiseta[$this->_getParam('sq_produto')]->nu_quantidade = 1;
            }
            $out = array(success => true, id => $this->carrinho->camiseta[$this->_getParam('sq_produto')]->sq_produto,
                quantidade => $this->carrinho->camiseta[$this->_getParam('sq_produto')]->nu_quantidade);
        } else {
            $out = array(
                success => false,
                error => 'Parametros passados de forma inválida!'
            );
        }
        $this->_prepareJson($out);
    }

    public function removerAction() {
        if ($this->_getParam('sq_produto')) {
            unset($this->carrinho->camiseta[$this->_getParam('sq_produto')]);
            $out = array(success => true, id => $this->_getParam('sq_produto'));
        } else {
            $out = array(success => false);
        }
        $this->_prepareJson($out);
    }

    public function finalizarAction() {
        $error = false;
        try {
            if (count($this->carrinho->camiseta) > 0) {

                $conn = Doctrine_Manager::connection();
                $conn->beginTransaction();

                $pedido = new TbPedidos();
                $pedido->sq_status = 1;
                $pedido->sq_usuario = $this->_autenticacao->usuario->sq_usuario;
                $pedido->vl_pedido = $this->valorTotal();
                $pedido->save();

                foreach ($this->carrinho->camiseta as $key => $value) {
                    $produto = new TbProdutoPedido();
                    $produto->sq_pedido = $pedido->sq_pedido;
                    $produto->sq_produto = $this->carrinho->camiseta[$key]->sq_produto;
                    $produto->nu_quantidade = $this->carrinho->camiseta[$key]->nu_quantidade;
                    $produto->save();
                }
                $conn->commit();
            }
        } catch (Doctrine_Exception $e) {
            $conn->rollback();
            $error = false;
        }

        if (!$error) {
            unset($this->carrinho->camiseta);
            $out = array(success => true);
        } else {
            $out = array(success => false);
        }
        $this->_prepareJson($out);
    }

    public function quantidadeAction() {
        if ($this->_getParam('sq_produto') && $this->_getParam('qt_produto')) {
            $this->carrinho->camiseta[$this->_getParam('sq_produto')]->nu_quantidade = $this->_getParam('qt_produto');
            $out = array(success => true, id => $this->_getParam('sq_produto'), quantidade => $this->carrinho->camiseta[$this->_getParam('sq_produto')]->nu_quantidade);
        } else {
            $out = array(success => false);
        }
        $this->_prepareJson($out);
    }

    private function valorTotal() {
        $total = 0;
        if (isset($this->carrinho->camiseta)) {
            foreach ($this->carrinho->camiseta as $key => $value) {
                $aux = ($this->carrinho->camiseta[$key]->nu_quantidade * $this->carrinho->camiseta[$key]->vl_produto);
                $total = ($total + $aux);
            }
        }
        return $total;
    }

}