<?php

class LoginController extends Base_Controller_Action {

    public $_aInformacoesProfissional = array();
    public $_aUnidadesProfissional = array();
    public $sq_profissional;
    public $_aEstruturaProfissionalLogado = array();
    public $sq_estrutura_logado;
    public $menu_profissional = array();
    public $a = array();
    public $root;
    public $item;
    public $nm_cpf;
    public $ds_senha;
    public $oProfissional;

    public function init() {
        $this->_helper->layout->disableLayout();
    }

    public function indexAction() {
        $this->startEXTJS(false); //use false para imprimir a variavel $this->out da view
    }

    public function loginAction() {

        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->sq_estrutura_logado = $this->_getParam('sq_estrutura_logado') != '' ? $this->_getParam('sq_estrutura_logado') : null;
        $this->nm_cpf = $_SESSION['profissional']['nm_cpf'] ? $_SESSION['profissional']['nm_cpf'] : null;
        $this->ds_senha = $_SESSION['profissional']['ds_prof_senha'] ? $_SESSION['profissional']['ds_prof_senha'] : null;
        $callback = $this->_getParam('callback');

        if ($this->getRequest()->isPost()) {
            //login principal
            if (($this->_getParam('nm_cpf') != '' && $this->_getParam('ds_senha') != '')) {
                $this->oProfissional = $profissional = new Profissional();
                $this->_aInformacoesProfissional = $profissional->autenticarProfissional(
                                $this->_getParam('nm_cpf'),
                                $this->_getParam('ds_senha')
                );

                if (count($this->_aInformacoesProfissional) > 0) {
                    $this->sq_profissional = $profissional->getSequencialProfissional();
                    $this->_aUnidadesProfissional = $profissional->getLotacoesProfissional();
                    $this->sq_estrutura_logado = $profissional->getSequencialLotacaoProfissional();
                    $profissional->setSequencialLotacaoProfissional($this->sq_estrutura_logado);
                    $this->_aEstruturaProfissionalLogado = $profissional->getLotacaoLogadoProfissional();
                    $this->registrarSessaoProfissional();
                    $out = array(
                        success => true
                        , title => $this->view->translate('L_V_T_AGUARDE') //'Aguarde'
                        , message => $this->view->translate('L_V_MSG_COLET_INFOR_ESTRUT')//'Coletando Informacoes da Estrutura...'
                        , progressText => $this->view->translate('L_V_MSG_AGUARDE') //'Aguarde...'
                        , action => $callback
                    );
                } else {
                    $out = array(
                        success => false
                        , title => $this->view->translate('L_V_MSG_ERROR') //'Ocorreu um erro'
                        , message => "'" . $this->view->translate('L_V_MSG_USER_SENHA_INVALID') . "'" //'Usuario ou Senha Invalidos!'
                        , progressText => $this->view->translate('L_V_MSG_AGUARDE') //'Aguarde...'
                        , action => $callback
                    );
                }
            }
            //trocar de estrutura
            if (($this->nm_cpf && $this->ds_senha && $this->sq_estrutura_logado)) {
                $_SESSION = array();
                $this->oProfissional = $profissional = new Profissional();
                $this->_aInformacoesProfissional = $profissional->autenticarProfissional(
                                $this->nm_cpf,
                                $this->ds_senha,
                                $this->sq_estrutura_logado
                );

                if (count($this->_aInformacoesProfissional) > 0) {
                    $this->sq_profissional = $profissional->getSequencialProfissional();
                    $this->_aUnidadesProfissional = $profissional->getLotacoesProfissional();
                    $profissional->setSequencialLotacaoProfissional($this->sq_estrutura_logado);
                    $this->_aEstruturaProfissionalLogado = $profissional->getLotacaoLogadoProfissional();
                    $this->registrarSessaoProfissional();
                    $out = array(
                        success => true,
                        title => $this->view->translate('L_V_T_AGUARDE'), //'Aguarde',
                        msg => $this->view->translate('L_V_MSG_COLET_INFOR_ESTRUT'), //'Coletando Informacoes da Estrutura...',
                        progressText => $this->view->translate('L_V_MSG_INICIANDO') //'Iniciando...'
                    );
                    $this->gravarLog(14);
                } else {
                    $out = array(
                        success => false
                        , code => 'U'
                        , message => ($this->view->translate('L_V_MSG_CARREGAR_ESTRUT'))
                        , action => $callback
                    );
                }
            }
        }
        $this->gravarLog(12);
        $callback = $callback . '(' . json_encode($out) . ')';
        $this->_response->appendBody($callback);
    }

