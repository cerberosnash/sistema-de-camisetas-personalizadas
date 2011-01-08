<?php
/**
 * Firebird exception treatment.
 * 
 * @author cralos
 * @since 08/11/2009
 * @version 0.1
 */
class Exception_Firebird extends Exception{

  /**
   * Exception overload.
   * 
   * @access public
   * @param $x_error_code
   */
  public function Exception_Firebird($x_exception){
  	
  		switch($x_exception->getCode()){
  			case -803:
  				parent::__construct(AB_MSG_DB_ERROR_INVALID_PK);
  			break;
  			
  			case -530:
  				parent::__construct(AB_MSG_DB_ERROR_CONSTRAINT_VIOLATION);
  			break;
  			
  			case -999:
  			case -291:
  			case -625: 
  				parent::__construct(AB_MSG_DB_ERROR_NOT_NULL);
  			break;
  			
  			case -206:
  				parent::__construct(AB_MSG_DB_ERROR_INVALID_COLUMN);
  			break;
  			
  			case -303:
  			case -802: 
  				parent::__construct(AB_MSG_DB_ERROR_DATA_EXCEED);
  			break;
  			
  		/*	case 1264: 
  				parent::__construct(AB_MSG_DB_ERROR_OUT_OF_RANGE);
  			break; */
  			
  			case -804: 
  				parent::__construct(AB_MSG_DB_ERROR_INVALID_ARG);
  			break;
  			
  			case -551:
  			case -552: 
  				parent::__construct(AB_MSG_DB_ERROR_NO_GRANT);
  			break;
  			
  			case -104: 
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