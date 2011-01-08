<?php
/**
 * Utility functions.
 * 
 * @author Carlos 
 * @since 08/04/2009
 * @version 0.1 
 */
class Util_Util {
	/**
	 * Convert boolean values.
	 * 
	 * @access public
	 * @static
	 * @param $x_value string
	 * @return $value string
	 */	
	public static function convertBooleanValues($x_value){
		if (isset($x_value) && ( $x_value == '1' || $x_value == 1) ){
			$value = AB_YES;
		} else {
			$value = AB_NO;
		}
		return $value;
	}
	
	/**
	 * Construct the where clause for select operations.
	 * 
	 * @access public
	 * @static
	 * @param Array $x_form
	 * @param boolean $is_update
	 * @return Array $where
	 */
	public static function constructWhereClause($x_form, $x_is_update_or_not_like = false){
		$adapter = Zend_Db_Table::getDefaultAdapter();
		$where = null;
		$str_operator = "LIKE";
		
		if ($x_is_update_or_not_like){
			$str_operator = "=";
		}
		
		for ($i = 0; $i < count($x_form); $i++){
			if (array_key_exists($i, $x_form)){
	    		if (Validator_Validator::validateRequiredField($x_form[$i]['value'])){
	    			for ($j = 0; $j <= count($where); $j++){
	    				if (@$where[$j] == null){
	    					if ($x_form[$i]['ptype'] == 'string'){
	    						if ($adapter instanceof Zend_Db_Adapter_Pdo_Pgsql){
	    							$where[$j]['field'] = strtoupper('"'.$x_form[$i]['id']).'" '.(array_key_exists('stype', $x_form[$i]) == true ? $x_form[$i]['stype'] : $str_operator)." ?";	
	    						} else {
	    							$where[$j]['field'] = strtoupper($x_form[$i]['id']).' '.(array_key_exists('stype', $x_form[$i]) == true ? $x_form[$i]['stype'] : $str_operator)." ?";
	    						}
	    						
	    						if (!$x_is_update_or_not_like){
	    							if (array_key_exists('stype', $x_form[$i])){
	    								if (strtoupper($x_form[$i]['stype']) == "LIKE"){
	    									$where[$j]['bind'] = "%".$x_form[$i]['value']."%";	
	    								} else {
	    									$where[$j]['bind'] = $x_form[$i]['value'];
	    								}
	    							} else {
	    								$where[$j]['bind'] = "%".$x_form[$i]['value']."%";	
	    							}
	    								
	    						} else {
	    							if (array_key_exists('stype', $x_form[$i])) {
	    							 	if (strtoupper($x_form[$i]['stype']) == 'IN'){
	    							 		$where[$j]['bind'] = '('.$x_form[$i]['value'].')';
	    							 		
	    							 	}	
	    							} else {
	    								$where[$j]['bind'] = $x_form[$i]['value'];	
	    							}
	    							
	    						}
	    							
	    					} else {
	    						if ($adapter instanceof Zend_Db_Adapter_Pdo_Pgsql){
	    							$where[$j]['field'] = strtoupper('"'.$x_form[$i]['id']).'" '.(array_key_exists('stype', $x_form[$i]) == true ? $x_form[$i]['stype'] : '=')." ?";
	    						} else {
		    						$where[$j]['field'] = strtoupper($x_form[$i]['id'])." ".(array_key_exists('stype', $x_form[$i]) == true ? $x_form[$i]['stype'] : '=')." ?";
	    						}
	    						
	    						$where[$j]['bind'] = $x_form[$i]['value'];
	    					}
	    					break;
	    				}
	    			}
	    		}
			}
    	}
    	
    	return $where;
	}
	
	/**
	 * Add clauses to select object (Zend_Db_Select) passed by reference.
	 * 
	 * @access public
	 * @static
	 * @param Zend_Db_Select $x_obj Zend_Db_Select object instantiate on Model.
	 * @param Array $x_select the select clause.
	 * @param Array $x_where  the where clause.
	 * @param mixed $x_order  the order by clause.
	 * @param mixed$x_group   the group by clause.
	 * @param Array $x_limit  the limit clause.
	 */
	public static function constructSelectObject(&$x_obj, $x_select = null, $x_where = null, $x_order = null, $x_group = null, $x_limit = null){
			if (is_null($x_select)){
				$x_obj->from($x_obj->getTable());	
			} else {
				if (!is_array($x_select)){
					throw new Exception_ABCustom(AB_MSG_DATA_INCORRECT);
				}
				$x_obj->from($x_obj->getTable(), $x_select);
			}
			
			if (!is_null($x_where) && !empty($x_where)){
				if (!is_array($x_where)){
					throw new Exception_ABCustom(AB_MSG_DATA_INCORRECT);
				}
				for ($i = 0; $i < count($x_where); $i++){
					$x_obj->where($x_where[$i]['field'], $x_where[$i]['bind']);	
				}
			}
			
			if (!is_null($x_order)){
				$x_obj->order($x_order);
			}
			
			if (!is_null($x_group)){
				$x_obj->group($x_group);
			}
			
			if (!is_null($x_limit)){
				if (!is_array($x_limit)){
					throw new Exception_ABCustom(AB_MSG_DATA_INCORRECT);
				}
				$x_obj->limit($x_limit['limit'], $x_limit['start']);
			}
	}
	
