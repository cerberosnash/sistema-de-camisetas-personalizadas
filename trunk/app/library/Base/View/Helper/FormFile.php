<?php
include_once 'BaseUrl.php';

class Base_View_Helper_FormFile extends Zend_View_Helper_FormFile
{
    private $fileSize;
    private $extension;
    private $upload_tmp;
    private $upload_dir;
    private $imgLoader;
    private $url;
    private $name;
    private $functionValid;
    private $functionSuccess;
    private $functionError;

    public function formFile($name, $value = null, $attribs = null)
    {
        $this->name = $name;
        if (!is_array($attribs)) {
            $attribs = array();
        }


        $this->parametrosAtributos($attribs);
        $this->generateScriptFile();

        return parent::formFile($name, $attribs);
    }

    /**
     * Método que recebe os paramêtros do atributo para inclui-los
     * no script de upload
     *
     * @param array $attribs
     */
    private function parametrosAtributos(array &$attribs)
    {
        foreach($attribs as $key=>$value){
            switch ($key) {
                case 'fileSize':
                    $this->fileSize = $value;
                    unset($attribs[$key]);
                    break;
                case 'extension':
                    $this->extension = $value;
                    unset($attribs[$key]);
                    break;
                case 'upload_tmp':
                    $this->upload_tmp = $value;
                    unset($attribs[$key]);
                    break;
                case 'upload_dir':
                    $this->upload_dir = $value;
                    unset($attribs[$key]);
                    break;
                case 'method':
                    $this->url = $value;
                    unset($attribs[$key]);
                    break;
                case 'idImg':
                    $this->imgLoader = $value;
                    unset($attribs[$key]);
                    break;
                case 'jquery':
                    $this->jquery = $value;
                    unset($attribs[$key]);
                    break;
                case 'functionValid':
                    $this->functionValid = $value;
                    unset($attribs[$key]);
                    break;
                case 'functionSuccess':
                    $this->functionSuccess = $value;
                    unset($attribs[$key]);
                    break;
                case 'functionError':
                    $this->functionError = $value;
                    unset($attribs[$key]);
                    break;
            }
        }
    }

    private function generateScriptFile()
    {
        $objBaseUrl = new Base_View_Helper_BaseUrl();
        //inclui o script do componete de upload
        $strScript = " <script language=\"javascript\" type=\"text/javascript\">
//                           if(!$.isFunction(ajaxFileUpload)){
                               loadScript('{$objBaseUrl->baseUrl()}/public/js/lib/jquery/upload/ajaxfileupload.js');
//                           }
                       </script> ";

        //Inlclue a imagem de Carregando
        $strImg = "";
        if($this->imgLoader != "")
        {
            $strImg = " $(\"#{$this->imgLoader}\")
                        .ajaxStart(function(){ $(this).css('display',''); })
                        .ajaxComplete(function(){ $(this).css('display','none'); }); ";
        }
        $strJquery   = "'";
        if($this->jquery != ""){
            $arrDados = explode(",",$this->jquery);
            $qtd = count($arrDados);
            if($qtd == 1){
                $strJquery = "/{$arrDados[0]}/'+"."$('#{$arrDados[0]}').val()";
            } else {
                $strJquery   = "";
                foreach($arrDados as $conteudo){
                    $strJquery .= "/{$conteudo}/'+"."$('#{$conteudo}').val()+'";
                }
                $strJquery = substr($strJquery,0,-2);
            }
        }

        $strFunction    = "";
        $strFunctionKey = "";
        if($this->functionValid != ""){
            $strFunction    = "if({$this->functionValid}){";
            $strFunctionKey = "} else { return false; }";
        }
        $strFunctionSuccess = '';
        if($this->functionSuccess != ""){
            $strFunctionSuccess = $this->functionSuccess.";";
        }
        $strFunctionError = '';
        if($this->functionError != ""){
            $strFunctionError = $this->functionError.";";
        } else {
            $strFunctionError = $strFunctionSuccess;
        }

        $strScript .= "  <script type=\"text/javascript\">
                            function ajaxFileUpload()
                            {
                                {$strFunction}
                                    //starting setting some animation when the ajax starts and completes\n
                                    {$strImg}
                                    $.ajaxFileUpload({
                                        url:'{$objBaseUrl->baseUrl()}/{$this->url}{$strJquery},
                                        secureuri:false,
                                        fileElementId:'{$this->name}',
                                        fileName:'{$this->name}',
                                        extension:'{$this->extension}',
                                        fileSize:'{$this->fileSize}',
                                        upload_tmp:'{$objBaseUrl->baseUrl()}/{$this->upload_tmp}',
                                        upload_dir:'{$objBaseUrl->baseUrl()}/{$this->upload_dir}',
                                        dataType: 'json',
                                        success: function(data, status)
                                        {
                                            if( typeof(data) == 'string'){
                                                var tipo = ( data.indexOf( 'sucesso' ) > -1)? 1:3;
                                            } else {
                                                var strDebug = '';
                                                var str      = '';
                                                for(var i in data){
                                                    strDebug +=  i + ' - ' + data[i] + '<br />';
                                                    str      +=  data[i] + '<br />';
                                                }
                                                $('#divDebug').show().html(strDebug);
                                                alertMsg(str,3,function(){
                                                    {$strFunctionError}
                                                });
                                               return;
                                            }
                                            alertMsg(data,tipo,function(){
                                                if( tipo === 1 ){
                                                    {$strFunctionSuccess}
                                                } else if( tipo === 3 ){
                                                    {$strFunctionError}
                                                }
                                            });
                                        },
                                        error: function(data, status, e)
                                        {
                                            alertMsg(e,3,function(){
                                                {$strFunctionError}
                                            });
                                        }
                                    });
                                    return true;
                                {$strFunctionKey}
                            }
                        </script> ";

        echo $strScript;
    }
}