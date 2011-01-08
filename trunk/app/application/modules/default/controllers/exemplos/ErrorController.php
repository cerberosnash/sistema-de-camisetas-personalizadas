<?php

class ErrorController extends Base_Controller_Action {

    public function init() {
        $this->_helper->layout->disableLayout();
    }

    public function errorAction() {
        $errors = $this->_request->getParam('error_handler');
        $e = $errors->exception;

        $error = preg_match_all("/(action|controller|method|invalid|
            __call|does|not|specified|trapped)/i", $e->getMessage(), $match);

        preg_match_all("/[^(]*[^)]/", $e->getMessage(), $controller);
        preg_match_all("/[^\"]*[^\"]/", $e->getMessage(), $action);
/*
        if ($error != 0) {
            $exception = $this->view->translate("L_V_MSG_CONTROLLER_ACTION_INVALIDO");
            $this->errorEXTJS($exception . ": " . $controller[0][1] . " " . $action[0][1]);
        } else {*/
            $this->_helper->viewRenderer->setNoRender();
            $error = strpos(strtolower($e->getMessage()), 'dapter');
            if (!$error) {
                $error = strpos($e->getMessage(), 'host');
                if (!$error) {
                    $error = strpos($e->getMessage(), 'password');
                    if (!$error) {
                        $error = strpos($e->getMessage(), 'database');
                        if (!$error) {
                            $error = strpos($e->getMessage(), 'driver');
                            if ($error) {
                                $msg = $this->view->translate('L_V_MSG_ERRO_BD_SEM_DRIVER_INSTALADO');
                            } else {
                                $msg = $e->getMessage();
                            }
                        } else {
                            $msg = $this->view->translate('L_V_MSG_ERRO_BD_INEXISTENTE');
                        }
                    } else {
                        $msg = $this->view->translate('L_V_MSG_ERRO_USUARIO_SENHA_ACESSO_INVALIDO');
                    }
                } else {
                    $msg = $this->view->translate('L_V_MSG_ERRO_NOME_SERVIDOR_INVALIDO');
                }
            } else {
                $msg = $this->view->translate('L_V_MSG_ERRO_BD_ADAPTER_NAO_ESPECIF');
            }

            $out = array(
                success => false
                , code => 'U'
                , message => $msg
                , action => $callback
            );

            //retira possiveis quebras de linha
            $msgLog = str_replace(array("\n\r", "\n", "\r"), " ", $msg);
            $msgLog = str_replace("
		", " ", $msgLog);

            $objLog = new Base_Log();
            $objLog->escreveLogError($e->getTrace(), trim($msgLog));

            $callback = $callback . '(' . json_encode($out) . ')';
            $this->_response->appendBody($callback);
        }
    //}

}