    public function registrarSessaoProfissional() {
        if (count($this->_aInformacoesProfissional) > 0) {
            foreach ($this->_aInformacoesProfissional[0] as $v => $a) {
                $_SESSION['profissional'][$v] = $a;
            }
            $this->startMenuProfissional();
        }
    }

    public function startMenuProfissional() {
        $this->menu_profissional = $this->oProfissional->getMenuProfissional();
        $this->startMenuJsonProfissional();
        $this->buildMenuProfissional($this->menu_profissional);
        $json_menu_profissional = $this->getMenuJsonProfissional();
        $json_menu_estruturas = $this->getMenuJsonUnidades();

        $_SESSION['global']['vars'][] = array('var' => 'AB_PROFISSIONAL_NOME', 'value' => $this->_aInformacoesProfissional[0]['ds_nom_pessoa'], 'type' => 'text');
        $_SESSION['global']['vars'][] = array('var' => 'AB_PROFISSIONAL_UNIDADE_LOGADO', 'value' => $this->_aEstruturaProfissionalLogado[0]['ds_nom_estrutura'], 'type' => 'text');
        $_SESSION['global']['vars'][] = array('var' => 'AB_MENU_PROFISSIONAL', 'value' => $json_menu_profissional, 'type' => 'object');
        $_SESSION['global']['vars'][] = array('var' => 'AB_PROFISSIONAL_UNIDADES', 'value' => $json_menu_estruturas, 'type' => 'object');
    }

    public function registrarSessaoGlobal() {

    }

    public function getMenuJsonUnidades() {
        $text = "{text: '{{ds_nom_estrutura}}',unidade: {{sq_estrutura}},handler: onClickButtonChangeUnidade},";

        foreach ($this->_aUnidadesProfissional as $i => $v) {
            $search = array("{{ds_nom_estrutura}}", "{{sq_estrutura}}");
            $replace = array($v['ds_nom_estrutura'], $v['sq_estrutura']);
            $root .= str_replace($search, $replace, $text);
        }

        return $root = substr($root, 0, -1);
    }

    public function startMenuJsonProfissional() {

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
    }

    public function buildMenuProfissional($itens) {

        foreach ($itens as $item) {

            $sq_profissional = $item['sq_profissional'];
            $sq_conteiner = $item['sq_conteiner'];
            $tx_conteiner = $item['tx_conteiner'];
            $tx_icon_conteiner = $item['tx_conteiner_icon'];
            $tx_controller = $item['tx_controller'];
            $tx_action = $item['tx_action'];
            $tx_icon_action = $item['tx_action_icon'];
            $tx_title = $item['tx_title'];

            if (!$this->a['menu']['conteiner-' . $sq_conteiner]['root']) {
                $search = array("{{tx_conteiner}}", "{{sq_conteiner}}", "{{tx_icon_conteiner}}");
                $replace = array($tx_conteiner, $sq_conteiner, $tx_icon_conteiner);
                $this->a['menu']['conteiner-' . $sq_conteiner]['root'] = str_replace($search, $replace, $this->root);
            }

            $search = array("{{tx_title}}", "{{tx_action}}", "{{tx_controller}}", "{{tx_icon_action}}");
            $replace = array('global.' . $tx_title, $tx_action, $tx_controller, $tx_icon_action);
            $this->a['menu']['conteiner-' . $sq_conteiner]['action'][] = str_replace($search, $replace, $this->item);
        }

        $this->outputMenuProfissional();
    }

    public function outputMenuProfissional() {

        $menus = $this->a['menu'];
        $out = array();

        if (count($this->a['menu']) > 0) {

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
                        $this->agruparItemMenuProfissional($out[$conteiner]['action'], $out[$conteiner]['root']);
                    }
                }
            }
        }
    }

    public function agruparItemMenuProfissional($itens, $root) {
        $search = array("{{ITEM}}");
        $replace = array($itens);
        $this->a['menu']['profissional'] .= str_replace($search, $replace, $root) . ',';
    }

    public function getMenuJsonProfissional() {
        return $this->a['menu']['profissional'] = substr($this->a['menu']['profissional'], 0, -1);
    }

    public function gravarLog($prioridade) {
        $this->setMCA();

        $msg = "Efetuou Login";
        if ($prioridade == 14) {
            $msg = "trocou de estrutura";
        }
        $objLog = new Base_Log();
        $objLog->escreveLog($prioridade,
                $this->MCA['module'],
                $this->MCA['controller'],
                $this->MCA['action'],
                null,
                0,
                $a = array(),
                $msg,
                $_SESSION['profissional']['sq_profissional']
        );
    }

}