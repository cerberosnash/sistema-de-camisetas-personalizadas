<?php

/**
 * Classe que configura os requisitos iniciais, do CSS e de codificação de saída antes de renderizar o layout.
 */
class Base_Controller_Plugin_ViewSetup extends Zend_Controller_Plugin_Abstract {

    /**
     * var Base_View
     */
    protected $_view;

    public function dispatchLoopStartup(Zend_Controller_Request_Abstract $request) {
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('viewRenderer');
        //Inicializa ViewRenderer
        $viewRenderer->init();

        $view = $viewRenderer->view;
        $this->_view = $view;

        //Configura variáveis que podem ser necessárias na visão
        $view->originalModule = $request->getModuleName();
        $view->originalController = $request->getControllerName();
        $view->originalAction = $request->getActionName();

        //Configura doctype para helpers da visão
        $view->doctype('XHTML1_STRICT');

        //Adiciona caminho do novo helper aos helpers de visão do Base
        $prefixView = 'Base_View_Helper';
        $prefixController = 'Base_Controller_Action_Helper';
        $dirView = dirname(__FILE__) . '/../../View/Helper';
        $dirController = dirname(__FILE__) . '/../Action/Helper';
        $view->addHelperPath($dirView, $prefixView);
        Zend_Controller_Action_HelperBroker::addPath($dirController, $prefixController);

        //Define o tipo de conteúdo
        $view->headMeta()->setName('Content-Type', 'text/html; charset=utf-8');
        $view->headMeta()->setName('cache-control', 'no-cache');

        //Defini o Titulo do Sistema
        $view->headTitle(mb_strtoupper(SYSTEM_NAME, 'utf-8'));
        $view->systemname = SYSTEM_NAME;

        //Carrega os CSS's do sistema
        $this->_configureCss($view);
        //Carrega favicon do sistema
        $view->headLink()->headLink(array('rel' => 'shortcut icon', 'href' => $view->baseUrl() . '/public/img/favicon.gif', 'type' => 'image/x-icon'));

        //Carrega os JS's do sistema
        //  $this->_configureLayout();
        $this->_configureFileScriptDefault($view);
        $this->_appendScript($view);
        $this->_appendScriptSession($view);
    }

    private function _configureTheme() {
        $theme = "gray";
        if (!is_null($_SESSION['theme'])) {
            $theme = $_SESSION['theme'];
        }
        return $theme;
    }

    private function _configureLanguage() {
        $language = "pt_BR";
        if (!is_null($_SESSION['language'])) {
            $language = $_SESSION['language'];
        }
        return $language;
    }

    private function _configureLayout($view) {
        // $view->headScript()->appendFile($view->baseUrl() . '/application/modules/default/views/layouts/listeners.js', 'text/javascript', array('language' => 'javascript'));
        // $view->headScript()->appendFile($view->baseUrl() . '/application/modules/default/views/layouts/toolbar.js', 'text/javascript', array('language' => 'javascript'));
        // $view->headScript()->appendFile($view->baseUrl() . '/application/modules/default/views/layouts/layout.js', 'text/javascript', array('language' => 'javascript'));
    }

    /**
     * Método que carrega o CSS do sisyema
     */
    private function _configureCss($view) {
        //Incluir arquivos CSS padrão
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/resources/css/ext-all.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/shared/icons/silk.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/css/icons-fam.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/tabs/tabs-example.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/ux/css/PanelResizer.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/grid/grid-examples.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/menu/menus.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/ux/statusbar/css/statusbar.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/shared/examples.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/resources/css/customized.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/resources/css/xtheme-' . $this->_configureTheme() . '.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/css/icons-fam.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/css/icons-flags.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/css/layout.css', 'screen, projection');

        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/view/animated-dataview.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/grid/multiple-sorting.css', 'screen, projection');

        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/ux/css/RowEditor.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/ux/css/Spinner.css', 'screen, projection');
    }

