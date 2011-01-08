<?php
/**
 * Postgress exception treatment.
 * 
 * @author carlos
 * @since 08/06/2009
 * @version 0.1
 */
class Exception_Postgres extends Exception{

  /**
   * Exception overload.
   * 
   * @access public
   * @param $x_error_code
   */
  public function Exception_Postgres($x_exception){
  	
  		switch($x_exception->getCode()){
  			case 23505:
  				parent::__construct(AB_MSG_DB_ERROR_INVALID_PK);
  			break;
  			  			
  			case 23503:
  			case 23000:
  				parent::__construct(AB_MSG_DB_ERROR_CONSTRAINT_VIOLATION);
  			break;
  			
			case 22004:
  			case 23502: 
  				parent::__construct(AB_MSG_DB_ERROR_NOT_NULL);
  			break;
  			
  			case 42703:
  				parent::__construct(AB_MSG_DB_ERROR_INVALID_COLUMN);
  			break;
  			
  			case 22001: 
  				parent::__construct(AB_MSG_DB_ERROR_DATA_EXCEED);
  			break;
  			
  			case 22003: 
  				parent::__construct(AB_MSG_DB_ERROR_OUT_OF_RANGE);
  			break;
  			
  			case 54011:
  			case 54023: 
  				parent::__construct(AB_MSG_DB_ERROR_INVALID_ARG);
  			break;
  			
  			case 01007:
  			case 42501: 
  				parent::__construct(AB_MSG_DB_ERROR_NO_GRANT);
  			break;
  			
  			case 42601: 
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