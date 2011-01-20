<?php

class Base_Controller_Action extends Zend_Controller_Action {

    protected $MCA = array();
    protected $_session;

    public function startAutenticacao() {
        session_start();
        if (!isset($_SESSION['Zend_Session_Namespace'])) {
            $this->_session = $_SESSION['Zend_Session_Namespace'] = new Zend_Session_Namespace('autenticacao');
        } else {
            $this->_session = $_SESSION['Zend_Session_Namespace'];
        }
    }

    protected function _prepareJson($out) {
        $callback = '(' . json_encode($out) . ')';
        $this->_response->appendBody($callback);
    }

    public function setMCA() {
        $this->MCA = array(
            'module' => $this->view->originalModule,
            'controller' => $this->view->originalController,
            'action' => $this->view->originalAction
        );
    }

    public function getMCA() {
        return $this->MCA;
    }

    public function init() {
        $this->startAutenticacao();
        $this->setMCA();
    }

    protected function toUpper($value) {
        $objFilter = new Zend_Filter();
        $objStringToUpper = new Zend_Filter_StringToUpper();

        $objStringToUpper->setEncoding('UTF-8');
        $objFilter->addFilter($objStringToUpper);

        return $objFilter->filter($value);
    }

    protected function toLower($value) {
        $objFilter = new Zend_Filter();
        $objStringToLower = new Zend_Filter_StringToLower();

        $objStringToLower->setEncoding('UTF-8');
        $objFilter->addFilter($objStringToLower);

        return $objFilter->filter($value);
    }

    public function startEXTJS($default=true) {
        $file = "../application/modules/" . $this->view->originalModule . "/views/scripts/"
                . $this->view->originalController . "/" . $this->view->originalAction . ".js";

        $file = utf8_encode(file_get_contents($file));

        if ($default === true) {
            $this->_response->appendBody($this->appendVariableExtJS() . $file);
        } else if ($default === false) {
            $this->view->out = $file;
        }
    }

    public function errorEXTJS($error) {
        $file = ROOT_DIR . "/application/modules/" . $this->view->originalModule . "/views/scripts/error/error.js";
        $file = utf8_encode(file_get_contents($file));
        $search = array("{{TITLE}}", "{{MESSAGE}}");
        $replace = array('Ocorreu um Erro', $error);
        $file = str_replace($search, $replace, $file);
        $this->view->out = $file;
    }

    public function appendVariableExtJS() {
        if ($this->view->originalAction != 'help') {
            include $this->_directory . DIRECTORY_SEPARATOR . $_SESSION['language'] . '.php';
            $arrayVar = $translationStrings[$this->view->originalModule]
                    [$this->view->originalController]
                    [$this->view->originalAction];
            $script = " var label = " . Zend_Json::encode($arrayVar) . ";";
            return $script;
        } else {
            return;
        }
    }

}