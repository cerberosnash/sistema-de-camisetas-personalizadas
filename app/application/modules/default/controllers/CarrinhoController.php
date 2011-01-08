<?php

class CarrinhoController extends Base_Controller_Action {

    private $carrinho;

    public function init() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->startCarrinho();
    }

    private function startCarrinho() {
        $this->carrinho = new Zend_Session_Namespace('carrinho');
    }

    public function carregarAction() {

        $path = "../outros/png-1.0/uploads/";
        $d = dir($path);

        $tamanho[0] = 'Pequena';
        $tamanho[1] = 'Media';
        $tamanho[2] = 'Grande';

        $camisetas = array(
            '000000', //preto
            '1bbc81', //verde-limao
            '34a4c4', //verde-claro
            '171c46', //azul-escuro
            '344ca3', //azul-claro
            '520b0b', //marron
            '174621', //verde-escuro
            '717171', //cinza
            'a7bc1b', //amarelo-limao
            'a3346b', //rosa
            'a33434', //vermelho-suave
            'd83200', //laranja
            'f6d600', //amarelo
            'f60000', //vermelho
            'ffffff', //branco
        );

        $cont = 0;
        // $images = null;
        while ($name = $d->read()) {
            if (!preg_match('/\.(jpg|gif|png)$/', $name)) {
                continue;
            }
            $id = substr($name, 0, 32);

            $size = filesize($path . $name);
            $lastmod = filemtime($path . $name) * 1000;
            if ($cont <= $this->_getParam('limit') && $this->carrinho->camiseta[$id]->id) {
                $cont++;
                $q = $this->carrinho->camiseta[$id]->quantidade ? $this->carrinho->camiseta[$id]->quantidade : 1;
                $images[] = array(
                    'id' => $id,
                    'nome' => $id,
                    'tamanho' => $tamanho[rand(0, 2)],
                    'cor' => $camisetas[rand(0, 13)],
                    'valor' => rand(24, 49) . '.99',
                    'quantidade' => $q,
                    'descricao' => md5(rand())
                );
            }
        }

        if ($cont == 0) {
            $images = '';
        }

        $d->close();
        $out = array('totalCount' => $cont, 'totalCarrinho' => $this->valorTotal(), 'images' => $images);
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

            $out = array('success' => true, 'id' => $this->carrinho->camiseta[$this->_getParam('sq_produto')]->sq_produto,
                'quantidade' => $this->carrinho->camiseta[$this->_getParam('sq_produto')]->nu_quantidade);
        } else {
            $out = array(
                success => false,
                error => 'Parametros passados de forma inválida!'
            );
        }
        $this->_prepareJson($out);
    }

    public function removerAction() {
        if ($this->_getParam('id')) {
            unset($this->carrinho->camiseta[$this->_getParam('sq_produto')]);
            $out = array('success' => true, 'id' => $this->_getParam('sq_produto'));
        } else {
            $out = array('success' => false);
        }
        $this->_prepareJson($out);
    }

    public function finalizarAction() {
        //implementar metodo que persiste o carrinho

        $pedido = new TbProdutoPedido();
        $pedido->sq_pedido = 1;
        $pedido->sq_produto = 1;
        //$pedido->sq_produto_pedido = 1;
        $pedido->nu_quantidade = 1;
        $pedido->save();

//        foreach ($this->carrinho->camiseta as $pedidos) {
//
//$temp = (array)$pedidos;
//$temp[nu_quantidade] = 1;
////$pedidos[nu_quantidade] = 1;
//            $pedido = new TbProdutoPedido();
//           // $pedido->nu_quantidade = 1;
//            $pedido->fromArray($temp);
//            $pedido->save();
//        }

        if (true) {
            unset($this->carrinho->camiseta);
            $out = array('success' => true);
        } else {
            $out = array('success' => false);
        }
        $this->_prepareJson($out);
    }

    public function quantidadeAction() {
        if ($this->_getParam('id') && $this->_getParam('quantidade')) {
            $this->carrinho->camiseta[$this->_getParam('id')]->quantidade = $this->_getParam('quantidade');
            $out = array('success' => true, 'id' => $this->_getParam('id'), 'quantidade' => $this->carrinho->camiseta[$this->_getParam('id')]->quantidade);
        } else {
            $out = array('success' => false);
        }
        $this->_prepareJson($out);
    }

    private function valorTotal() {
        $total = 0;
        $base = 24.99;
        if (isset($this->carrinho->camiseta)) {
            foreach ($this->carrinho->camiseta as $key => $value) {
                $aux = ($this->carrinho->camiseta[$key]->quantidade * $base);
                $total = ($total + $aux);
            }
        }
        return $total;
    }

}