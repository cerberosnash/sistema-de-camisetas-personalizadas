<?php

class ClienteController extends Base_Controller_Action {

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }

    public function init() {
        parent::init();
        if ($this->_session->usuario->tx_perfil != $this->view->originalController) {
//  $this->_redirect('');
            //echo 'Acesso Restrito' . $this->view->originalController . ' ed ' . $this->_session->usuario->tx_perfil;
        } else {
            //echo 'Restrito Permitido..' . $this->view->originalController . ' ed ' . $this->_session->usuario->tx_perfil;
        }
    }

    public function carregarAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
//        if (isset($this->_session->usuario->sq_usuario)) {
//            $out = array(success => true, cliente => $this->_session->usuario);
//        } else {
//            $out = array(success => false);
//        }
//        $this->_prepareJson($out);

        $out = '({"success":true,"cliente":{"sq_usuario":1,"tx_perfil":"cliente","nm_usuario":"Michael Fernandes Rodrigues","nu_cpf":"73762385149","dd_residencial":"061","nu_residencial":"34346810","dd_celular":"061","nu_celular":"91455656","sq_municipio":1,"nu_cep":"72610512","tx_endereco":"Quadra 205 Conjunto 12 Casa 06","tx_email":"cerberosnash@gmail.com","tx_senha":"123456"}})';
        $this->_response->appendBody($out);
    }

    public function adicionarAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        if ($this->getRequest()->isPost()) {
            if (
                    $this->_getParam('nm_usuario') &&
                    $this->_getParam('nu_cpf') &&
                    $this->_getParam('sq_municipio') &&
                    $this->_getParam('nu_cep') &&
                    $this->_getParam('tx_endereco') &&
                    $this->_getParam('tx_email') &&
                    $this->_getParam('tx_senha') &&
                    $this->_getParam('dd_residencial') &&
                    $this->_getParam('nu_residencial') &&
                    $this->_getParam('dd_celular') &&
                    $this->_getParam('nu_celular')
            ) {

                try {
                    $conn = Doctrine_Manager::connection();
                    $conn->beginTransaction();

                    /* Cliente */
                    $cliente = new TbUsuarios();
                    $cliente->sq_perfil = 1; //cliente
                    $cliente->nm_usuario = $this->_getParam('nm_usuario');
                    $cliente->nu_cpf = Base_Util::onlyNumbers($this->_getParam('nu_cpf'));
                    $cliente->sq_municipio = $this->_getParam('sq_municipio');
                    $cliente->nu_cep = Base_Util::onlyNumbers($this->_getParam('nu_cep'));
                    $cliente->tx_endereco = $this->_getParam('tx_endereco');
                    $cliente->tx_email = Base_Util::toLower($this->_getParam('tx_email'));
                    $cliente->tx_senha = $this->_getParam('tx_senha');
                    $cliente->save();
                    /* Telefones */
                    /* Residencial */
                    $residencial = new TbTelefones();
                    $residencial->sq_usuario = $cliente->sq_usuario;
                    $residencial->tp_telefone = 'Residencial';
                    $residencial->nu_ddd = Base_Util::onlyNumbers($this->_getParam('dd_residencial'));
                    $residencial->nu_telefone = Base_Util::onlyNumbers($this->_getParam('nu_residencial'));
                    $residencial->save();
                    /* Celular */
                    $celular = new TbTelefones();
                    $celular->sq_usuario = $cliente->sq_usuario;
                    $celular->tp_telefone = 'Celular';
                    $celular->nu_ddd = Base_Util::onlyNumbers($this->_getParam('dd_celular'));
                    $celular->nu_telefone = Base_Util::onlyNumbers($this->_getParam('nu_celular'));
                    $celular->save();

                    $conn->commit();

                    $out = array(success => true, id => $cliente->sq_usuario);
                } catch (Doctrine_Exception $e) {
                    $conn->rollback();
                    $out = array(success => false, error => $e->getMessage());
                }
            } else {
                $out = array(success => false, error => 'Todos os campos sao obrigatorios!');
            }
            $this->_prepareJson($out);
        }
    }

}