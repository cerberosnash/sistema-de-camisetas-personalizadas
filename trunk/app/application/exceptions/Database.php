<?php
/**
 * Database Exception.
 * 
 * @author cralos
 * @since 08/03/2009
 * @version 0.1
 */
class Exception_Database extends Exception{

  /**
   * Exception overload.
   * 
   * @access public
   * @param $x_msg
   */
  public function Exception_Database($x_exception){
  		if (Zend_Db_Table::getDefaultAdapter() instanceof Zend_Db_Adapter_Pdo_Mysql){//MySQL exception
  			throw new Exception_MySQL($x_exception);
  		} else if (Zend_Db_Table::getDefaultAdapter() instanceof Zend_Db_Adapter_Pdo_Pgsql){//Postgres exception
  			throw new Exception_Postgres($x_exception);
  		} else if (Zend_Db_Table::getDefaultAdapter() instanceof Zend_Db_Adapter_Firebird){//Firebird exception
  			throw new Exception_Firebird($x_exception);
  		}  	
  }  
}