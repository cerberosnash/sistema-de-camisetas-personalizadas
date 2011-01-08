<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CadPesPessoa
 *
 * @author 01492364177
 */
class CadPesPessoa {

    private static $COD_PAIS = '55';

    public function save($pes_pessoa, $pes_email_pessoa, $pes_pessoa_telefone, $pes_pessoa_documento, $pes_pessoa_endereco) {
        try {
            $conn = Doctrine_Manager::connection();
            $conn->beginTransaction();

            //pessoa ///////////////////////////////////////////////////////////
            $pessoa = new PesPessoa();
            $pessoa->cd_tipo = 'PF'; // ***** TEMPORARIO MODIFICAR ******
            $pessoa->nm_pessoa = $pes_pessoa['nm_pessoa'];
            $pessoa->save();

            //email ////////////////////////////////////////////////////////////
            foreach ($pes_email_pessoa as $var) {
                $ger_email = new GerEmail();
                $ger_email->tx_email = $var;
                $ger_email->save();

                $pes_email = new PesEmailPessoa();
                $pes_email->sq_pessoa = $pessoa->sq_pessoa;
                $pes_email->sq_email = $ger_email->sq_email;
                $pes_email->save();
            }

            //telefone /////////////////////////////////////////////////////////
            $phone = $this->arrayPhone($pes_pessoa_telefone);
            foreach ($phone as $tmp) {
                $ger_telefone = new GerTelefone();
                $ger_telefone->fromArray($tmp);
                $ger_telefone->save();

                $pes_telefone = new PesPessoaTelefone();
                $pes_telefone->sq_pessoa = $pessoa->sq_pessoa;
                $pes_telefone->sq_telefone = $ger_telefone->sq_telefone;
                $pes_telefone->save();
            }

            //dados pessoais ///////////////////////////////////////////////////
            $data = array(
                'sq_pessoa' => $pessoa->sq_pessoa,
                'nu_cpf' => $pes_pessoa['nu_cpf'],
                'dt_nascimento' => '1987-02-10',
                'cd_sexo' => $pes_pessoa['cd_sexo'],
                'sq_estado_civil' => $pes_pessoa['sq_estado_civil'],
                'nm_pai' => $pes_pessoa['nm_pai'],
                'nm_mae' => $pes_pessoa['nm_mae'],
                'nu_id_lattes_cpnq' => $pes_pessoa['nu_id_lattes_cpnq']
            );
            $fisica = new PesPessoaFisica();
            $fisica->fromArray($data);
            $fisica->save();


            //documento ////////////////////////////////////////////////////////
            foreach ($pes_pessoa_documento as $doc) {
                $arg = (array) $doc;
                $arg['sq_pessoa'] = $pessoa->sq_pessoa;
                $arg['sq_documento_tipo'] = 1; // ***** TEMPORARIO MODIFICAR ***
                $arg['dt_validade'] = $this->format($arg['dt_validade']);
                $arg['dt_emissao'] = $this->format($arg['dt_emissao']);

                if ($arg['sg_uf'] == '') {
                    $arg['sg_uf'] = null;
                }
                $documento = new PesPessoaDocumento();
                $documento->fromArray($arg);
                $documento->save();
            }

            //endereco /////////////////////////////////////////////////////////
            foreach ($pes_pessoa_endereco as $var) {
                $arg = (array) $var;
                $arg['cd_pais'] = self::$COD_PAIS;
                $end = new GerEndereco();
                $end->fromArray($arg);
                $end->save();

                $endereco = new PesPessoaEndereco();
                $endereco->sq_endereco = $end->sq_endereco;
                $endereco->sq_pessoa = $pessoa->sq_pessoa;
                $endereco->save();
            }

            //comita alterações ////////////////////////////////////////////////
            $conn->commit();
        } catch (Doctrine_Exception $e) {
            $conn->rollback();
            throw new Exception($e->getMessage());
        }
    }

    public function arrayPhone($pes_pessoa_telefone) {
        $phone = array();
        $cont = 0;
        foreach ($pes_pessoa_telefone as $argv) {
            $var = (array) $argv;
            $args = array();
            preg_match('/([0-9]{2})/', $var['nu_telefone'], &$args);
            $phone[$cont]['sq_tel_tipo'] = $var['sq_tel_tipo'];
            $phone[$cont]['cd_pais'] = self::$COD_PAIS;
            $phone[$cont]['nu_telefone'] = str_replace('-', '',
                            (preg_replace('/\(.*?\)/', '', $var['nu_telefone'])));
            $phone[$cont]['cd_ddd'] = $args[0];
            $cont++;
        }
        return $phone;
    }

    public function format($string) {
        $d = explode("/", $string);
        $data = $d[2] . "-" . $d[1] . "-" . $d[0];
        return $data;
    }

}

?>
