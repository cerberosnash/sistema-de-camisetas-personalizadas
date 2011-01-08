<?php

class UnidadeOrganizacionalController extends Base_Controller_Action {

    public function init() { //toda vez que for sobrescrever o metodo init invoke "parent::init()" para carregar os objMCA
        parent::init();
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }

    public function indexAction() {
        
    }

    public function adicionarUnidOrganizAction() {
        if (Zend_Auth::getInstance()->hasIdentity()) {
            if ($this->getRequest()->isPost()) {
                try {
                    $id = InsUnidOrganiz::insert(UnidOrganiz::saveInstance(
                            $this->getRequest()->getParams()));
                    $out = array('success' => true,
                        'action' => 'add',
                        'title' => $this->view->translate('L_V_T_SUCESSO'),
                        'icon' => 'ext-mb-info',
                        'msg' => $this->view->translate('L_V_MSG_UNID_ADD_SUCESSO'),
                        'id' => $id
                    );
                } catch (Exception $e) {
                    $out = array(success => true,
                        'action' => 'add',
                        'title' => $this->view->translate('L_V_T_ERROR'),
                        'icon' => 'ext-mb-info',
                        'msg' => $e->getMessage()
                    );
                }
                $this->_response->appendBody('(' . json_encode($out) . ')');
            }
        }
    }

    public function salvarUnidOrganizAction() {
        if (Zend_Auth::getInstance()->hasIdentity()) {
            if ($this->getRequest()->isPost()) {
                try {
                   $_SESSION['post'] = $this->getRequest()->getParams();
                    InsUnidOrganiz::update(UnidOrganiz::updateInstance($this->getRequest()->getParams()));

                    $out = array('success' => true,
                        'action' => 'save',
                        'title' => $this->view->translate('L_V_T_SUCESSO'),
                        'icon' => 'ext-mb-info',
                        'msg' => $this->view->translate('L_V_MSG_UNID_ALT_SUCESSO')
                    );
                } catch (Exception $e) {
                    $out = array('success' => false,
                        'title' => $this->view->translate('L_V_T_ERROR'),
                        'icon' => 'ext-mb-error',
                        'msg' => $e->getMessage()
                    );
                }
                $this->_response->appendBody('(' . json_encode($out) . ')');
            }
        }
    }

    public function excluirUnidOrganizAction() {
        if (Zend_Auth::getInstance()->hasIdentity()) {
            if ($this->getRequest()->isPost()) {
                try {
                    InsUnidOrganiz::deleteById($this->getRequest()->getParam('sq_unid_organiz'));

                    $out = array('success' => true,
                        'action' => 'save',
                        'title' => $this->view->translate('L_V_T_SUCESSO'),
                        'icon' => 'ext-mb-info',
                        'msg' => $this->view->translate('L_V_MSG_UNID_DEL_SUCESSO')
                    );
                } catch (Exception $e) {
                    $out = array('success' => false,
                        'title' => $this->view->translate('L_V_T_ERROR'),
                        'icon' => 'ext-mb-error',
                        'msg' => $e->getMessage()
                    );
                }
                $this->_response->appendBody('(' . json_encode($out) . ')');
            }
        }
    }

    public function comboUnidOrganizAction() {
        if ($this->getRequest()->isPost()) {
            $search = $this->getRequest()->getParam('query');
            $page = $this->getRequest()->getParam('start');

            $out = Doctrine_Core::getTable('InsUnidOrganiz')
                            ->getComboUnidOrganiz($search, $page);
            $this->_response->appendBody('(' . json_encode($out) . ')');
        }
    }

    public function comboMunicipiosAction() {
        if ($this->getRequest()->isPost()) {
            $search = $this->getRequest()->getParam('query');
            $out = Doctrine_Core::getTable('GeoMunicipio')
                            ->getComboMunicipio($search);
            $this->_response->appendBody('(' . json_encode($out) . ')');
        }
    }

    public function comboUfsAction() {
        if ($this->getRequest()->isPost()) {
            $out = Doctrine_Core::getTable('GeoUf')
                            ->getComboUf();
            $this->_response->appendBody('(' . json_encode($out) . ')');
        }
    }

    public function comboTipUnidOrganizAction() {
        if ($this->getRequest()->isPost()) {
            $search = $this->getRequest()->getParam('query');
            $page = $this->getRequest()->getParam('start');

            $out = Doctrine_Core::getTable('InsUnidTipo')
                            ->getComboTipUnidOrganiz($search, $start);
            $this->_response->appendBody('(' . json_encode($out) . ')');
        }
    }

    public function listarUnidadesOrganizacionaisAction() {
        if ($this->getRequest()->isPost()) {
            $page = $this->getRequest()->getParam('start');

            $dir = $this->getRequest()->getParam('dir');
            $field = $this->getRequest()->getParam('sort');
			$search = $this->getRequest()->getParam('query');

            $out = Doctrine_Core::getTable('InsUnidOrganiz')
                            ->listUnidOrganiz($page, $field, $dir, $search);
            $this->_response->appendBody('(' . json_encode($out) . ')');
        }
    }
	

    public function viewManterUnidadeOrganizacionalAction() {
        $this->startEXTJS();
    }

    public function filtroUnidadesOrganizacionaisAction() {


        $params["start"] = $this->_getParam('start') ? $this->_getParam('start') : null;
        $params["limit"] = $this->_getParam('limit') ? $this->_getParam('limit') : null;
        $params["search"] = $this->_getParam('fields') ? json_decode($this->_getParam('fields')) : null;
        $params["query"] = $this->_getParam('query') ? $this->_getParam('query') : null;
        $params["sort"] = $this->_getParam('sort') ? $this->_getParam('sort') : null;
        $params["dir"] = $this->_getParam('dir') ? $this->_getParam('dir') : null;

        $out = array(
            "success" => true
            , "totalCount" => print_r($params, true)
            , "rows" => print_r($params, true)
        );
//  $osql->output($response);

        /*         * */

// $this->oUnidadeOrganizacional = new UnidadeOrganizacional($this->getMCA());
// $out = $this->oUnidadeOrganizacional->filterUnidadesOrganizacionais($where);

        if ($out) {
//   header('Content-Type: application/x-json');
            $this->_response->appendBody(json_encode($out));
        }
    }

}