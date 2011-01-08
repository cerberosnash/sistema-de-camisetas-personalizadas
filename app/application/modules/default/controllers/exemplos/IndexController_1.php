<?php

class IndexController extends Base_Controller_Action {

    public function indexAction() {
        if (is_null($_SESSION['profissional'])) {
            $this->_redirect("/login");
        } else {
            $this->_redirect("/inicio");
        }
    }

    private function _installation() {
        if (K_INSTALL == "N") {
            $this->_redirect("/install");
        }
    }

}