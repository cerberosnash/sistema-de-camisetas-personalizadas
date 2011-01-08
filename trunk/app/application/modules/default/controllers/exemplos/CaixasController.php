<?php

class CaixasController extends Base_Controller_Action {

    private $res = array();

    /**
     * Init method.
     *
     * @access public
     * @see library/Zend/Controller/Zend_Controller_Action#init()
     */
    public function init() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }

    public function indexAction() {

    }

    /**
     * Method returning help of user
     * @return HTML help
     *
     */
    public function helpAction() {
        if (!$this->getRequest()->isPost()) {
            throw new Exception_InvalidRequest(AB_MSG_INVALID_REQUEST);
        }
        $this->startEXTJS();
    }

    public function caixaEntradaAction() {
        if (!$this->getRequest()->isPost()) {
            throw new Exception_InvalidRequest(AB_MSG_INVALID_REQUEST);
        }
        $this->startEXTJS();
    }

    public function areaTrabalhoAction() {
        if (!$this->getRequest()->isPost()) {
            throw new Exception_InvalidRequest(AB_MSG_INVALID_REQUEST);
        }
        $this->startEXTJS();
    }

    public function caixaSaidaAction() {
        if (!$this->getRequest()->isPost()) {
            throw new Exception_InvalidRequest(AB_MSG_INVALID_REQUEST);
        }
        $this->startEXTJS();
    }

}

