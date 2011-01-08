<?php

class LogoffController extends Base_Controller_Action {

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        Zend_Session::destroy();
        $this->_redirect('');
    }

}