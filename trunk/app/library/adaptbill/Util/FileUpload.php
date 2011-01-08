<?php

class Util_FileUpload extends Zend_File_Transfer_Adapter_Http {
	
	/**
	 * Set destination path of file upload.
	 * 
	 * @access public
	 * @param $x_dest_path
	 */
	public function setDestinationPath($x_dest_path){
		try {
			$this->setDestination($x_dest_path);	
		} catch (Zend_File_Transfer_Exception $e){
			throw new Exception_FileUpload(AB_MSG_FILE_UPLOAD_INCORRET_PATH);
		}		
	}

	/**
	 * Verify if the file to be uploaded is an imagem.
	 * Default permited image extensions: jpg, jpeg, gif, bmp and png
	 * 
	 * @access public
	 * @param $x_image_type_permited
	 */
	public function isImg($x_image_type_permited = array('jpg', 'jpeg', 'gif', 'bmp', 'png')){
		$this->addValidator('isImage', false, $x_image_type_permited);
		
		if (!$this->isValid()){
			$errorStr = implode("\n", $this->getMessages());
			$errorStr = str_replace('The file', '', $errorStr);
			$errorStr = str_replace('is no image', '', $errorStr);
			$errorStr = str_replace('detected', '', $errorStr);
			$errorStr = explode(',', $errorStr);
			$fileName = $errorStr[0];
			$fileMime = $errorStr[1];
			throw new Exception_FileUpload(AB_MSG_FILE_IS_NO_IMAGE.$fileName.' '.$fileMime);
		}
	}

	/**
	 * Define file max size in bytes.
	 * 
	 * @access public
	 * @param $x_max_size
	 */
	public function setMaxSize($x_max_size){
		$this->addValidator('Size', false, $x_max_size);
		
		if (!$this->isValid()){
			$errorStr = implode("\n", $this->getMessages());
			$errorStr = str_replace('Maximum allowed size for file ', '', $errorStr);
			$errorStr = str_replace('is', ',', $errorStr);
			$errorStr = str_replace('but', ',', $errorStr);
			$errorStr = str_replace('detected', '', $errorStr);
			$errorStr = explode(',', $errorStr);
			$fileName = $errorStr[0];
			$fileSizeExceeded = $errorStr[2];
			throw new Exception_FileUpload(AB_MSG_FILE_IS_MAX_SIZE_EXCEEDED.$fileName.' '.$fileSizeExceeded);
		}
	}
	
	/**
	 * Upload file.
	 * 
	 * @access public
	 */
	public function upload(){
		if (!$this->receive()) {
			throw new Exception_FileUpload(AB_MSG_UPLOAD_FAIL);
		}		
	}
}