<?php
/**
 * Invalid request exception.
 * 
 * @author cralos
 * @since 08/03/2009
 * @version 0.1
 */
class Exception_InvalidRequest extends Exception{

  /**
   * Exception overload.
   * 
   * @access public
   * @param $x_msg
   */
  public function Exception_InvalidRequest($x_msg){
  	parent::__construct($x_msg);
  }
}