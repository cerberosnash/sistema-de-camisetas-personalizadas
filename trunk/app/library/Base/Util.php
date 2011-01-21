<?php

class Base_Util {

    public static function baseUrlModule($module = null, $folder = null) {
        $dirClass = ROOT_DIR
                . DIRECTORY_SEPARATOR . 'application'
                . DIRECTORY_SEPARATOR . 'modules';
        if (!is_null($module)) {
            $dirClass .= DIRECTORY_SEPARATOR . $module;
        } else {
            $dirClass .= DIRECTORY_SEPARATOR . 'default';
        }
        if (!is_null($folder)) {
            $dirClass .= DIRECTORY_SEPARATOR . $folder . DIRECTORY_SEPARATOR;
        }

        return $dirClass;
    }

    /**
     * Getter das Mensagens da Regra de Negócio
     *
     * @param string       $indice
     * @param string|array $value Exemplo array('value1'=>10, 'value2'=>20)
     * @return string
     */
    public static function getTranslator($indice, $value='') {
        $msg = Zend_Registry::get('Zend_Translate')->_($indice);
        if (!empty($value)) {
            if (is_array($value)) {
                foreach ($value as $key => $value) {
                    $msg = str_replace("%{$key}%", $value, $msg);
                }
            } else {
                $msg = str_replace('%value%', $value, $msg);
            }
        }
        return $msg;
    }

    /**
     * Método que monta o titulo já com o i18n
     *
     * @param string $indice
     * @return string
     */
    public static function setTitle($indice) {
        return " - " . self::getTranslator($indice);
    }

    /**
     * Método que retona a descrição do número do mês
     *
     * @param int $codMesDesc
     * @return desc_mes or arrMes
     */
    public static function getMes($codMesDesc = null) {
        $arrMeses = array();
        $arrMeses[0] = Base_Util::getTranslator('L_VIEW_COMBO_SELECIONE_MES');
        $arrMeses[1] = Base_Util::getTranslator('L_VIEW_COMBO_JANEIRO');
        $arrMeses[2] = Base_Util::getTranslator('L_VIEW_COMBO_FEVEREIRO');
        $arrMeses[3] = Base_Util::getTranslator('L_VIEW_COMBO_MARCO');
        $arrMeses[4] = Base_Util::getTranslator('L_VIEW_COMBO_ABRIL');
        $arrMeses[5] = Base_Util::getTranslator('L_VIEW_COMBO_MAIO');
        $arrMeses[6] = Base_Util::getTranslator('L_VIEW_COMBO_JUNHO');
        $arrMeses[7] = Base_Util::getTranslator('L_VIEW_COMBO_JULHO');
        $arrMeses[8] = Base_Util::getTranslator('L_VIEW_COMBO_AGOSTO');
        $arrMeses[9] = Base_Util::getTranslator('L_VIEW_COMBO_SETEMBRO');
        $arrMeses[10] = Base_Util::getTranslator('L_VIEW_COMBO_OUTUBRO');
        $arrMeses[11] = Base_Util::getTranslator('L_VIEW_COMBO_NOVEMBRO');
        $arrMeses[12] = Base_Util::getTranslator('L_VIEW_COMBO_DEZEMBRO');

        if (!is_null($codMesDesc)) {
            return $arrMeses[$codMesDesc];
        } else {
            return $arrMeses;
        }
    }

    /**
     * Método que retona a descrição do número do mês
     *
     * @param int $codMesDesc
     * @return desc_mes or arrMes
     */
    public static function getMesRes($codMesDesc = null) {
        $arrMeses = array();
        $arrMeses[0] = Base_Util::getTranslator('L_VIEW_COMBO_MES');
        $arrMeses[1] = Base_Util::getTranslator('L_VIEW_COMBO_JAN');
        $arrMeses[2] = Base_Util::getTranslator('L_VIEW_COMBO_FEV');
        $arrMeses[3] = Base_Util::getTranslator('L_VIEW_COMBO_MAR');
        $arrMeses[4] = Base_Util::getTranslator('L_VIEW_COMBO_ABR');
        $arrMeses[5] = Base_Util::getTranslator('L_VIEW_COMBO_MAI');
        $arrMeses[6] = Base_Util::getTranslator('L_VIEW_COMBO_JUN');
        $arrMeses[7] = Base_Util::getTranslator('L_VIEW_COMBO_JUL');
        $arrMeses[8] = Base_Util::getTranslator('L_VIEW_COMBO_AGO');
        $arrMeses[9] = Base_Util::getTranslator('L_VIEW_COMBO_SET');
        $arrMeses[10] = Base_Util::getTranslator('L_VIEW_COMBO_OUT');
        $arrMeses[11] = Base_Util::getTranslator('L_VIEW_COMBO_NOV');
        $arrMeses[12] = Base_Util::getTranslator('L_VIEW_COMBO_DEZ');

        if (!is_null($codMesDesc)) {
            return $arrMeses[$codMesDesc];
        } else {
            return $arrMeses;
        }
    }

    public static function getPrioridade($codPrioridade = null) {
        $arrPrioridade = array();
        $arrPrioridade[0] = Base_Util::getTranslator('L_VIEW_COMBO_SELECIONE');
        $arrPrioridade['A'] = Base_Util::getTranslator('L_VIEW_COMBO_ALTISSIMA');
        $arrPrioridade['L'] = Base_Util::getTranslator('L_VIEW_COMBO_ALTA');
        $arrPrioridade['M'] = Base_Util::getTranslator('L_VIEW_COMBO_MEDIA');
        $arrPrioridade['B'] = Base_Util::getTranslator('L_VIEW_COMBO_BAIXA');

        if (!is_null($codPrioridade)) {
            return $arrPrioridade[$codPrioridade];
        } else {
            return $arrPrioridade;
        }
    }

