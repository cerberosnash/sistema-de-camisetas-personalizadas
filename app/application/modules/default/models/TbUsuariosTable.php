<?php

/**
 */
class TbUsuariosTable extends Doctrine_Table {

    public function autenticar($tx_email, $tx_senha) {
        try {
            $query = Doctrine_Query::create()
                            ->select('u.*,p.tx_perfil,t.nu_telefone,t.nu_ddd,t.tp_telefone,m.nm_municipio,e.nm_uf')
                            ->from('TbUsuarios u')
                            ->innerJoin('u.TbPerfil p ON p.sq_perfil = u.sq_perfil')
                            ->innerJoin('u.TbMunicipios m ON m.sq_municipio = u.sq_municipio')
                            ->innerJoin('m.TbUfs e ON e.sq_uf = m.sq_uf')
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
                    'tx_perfil' => $current['TbPerfil']['tx_perfil'],
                    'sq_municipio' => $current['TbMunicipios']['sq_municipio'],
                    'nm_municipio' => $current['TbMunicipios']['nm_municipio'],
                    'sq_uf' => $current['TbMunicipios']['TbUfs']['sq_uf'],
                    'nm_uf' => $current['TbMunicipios']['TbUfs']['nm_uf'],
                    'nu_' . strtolower($current['TbTelefones'][0]['tp_telefone']) => $current['TbTelefones'][0]['nu_telefone'],
                    'dd_' . strtolower($current['TbTelefones'][0]['tp_telefone']) => $current['TbTelefones'][0]['nu_ddd'],
                    'nu_' . strtolower($current['TbTelefones'][1]['tp_telefone']) => $current['TbTelefones'][1]['nu_telefone'],
                    'dd_' . strtolower($current['TbTelefones'][1]['tp_telefone']) => $current['TbTelefones'][1]['nu_ddd']
                );
                unset($current['TbPerfil']);
                unset($current['TbMunicipios']);
                unset($current['TbTelefones']);
                $data[$cont] = array_merge($current, $temp);
                $iterator->next();
                $cont++;
            }

            return $data;
        } catch (Doctrine_Exception $e) {
            throw new Doctrine_Exception($e);
        }
    }

}