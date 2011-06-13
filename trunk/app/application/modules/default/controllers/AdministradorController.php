<?php

class AdministradorController extends Base_Controller_Action {

    private $upload;

    public function init() {
        parent::init();
        $this->upload = new Zend_Session_Namespace('upload');
    }

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        if ($this->_session->usuario->tx_perfil != $this->view->originalController) {
            $this->_redirect('');
        }
    }

    public function viewUsuariosAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->startEXTJS();
    }

    public function viewCriarCamisetaAction() {
        unset($_SESSION['upload']);
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->startEXTJS();
    }

    public function criarCamisetaAction() {

        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        if ($this->getRequest()->isPost()) {
            if ($this->upload->crop === true) {
                if ($this->_getParam('tm_produto') && $this->_getParam('co_produto') && $this->_getParam('nm_produto') && $this->_getParam('ds_produto') && $this->_getParam('fg_verso') && $this->_getParam('vl_produto') && $this->upload->imagem) {
                    try {
                        $error = false;
                        $produto = new TbProdutos();
                        $produto->vl_produto = $this->_getParam('vl_produto');
                        $produto->co_produto = $this->_getParam('co_produto');
                        $produto->tm_produto = $this->_getParam('tm_produto');
                        $produto->nm_produto = $this->_getParam('nm_produto');
                        $produto->ds_produto = $this->_getParam('ds_produto');
                        $produto->fg_verso = $this->_getParam('fg_verso');
                        $produto->st_privado = false; //mudar
                        $produto->hs_produto = substr($this->upload->imagem, 0, 32);
                        $produto->save();

                        $out = array(success => true, crop => true, id => substr($produto->hs_produto, 0, 32));
                        unset($this->upload->imagem);
                    } catch (Doctrine_Exception $e) {
                        $error = true;
                        $out = array(success => false, error => $e->getMessage());
                    }
                } else {
                    $out = array(success => false, crop => true);
                }
            } else {
                $out = array(success => false, crop => false);
            }

            $this->_prepareJson($out);
        }
    }

    public function removerCamisetaAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        if ($this->getRequest()->isPost()) {
            if ($this->_getParam('sq_produto') && $this->_session->usuario->sq_usuario) {
                try {
                    $rows = Doctrine_Core::getTable('TbProdutos')->remover($this->_getParam('sq_produto'));
                    if ($rows > 0) {
                        $out = array(success => true, id => $this->_getParam('sq_produto'));
                    } else {
                        $out = array(success => false);
                    }
                } catch (Doctrine_Exception $e) {
                    $out = array(success => false, error => $e->getMessage());
                }
            } else {
                $out = array(success => false, error => 'Erro nos parametros.');
            }
            $this->_prepareJson($out);
        }
    }

    public function carregarUsuariosAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        $out = Doctrine_Core::getTable('TbUsuarios')->listarUsuarios($this->_getAllParams());

        $this->_prepareJson($out);
    }

    public function carregarUsuarioAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        if ($this->getRequest()->isPost()) {

            $usuario = Doctrine_Core::getTable('TbUsuarios')->carregarUsuario($this->_getParam('sq_usuario'));
            $usuario['tx_senha'] = Base_Util::md6_decode($usuario['tx_senha']);
            $out = array(success => true, usuario => $usuario);

            if (!isset($usuario['sq_usuario'])) {
                $out = array(success => false);
            }
        } else {
            $out = array(success => false);
        }
        $this->_prepareJson($out);
    }

    public function alterarUsuarioAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        $sq_usuario = $this->_getParam('sq_usuario') ? $this->_getParam('sq_usuario') : $this->_session->usuario->sq_usuario;

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

                    $query1 = Doctrine_Query::create()
                                    ->update('TbUsuarios')
                                    ->set('nm_usuario', '?', $this->_getParam('nm_usuario'))
                                    ->set('nu_cpf', '?', Base_Util::onlyNumbers($this->_getParam('nu_cpf')))
                                    ->set('sq_municipio', '?', $this->_getParam('sq_municipio'))
                                    ->set('nu_cep', '?', Base_Util::onlyNumbers($this->_getParam('nu_cep')))
                                    ->set('tx_endereco', '?', $this->_getParam('tx_endereco'))
                                    ->set('tx_email', '?', $this->_getParam('tx_email'))
                                    ->set('tx_senha', '?', Base_Util::md6_encode($this->_getParam('tx_senha')))
                                    ->set('sq_perfil', '?', $this->_getParam('sq_perfil'))
                                    ->set('st_ativo', '?', $this->_getParam('st_ativo'))
                                    ->where('sq_usuario = ?', $sq_usuario);
                    $query1->execute();

                    $query2 = Doctrine_Query::create()
                                    ->update('TbTelefones')
                                    ->set('nu_ddd', '?', $this->_getParam('dd_celular'))
                                    ->set('nu_telefone', '?', Base_Util::onlyNumbers($this->_getParam('nu_celular')))
                                    ->where('sq_usuario = ?', $this->_session->usuario->sq_usuario)
                                    ->andWhere('tp_telefone = ?', 'Celular')
                                    ->andWhere('st_ativo = ?', true);
                    $query2->execute();

                    $query3 = Doctrine_Query::create()
                                    ->update('TbTelefones')
                                    ->set('nu_ddd', '?', $this->_getParam('dd_residencial'))
                                    ->set('nu_telefone', '?', Base_Util::onlyNumbers($this->_getParam('nu_residencial')))
                                    ->where('sq_usuario = ?', $this->_session->usuario->sq_usuario)
                                    ->andWhere('tp_telefone = ?', 'Residencial')
                                    ->andWhere('st_ativo = ?', true);
                    $query3->execute();

                    $conn->commit();

                    $out = array(success => true);
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

    public function adicionarUsuarioAction() {
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

                    /* Usuario */
                    $cliente = new TbUsuarios();
                    $cliente->sq_perfil = $this->_getParam('sq_perfil');
                    $cliente->nm_usuario = $this->_getParam('nm_usuario');
                    $cliente->nu_cpf = Base_Util::onlyNumbers($this->_getParam('nu_cpf'));
                    $cliente->sq_municipio = $this->_getParam('sq_municipio');
                    $cliente->nu_cep = Base_Util::onlyNumbers($this->_getParam('nu_cep'));
                    $cliente->tx_endereco = $this->_getParam('tx_endereco');
                    $cliente->tx_email = Base_Util::toLower($this->_getParam('tx_email'));
                    $cliente->tx_senha = Base_Util::md6_encode($this->_getParam('tx_senha'));
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

                    $out = array(success => true);
                } catch (Doctrine_Exception $e) {
                    $conn->rollback();
                    $out = array(success => false, error => ExceptionMessage::toString($e));
                }
            } else {
                $out = array(success => false, error => 'Todos os campos sao obrigatorios!');
            }
            $this->_prepareJson($out);
        }
    }

}