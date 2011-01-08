<?php

class UnidOrganiz {
    public static function saveInstance($formData){
        $data = array(
            'cd_uorg' => $formData["cd_uorg"],
            'sq_unid_organiz_pai' => $formData["sq_unid_organiz_pai"],
            'sq_unid_tipo' => $formData["sq_unid_tipo"],
            'sg_unid_organiz' => $formData["sg_unid_organiz"],
            'nm_unid_organiz' => $formData["nm_unid_organiz"],
            'st_ativo' => true,
            'InsUnidOrganizMunicipio' => array(
                array(
                    'sq_municipio' => $formData["sq_municipio"]
                )
            )
        );

        $unidOrganiz = new InsUnidOrganiz();
        $unidOrganiz->fromArray($data);
        return $unidOrganiz;
    }

    public static function updateInstance($formData) {
         $data = array(
               'cd_uorg' => $formData["cd_uorg"],
            'sq_unid_organiz_pai' => $formData["sq_unid_organiz_pai"],
            'sq_unid_tipo' => $formData["sq_unid_tipo"],
            'sg_unid_organiz' => $formData["sg_unid_organiz"],
            'nm_unid_organiz' => $formData["nm_unid_organiz"],
            'st_ativo' => true,
            'InsUnidOrganizMunicipio' => array(
                array(
                    'sq_municipio' => $formData["sq_municipio"]
                )
            )
        );

        $unidOrganiz = new InsUnidOrganiz();
        $unidOrganiz->assignIdentifier($formData['sq_unid_organiz']);
        $unidOrganiz->fromArray($data);
        return $unidOrganiz;

    }
}
?>
