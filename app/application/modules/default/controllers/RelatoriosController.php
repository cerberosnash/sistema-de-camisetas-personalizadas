<?php

class RelatoriosController extends Base_Controller_Action {

    public function init() {
        parent::init();
        if (($this->_session->usuario->tx_perfil != 'administrador')) {
            $this->_redirect('');
        }
    }

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        if (($this->_session->usuario->tx_perfil != 'administrador')) {
            $this->_redirect('');
        }
    }

    public function gerarAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();

        $PHPJasperXML = new Base_PHPJasperXML();
        $PHPJasperXML->debugsql = false;

        switch ($this->_getParam('opcao')) {
            case 1:
                /* Relatorio de camisetas vendidas [Periodo] */
                $PHPJasperXML->arrayParameter = array(
                    dt_inicio => $this->_getParam('dt_inicio'),
                    dt_final => $this->_getParam('dt_final'),
                    ddt_inicio => Base_Util::convertDate($this->_getParam('dt_inicio')),
                    ddt_final => Base_Util::convertDate($this->_getParam('dt_final'))
                );
                break;

            case 2:
                /* Relatorio de producao individual (Confeccao) [Periodo] */
                $PHPJasperXML->arrayParameter = array(
                    dt_inicio => $this->_getParam('dt_inicio'),
                    dt_final => $this->_getParam('dt_final'),
                    ddt_inicio => Base_Util::convertDate($this->_getParam('dt_inicio')),
                    ddt_final => Base_Util::convertDate($this->_getParam('dt_final'))
                );
                break;

            default:

                break;
        }

        $PHPJasperXML->xml_dismantle(simplexml_load_file("../library/PHPJasperXML/Templates/Relatorio{$this->_getParam('opcao')}.jrxml"));
        $PHPJasperXML->transferDBtoArray();
        $PHPJasperXML->outpage("I");    //page output method I:standard output  D:Download file
    }

}