<?php

class RelatoriosController extends Base_Controller_Action {

    public function init() {
        parent::init();
        if (($this->_session->usuario->tx_perfil != 'administrador')) {
            $this->_redirect('');
        }
    }

    public function gerarAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        switch ($this->_getParam('opcao')) {
            case 1:

                /* Descricao do Relatorio */

                $PHPJasperXML = new Base_PHPJasperXML();
                $PHPJasperXML->debugsql = false;
                $PHPJasperXML->arrayParameter = array("value1" => 1);
                $PHPJasperXML->xml_dismantle(simplexml_load_file('../library/PHPJasperXML/Templates/' . $this->_getParam('opcao') . '.jrxml'));

                $PHPJasperXML->transferDBtoArray();
                $PHPJasperXML->outpage("I");    //page output method I:standard output  D:Download file

                break;

            case 2:
                echo 'relatorio 2';
                break;

            case 3:
                echo 'relatorio 3';
                break;

            default:
                echo 'relatorio ' . $this->_getParam('opcao') . ' ainda nao foi registrado pela administrador do sistemas!';
                break;
        }
    }

}