<?php

class MyBookController extends Base_Controller_Action {

    public function init() {
        $this->_helper->layout->disableLayout();
        //$this->_helper->viewRenderer->setNoRender();
    }

    public function index2Action() {
        $controller = new TbController();
        $controller->tx_controller = md5(rand());
        //$controller->TbSistema->sq_sistema = $controller->TbSistema->getTable('TbSistema')->count() + 1;
        $controller->TbSistema->ds_nom_sistema = md5(rand());
        $controller->TbSistema->ds_sigla_sistema = md5(rand());
        //$controller->TbAction[0]->sq_action = $controller->TbAction->getTable('TbAction')->count() + 1;
        $controller->TbAction[0]->tx_action = md5(rand());
        $controller->TbAction[0]->tx_action_icon = md5(rand());

        $controller->sq_sistema = $controller->TbSistema->sq_sistema;
        $this->view->out = TbControllerTable::inserirController($controller);
    }

    public function selectAction() {
        $municipio = Doctrine_Core::getTable('GeoMunicipio');
        //$municipio->find(10);
        $this->view->out = $municipio->findBy('sg_uf', 'DF');
    }

    public function indexAction() {
        $this->view->action = "teste";
     //   $geo = Doctrine_Core::getTable('GeoMunicipio')->findAll()->toArray();
       // $geo = PesPessoa::autenticar(01492364177, 123456);
        
      /*  $tipo = new PesTipo();
        $tipo->cd_tipo = "df";
        $tipo->nm_tipo = "Teste";
        $tipo->st_ativo = "true";
        $tipo->save();*/

       // $this->view->out = $geo->toArray();
    }

    public function fixturesAction() {
        /* Conexao */
        $conn = Doctrine_Manager::connection();
        /* Sequences */
        $sequences = $conn->import->listSequences('events_db');
        $this->view->sequences = $sequences;
        /* Databases */
        $databases = $conn->import->listDatabases();
        $this->view->databases = $databases;
        /* Constrainst */
        $constraints = $conn->import->listTableConstraints('michael');
        $this->view->constraints = $constraints;
        /* Table Colunns */
        $columns = $conn->import->listTableColumns('michael');
        $this->view->columns = $columns;
        /* Tables */
        $tables = $conn->import->listTables();
        $this->view->tables = $tables;
    }

    public function criarBancoAction() {
        $this->_helper->viewRenderer->setNoRender();
        $conn = Doctrine_Manager::connection();
        $conn->export->createDatabase($this->_getParam('nome'));
    }

    public function criarTabelaAction() {
        $this->_helper->viewRenderer->setNoRender();
        $conn = Doctrine_Manager::connection();

        $definition = array(
            'id' => array(
                'type' => 'integer',
                'primary' => true,
                'autoincrement' => false
            ),
            'name' => array(
                'type' => 'string',
                'length' => 255
            ),
            'datetime' => array(
                'type' => 'timestamp'
            )
        );

        $conn->export->createTable('michael', $definition);
    }

    public function alterarTabelaAction() {
        $this->_helper->viewRenderer->setNoRender();
        $conn = Doctrine_Manager::connection();

        $alter = array('name' => 'id',
            'change' => array(
                'id' => array(
                    'autoincrement' => true
                )
            )
        );

        $conn->export->alterTable('michael', $alter);
    }

}