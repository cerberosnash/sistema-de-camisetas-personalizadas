<?php

class IndexController extends Base_Controller_Action {

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        if ($this->_session->perfil) {
            $this->_redirect($this->_session->perfil);
        }
    }

}