<?php

class Bootstrap {

    private $_configSection;

    public function __construct($configSection) {
        $this->_configSection = $configSection;
        //$this->_configureHeader();
        $this->_configureIni();

        $rootDir = dirname(dirname(__FILE__));
        define('ROOT_DIR', $rootDir);

        set_include_path(
                PATH_SEPARATOR . ROOT_DIR . '/application/modules/default/models'
                . PATH_SEPARATOR . ROOT_DIR . '/application/modules/default/models/Base'
                . PATH_SEPARATOR . ROOT_DIR . '/application/configuration'
                . PATH_SEPARATOR . ROOT_DIR . '/library'
                . PATH_SEPARATOR . ROOT_DIR . '/application/exceptions'
                . PATH_SEPARATOR . ROOT_DIR . '/library/Base/Smtp'
                . PATH_SEPARATOR . ROOT_DIR . '/library/Base'
                . PATH_SEPARATOR . ROOT_DIR . '/library/Doctrine'
                . PATH_SEPARATOR . ROOT_DIR . '/library/Util'
                . PATH_SEPARATOR . ROOT_DIR . '/library/Util/Boletos'
                . PATH_SEPARATOR . get_include_path()
        );

        include_once 'const.php';
        include_once 'Zend/Loader/Autoloader.php';
        include_once 'Doctrine.php';

        try {
            $autoloader = Zend_Loader_Autoloader::getInstance();
            $autoloader->setFallbackAutoloader(true);
            $autoloader->registerNamespace('Base_');
            $autoloader->pushAutoloader(array('Doctrine', 'autoload'), 'Doctrine');
            spl_autoload_register(array('Doctrine', 'autoload'));
            $registry = Zend_Registry::getInstance();
            $config = new Zend_Config_Ini(ROOT_DIR . '/application/configuration/config.ini');
            $registry->set('config', $config);
            date_default_timezone_set($config->configuration->date_default_timezone);
            $this->_initDoctrine();
        } catch (Exception $e) {
            $this->_exception($e);
        }
    }

    public function runApp() {
        Zend_Session::start();
        $this->_configureLayout();
        $front = Zend_Controller_Front::getInstance();
        $front->setBaseUrl('/' . SYSTEM_NAME);
        $front->throwExceptions(false);
        $front->registerPlugin(new Base_Controller_Plugin_ViewSetup());
        $front = Zend_Controller_Front::getInstance();
        $front->addModuleDirectory(ROOT_DIR . '/application/modules');
        $front->dispatch();
    }

    private function _configureLayout() {
        Zend_Layout::startMvc(array('layoutPath' => ROOT_DIR . '/application/modules/default/views/layouts'));
    }

//    private function _configureHeader() {
//        // Evita que os dados sejam recuperados do cache do browser.
//        header("Expires:Mon, 26 Jul 1997 05:00:00 GMT"); //colocamos uma data passada para que expire
//        header("Last-Modified:" . gmdate("D, dM Y H:i:s") . "GMT"); //Última modificação, justo agora.
//        header("Cache-Control: no-cache, must-revalidate"); //evita que se guarde em cache, HTTP 1.1
//        header("Cache-Control: post-check=0, pre-check=0", false);
//        header("Pragma: no-cache"); //evita que se guarde em cache HTTP 1.0
//    }

    private function _configureIni() {
        ini_set('default_charset', 'UTF-8');
        ini_set('display_errors', 1);
        ini_set('max_execution_time', '0');
        ini_set('memory_limit', '100M');
    }

    private function _exception($exception) {
        echo "<pre>";
        var_dump($exception);
        echo "</pre>";
        die("<br />LINE: " . __LINE__ . "<br />FILE: " . __FILE__);
    }

    protected function _initDoctrine() {
        $configSelection = $this->_configSection;
        $banco = Zend_Registry::get('config');
        $manager = Doctrine_Manager::getInstance();
        $manager->setAttribute(Doctrine::ATTR_AUTO_ACCESSOR_OVERRIDE, true);
        $manager->setAttribute(Doctrine::ATTR_AUTOLOAD_TABLE_CLASSES, true);
        $manager->setAttribute(
                Doctrine::ATTR_MODEL_LOADING,
                Doctrine::MODEL_LOADING_AGGRESSIVE
        );

        Doctrine::loadModels($banco->prod->doctrine->models_path);
        $conn = Doctrine_Manager::connection($banco->prod->doctrine->dsn, 'doctrine');
        $conn->setAttribute(Doctrine::ATTR_USE_NATIVE_ENUM, true);

        return $conn;
    }

}