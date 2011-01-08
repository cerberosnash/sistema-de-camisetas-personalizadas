<?php
/**
 * Common validations.
 * 
 * @author carlos
 * @since 07/30/2009
 * @version 0.1 
 */
class Validator_Validator {
	
	/**
	 * Prepare form parameters for manipulation on controllers.
	 * 
	 * @access public
	 * @static
	 * @param $x_form_params
	 * @return Array
	 */	
	public static function prepareFormParams($x_form_params){
		if (!isset($x_form_params)){
			throw new Exception(AB_MSG_DATA_NOT_FOUND);
		}
		
		unset($x_form_params['module']);
		unset($x_form_params['action']);
		unset($x_form_params['controller']);
		unset($x_form_params['start']);
		unset($x_form_params['limit']);
		unset($x_form_params['tab']);
		
		$arr_keys = array_keys($x_form_params);
				
		for ($i = 0; $i < sizeof($arr_keys); $i++){
			$arr_aux[$i] = json_decode($x_form_params[$arr_keys[$i]], true);	
		}
		
		if (isset($arr_aux)){
			return $arr_aux;	
		}		
	}
	
	/**
	 * Check all kind of validations on the entire form.
	 * 
	 * @access public
	 * @static
	 * @param $x_form_params
	 * @return Array
	 */	
	public static function validateForm($x_form_params, $x_is_select = false){
		$res = array();
			
		for ($i = 0; $i < sizeof($x_form_params); $i++){
			//remove whitespace from strings begin/end
			if(isset($x_form_params[$i]['value'])){
				self::setFieldTrim($x_form_params[$i]['value']);
			}
			
			//verify uppercase
			if ($x_form_params[$i]['validations']['uppercase']){
				self::setFieldUpperCase($x_form_params[$i]['value']);
			}
			
			//verify lowercase
			if ($x_form_params[$i]['validations']['lowercase']){
				self::setFieldLowerCase($x_form_params[$i]['value']);
			}
			
			if (!$x_is_select){
				//verify required field
				if ($x_form_params[$i]['validations']['required']){
					if (!self::validateRequiredField($x_form_params[$i]['value'])){
							for ($j = 0; $j <= sizeof($res); $j++){
								if (@$res[$j] == null){
									$res[$j]['id'] 	= $x_form_params[$i]['id'];
									$res[$j]['msg'] = AB_ERROR_REQUIRED_FIELD;
									break;
								}
							}	
					}
				}	
			}			
			
			//verify maxlength
			if ($x_form_params[$i]['validations']['maxlength'] != false){
				if (!self::validateMaxLengthField($x_form_params[$i]['value'], $x_form_params[$i]['validations']['maxlength'])){
						for ($j = 0; $j <= sizeof($res); $j++){
							if (@$res[$j] == null){
								$res[$j]['id'] 	= $x_form_params[$i]['id'];
								$res[$j]['msg'] = AB_ERROR_MAXLENGTH_FIELD;
								break;
							}
						}	
				}
			}
			if(isset($x_form_params[$i]['validations']['vtype'])){
				//verify email type
				if (array_key_exists('vtype', $x_form_params[$i]['validations']) && $x_form_params[$i]['validations']['vtype'] == 'email'){
					if (!self::validateEmailField($x_form_params[$i]['value'])){
							for ($j = 0; $j <= sizeof($res); $j++){
								if (@$res[$j] == null){
									$res[$j]['id'] 	= $x_form_params[$i]['id'];
									$res[$j]['msg'] = AB_ERROR_EMAIL_FIELD;
									break;
								}
							}	
					}
				}
				//verify url type
				if (array_key_exists('vtype', $x_form_params[$i]['validations']) && $x_form_params[$i]['validations']['vtype'] == 'url'){
					if (!self::validateUrlField($x_form_params[$i]['value'])){
							for ($j = 0; $j <= sizeof($res); $j++){
								if (@$res[$j] == null){
									$res[$j]['id'] 	= $x_form_params[$i]['id'];
									$res[$j]['msg'] = AB_ERROR_URL_FIELD;
									break;
								}
							}	
					}
				}
			}
			//verify string type
			if ($x_form_params[$i]['validations']['ptype'] == 'string'){
				if (!self::isString($x_form_params[$i]['value'])){
						for ($j = 0; $j <= sizeof($res); $j++){
							if (@$res[$j] == null){
								$res[$j]['id'] 	= $x_form_params[$i]['id'];
								$res[$j]['msg'] = AB_ERROR_STRING;
								break;
							}
						}	
				}
			}
			
			//verify int type
			if ($x_form_params[$i]['validations']['ptype'] == 'int'){
				if (!self::isInt($x_form_params[$i]['value'])){
						for ($j = 0; $j <= sizeof($res); $j++){
							if (@$res[$j] == null){
								$res[$j]['id'] 	= $x_form_params[$i]['id'];
								$res[$j]['msg'] = AB_ERROR_INT;
								break;
							}
						}	
				}
			}
			
			//verify double type
			if ($x_form_params[$i]['validations']['ptype'] == 'double'){
				if (!self::isDouble($x_form_params[$i]['value'])){
						for ($j = 0; $j <= sizeof($res); $j++){
							if (@$res[$j] == null){
								$res[$j]['id'] 	= $x_form_params[$i]['id'];
								$res[$j]['msg'] = AB_ERROR_DOUBLE;
								break;
							}
						}	
				}
			}
			
			//verify boolean type
			if ($x_form_params[$i]['validations']['ptype'] == 'boolean'){
				if (!self::isBoolean($x_form_params[$i]['value'])){
						for ($j = 0; $j <= sizeof($res); $j++){
							if (@$res[$j] == null){
								$res[$j]['id'] 	= $x_form_params[$i]['id'];
								$res[$j]['msg'] = AB_ERROR_BOOLEAN;
								break;
							}
						}	
				}
			}			
		}
		
		// if has errors, throw exception to controller who invoke the validation
		if (sizeof($res) > 0){	
			throw new Exception_Validator(Zend_Json_Encoder::encode($res));
		}
		
		//if everything is ok, return an array with the validated form
		$f = array();
		
		if (!$x_is_select){
			for ($i = 0; $i < sizeof($x_form_params); $i++){
				if (!is_string($x_form_params[$i]['value']) && (self::isInt($x_form_params[$i]['value']) || self::isDouble($x_form_params[$i]['value']))){
					$x_aux_x = $x_form_params[$i]['value']+"";	
				} else {
					$x_aux_x = $x_form_params[$i]['value'];
				}
				
				if (is_string($x_aux_x) && ($x_aux_x == "")){
					$f[$x_form_params[$i]['id']] = null;
				} else {
					$f[$x_form_params[$i]['id']] = utf8_encode($x_aux_x);
				}
			}	
		} else {
			
			for ($i = 0; $i < sizeof($x_form_params); $i++){
				//construct easy access to construct SQL instructions
				$f[$i]['id'] = $x_form_params[$i]['id'];
				$f[$i]['value'] = utf8_encode($x_form_params[$i]['value']);
				$f[$i]['ptype'] = $x_form_params[$i]['validations']['ptype'];
				if (isset($x_form_params[$i]['validations']['stype'])){
					$f[$i]['stype'] = $x_form_params[$i]['validations']['stype'];	
				}

				//construct easy value access
				if (self::isInt($x_form_params[$i]['value']) || self::isDouble($x_form_params[$i]['value'])){
					$x_aux_x = $x_form_params[$i]['value']+"";	
				} else {
					$x_aux_x = utf8_encode($x_form_params[$i]['value']);
				}
				
				$f[$x_form_params[$i]['id']] = ($x_aux_x = "" ? null : $x_form_params[$i]['value']);
			}
		}		
		
		return $f;		
	}
	