    public static function getAbrangencia($codAbrangencia = null) {
        $arrAbrangencia = array();
        $arrAbrangencia['I'] = Base_Util::getTranslator('L_VIEW_COMBO_INTERNO');
        $arrAbrangencia['E'] = Base_Util::getTranslator('L_VIEW_COMBO_EXTERNO');
        $arrAbrangencia['A'] = Base_Util::getTranslator('L_VIEW_COMBO_INTERNO_EXTERNO');

        if (!is_null($codAbrangencia)) {
            return $arrAbrangencia[$codAbrangencia];
        } else {
            return $arrAbrangencia;
        }
    }

    /**
     * Método que retona se uma hora entá dentro de um
     * periodo
     *
     * @param array $arrHoras Esta variável recebe um array com a hora a ser verificada
     * e o período de horas pra verificação e retorna se a hora indicada se encontra
     * dentro do periodo ou não
     * @return boolean hora_no_periodo
     * @example $arrHoras("hora_verificada"=>"09:35:00","hora_inicial_1"=>"08:00:00",
     * "hora_final_1"=>"12:00:00","hora_inicial_2"=>"14:00:00","hora_final_2"=>"18:00:00")
     */
    public static function verifyHoraNoPeriodo($arrHoras) {
        $hora_verificada = explode(":", $arrHoras[0]);
        $hora_inicio_periodo_1 = explode(":", $arrHoras[1]);
        $hora_fim_periodo_1 = explode(":", $arrHoras[2]);
        $hora_inicio_periodo_2 = explode(":", $arrHoras[3]);
        $hora_fim_periodo_2 = explode(":", $arrHoras[4]);

        $hora = mktime($hora_verificada[0], $hora_verificada[1], $hora_verificada[2], 00, 00, 00);
        $hora_inicio_1 = mktime($hora_inicio_periodo_1[0], $hora_inicio_periodo_1[1], $hora_inicio_periodo_1[2], 00, 00, 00);
        $hora_fim_1 = mktime($hora_fim_periodo_1[0], $hora_fim_periodo_1[1], $hora_fim_periodo_1[2], 00, 00, 00);
        $hora_inicio_2 = mktime($hora_inicio_periodo_2[0], $hora_inicio_periodo_2[1], $hora_inicio_periodo_2[2], 00, 00, 00);
        $hora_fim_2 = mktime($hora_fim_periodo_2[0], $hora_fim_periodo_2[1], $hora_fim_periodo_2[2], 00, 00, 00);

        if ((($hora >= $hora_inicio_1) && ($hora <= $hora_fim_1)) || (($hora >= $hora_inicio_2) && ($hora <= $hora_fim_2))) {
            $hora_no_periodo = true;
        } else {
            $hora_no_periodo = false;
        }
        return $hora_no_periodo;
    }

    /**
     * Converte uma data para os formatos: YYYY-MM-DD ou DD/MM/YYYY
     *
     * @param String $value
     * @param String $entrada formatos: YYYY-MM-DD ou DD/MM/YYYY
     * @param String $saida   formatos: YYYY-MM-DD ou DD/MM/YYYY
     * @return String
     */
    public static function converterDate($value, $entrada, $saida) {
        switch ($entrada) {
            case 'YYYY-MM-DD':
                switch ($saida) {
                    case 'DD/MM/YYYY':
                        $data = explode("-", $value);
                        return "{$data[2]}/{$data[1]}/{$data[0]}";
                        break;
                }
                break;
            case 'DD/MM/YYYY':
                switch ($saida) {
                    case 'YYYY-MM-DD':
                        $data = explode("/", $value);
                        return "{$data[2]}-{$data[1]}-{$data[0]}";
                        break;
                }
                break;
        }
    }

    /**
     * Converte uma data timestamp para os formatos desejados
     *
     * @param String $value
     * @param String $entrada formatos: YYYY-MM-DD ou DD/MM/YYYY
     * @param String $saida   formatos: YYYY-MM-DD ou DD/MM/YYYY
     * @return String
     *
     * @obs: mais apropriado utilizar "date('d/m/Y H:i:s', strtotime($valueTimestamp))"
     */
    public static function converterDatetime($value, $entrada, $saida) {
        switch ($entrada) {
            case 'YYYY-MM-DD':
                switch ($saida) {
                    case 'DD/MM/YYYY':
                        $value = explode(" ", $value);
                        $data = explode("-", $value[0]);
                        return "{$data[2]}/{$data[1]}/{$data[0]} {$value[1]}";
                        break;
                }
                break;
            case 'DD/MM/YYYY':
                switch ($saida) {
                    case 'YYYY-MM-DD':
                        $value = explode(" ", $value);
                        $data = explode("/", $value[0]);
                        return "{$data[2]}-{$data[1]}-{$data[0]} {$value[1]}";
                        break;
                }
                break;
        }
    }

    public static function PhpToJavascript($var, $value, $type) {
        if ($type == 'object') {
            $var = str_replace(array("{{var}}", "{{value}}"), array($var, $value), "var {{var}} = [{{value}}];");
        }
        if ($type == 'text') {
            $var = str_replace(array("{{var}}", "{{value}}"), array($var, $value), "var {{var}} = '{{value}}';");
        }
        return $var;
    }

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

}