<?php

/**
 */
class TbUsuariosTable extends Doctrine_Table {

    public function autenticar($tx_email, $tx_senha) {
        try {
            $query = Doctrine_Query::create()
                            ->select('u.*,p.tx_perfil,t.nu_telefone,t.nu_ddd,t.tp_telefone')
                            ->from('TbUsuarios u')
                            ->innerJoin('u.TbPerfil p ON p.sq_perfil = u.sq_perfil')
                            ->leftJoin('u.TbTelefones t ON t.sq_usuario = u.sq_usuario')
                            ->where('u.tx_email = ? AND u.tx_senha = ?', array($tx_email, $tx_senha))
                            ->andWhere('u.st_ativo = ?', true)
                            ->andWhere('p.st_ativo = ?', true)
                            ->andWhere('t.st_ativo = ?', true)
                            ->limit(1);
            $res = $query->execute(array(), Doctrine::HYDRATE_ARRAY);


            $iterator = new ArrayIterator($res);
            $data = array();
            $cont = 0;

            while ($iterator->valid()) {
                $current = $iterator->current();
                $temp = array(
                    'tx_perfil' => $current['TbPerfil']['tx_perfil']
                );
                unset($current['TbPerfil']);
                $data[$cont] = array_merge($current, $temp);
                $iterator->next();
                $cont++;
            }

            $iterator = new ArrayIterator($data);
            $data = array();
            $cont = 0;

            while ($iterator->valid()) {
                $current = $iterator->current();
                $temp = array(
                    'nu_' . strtolower($current['TbTelefones'][0]['tp_telefone']) => $current['TbTelefones'][0]['nu_telefone'],
                    'dd_' . strtolower($current['TbTelefones'][0]['tp_telefone']) => $current['TbTelefones'][0]['nu_ddd'],
                    'nu_' . strtolower($current['TbTelefones'][1]['tp_telefone']) => $current['TbTelefones'][1]['nu_telefone'],
                    'dd_' . strtolower($current['TbTelefones'][1]['tp_telefone']) => $current['TbTelefones'][1]['nu_ddd']
                );
                unset($current['TbTelefones']);
                $data[$cont] = array_merge($current, $temp);
                $iterator->next();
                $cont++;
            }

            //$out['success'] = true;
            //$out['usuario'] = $data;

            return $data;

//            if (count($usuario) > 0) {
//                return array(success => true, usuario => $out);
//            }
//            return array(success => false);
        } catch (Doctrine_Exception $e) {
            return array(success => false, error => $e->getMessage());
        }
    }

}