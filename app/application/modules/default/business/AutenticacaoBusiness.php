<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of autenticarBusiness
 *
 * @author 73762385149
 */
class AutenticacaoBusiness {

    //put your code here

    public function Recuperar($stringEmail) {

    }

    public function Autenticar($arrayParametros) {

        $arrayParametros["senha"] = '12345';
        $arrayParametros["email"] = 'cerberosnash@gmail.com';

        $data = array(
            'senha' => $arrayParametros["senha"],
            'email' => $arrayParametros["email"]
        );

        $autenticacao = new TbUsuarios();
        $data = $autenticacao->Autenticar($data);

        return $data;
    }

}

?>
