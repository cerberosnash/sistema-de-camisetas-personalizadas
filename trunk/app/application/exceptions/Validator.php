<?php
/**
 * Validator exception.
 * 
 * @author carlos
 * @since 08/03/2009
 * @version 0.1
 */
class Exception_Validator extends Exception{

  /**
   * Exception overload.
   * 
   * @access public
   * @param $x_msg
   */
  public function Exception_Validator($x_msg){
  	parent::__construct($x_msg);
  }
}