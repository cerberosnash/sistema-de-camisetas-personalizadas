<?php

class FavoritoController extends Base_Controller_Action {

    private $upload;

    public function init() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->upload = new Zend_Session_Namespace('upload');
    }

    public function adicionarAction() {
        if ($_SESSION['upload']['crop'] === true) {
            if ($_POST['tamanho'] && $_POST['cor'] && $_POST['nome'] && $_POST['descricao'] && $_SESSION['upload']['imagem']) {
                $out = array('success' => true,
                    'crop' => true, 'id' => substr($_SESSION['upload']['imagem'], 0, 32));
                unset($_SESSION['upload']['imagem']);
            } else {
                $out = array('success' => false,
                    'crop' => true);
            }
        } else {
            $out = array('success' => false,
                'crop' => false);
        }
        $this->_prepareJson($out);
    }

}