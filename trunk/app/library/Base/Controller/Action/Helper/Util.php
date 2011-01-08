<?php
class Base_Controller_Action_Helper_Util extends Zend_Controller_Action_Helper_Abstract
{

	public function validaValor($valor)
	{
		if(trim($valor)){
			$valor = str_ireplace(".","",$valor);
			$valor = str_ireplace(",",".",$valor);
		} else {
			$valor = null;
		}
		return $valor; 
	}
	
	/**
	 * Método que retona a descrição do número do mês
	 *
	 * @param int $codMesDesc
	 * @return desc_mes or arrMes
	 */	
	public function getMes($codMesDesc = null)
	{
		$arrMeses     = array();
		$arrMeses[0]  = Base_Util::getTranslator('L_VIEW_COMBO_SELECIONE_MES');
		$arrMeses[1]  = Base_Util::getTranslator('L_VIEW_COMBO_JANEIRO');
		$arrMeses[2]  = Base_Util::getTranslator('L_VIEW_COMBO_FEVEREIRO');
		$arrMeses[3]  = Base_Util::getTranslator('L_VIEW_COMBO_MARCO');
		$arrMeses[4]  = Base_Util::getTranslator('L_VIEW_COMBO_ABRIL');
		$arrMeses[5]  = Base_Util::getTranslator('L_VIEW_COMBO_MAIO');
		$arrMeses[6]  = Base_Util::getTranslator('L_VIEW_COMBO_JUNHO');
		$arrMeses[7]  = Base_Util::getTranslator('L_VIEW_COMBO_JULHO');
		$arrMeses[8]  = Base_Util::getTranslator('L_VIEW_COMBO_AGOSTO');
		$arrMeses[9]  = Base_Util::getTranslator('L_VIEW_COMBO_SETEMBRO');
		$arrMeses[10] = Base_Util::getTranslator('L_VIEW_COMBO_OUTUBRO');
		$arrMeses[11] = Base_Util::getTranslator('L_VIEW_COMBO_NOVEMBRO');
		$arrMeses[12] = Base_Util::getTranslator('L_VIEW_COMBO_DEZEMBRO');
		
		if(!is_null($codMesDesc)){
			return $arrMeses[$codMesDesc];
		} else {
			return $arrMeses;
		}
	}
	
	/**
	 * Método que retona a descrição do número do mês
	 *
	 * @param int $codMesDesc
	 * @return desc_mes or arrMes
	 */	
	public function getMesRes($codMesDesc = null)
	{
		$arrMeses     = array();
		$arrMeses[0]  = Base_Util::getTranslator('L_VIEW_COMBO_MES');
		$arrMeses[1]  = Base_Util::getTranslator('L_VIEW_COMBO_JAN');
		$arrMeses[2]  = Base_Util::getTranslator('L_VIEW_COMBO_FEV');
		$arrMeses[3]  = Base_Util::getTranslator('L_VIEW_COMBO_MAR');
		$arrMeses[4]  = Base_Util::getTranslator('L_VIEW_COMBO_ABR');
		$arrMeses[5]  = Base_Util::getTranslator('L_VIEW_COMBO_MAI');
		$arrMeses[6]  = Base_Util::getTranslator('L_VIEW_COMBO_JUN');
		$arrMeses[7]  = Base_Util::getTranslator('L_VIEW_COMBO_JUL');
		$arrMeses[8]  = Base_Util::getTranslator('L_VIEW_COMBO_AGO');
		$arrMeses[9]  = Base_Util::getTranslator('L_VIEW_COMBO_SET');
		$arrMeses[10] = Base_Util::getTranslator('L_VIEW_COMBO_OUT');
		$arrMeses[11] = Base_Util::getTranslator('L_VIEW_COMBO_NOV');
		$arrMeses[12] = Base_Util::getTranslator('L_VIEW_COMBO_DEZ');
		
		if(!is_null($codMesDesc)){
			return $arrMeses[$codMesDesc];
		} else {
			return $arrMeses;
		}
	}
	
	public function getPrioridade()
	{
		$arrPrioridade = array();
		$arrPrioridade[0] = Base_Util::getTranslator('L_VIEW_COMBO_SELECIONE');
		$arrPrioridade['A'] = Base_Util::getTranslator('L_VIEW_COMBO_ALTISSIMA');
		$arrPrioridade['L'] = Base_Util::getTranslator('L_VIEW_COMBO_ALTA');
		$arrPrioridade['M'] = Base_Util::getTranslator('L_VIEW_COMBO_MEDIA');
		$arrPrioridade['B'] = Base_Util::getTranslator('L_VIEW_COMBO_BAIXA');
		
		return $arrPrioridade;
	}

	public function comboGroup($arrComboGroup)
	{
		if(count($arrComboGroup) > 0){
			$strOption  = "<option selected=\"selected\" label=\"".Base_Util::getTranslator('L_VIEW_COMBO_SELECIONE')."\" value=\"0\">".Base_Util::getTranslator('L_VIEW_COMBO_SELECIONE')."</option>";
			$title      = Base_Util::getTranslator('L_VIEW_COMBO_SELECIONE');
			foreach($arrComboGroup as $group){
				if(array_key_exists('title', $group)){
					$title = $value['title'];
				}
				$strOption .= "<optgroup label=\"{$title}\">";
				foreach($group as $key=>$value){
					$strOption .= "<option label=\"{$value}\" value=\"{$key}\">{$value}</option>";
				}
			}
			$strOption .= "</optgroup>";
		}
		return $strOption;
	}

    /**
     * Método que realiza um filtro nos dados informados para autenticação
     * e caso possua alguma coisa errada a pagina e redirecionada para
     * realização dos loguins novamente
     * @param Array $formData
     * @return Array $formData
     */
    public static function validateInformation($formData, $param1, $param2)
    {
        //Realiza um filtro nos dados recebidos do post
        $filter              = new Zend_Filter_StripTags();
        $formData[$param1] = $filter->filter($formData[$param1]);
        if (strpos($formData[$param1], "@") === false) {
            $formData[$param1] = $formData[$param1] . K_DOMINIO_EMAIL_PADRAO;
        }
        if(Zend_Validate::is($formData[$param1],'EmailAddress')){
            $formData[$param2] = $filter->filter($formData[$param2]);
            return $formData;
        } else {
            $formData = array();
            return $formData;
        }
    }

    /**
     * Método que cria a pesquisa das informações no banco de dados para
     * recuperar os dados do usuário caso exista.
     *
     * Método utilizado pelos controller Auth e PedidoSolicitacao
     * 
     * @param Array $formData
     * @return object Zend_Auth_Adapter_DbTable
     */
    public static function getAuthAdapter($formData, $tableName, $identityColumn, $credentialColumn, $treatment = "MD5")
    {
        //Obtém o adaptador de banco de dados a partir do registro
        $dbAdapter = Zend_Registry::get('db');

        //Configura informações específicas do banco de dados
        $authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter);
        $authAdapter->setTableName($tableName)
                    ->setIdentityColumn($identityColumn)
                    ->setCredentialColumn($credentialColumn);
//                    ->setCredentialTreatment("{$treatment}(?)");
                    
        //Aumenta a segurança da senha adicionado texto salt
        $config = Zend_Registry::get('banco');
        $salt = $config->auth->salt;
        $password = $salt.$formData['senha'];
        //Configura dados para autenticação
        $authAdapter->setIdentity($formData['usuario']);
//        $authAdapter->setCredential($password);
        $authAdapter->setCredential(md5($password));

        return $authAdapter;
    }
}