<?php
/**
 * MySQL exception treatment.
 * 
 * @author cralos
 * @since 08/06/2009
 * @version 0.1
 */
class Exception_MySQL extends Exception{

  /**
   * Exception overload.
   * 
   * @access public
   * @param $x_error_code
   */
  public function Exception_MySQL($x_exception){
  	
  		switch($x_exception->getCode()){
  			case 1146:
  				parent::__construct(AB_MSG_DB_ERROR_INVALID_TABLE);
  			break;
  			
  			case 1062:
  				parent::__construct(AB_MSG_DB_ERROR_INVALID_PK);
  			break;
  			
  			case 1451:
  			case 1452:
  				parent::__construct(AB_MSG_DB_ERROR_CONSTRAINT_VIOLATION);
  			break;
  			
  			case 1048: 
  				parent::__construct(AB_MSG_DB_ERROR_NOT_NULL);
  			break;
  			
  			case 1054:
  				parent::__construct(AB_MSG_DB_ERROR_INVALID_COLUMN);
  			break;
  			
  			case 1406: 
  				parent::__construct(AB_MSG_DB_ERROR_DATA_EXCEED);
  			break;
  			
  			case 1264: 
  				parent::__construct(AB_MSG_DB_ERROR_OUT_OF_RANGE);
  			break;
  			
  			case 1136: 
  				parent::__construct(AB_MSG_DB_ERROR_INVALID_ARG);
  			break;
  			
  			case 1142:
  			case 1143: 
  				parent::__construct(AB_MSG_DB_ERROR_NO_GRANT);
  			break;
  			
  			case 1064: 
  				parent::__construct(AB_MSG_DB_ERROR_SYNTAX);
  			break;
  			
  			default:
  				$logger = new Model_log_LogProcess(Zend_Log::ERR,__METHOD__,__LINE__, $x_exception->getMessage(), Model_log_LogProcess::LOG_ADMIN);
				$logger->setLog($x_exception->getTraceAsString());				
  				parent::__construct(AB_MSG_OPERATION_FAILURE);
  			break;
  		}
  }
}