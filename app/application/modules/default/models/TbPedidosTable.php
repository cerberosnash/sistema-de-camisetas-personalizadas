<?php

class TbPedidosTable extends Doctrine_Table {

    public function listarPedidos($aParams) {

        if ($aParams['start'] != 0) {
            $page = $aParams['start'] / $aParams['limit'];
        } else {
            $page = 0;
        }

        try {

            $out['success'] = true;

            $query = new Doctrine_Pager(
                            $subquery = Doctrine_Query::create()
                            ->select('p.sq_pedido,u.nm_usuario,p.dt_pedido,p.vl_pedido')
                            ->from('TbPedidos p')
                            ->innerJoin('p.TbUsuarios u ON p.sq_usuario = u.sq_usuario')
                            ->where('p.sq_status = ?', $aParams['status'])
                            ->andWhere('p.st_ativo = ?', true)
                            ->orderBy($aParams['sort'] . ' ' . $aParams['dir']), ++$page, $aParams['limit']);

            $res = $query->execute(array(), Doctrine::HYDRATE_ARRAY);

            $iterator = new ArrayIterator($res);
            $data = array();
            $cont = 0;

            while ($iterator->valid()) {
                $current = $iterator->current();
                $temp = array(
                    'nm_usuario' => $current['TbUsuarios']['nm_usuario']
                );
                unset($current['TbUsuarios']);
                $data[$cont] = array_merge($current, $temp);
                $iterator->next();
                $cont++;
            }

            $out['pedidos'] = $data;

            $out['totalCount'] = Doctrine_Query::create()
                    ->from('TbPedidos p')
                    ->where('p.sq_status = ?', 1)
                    ->andWhere('p.st_ativo = ?', true)
                    ->count();
        } catch (Doctrine_Exception $e) {
            $out = array(success => false, error => $e->getMessage());
        }
        return $out;
    }

    public function cliente($id_pedido) {
        // $id_pedido = 12222;
        try {
            $query = Doctrine_Query::create()
                    ->select('u.nm_usuario,t.nu_telefone,t.nu_ddd,t.tp_telefone,m.nm_municipio,e.nm_uf,p.sq_pedido,u.nu_cep,u.nu_cpf,u.tx_endereco')
                    ->from('TbUsuarios u')
                    ->innerJoin('u.TbMunicipios m ON m.sq_municipio = u.sq_municipio')
                    ->innerJoin('m.TbUfs e ON e.sq_uf = m.sq_uf')
                    ->innerJoin('u.TbPedidos p ON u.sq_usuario = p.sq_usuario')
                    ->leftJoin('u.TbTelefones t ON t.sq_usuario = u.sq_usuario')
                    ->where('p.sq_pedido = ? ', $id_pedido)
                    ->andWhere('u.st_ativo = ?', true)
                    ->andWhere('p.st_ativo = ?', true)
                    ->andWhere('t.st_ativo = ?', true)
                    ->andWhere('p.sq_status = ?', 3)
                    ->limit(1);
            $res = $query->execute(null, Doctrine::HYDRATE_ARRAY);

            if (!empty($res)) {

                $iterator = new ArrayIterator($res);
                $data = array();
                $cont = 0;

                while ($iterator->valid()) {
                    $current = $iterator->current();
                    $temp = array(
                        'success' => true,
                        'nm_municipio' => $current['TbMunicipios']['nm_municipio'],
                        'nm_uf' => $current['TbMunicipios']['TbUfs']['nm_uf'],
                        'nu_' . strtolower($current['TbTelefones'][0]['tp_telefone']) => $current['TbTelefones'][0]['nu_telefone'],
                        'dd_' . strtolower($current['TbTelefones'][0]['tp_telefone']) => $current['TbTelefones'][0]['nu_ddd'],
                        'nu_' . strtolower($current['TbTelefones'][1]['tp_telefone']) => $current['TbTelefones'][1]['nu_telefone'],
                        'dd_' . strtolower($current['TbTelefones'][1]['tp_telefone']) => $current['TbTelefones'][1]['nu_ddd']
                    );
                    unset($current['TbMunicipios']);
                    unset($current['TbTelefones']);
                    $data = array_merge($current, $temp);
                    $iterator->next();
                    $cont++;
                }
            } else {
                $data['success'] = false;
            }

            return $data;
        } catch (Doctrine_Exception $e) {
            throw new Doctrine_Exception($e);
        }
    }

}