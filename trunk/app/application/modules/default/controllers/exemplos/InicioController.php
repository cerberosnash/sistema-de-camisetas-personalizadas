<?php

class InicioController extends Base_Controller_Action {

    public function indexAction() {
        $this->_helper->viewRenderer->setNoRender(); //suppress auto-rendering
    }

    private function _installation() {
        if (K_INSTALL == "N") {
            $this->_redirect("/install");
        }
    }

}