<?php

class FavoritosController extends Base_Controller_Action {

    private $upload;

    public function init() {
        parent::init();
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->upload = new Zend_Session_Namespace('upload');
    }

    public function carregarAction() {
        $this->_prepareJson(Doctrine_Core::getTable('TbProdutos')->listarFavoritos($this->_session->usuario->sq_usuario, $this->_getAllParams()));
    }

    public function criarAction() {
        if ($this->getRequest()->isPost()) {
            if ($this->upload->crop === true) {
                if ($this->_getParam('tm_produto') && $this->_getParam('co_produto') && $this->_getParam('nm_produto') && $this->_getParam('ds_produto') && $this->upload->imagem) {
                    try {
                        $error = false;
                        $produto = new TbProdutos();
                        $produto->vl_produto = PRICE_DEFAULT_CAMISETA;
                        $produto->co_produto = $this->_getParam('co_produto');
                        $produto->tm_produto = $this->_getParam('tm_produto');
                        $produto->nm_produto = $this->_getParam('nm_produto');
                        $produto->ds_produto = $this->_getParam('ds_produto');
                        $produto->fg_verso = $this->_getParam('fg_verso');
                        $produto->st_privado = true; //mudar
                        $produto->hs_produto = substr($this->upload->imagem, 0, 32);
                        $produto->save();

                        $favorito = new TbFavoritos();
                        $favorito->sq_produto = $produto->sq_produto;
                        $favorito->sq_usuario = $this->_session->usuario->sq_usuario;
                        $favorito->save();

                        $out = array(success => true, crop => true, id => substr($produto->hs_produto, 0, 32));
                        unset($this->upload->imagem);
                    } catch (Doctrine_Exception $e) {
                        $error = true;
                        $out = array(success => false, error => $e->getMessage());
                    }
                } else {
                    $out = array(success => false, crop => true);
                }
            } else {
                $out = array(success => false, crop => false);
            }

            $this->_prepareJson($out);
        }
    }

    public function adicionarAction() {
        if ($this->getRequest()->isPost()) {
            if ($this->_getParam('sq_produto') && $this->_session->usuario->sq_usuario) {
                try {
                    $rows = Doctrine_Core::getTable('TbFavoritos')->adicionar($this->_session->usuario->sq_usuario, $this->_getParam('sq_produto'));
                    if ($rows > 0) {
                        $out = array(success => true, id => $this->_getParam('sq_produto'));
                    } else {
                        $out = array(success => false);
                    }
                } catch (Doctrine_Exception $e) {
                    $out = array(success => false, error => $e->getMessage());
                }
            } else {
                $out = array(success => false, error => 'Erro nos parametros.');
            }
            $this->_prepareJson($out);
        }
    }

    public function removerAction() {
        if ($this->getRequest()->isPost()) {
            if ($this->_getParam('sq_produto') && $this->_session->usuario->sq_usuario) {
                try {
                    $rows = Doctrine_Core::getTable('TbFavoritos')->remover($this->_session->usuario->sq_usuario, $this->_getParam('sq_produto'));
                    if ($rows > 0) {
                        $out = array(success => true, id => $this->_getParam('sq_produto'));
                    } else {
                        $out = array(success => false);
                    }
                } catch (Doctrine_Exception $e) {
                    $out = array(success => false, error => $e->getMessage());
                }
            } else {
                $out = array(success => false, error => 'Erro nos parametros.');
            }
            $this->_prepareJson($out);
        }
    }

}