<?php

class GaleriaController extends Base_Controller_Action {

    public function init() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }

    public function carregarAction() {
        $this->_prepareJson(Doctrine_Core::getTable('TbProdutos')->listarGaleria($this->_getAllParams()));
    }

}