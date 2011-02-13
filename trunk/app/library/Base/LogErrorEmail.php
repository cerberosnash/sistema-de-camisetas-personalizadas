<?php

/* Class Log Erro Email */

class LogErrorEmail {

    public static function sendReport($e) {
        $corpo = print_r($_SESSION, true) . $e;

        $mail = new Base_PHPMailer();
        $mail->IsHTML(true);
        $mail->AddAddress('cerberosnas@gmail.com', 'Administrador');
        $mail->Subject = 'Log Error - Camisetas Personalizadas';
        $mail->MsgHTML($corpo);

        if (!$mail->Send()) {
            $out = array(success => false, error => $mail->ErrorInfo);
        } else {
            $out = array(success => true);
        }

        if (!$mail->Send()) {
            return false;
        }
        return true;
    }

}

?>