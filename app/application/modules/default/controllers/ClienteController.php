<?php

class ClienteController extends Base_Controller_Action
{

    public function init ()
    {
        parent::init();
        if (($this->_session->usuario->tx_perfil != $this->view->originalController) && ($this->view->originalAction != 'adicionar')) {
            $this->_redirect('');
        }
    }

    public function indexAction ()
    {
        $this->_helper->layout->disableLayout();
    }

    public function viewBoletosAction ()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->startEXTJS();
    }

    public function viewMinhaCamisetaAction ()
    {
        unset($_SESSION['upload']);
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->startEXTJS();
    }

    public function viewCarrinhoAction ()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->startEXTJS();
    }

    public function viewFavoritosAction ()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->startEXTJS();
    }

    public function carregarAction ()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        if ($this->getRequest()->isPost()) {
            if (!$this->_getParam('campo')) {
                $cliente = $this->_session->usuario;
                $cliente->tx_senha = Base_Util::md6_decode($cliente->tx_senha);
                $out = array(success => true, cliente => $cliente);
                unset($cliente);
            } else {
                if (isset($this->_session->usuario->{$this->_getParam('campo')})) {
                    $out = array(success => true, campo => $this->_session->usuario->{$this->_getParam('campo')});
                } else {
                    $out = array(success => false);
                }
            }
            if (isset($this->_session->usuario->sq_usuario)) {

            } else {
                $out = array(success => false);
            }
        } else {
            $out = array(success => false);
        }
        $this->_prepareJson($out);
    }

    public function adicionarAction ()
    {
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

    public function alterarAction ()
    {
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
                            ->where('sq_usuario = ?', $sq_usuario)
                            ->andWhere('st_ativo = ?', true);
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

}