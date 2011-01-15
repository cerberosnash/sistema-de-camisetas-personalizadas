<?php

class RelatorioController extends Base_Controller_Action {

    public function indexAction() {
              $this->_helper->layout->disableLayout();
      //  $this->_helper->viewRenderer->setNoRender(); //suppress auto-rendering
    
//        if (is_null($_SESSION['profissional'])) {
//            $this->_redirect("/login");
//        } else {
//            $this->_redirect("/inicio");
//        }
    }

    private function _installation() {
        if (K_INSTALL == "N") {
            $this->_redirect("/install");
        }
    }

}