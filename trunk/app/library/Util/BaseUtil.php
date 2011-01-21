<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Util
 *
 * @author Michael
 */
class Base_Util {

    public static function onlyNumbers($string) {
        return preg_replace("/[^0-9]/i", "", $string);
    }

    public static function onlyText($string) {
        return preg_replace("/[^A-Za-z]/d", "", $string);
    }

}