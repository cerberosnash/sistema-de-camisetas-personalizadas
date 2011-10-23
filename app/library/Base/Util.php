<?php

class Base_Util {
    /* Camisetas Personalizadas */

    public static function onlyNumbers($string) {
        return preg_replace("/[^0-9]/i", "", $string);
    }

    public static function onlyText($string) {
        return preg_replace("/[^A-Za-z]/d", "", $string);
    }

    public static function toLower($string) {
        return strtolower($string);
    }

    public static function toUpper($string) {
        return strtoupper($string);
    }

    public static function md6_encode($string) {
        return base64_encode(base64_encode(base64_encode($string)));
    }

    public static function md6_decode($string) {
        return base64_decode(base64_decode(base64_decode($string)));
    }

    public static function convertDate($data) {
        return implode(preg_match("~\/~", $data) == 0 ? "/" : "-", array_reverse(explode(preg_match("~\/~", $data) == 0 ? "-" : "/", $data)));
    }

}