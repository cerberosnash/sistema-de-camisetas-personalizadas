<?php

/**
 * @Copyright Copyright 2006, 2007, 2008, 2009 MDIC - Ministério do Desenvolvimento, da Industria e do Comércio Exterior, Brasil.
 * @tutorial  Este arquivo é parte do programa OASIS - Sistema de Gestão de Demanda, Projetos e Serviços de TI.
 * 			  O OASIS é um software livre; você pode redistribui-lo e/ou modifica-lo dentro dos termos da Licença
 * 			  Pública Geral GNU como publicada pela Fundação do Software Livre (FSF); na versão 2 da Licença,
 * 			  ou (na sua opnião) qualquer versão.
 * 			  Este programa é distribuido na esperança que possa ser util, mas SEM NENHUMA GARANTIA;
 * 			  sem uma garantia implicita de ADEQUAÇÂO a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR.
 * 			  Veja a Licença Pública Geral GNU para maiores detalhes.
 * 			  Você deve ter recebido uma cópia da Licença Pública Geral GNU, sob o título "LICENCA.txt",
 * 			  junto com este programa, se não, escreva para a Fundação do Software Livre(FSF) Inc., 51 Franklin St,
 * 			  Fifth Floor, Boston, MA 02110-1301 USA.
 */
class helpController extends Base_Controller_Action {

    private $_controller;
    private $_module;
    private $_action;

    public function init() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        $this->_module = $this->_getParam('modulo'); //nao utilize "module" neste ponto para evitar conflito
        $this->_controller = $this->_getParam('controlador'); //nao utilize "controller" neste ponto para evitar conflito
        $this->_action = $this->_getParam('acao'); //nao utilize "action" neste ponto para evitar conflito
    }

    public function helpAction() {
        $file = '../application/modules/' . $this->_module . '/views/scripts/' . $this->_controller . '/help-' . $this->_action . '.html';
        $file = utf8_encode(file_get_contents($file));
        $this->_response->appendBody($file);
    }

}