<?php

class Base_Controller_Plugin_ViewSetup extends Zend_Controller_Plugin_Abstract {

    protected $_view;

    public function dispatchLoopStartup(Zend_Controller_Request_Abstract $request) {
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('viewRenderer');
        $viewRenderer->init();
        $view = $viewRenderer->view;
        $this->_view = $view;
        $view->originalModule = $request->getModuleName();
        $view->originalController = $request->getControllerName();
        $view->originalAction = $request->getActionName();
        $view->doctype('XHTML1_STRICT');
        $prefixView = 'Base_View_Helper';
        $prefixController = 'Base_Controller_Action_Helper';
        $dirView = dirname(__FILE__) . '/../../View/Helper';
        $dirController = dirname(__FILE__) . '/../Action/Helper';
        $view->addHelperPath($dirView, $prefixView);
        Zend_Controller_Action_HelperBroker::addPath($dirController, $prefixController);
        $view->headMeta()->setName('Content-Type', 'text/html; charset=utf-8');
        $view->headMeta()->setName('cache-control', 'no-cache');
        $view->headTitle(mb_strtoupper(SYSTEM_NAME, 'utf-8'));
        $view->systemname = SYSTEM_NAME;
        $view->headLink()->headLink(array('rel' => 'shortcut icon', 'href' => $view->baseUrl() . '/public/img/favicon.gif', 'type' => 'image/x-icon'));
        $this->_configureCss($view);
        $this->_configureJavascript($view);
    }

    private function _configureCss($view) {
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
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/resources/css/xtheme-gray.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/css/icons-fam.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/css/icons-flags.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/css/layout.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/view/animated-dataview.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/grid/multiple-sorting.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/ux/css/RowEditor.css', 'screen, projection');
        $view->headLink()->appendStylesheet($view->baseUrl() . '/public/extjs/examples/ux/css/Spinner.css', 'screen, projection');
    }

    private function _configureJavascript($view) {
        $view->headScript()->appendFile($view->baseUrl() . '/public/extjs/adapter/ext/ext-base.js', 'text/javascript');
        $view->headScript()->appendFile($view->baseUrl() . '/public/extjs/blank-image-url.js', 'text/javascript');
        $view->headScript()->appendFile($view->baseUrl() . '/public/extjs/ext-all.js', 'text/javascript');
        $view->headScript()->appendFile($view->baseUrl() . '/public/extjs/src/locale/ext-lang-pt_BR.js', 'text/javascript');
        $view->headScript()->appendFile($view->baseUrl() . '/public/extjs/examples/shared/examples.js', 'text/javascript');
    }

}