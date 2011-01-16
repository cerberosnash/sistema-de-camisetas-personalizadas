<?php

class FavoritosController extends Base_Controller_Action {

    private $upload;

    public function init() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->upload = new Zend_Session_Namespace('upload');
        /* debugger */
        $this->_autenticacao->usuario->sq_usuario = 1;
        /* Habilitar isso para assegurar a passagem de parametros somente por POST */
        /* if ($this->getRequest()->isPost()) {} else {} */
    }

    public function carregarAction() {
        $this->_prepareJson(Doctrine_Core::getTable('TbProdutos')->listarFavoritos($this->_autenticacao->usuario->sq_usuario, $this->_getAllParams()));
    }

    public function criarAction() {
        if ($this->getRequest()->isPost()) {
            if ($this->upload->crop === true) {
                if ($this->_getParam('tm_produto') && $this->_getParam('co_produto') && $this->_getParam('nm_produto') && $this->_getParam('ds_produto') && $this->upload->imagem) {
                    try {
                        $error = false;
                        $produto = new TbProdutos();
                        $produto->vl_produto = 29.99;
                        $produto->co_produto = $this->_getParam('co_produto');
                        $produto->tm_produto = $this->_getParam('tm_produto');
                        $produto->nm_produto = $this->_getParam('nm_produto');
                        $produto->ds_produto = $this->_getParam('ds_produto');
                        $produto->st_privado = false; //mudar
                        $produto->hs_produto = substr($this->upload->imagem, 0, 32);
                        $produto->save();

                        $favorito = new TbFavoritos();
                        $favorito->sq_produto = $produto->sq_produto;
                        $favorito->sq_usuario = $this->_autenticacao->usuario->sq_usuario;
                        $favorito->save();

                        $out = array(success => true, crop => true, id => substr($produto->hs_produto, 0, 32));
                        unset($this->upload->imagem);
                    } catch (Doctrine_Exception $e) {
                        $error = true;
                        $out = array(success => false, error => $e);
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
            if ($this->_getParam('sq_produto') && $this->_autenticacao->usuario->sq_usuario) {
                try {
                    $rows = Doctrine_Core::getTable('TbFavoritos')->adicionar($this->_autenticacao->usuario->sq_usuario, $this->_getParam('sq_produto'));
                    if ($rows > 0) {
                        $out = array(success => true, id => $this->_getParam('sq_produto'));
                    } else {
                        $out = array(success => false);
                    }
                } catch (Doctrine_Exception $e) {
                    $out = array(success => false, error => $e);
                }
            } else {
                $out = array(success => false, error => 'Erro nos parametros.');
            }
            $this->_prepareJson($out);
        }
    }

    public function removerAction() {
        if ($this->getRequest()->isPost()) {
            if ($this->_getParam('sq_produto') && $this->_autenticacao->usuario->sq_usuario) {
                try {
                    $rows = Doctrine_Core::getTable('TbFavoritos')->remover($this->_autenticacao->usuario->sq_usuario, $this->_getParam('sq_produto'));
                    if ($rows > 0) {
                        $out = array(success => true, id => $this->_getParam('sq_produto'));
                    } else {
                        $out = array(success => false);
                    }
                } catch (Doctrine_Exception $e) {
                    $out = array(success => false, error => $e);
                }
            } else {
                $out = array(success => false, error => 'Erro nos parametros.');
            }
            $this->_prepareJson($out);
        }
    }

}