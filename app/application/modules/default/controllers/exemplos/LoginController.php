<?php

class LoginController extends Base_Controller_Action {

    private $menu = array();
    private $root;
    private $item;
    private $sq_pessoa;
    private $sq_estrutura = null;

    public function init() {
        $this->_helper->layout->disableLayout();
    }

    public function indexAction() {
        $this->startEXTJS(false);
    }

    public function loginAction() {
        $this->_helper->viewRenderer->setNoRender();

        if ($this->getRequest()->isPost()) {
            if ($this->_getParam('sq_estrutura') != '') {
                $this->sq_estrutura = $this->_getParam('sq_estrutura');
                Zend_Session::namespaceUnset('global');
            }

            if ($this->_getParam('nm_cpf') != '' && $this->_getParam('ds_senha') != '') {
                $adapter = new Base_Auth_Adapter($this->_getParam('nm_cpf'),
                                $this->_getParam('ds_senha'));
                Zend_Auth::getInstance()->authenticate($adapter);
            }

            if (Zend_Auth::getInstance()->hasIdentity()) {
                $this->outputMessage(true);
                $this->sq_pessoa = Zend_Auth::getInstance()
                                ->getIdentity()->sq_pessoa;

                if ($this->sq_estrutura == null) {
                    $estrutura = Doctrine_Core::getTable('InsProfissional')
                                    ->getLotation($this->sq_pessoa);
                    $this->sq_estrutura = $estrutura[0]['sq_estrutura'];
                }
                $this->startMenuProfissional();
            } else {
                $this->outputMessage();
            }
        }
    }

    public function outputMessage($bool = false) {
        $out = array();

        if ($bool) {
            $out = array(success => true,
                title => $this->view->translate('L_V_T_AGUARDE'),
                message => $this->view->translate('L_V_MSG_COLET_INFOR_ESTRUT'),
                progressText => $this->view->translate('L_V_MSG_AGUARDE'),
            );
        } else {
            $out = array(success => false,
                title => $this->view->translate('L_V_MSG_ERROR'),
                message => $this->view->translate('L_V_MSG_USER_SENHA_INVALID'),
                progressText => $this->view->translate('L_V_MSG_AGUARDE'),
            );
        }

        $this->_response->appendBody('(' . json_encode($out) . ')');
    }

    public function startMenuProfissional() {
        $this->menuProfissional();
        $session = new Zend_Session_Namespace('global');

        $session->vars[] = array('var' =>
            'AB_PROFISSIONAL_NOME',
            'value' => Zend_Auth::getInstance()->getIdentity()->nm_pessoa,
            'type' => 'text');

        $session->vars[] = array('var' =>
            'AB_PROFISSIONAL_UNIDADE_LOGADO',
            'value' => Doctrine_Core::getTable('InsEstrutura')
                    ->find($this->sq_estrutura)->nm_estrutura,
            'type' => 'text');
        $session->vars[] = array('var' =>
            'AB_MENU_PROFISSIONAL',
            'value' => $this->getMenuProf(),
            'type' => 'object');
        $session->vars[] = array('var' =>
            'AB_PROFISSIONAL_UNIDADES',
            'value' => $this->getMenuUnidades(),
            'type' => 'object');
    }

    public function getMenuUnidades() {
        $menu = Doctrine_Core::getTable('InsProfissional')
                        ->getLotation($this->sq_pessoa);
        $text = "{text: '{{nm_estrutura}}',
                  unidade: {{sq_estrutura}},
                  handler: onClickButtonChangeUnidade },";

        foreach ($menu as $i => $v) {
            $search = array("{{nm_estrutura}}", "{{sq_estrutura}}");
            $replace = array($v['nm_estrutura'], $v['sq_estrutura']);
            $root .= str_replace($search, $replace, $text);
        }
        return $root = substr($root, 0, -1);
    }

    public function menuProfissional() {
        $itens = Doctrine_Core::getTable('InsProfissional')
                        ->getMenu($this->sq_pessoa, $this->sq_estrutura);
        $this->root = "{
            title:'{{tx_conteiner}}',
            id: 'conteiner-{{sq_conteiner}}',
            iconCls: '{{tx_icon_conteiner}}',
            root:{
                children:[{{ITEM}}]
                }
            }";

        $this->item = "{
            text: {{tx_title}},
            leaf:true,
            action:'{{tx_action}}',
            controller:'{{tx_controller}}',
            iconCls:'{{tx_icon_action}}'
            }";

        foreach ($itens as $item) {
            if (!$this->menu['menu']['conteiner-' . $item['sq_conteiner']]['root']) {
                $search = array("{{tx_conteiner}}",
                    "{{sq_conteiner}}",
                    "{{tx_icon_conteiner}}");
                $replace = array(
                    $item['nm_conteiner'],
                    $item['sq_conteiner'],
                    $item['tx_conteiner_icon']);

                $this->menu['menu']['conteiner-' .
                        $item['sq_conteiner']]['root'] = str_replace(
                                $search, $replace, $this->root);
            }

            $search = array("{{tx_title}}",
                "{{tx_action}}",
                "{{tx_controller}}",
                "{{tx_icon_action}}");
            $replace = array('global.' . $item['tx_title'],
                $item['nm_action'],
                $item['tx_controller'],
                $item['tx_action_icon']);

            $this->menu['menu']['conteiner-' .
                    $item['sq_conteiner']]['action'][] = str_replace(
                            $search, $replace, $this->item);
        }

        $this->outputMenu();
    }

    public function outputMenu() {
        $menus = $this->menu['menu'];
        $out = array();

        if (count($this->menu['menu']) > 0) {
            foreach ($menus as $conteiner => $root) {
                foreach ($root as $item => $itens) {
                    if ($item == 'root') {
                        $out[$conteiner]['root'] = $itens;
                    }
                    if ($item == 'action') {
                        $max = (count($itens) - 1);
                        for ($cont = 0; $cont <= $max; $cont++) {
                            if ($cont == $max) {
                                $out[$conteiner]['action'] .= $itens[$cont];
                            } else {
                                $out[$conteiner]['action'] .= $itens[$cont] . ',';
                            }
                        }
                    }
                    if ($out[$conteiner]['action'] && $out[$conteiner]['root']) {
                        $this->groupMenu(
                                $out[$conteiner]['action'],
                                $out[$conteiner]['root']);
                    }
                }
            }
        }
    }

    public function groupMenu($itens, $root) {
        $search = array("{{ITEM}}");
        $replace = array($itens);
        $this->menu['menu']['profissional'] .= str_replace($search, $replace, $root) . ',';
    }

    public function getMenuProf() {
        return $this->menu['menu']['profissional'] = substr($this->menu['menu']['profissional'], 0, -1);
    }

}

?>
