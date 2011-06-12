<?php

//Configuracoes dos Boletos
//Banco do Brasil
$configuracaoBoletos = array(BancoDoBrasil => array(
        dias_de_prazo_para_pagamento => $dias_de_prazo_para_pagamento,
        taxa_boleto => $taxa_boleto,
        data_venc => date("d/m/Y", time() + ($dias_de_prazo_para_pagamento * 86400)),
        valor_cobrado => str_replace(",", ".", $vl_cobrado),
        valor_boleto => number_format($valor_cobrado + $taxa_boleto, 2, ',', ''),
        nosso_numero => "87654",
        numero_documento => '#' . $id_pedido, // Num do pedido ou do documento
        data_vencimento => date("d/m/Y", time() + ($dias_de_prazo_para_pagamento * 86400)), // Data de Vencimento do Boleto - REGRA: Formato DD/MM/AAAA
        data_documento => date("d/m/Y"), // Data de emiss�o do Boleto
        data_processamento => date("d/m/Y"), // Data de processamento do boleto (opcional)
        valor_boleto => $vl_boleto, // Valor do Boleto - REGRA: Com v�rgula e sempre com duas casas depois da virgula
        sacado => $nm_cliente,
        endereco1 => $tx_endereco,
        endereco2 => "{$tx_municipio} - {$tx_uf} -  CEP: {$nu_cep}",
        demonstrativo1 => "Pagamento de Compra efetuada em Camisetas Personalizadas",
        demonstrativo2 => "Pagamento referente ao pedido #{$id_pedido}<br>Taxa bancaria - R$ " . number_format($taxa_boleto, 2, ',', ''),
        demonstrativo3 => "O preco do frente ja esta incluso no valor cobrado.",
        instrucoes1 => "- Sr. Caixa, cobrar multa de 2% apos o vencimento",
        instrucoes2 => "- Receber ate 10 dias apos o vencimento",
        instrucoes3 => "- Em caso de dúvidas entre em contato conosco: " . TELEFONE_EMPRESA,
        instrucoes4 => "- Emitido por " . NOME_EMPRESA,
        quantidade => 'S/N',
        valor_unitario => 'S/N',
        aceite => "N",
        especie => "R$",
        especie_doc => "DM",
        agencia => "9999", // Num da agencia, sem digito
        conta => "99999", // Num da conta, sem digito
        convenio => "999999999", // Num do conv�nio - REGRA: 6 ou 7 ou 8 d�gitos
        contrato => "999999", // Num do seu contrato
        carteira => "18",
        variacao_carteira => "-019", // Varia��o da Carteira, com tra�o (opcional)
        formatacao_convenio => "7", // REGRA: 8 p/ Conv�nio c/ 8 d�gitos, 7 p/ Conv�nio c/ 7 d�gitos, ou 6 se Conv�nio c/ 6 d�gitos
        formatacao_nosso_numero => "2", // REGRA: Usado apenas p/ Conv�nio c/ 6 d�gitos: informe 1 se for NossoN�mero de at� 5 d�gitos ou 2 para op��o de at� 17 d�gitos
        identificacao => NOME_EMPRESA,
        cpf_cnpj => CNPJ_EMPRESA,
        endereco => ENDERECO_EMPRESA,
        cidade_uf => MUNICIPIO_EMPRESA . ' - ' . UF_EMPRESA,
        cedente => NOME_EMPRESA
        ));
