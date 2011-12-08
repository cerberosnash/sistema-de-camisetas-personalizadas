<?php

class AutenticacaoController extends Base_Controller_Action
{

    public function init ()
    {
        parent::init();
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
    }

    public function autenticarAction ()
    {
        if ($this->getRequest()->isPost()) {
            if ($this->_getParam('tx_email') && $this->_getParam('tx_senha')) {
                try {
                    $usuario = Doctrine_Core::getTable('TbUsuarios')->autenticar(Base_Util::toLower($this->_getParam('tx_email')), Base_Util::md6_encode($this->_getParam('tx_senha')));

                    if (count($usuario) > 0) {
                        /* Carregar Informacoes do Usuario da Sessao */
                        $this->_session->usuario->sq_usuario = $usuario[0]['sq_usuario'];
                        $this->_session->usuario->tx_perfil = strtolower($usuario[0]['tx_perfil']);
                        $this->_session->usuario->nm_usuario = $usuario[0]['nm_usuario'];

                        if (strtolower($usuario[0]['tx_perfil']) == 'cliente') {
                            /* Destinado Somente à Clientes */
                            $this->_session->usuario->nu_cpf = $usuario[0]['nu_cpf'];
                            $this->_session->usuario->dd_residencial = $usuario[0]['dd_residencial'];
                            $this->_session->usuario->nu_residencial = $usuario[0]['nu_residencial'];
                            $this->_session->usuario->dd_celular = $usuario[0]['dd_celular'];
                            $this->_session->usuario->nu_celular = $usuario[0]['nu_celular'];
                            $this->_session->usuario->nm_municipio = $usuario[0]['nm_municipio'];
                            $this->_session->usuario->sq_municipio = $usuario[0]['sq_municipio'];
                            $this->_session->usuario->nm_uf = $usuario[0]['nm_uf'];
                            $this->_session->usuario->sq_uf = $usuario[0]['sq_uf'];
                            $this->_session->usuario->nu_cep = $usuario[0]['nu_cep'];
                            $this->_session->usuario->tx_endereco = $usuario[0]['tx_endereco'];
                            $this->_session->usuario->tx_email = $usuario[0]['tx_email'];
                            $this->_session->usuario->tx_senha = $usuario[0]['tx_senha'];
                        }

                        $out = array(success => true, url => '/camisetas/' . $this->_session->usuario->tx_perfil, perfil => $this->_session->usuario->tx_perfil);
                    } else {
                        $out = array(success => false, error => 'Falha na Autenticação!');
                    }
                } catch (Doctrine_Exception $e) {
                    $out = array(success => false, error => $e->getMessage());
                }
            } else {
                $out = array(success => false, error => 'Email e Senha são obrigatórios!');
            }
        } else {
            $out = array(success => false, error => 'Parametros passados de forma inválida!');
        }
        $this->_prepareJson($out);
    }

    public function recuperarAction ()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        if ($this->getRequest()->isPost()) {

            $usuario = Doctrine_Core::getTable('TbUsuarios')->findByDql('tx_email = ?', $this->_getParam('tx_email'))->toArray();

            if (count($usuario) > 0) {
                if ($usuario[0]['st_ativo'] === true) {
                    $sendMail = $this->sendMailNotification(
                            array(
                                template => 'recuperar-senha',
                                email => $this->_getParam('tx_email'),
                                assunto => 'Recuperacao de Senha - Camisetas Personalizadas',
                                message => array(
                                    nome => $usuario[0]['nm_usuario'],
                                    senha => Base_Util::md6_decode($usuario[0]['tx_senha'])
                                )
                            )
                    );

                    if (!$sendMail) {
                        $out = array(success => false, error => 'Ocorreu um erro ao tentar enviar o email com a senha!');
                    } else {
                        $out = array(success => true);
                    }
                } else {
                    $out = array(success => false, error => 'Este usuário está bloqueado!');
                }
            } else {
                $out = array(success => false, error => 'Email não encontrado na base de dados!');
            }
        } else {
            $out = array(success => false, error => 'Parametros passados de forma inválida!');
        }
        $this->_prepareJson($out);
    }

}