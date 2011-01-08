<?php

class PerfilConfigController extends Base_Controller_Action {

    public function init() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }

    public function indexAction() {

    }

    public function languageAction() {
        if ($this->getRequest()->isPost()) {
            try {
                $_SESSION["language"] = $this->_getParam("param");
                $out = array(
                    success => true,
                    msg => 'global.L_V_MSG_CARREGANDO_IDIOMA',
                    progressText => 'global.L_V_MSG_CARREGANDO_IDIOMA'
                );
            } catch (Exception $e) {
                $out = array(
                    success => false,
                    msg => $e->getMessage()
                );
            }
            $callback = '(' . json_encode($out) . ')';
            $this->_response->appendBody($callback);
        }
    }

    public function themeAction() {
        if ($this->getRequest()->isPost()) {
            try {
                $_SESSION["theme"] = $this->_getParam("param");
                $out = array(
                    success => true,
                    msg => 'global.L_V_MSG_CARREGANDO_TEMA',
                    progressText => 'global.L_V_MSG_CARREGANDO_TEMA'
                );
            } catch (Exception $e) {
                $out = array(
                    success => false,
                    msg => $e->getMessage()
                );
            }
            $callback = '(' . json_encode($out) . ')';
            $this->_response->appendBody($callback);
        }
    }

}