<?php
/**
 * File upload exception.
 * 
 * @author cralos
 * @since 12/11/2009
 * @version 0.1
 */
class Exception_FileUpload extends Exception{

  /**
   * Exception overload.
   * 
   * @access public
   * @param $x_msg
   */
  public function Exception_FileUpload($x_msg){
  	parent::__construct($x_msg);
  }
}