    private function _configureFileScriptDefault($view) {
        //Incluir arquivos JS padrao
        $view->headScript()->appendFile($view->baseUrl() . '/public/extjs/adapter/ext/ext-base.js', 'text/javascript', array('language' => 'javascript'));
        $view->headScript()->appendFile($view->baseUrl() . '/public/extjs/blank-image-url.js', 'text/javascript', array('language' => 'javascript'));
        $view->headScript()->appendFile($view->baseUrl() . '/public/extjs/ext-all.js', 'text/javascript', array('language' => 'javascript'));
        $view->headScript()->appendFile($view->baseUrl() . '/public/extjs/src/locale/ext-lang-pt_BR.js', 'text/javascript', array('language' => 'javascript'));
        $view->headScript()->appendFile($view->baseUrl() . '/public/extjs/examples/shared/examples.js', 'text/javascript', array('language' => 'javascript'));
        // $view->headScript()->appendFile($view->baseUrl() . '/application/modules/default/views/layouts/' . $view->originalController . '/TabCloseMenu.js', 'text/javascript', array('language' => 'javascript'));
        //$view->headScript()->appendFile($view->baseUrl() . '/application/modules/default/views/layouts/' . $view->originalController . '/listeners.js', 'text/javascript', array('language' => 'javascript'));
        //$view->headScript()->appendFile($view->baseUrl() . '/application/modules/default/views/layouts/' . $view->originalController . '/toolbar.js', 'text/javascript', array('language' => 'javascript'));
    }

    private function _appendScript($view) {/*
      $scriptInicial  = ( isset($_SESSION['oasis_logged']) )? " var welcome = true; ":" var welcome = false; ";
      $scriptInicial .= " var systemName = '{$view->baseUrl()}';";
      $scriptInicial .= " var systemNameModule = '{$view->originalModule}';";

      $scriptInicial .= "
      $(document).ready(function(){
      $('.buttonBarLeft').css('display',''); ";

      if(key_exists('oasis_logged',$_SESSION)) {
      if(key_exists('cd_profissional',$_SESSION['oasis_logged'][0])) {
      if($_SESSION['oasis_logged'][0]['cd_profissional'] === "0") {
      $scriptInicial .= " jQuery('#cabeca').height('112px'); ";
      }
      }
      } else {
      $scriptInicial .= "
      $('#sair a').hide();
      $('#sair').css('padding-right',5);
      $('#sair').css('margin-left',-1); ";
      }

      $scriptInicial .= " }); ";

      $view->headScript()->appendScript($scriptInicial); */
    }

    private function _appendScriptSession($view) {

        $SESSION = array();
        $controller = $view->originalController;
        $action = $view->originalAction;
        $modulo = $view->originalModule;

        if ($controller == 'login' && $action == 'index' && $modulo == 'default') {
            $_SESSION = array();
        }

        if (key_exists('profissional', $_SESSION)) {
            if (key_exists('nm_cpf', $_SESSION['profissional'])) {
                if ($_SESSION['profissional']) {

                    /* $script .= 'alert("' . $_SESSION['profissional']['nm_cpf'] .
                      ' - ' . $_SESSION['profissional']['ds_prof_senha'] .
                      ' - ' . $_SESSION['profissional']['sq_profissional'] .
                      '");'; */
                }
            }
        } else {
            // $script .= "alert('" . $_SESSION['profissional']['nm_cpf'] . "');";
            //$script .= "alert('nao logado');";
        }

        if (key_exists('global', $_SESSION)) {
            if (key_exists('vars', $_SESSION['global'])) {
                foreach ($_SESSION['global']['vars'] as $vars => $var) {
                    $script .= Base_Util::PhpToJavascript($var['var'], $var['value'], $var['type']);
                }
            }
        }

        // $view->headScript()->appendScript($script);
        $view->main = $script;
        $view->controller = $view->originalController;
    }

}