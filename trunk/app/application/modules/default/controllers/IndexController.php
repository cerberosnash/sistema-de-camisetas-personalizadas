<?php

class IndexController extends Base_Controller_Action {

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        if ($this->_autenticacao->perfil) {
            $this->_redirect($this->_autenticacao->perfil);
        }
    }

}