	/**
	 * Construct the where clause for update operations.
	 * 
	 * @access public
	 * @static
	 * @param $x_where 		  - the full where clause (all fields posted)
	 * @param $x_pk    		  - the table PK
	 * @param $x_extra_fields - extra fields to be added to where clause (array(0 => array(field, value),...)
	 * @return Array
	 */
	public static function constructWhereForUpdate($x_where, $x_pk = null, $x_extra_fields = null){
		if (is_null($x_where)){
			return null;
		}
		
		$fields_post = null;
		for ($i = 0; $i < count($x_where); $i++){
			$fields_post[$i] = substr($x_where[$i]['field'], 0, strpos($x_where[$i]['field'], ' '));
		}
		
		if (is_array($x_pk)){
			$fields_post = array_intersect($x_pk, $fields_post);
		} else {
			$sz = count($fields_post);
			for ($i = 0; $i < $sz; $i++){
				if ($x_pk != str_replace('"', "",$fields_post[$i])){
					unset($fields_post[$i]);
				}
			}			
		}
		
		$adapter = Zend_Db_Table::getDefaultAdapter();
		
		$aux = array();
		$f;
		$sz2 = count($x_where);
		for ($i = 0; $i < $sz2; $i++){
			$f = substr($x_where[$i]['field'], 0, strpos($x_where[$i]['field'], ' '));
			$sql_operator = substr($x_where[$i]['field'], strpos($x_where[$i]['field'], ' ')+1);
			$sql_operator = str_replace('?', '', str_replace(' ','', $sql_operator));
			if (!in_array($f, $fields_post)){
				unset($x_where[$i]);
			} else {
				if ($sql_operator == 'IN'){//special treatment for IN operator
					$aux[$i] = str_replace('?', $x_where[$i]['bind'], $x_where[$i]['field']);
				} else {
					$aux[$i] = $adapter->quoteInto($x_where[$i]['field'], $x_where[$i]['bind']);
				}
				
			}			
		}
		
		if (!is_null($x_extra_fields) && is_array($x_extra_fields)){
			$x_extra_fields = self::addExtraFieldForUpdate($x_extra_fields);
			
			$aux = array_merge($aux, $x_extra_fields);
		}
		
		
		return $aux;
	}
	
	/**
	 * Add extra fields for where clause in update statemente.
	 * 
	 * @access public
	 * @static
	 * @param $x_extra
	 * @return Array
	 */
	public static function addExtraFieldForUpdate($x_extra){
		$adapter = Zend_Db_Table::getDefaultAdapter();
		$aux = null;
		$aux2 = null;
		for ($i = 0; $i < count($x_extra); $i++){
			if ($adapter instanceof Zend_Db_Adapter_Pdo_Pgsql){
    			$aux[$i]['field'] = strtoupper('"'.$x_extra[$i]['field']).'"'." = ?";	
    		} else {
    			$aux[$i]['field'] = strtoupper($x_extra[$i]['field'])." = ?";
    		}
    		
    		$aux[$i]['bind'] = $x_extra[$i]['value']; 
		}
		
		for ($i = 0; $i < count($aux); $i++){
			$aux2[$i] = $adapter->quoteInto($aux[$i]['field'], $aux[$i]['bind']);
		}
		
		return $aux2;
	}
	
	/**
	 * Convert case array key
	 * 
	 * @access public
	 * @static
	 * @param $x_array array
	 * @param $x_case int
	 * @return Array
	 */
	public static function convertArrayKeyCase(array $x_array, $x_case = CASE_LOWER ){
		$aAux=array();
    	foreach($x_array as $k => $v){
    		$aAux[] = array_change_key_case($v, $x_case); 
    	}
    	return $aAux;
	}
	
