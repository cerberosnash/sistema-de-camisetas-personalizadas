<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Captchar
 *
 * @author Michael
 */
ob_start();
ob_clean();

class Captcha {

    var $font = '../public/fonts/captcha.ttf';

    function generateCode($characters) {
        /* list all possible characters, similar looking characters and vowels have been removed */
        $possible = '0123456789';
        $code = '';
        $i = 0;
        while ($i < $characters) {
            $code .= substr($possible, mt_rand(0, strlen($possible) - 1), 1);
            $i++;
        }
        return $code;
    }

    function Captcha($width='120', $height='40', $characters='6') {
        $_SESSION['autenticacao']['captcha'] = null;
        $code = $this->generateCode($characters);
        /* font size will be 75% of the image height */
        $font_size = 35 * 0.75;
        $image = @imagecreate($width, $height) or die('Cannot initialize new GD image stream');
        /* set the colours */
        $background_color = imagecolorallocate($image, 255, 255, 255);
        $text_color = imagecolorallocate($image, 20, 40, 100);
        $noise_color = imagecolorallocate($image, 100, 120, 180);
        /* generate random dots in background */
//		for( $i=0; $i<($width*$height)/3; $i++ ) {
//			imagefilledellipse($image, mt_rand(0,$width), mt_rand(0,$height), 1, 1, $noise_color);
//		}
        /* generate random lines in background */
//		for( $i=0; $i<($width*$height)/150; $i++ ) {
//			imageline($image, mt_rand(0,$width), mt_rand(0,$height), mt_rand(0,$width), mt_rand(0,$height), $noise_color);
//		}
        /* create textbox and add text */
        $textbox = imagettfbbox($font_size, 0, $this->font, $code) or die('Error in imagettfbbox function');
        $x = ($width - $textbox[4]) / 2;
        $y = ($height - $textbox[5]) / 2;
        imagettftext($image, $font_size, 0, $x, $y, $text_color, $this->font, $code) or die('Error in imagettftext function');
        /* output captcha image to browser */
        header('Content-Type: image/jpeg');
        //  header("Cache-Control: no-cache");
        //  header("Pragma: no-cache");

        imagejpeg($image);
        // imagedestroy($image);
        $_SESSION['autenticacao']['captcha'] = $code;
        //set_cookie('security_code', $code, '', '', '', '' );
    }

}