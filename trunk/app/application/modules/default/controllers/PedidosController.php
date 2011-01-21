<?php

class PedidosController extends Base_Controller_Action {

    public function init() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();
        /* debuggar */
        $this->_session->usuario->sq_usuario = 1;
    }

    public function carregarAction() {
        $pedidos = array();
        if ($this->getRequest()->isPost()) {
            if ($this->_session->usuario->sq_usuario) {
                try {
                    $pedidos = Doctrine_Core::getTable('TbPedidos')->findByDql('sq_usuario = ' . $this->_session->usuario->sq_usuario . ' AND sq_status = 1 AND st_ativo = true')->toArray();

                    foreach ($pedidos as $key => $value) {
                        $pedidos[$key]['cd_pedido'] = $pedidos[$key]['sq_pedido'] . '-' . str_replace('-', '', $pedidos[$key]['dt_pedido']) . '-' . str_replace('.', '-', $pedidos[$key]['vl_pedido']);
                    }

                    $out = array(success => true, totalCount => count($pedidos), pedidos => $pedidos);
                } catch (Doctrine_Exception $e) {
                    $out = array(success => false, error => $e->getMessage());
                }
            } else {
                $out = array(success => false, error => 'Nao foi possivel recuperar as informacoes do usuario!');
            }
        } else {
            $out = array(success => false, error => 'Parametros passados de forma invalida!');
        }
        $this->_prepareJson($out);
    }

    public function processarAction() {
        $pedidos = array();
        if ($this->getRequest()->isPost()) {
            if ($this->_session->usuario->sq_usuario && $this->_getParam('nm_banco') && $this->_getParam('sq_pedido')) {
                try {
                    $pedidos = Doctrine_Core::getTable('TbPedidos')->findByDql('sq_pedido = ' . $this->_getParam('sq_pedido') . ' AND sq_usuario = ' . $this->_session->usuario->sq_usuario . ' AND sq_status = 1 AND st_ativo = true limit 1')->toArray();

//                    foreach ($pedidos as $key => $value) {
//                        $pedidos[$key]['cd_pedido'] = $pedidos[$key]['sq_pedido'] . '-' . str_replace('-', '', $pedidos[$key]['dt_pedido']) . '-' . str_replace('.', '-', $pedidos[$key]['vl_pedido']);
//                    }

                    $out = array(success => true, totalCount => count($pedidos), pedidos => $pedidos);
                } catch (Doctrine_Exception $e) {
                    $out = array(success => false, error => "$e");
                }
            } else {
                $out = array(success => false, error => 'Nao foi possivel recuperar as informacoes do usuario!');
            }
        } else {
            $out = array(success => false, error => 'Parametros passados de forma invalida!');
        }
        $this->_prepareJson($out);
    }

    public function boletoAction() {
        /* cONSTANTES */
        $dias_de_prazo_para_pagamento = 5;
        $taxa_boleto = 2.95;
        $valor_cobrado = 9.99;
        $data_venc = '12/11/2011';
        $valor_boleto = 12.99;
        $config = array(
// ------------------------- DADOS DIN�MICOS DO SEU CLIENTE PARA A GERA��O DO BOLETO (FIXO OU VIA GET) -------------------- //
// Os valores abaixo podem ser colocados manualmente ou ajustados p/ formul�rio c/ POST, GET ou de BD (MySql,Postgre,etc)	//
// DADOS DO BOLETO PARA O SEU CLIENTE
            "dias_de_prazo_para_pagamento" => $dias_de_prazo_para_pagamento,
            "taxa_boleto" => $taxa_boleto,
            "data_venc" => date("d/m/Y", time() + ($dias_de_prazo_para_pagamento * 86400)), // Prazo de X dias OU informe data: "13/04/2006",
            "valor_cobrado" => $valor_cobrado, // Valor - REGRA: Sem pontos na milhar e tanto faz com "." ou "," ou com 1 ou 2 ou sem casa decimal
            "valor_cobrado" => str_replace(",", ".", $valor_cobrado),
            "valor_boleto" => number_format($valor_cobrado + $taxa_boleto, 2, ',', ''),
            "nosso_numero" => "87654",
            "numero_documento" => "27.030195.10", // Num do pedido ou do documento
            "data_vencimento" => $data_venc, // Data de Vencimento do Boleto - REGRA: Formato DD/MM/AAAA
            "data_documento" => date("d/m/Y"), // Data de emiss�o do Boleto
            "data_processamento" => date("d/m/Y"), // Data de processamento do boleto (opcional)
            "valor_boleto" => $valor_boleto, // Valor do Boleto - REGRA: Com v�rgula e sempre com duas casas depois da virgula
// DADOS DO SEU CLIENTE
            "sacado" => "Nome do seu Cliente",
            "endereco1" => "Endere�o do seu Cliente",
            "endereco2" => "Cidade - Estado -  CEP: 00000-000",
// INFORMACOES PARA O CLIENTE
            "demonstrativo1" => "Pagamento de Compra na Loja Nonononono",
            "demonstrativo2" => "Mensalidade referente a nonon nonooon nononon<br>Taxa banc�ria - R$ " . number_format($taxa_boleto, 2, ',', ''),
            "demonstrativo3" => "BoletoPhp - http://www.boletophp.com.br",
// INSTRU��ES PARA O CAIXA
            "instrucoes1" => "- Sr. Caixa, cobrar multa de 2% ap�s o vencimento",
            "instrucoes2" => "- Receber ate 10 dias apos o vencimento",
            "instrucoes3" => "- Em caso de d�vidas entre em contato conosco: xxxx@xxxx.com.br",
            "instrucoes4" => "&nbsp; Emitido pelo sistema Projeto BoletoPhp - www.boletophp.com.br",
// DADOS OPCIONAIS DE ACORDO COM O BANCO OU CLIENTE
            "quantidade" => "10",
            "valor_unitario" => "10",
            "aceite" => "N",
            "especie" => "R$",
            "especie_doc" => "DM",
// ---------------------- DADOS FIXOS DE CONFIGURA��O DO SEU BOLETO --------------- //
// DADOS DA SUA CONTA - BANCO DO BRASIL
            "agencia" => "9999", // Num da agencia, sem digito
            "conta" => "99999", // Num da conta, sem digito
// DADOS PERSONALIZADOS - BANCO DO BRASIL
            "convenio" => "999999999", // Num do conv�nio - REGRA: 6 ou 7 ou 8 d�gitos
            "contrato" => "999999", // Num do seu contrato
            "carteira" => "18",
            "variacao_carteira" => "-019", // Varia��o da Carteira, com tra�o (opcional)
// TIPO DO BOLETO
            "formatacao_convenio" => "7", // REGRA: 8 p/ Conv�nio c/ 8 d�gitos, 7 p/ Conv�nio c/ 7 d�gitos, ou 6 se Conv�nio c/ 6 d�gitos
            "formatacao_nosso_numero" => "2", // REGRA: Usado apenas p/ Conv�nio c/ 6 d�gitos: informe 1 se for NossoN�mero de at� 5 d�gitos ou 2 para op��o de at� 17 d�gitos

            /*
              #################################################
              DESENVOLVIDO PARA CARTEIRA 18

              - Carteira 18 com Convenio de 8 digitos
              Nosso n�mero: pode ser at� 9 d�gitos

              - Carteira 18 com Convenio de 7 digitos
              Nosso n�mero: pode ser at� 10 d�gitos

              - Carteira 18 com Convenio de 6 digitos
              Nosso n�mero:
              de 1 a 99999 para op��o de at� 5 d�gitos
              de 1 a 99999999999999999 para op��o de at� 17 d�gitos

              #################################################
             */
// SEUS DADOS
            "identificacao" => "Clone Catho - Ltda",
            "cpf_cnpj" => "00.000.000/0000-00",
            "endereco" => "Quadra 205 Conjunto 12 Casa 06" . "Pedido Numero :: " . $this->_getParam('sq_pedido'),
            "cidade_uf" => "Recanto das Emas / Distrito Federal",
            "cedente" => "Clone Catho - Ltda"
        );
// N�O ALTERAR!
//require ("include/funcoes_bb.php");
//require ("include/dump_bb.php");








        $boleto = new BoletoBB($config);
        //$boleto->start();
//require '../../../../library/Util/boletos/BB.php';
    }

}