	/**
	 * Return IP of client.
	 * 
	 * @access public
	 * @static
	 * @return String
	 */
	public static function getIP(){
		return isset($_SERVER['REMOTE_ADDR'])?$_SERVER['REMOTE_ADDR']:$_SERVER['HTTP_X_FORWARDED_FOR'];	
	}
	
	/**
	 * Return session ID.
	 * 
	 * @access public
	 * @static
	 * @return string
	 */
	public static function getSessionId(){
		return session_id(); 
	}
	
	/**
	 * Encode ISO8859-1 string values to UTF-8.
	 *  
	 * @access public
	 * @static
	 * @param $x_data the resultset obtained after a select statement.
	 * @return Array
	 */
	public static function encodeResultSetUTF8Values($x_data){
		$res = null;
		for ($i = 0; $i < count($x_data); $i++){
			$arr_keys = array_keys($x_data[$i]);
			for ($j = 0; $j < count($arr_keys); $j++){
				$res[$i][$arr_keys[$j]] = $x_data[$i][$arr_keys[$j]];
			}			
		}
		
		return $res;
	}
	
	/**
	 * Setup primary key auto-increment for Firebird. MySQL and PGSQL don't need sequences, because
	 * they already have auto-increment columns inside.
	 * 
	 * @access public
	 * @static
	 * @param $x_table
	 * @return mixed
	 */
	public static function setupPKAutoInc($x_table){
		$seq = true;
		if (Zend_Db_Table::getDefaultAdapter() instanceof  Zend_Db_Adapter_Firebird){
			$seq = "SQ_".$x_table."_01";
		}
		
		return $seq;
	}
	
	/**
	 * Construct the data param for update operations. 
	 * Remove the primary key from data before update.
	 * 
	 * @access public
	 * @static
	 * @param $x_data
	 * @param $x_primay
	 * @return array
	 */
	public static function constructDataForUpdate($x_data, $x_pk){
		$x_data_aux = $x_data;
		if (is_array($x_pk)){
			for ($i = 0; $i < count($x_pk); $i++){
				unset($x_data_aux[$x_pk[$i]]);
			}
		} else {
			unset($x_data_aux[$x_pk]);
		}
		
		return $x_data_aux;
	}
	
	/**
	 * Generate randomic password.
	 * 
	 * @access public
	 * @static
	 * @return String
	 */
	public static function generateRandomPassword(){
		return substr(md5(microtime()), 0, (int) AB_LIMIT_MIN_CHARACTER_PASSWORD);
	}
	
	/**
	 * Create where clause for select or update operations.
	 * 
	 * @access public
	 * @static
	 * @param $x_where
	 * @return Array
	 * @example array(array('COLUMN_NAME', 'OPERATOR', 'VALUE'))
	 */
	public static function addWhere($x_where){
		$res = null;
		for ($i = 0; $i < count($x_where); $i++){
			if (Zend_Db_Table::getDefaultAdapter() instanceof  Zend_Db_Adapter_Pdo_Pgsql) {
				$res[$i] = array('field' => '"'.strtoupper($x_where[$i][0]).'" '.$x_where[$i][1].' ?', 'bind' => $x_where[$i][2]);	
			} else {
				$res[$i] = array('field' => strtoupper($x_where[$i][0]).' '.$x_where[$i][1].' ?', 'bind' => $x_where[$i][2]);
			}			
		}
		
		if (is_null($res)){
			throw new Exception(AB_MSG_NO_FILTER);
		}
		
		return $res;
	}
	
	/**
	 * Construct structure of metadata in json
	 * 
	 * @access public
	 * @static
	 * @param $x_fields
	 * @return array
	 */
	public static function constructMetaDataJson(array $x_reader_fields){
		$array_aux = array();
		foreach ($x_reader_fields as $v){
			$array_aux[] = array('name'=>strtoupper($v), 'type' => "string");
		}
		$aReturn = array('root' => 'rows'
		    			,'id' => 0
		    			,'fields' => $array_aux);
    	return $aReturn;
	}
	
	/**
	 * Construct json structure for combo remote syntax.
	 * 
	 * @access public
	 * @static
	 * @param array $x_data
	 * @param array $x_reader_fields
	 * @return String
	 */
	public static function prepareJsonMetaData(array $x_data, array $x_reader_fields){
		$json = array();
		foreach ($x_data as $i => $row) {         
		    $json[$i][$x_reader_fields[0]] = $row[$x_reader_fields[0]];
		    $json[$i][$x_reader_fields[1]] = $row[$x_reader_fields[1]];
		}
    	return $json;
	}
}