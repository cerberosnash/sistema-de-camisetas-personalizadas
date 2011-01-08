<?php

/**
 * @Copyright Copyright 2010 MDIC - Ministério do Desenvolvimento, da Industria e do Comércio Exterior, Brasil.
 * @tutorial  Este arquivo é parte do programa SGDOC - Sistema de Gerenciamento Documentos.
 * 			  O SGDOC é um software livre; você pode redistribui-lo e/ou modifica-lo dentro dos termos da Licença
 * 			  Pública Geral GNU como publicada pela Fundação do Software Livre (FSF; na versão 2 da Licença,
 * 			  ou (na sua opnião) qualquer versão.
 * 			  Este programa é distribuido na esperança que possa ser util, mas SEM NENHUMA GARANTIA;
 * 			  sem uma garantia implicita de ADEQUAÇÂO a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR.
 * 			  Veja a Licença Pública Geral GNU para maiores detalhes.
 * 			  Você deve ter recebido uma cópia da Licença Pública Geral GNU, sob o título "LICENCA.txt",
 * 			  junto com este programa, se não, escreva para a Fundação do Software Livre(FSF) Inc., 51 Franklin St,
 * 			  Fifth Floor, Boston, MA 02110-1301 USA.
 */

/**
 * Variavéis globais
 *
 */
$translationStrings['global']['L_V_T_SGDOC']                                    = '<h1>Layout - SGDoc - V3</h1>Sistema Gerenciador de Documentos';
$translationStrings['global']['L_V_M_PRINCIPAL']                                = 'Menu Principal';
$translationStrings['global']['L_V_M_CAIXA']                                    = 'Minhas Caixas';
$translationStrings['global']['L_V_M_CAIXA_TRABALHO']                           = 'Área de trabalho';
$translationStrings['global']['L_V_M_CAIXA_ENTRADA']                            = 'Caixa de entrada';
$translationStrings['global']['L_V_M_CAIXA_SAIDA']                              = 'Caixa de saída';
$translationStrings['global']['L_V_M_VISUALIZAR']                               = 'Vizualização';
$translationStrings['global']['L_V_M_INFORMAR']                                 = 'Informações';
$translationStrings['global']['L_V_T_FECHAR_SISTEMA']                           = 'Fechar o Sistema';
$translationStrings['global']['L_V_MSG_FECHAR_SISTEMA']                         = '<br />Você tem certeza que deseja fechar o sistema?';
$translationStrings['global']['L_V_MSG_AGUARDE']                                = 'Aguarde...';
$translationStrings['global']['L_V_T_AGUARDE']                                  = 'Aguarde';
$translationStrings['global']['L_V_MSG_FECHANDO']                               = 'Fechando o sistema!';
$translationStrings['global']['L_V_MSG_ERROR']                                  = 'Ocorreu um erro';
$translationStrings['global']['L_V_T_ERROR']                                    = 'Erro';
$translationStrings['global']['L_V_M_TROCAR']                                   = 'Trocar Unidade';
$translationStrings['global']['L_V_M_CONFIG']                                   = 'Configurações';
$translationStrings['global']['L_V_M_SAIR']                                     = 'Sair';
$translationStrings['global']['L_V_MSG_COLET_INFOR_ESTRUT']                     = 'Coletando informacões da estrutura...';
$translationStrings['global']['L_V_MSG_USER_SENHA_INVALID']                     = 'Usuário ou senha inválidos!';
$translationStrings['global']['L_V_MSG_INICIANDO']                              = 'Iniciando...';
$translationStrings['global']['L_V_MSG_CARREGAR_ESTRUT']                        = 'Não foi possível logar em outra Estrutura...';
$translationStrings['global']['L_V_MSG_INFO_USER']                              = 'Informe o usuário';
$translationStrings['global']['L_V_MSG_INFO_CODIGO']                            = 'Informe o código';
$translationStrings['global']['L_V_MSG_INFO_SENHA']                             = 'Informe a senha';
$translationStrings['global']['L_V_MSG_PREENCHA_CAMPO']                         = 'Preencha o campo';
$translationStrings['global']['L_V_I_CPF_USER']                                 = 'CPF';
$translationStrings['global']['L_V_I_SENHA_USER']                               = 'Senha';
$translationStrings['global']['L_V_I_CDG_USER']                                 = 'Código';
$translationStrings['global']['L_V_T_AUTENT']                                   = 'Autenticação';
$translationStrings['global']['L_V_BTN_ENTRAR']                                 = 'Entrar';
$translationStrings['global']['L_V_BTN_SAIR']                                   = 'Sair';
$translationStrings['global']['L_V_T_ACESSO_REST']                              = 'Acesso restrito';
$translationStrings['global']['L_V_T_ARQ_NAO_ENC']                              = 'Arquivo não encontrado';
$translationStrings['global']['L_V_T_CAMPO_BRANCO']                             = 'Campos em branco';
$translationStrings['global']['L_V_MSG_PREENC_OBG']                             = 'Preencha todos campos obrigatórios';
$translationStrings['global']['L_V_T_CONFIRMAR']                                = 'Confirmação';
$translationStrings['global']['L_V_MSG_CONF_ADD_UNID']                          = 'Você tem certeza que deseja adicionar esta nova unidade organizacional?';
$translationStrings['global']['L_V_MSG_CONF_DEL_UNID']                          = 'Você tem certeza que deseja excluir esta unidade organizacional?';
$translationStrings['global']['L_V_MSG_CONF_ALT_UNID']                          = 'Você tem certeza que deseja salvar as alteracões feitas nesta unidade organizacional?';
$translationStrings['global']['L_V_T_SALVANDO']                                 = 'Salvando...';
$translationStrings['global']['L_V_T_TRAMITAR']                                 = 'Tramitar';
$translationStrings['global']['L_V_T_RECEBER']                                  = 'Receber';
$translationStrings['global']['L_V_T_SUCESSO']                                  = 'Sucesso';
$translationStrings['global']['L_V_MSG_UNID_ADD_SUCESSO']                       = 'Unidade adicionada com sucesso';
$translationStrings['global']['L_V_MSG_UNID_ALT_SUCESSO']                       = 'Unidade alterada com sucesso';
$translationStrings['global']['L_V_MSG_UNID_DEL_SUCESSO']                       = 'Unidade excluida com sucesso';


/**
 * @controller unidade-organizacional
 * @view view-adicionar-unidade-organizacional
 */
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_I_UND_SUPERIOR']                 = 'Unidade Superior';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_I_TIPO_UNID']                    = 'Tipo da Unidade';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_I_UF']                           = 'Estado';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_I_MUNICIPIO']                    = 'Município';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_I_CDG_UORG']                     = 'Código UORG';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_I_NOME_UNID']                    = 'Nome unidade';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_I_SIGLA_UNID']                   = 'Sigla unidade';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_I_SELEC_UNID']                   = '--- Selecione a Unidade ---';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_BTN_ADICIONAR']                  = 'Adicionar';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_BTN_SALVAR']                     = 'Salvar';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_BTN_CRIAR']                      = 'Criar';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_BTN_LIMPAR']                     = 'Limpar';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_BTN_AJUDA']                      = 'Ajuda';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_BTN_EXCLUIR']                    = 'Excluir';
$translationStrings['default']['unidade-organizacional']
['view-adicionar-unidade-organizacional']['L_V_BTN_NOVO']                       = 'Novo';


?>