	/**
	 * Remove whitespace from the begining and end of string values. Also decode UTF8.
	 * 
	 * @access public
	 * @static
	 * @param $x_field 
	 */
	public static function setFieldTrim(&$x_field){
		if (self::isString($x_field)){
			$x_field = trim(utf8_decode($x_field));	
		}			
	}
	
	/**
	 * Set uppercase on string values.
	 * 
	 * @access public
	 * @static
	 * @param $x_field 
	 */
	public static function setFieldUpperCase(&$x_field){
		if (!empty($x_field) && self::isString($x_field)){
			$x_field = strtoupper($x_field);				
		}
	}
	
	/**
	 * Set lowercase on string values.
	 * 
	 * @access public
	 * @static
	 * @param $x_field 
	 */
	public static function setFieldLowerCase(&$x_field){
		if (!empty($x_field) && self::isString($x_field)){
			$x_field = strtolower($x_field);				
		}
	}
	
	/**
	 * Verify if field value is set.
	 * 
	 * @access public
	 * @static
	 * @param $x_field_value
	 * @return Boolean
	 */
	public static function validateRequiredField($x_field_value){
		$xx = (string) $x_field_value;
		if ($xx == "" || $xx == null){			
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * Verify if the field value size is over maxlength permited for the field.
	 * 
	 * @access public
	 * @static
	 * @param $x_field_value
	 * @param $x_maxlength
	 * @return Boolean
	 */
	public static function validateMaxLengthField($x_field_value, $x_maxlength){
		if (!empty($x_field_value)){
			if (strlen($x_field_value) > $x_maxlength){
				return false;
			} else {
				return true;
			}	
		} else {
			return true;
		}		
	}
	
	/**
	 * Validate email address.
	 * 
	 * @access public
	 * @static
	 * @param $x_field_value
	 * @return Boolean
	 */
	public static function validateEmailField($x_field_value){
		if (!empty($x_field_value)){
			$emailValidator = new Zend_Validate_EmailAddress();
			return $emailValidator->isValid($x_field_value);
		} else {
			return true;
		}		
	}
	
	/**
	 * Validate URL fields (DNS only).
	 * 
	 * @access public
	 * @static
	 * @param $x_field_value
	 * @return Boolean
	 */
	public static function validateUrlField($x_field_value){
		if (!empty($x_field_value)){
			$aux = str_replace('http://', '', $x_field_value);
			$urlValidator = new Zend_Validate_Hostname(Zend_Validate_Hostname::ALLOW_DNS, true, false);
			
			return $urlValidator->isValid($aux);
		} else {
			return true;
		}
	}
	
	/**
	 * Verify if field value is a string.
	 * 
	 * @access public
	 * @static
	 * @param $x_field_value
	 * @return Boolean
	 */
	public static function isString($x_field_value){
		return is_string($x_field_value);
	}
	
	/**
	 * Verify if field value is a int number.
	 * 
	 * @access public
	 * @static
	 * @param $x_field_value
	 * @return Boolean
	 */
	public static function isInt($x_field_value){
		if ($x_field_value != ''){
			$validateInt = new Zend_Validate_Int();
			return $validateInt->isValid($x_field_value);			
		} else {
			return true;
		}		
	}
	
	/**
	 * Verify if field value is a double number.
	 * 
	 * @access public
	 * @static
	 * @param $x_field_value
	 * @return Boolean
	 */
	public static function isDouble($x_field_value){
		if ($x_field_value != ''){
			$validateInt = new Zend_Validate_Int();
			if ($validateInt->isValid($x_field_value)){
				return true;
			}
			return is_double($x_field_value);
		} else {
			return true;
		}		
	}
	
	/**
	 * Verify if field value is a boolean.
	 * 
	 * @access public
	 * @static
	 * @param $x_field_value
	 * @return Boolean
	 */
	public static function isBoolean($x_field_value){
		return is_bool($x_field_value);
	}	
}