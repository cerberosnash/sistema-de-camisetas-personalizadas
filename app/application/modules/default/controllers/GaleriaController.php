<?php

/**
 *
 * @author Michael Fernandes Rodrigues
 *
 */
class GaleriaController extends Base_Controller_Action {

    public function init() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }

    public function carregarAction() {
        $this->_prepareJson(Doctrine_Core::getTable('TbProdutos')->listarGaleria($this->_getAllParams()));
    }

//    public function carregar2Action() {
//
//        $path = "../outros/png-1.0/uploads/";
//        $d = dir($path);
//
//        $tamanho[0] = 'Pequena';
//        $tamanho[1] = 'Media';
//        $tamanho[2] = 'Grande';
//
//        $camisetas = array(
//            '000000', //preto
//            '1bbc81', //verde-limao
//            '34a4c4', //verde-claro
//            '171c46', //azul-escuro
//            '344ca3', //azul-claro
//            '520b0b', //marron
//            '174621', //verde-escuro
//            '717171', //cinza
//            'a7bc1b', //amarelo-limao
//            'a3346b', //rosa
//            'a33434', //vermelho-suave
//            'd83200', //laranja
//            'f6d600', //amarelo
//            'f60000', //vermelho
//            'ffffff', //branco
//        );
//
//        $cont = 0;
//        // $images = null;
//        while ($name = $d->read()) {
//            if (!preg_match('/\.(jpg|gif|png)$/', $name)) {
//                continue;
//            }
//            $id = substr($name, 0, 32);
//
//            $size = filesize($path . $name);
//            $lastmod = filemtime($path . $name) * 1000;
//            if ($cont <= $this->_getParam('limit') && $this->carrinho->camiseta[$id]->id) {
//                $cont++;
//                $q = $this->carrinho->camiseta[$id]->quantidade ? $this->carrinho->camiseta[$id]->quantidade : 1;
//                $images[] = array(
//                    'id' => $id,
//                    'nome' => $id,
//                    'tamanho' => $tamanho[rand(0, 2)],
//                    'cor' => $camisetas[rand(0, 13)],
//                    'valor' => rand(24, 49) . '.99',
//                    'quantidade' => $q,
//                    'descricao' => md5(rand())
//                );
//            }
//        }
//
//        if ($cont == 0) {
//            $images = '';
//        }
//
//        $d->close();
//        $out = array('totalCount' => $cont, 'totalCarrinho' => $this->valorTotal(), 'images' => $images);
//        $this->_prepareJson($out);
//    }
}