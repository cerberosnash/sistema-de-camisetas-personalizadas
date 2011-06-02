<?php

class UtilController extends Base_Controller_Action {

    public function init() {
        parent::init();
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }

    public function indexAction() {
        /* debugger */
        $this->_helper->layout->disableLayout();
        if ($this->_session->usuario->tx_perfil) {
            $this->_redirect($this->_session->usuario->tx_perfil);
        }
    }

    public function codigoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        if ($_SESSION['autenticacao']['captcha']) {
            $out = array('success' => true, 'code' => $_SESSION['autenticacao']['captcha']);
        } else {
            $out = array('success' => false);
        }
        $this->_prepareJson($out);
    }

    public function combosAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        switch ($this->_getParam('combo')) {
            case 'ufs':
                $out['estados'] = Doctrine_Core::getTable('TbUfs')->findBy('st_ativo', true)->toArray();
                $out['totalCount'] = Doctrine_Core::getTable('TbUfs')->findBy('st_ativo', true)->count();
                $this->_prepareJson($out);
                break;

            case 'municipios':
                $out['municipios'] = Doctrine_Core::getTable('TbMunicipios')->findByDql('sq_uf = ? AND st_ativo = ?', array($this->_getParam('sq_uf'), true))->toArray();
                $out['totalCount'] = Doctrine_Core::getTable('TbMunicipios')->findByDql('sq_uf = ? AND st_ativo = ?', array($this->_getParam('sq_uf'), true))->count();
                $this->_prepareJson($out);
                break;

            case 'cores':
                $out = array('combo=' => $this->_getParam('combo'));
                break;

            default:
                break;
        }
    }

    public function captchaAction() {
        $captcha = new Captcha(72, 25, 4);
    }

}
