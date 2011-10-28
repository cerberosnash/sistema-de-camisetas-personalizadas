<?php

/*
 * funcao   :   Enviar emails pelo stmp do gmail
 * autor    :   Michael Fernandes Rodrigues
 * email    :   cerberosnash@gmail.com
 * skype    :   michael.rodrigues
 *
 */

require_once('../class.phpmailer.php');
set_time_limit(60000);
date_default_timezone_set('America/Sao_Paulo');

$body = file_get_contents('conteudo.html');   // estar linha pega um arquivo e o transforma em texto

$mail = new PHPMailer();
$mail->SMTPDebug = 2;                       // USE O 2 PARA HABILITAR E 1 PARA DESABILITAR O MODO DEBUG
$mail->SMTPAuth = true;                    // nao altere
$mail->SMTPSecure = "ssl";                   // nao altere
$mail->Host = "ssl://smtp.gmail.com";  // nao altere
$mail->Port = 465;                     // nao altere
$mail->Username = "sistema.camisetas.personalizadas@gmail.com"; // Seu email do GMAIL
$mail->Password = "doctrine";         // Sua senha do GMAIL
$mail->SetLanguage("br", "../language/phpmailer.lang-br.php"); //nao altere
$mail->IsSMTP();
$mail->SetFrom('camisetas@camisetas.com.br', 'Camisetas Personalizadas');
$mail->AddAddress('cerberosnash@gmail.com', "Michael Fernandes Rodrigues");
$mail->AddReplyTo("gabrielabenigno@gmail.com", "Gabriela Benigno dos Santos Alves"); // esta linha server pra enviar uma copia para outro email
$mail->Subject = 'Recuperação de Senha - Camisetas Personalizadas';
$mail->AltBody = "Recuperação de Senha - Camisetas Personalizadas"; // Opcional
$mail->MsgHTML($body);
$mail->AddAttachment("txt.txt");             // esta linha serve pra adicionar um anexo ao email
//$mail               ->AddAttachment("jpg.jpg");             // esta linha serve pra adicionar um anexo ao email

if (!$mail->Send()) {
    echo "Ocorreu Erro(s): " . $mail->ErrorInfo;
} else {
    echo "Email enviado com sucesso!";
}
?>