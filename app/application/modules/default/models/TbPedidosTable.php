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
                                    ->where('p.sq_status = ?', 1)
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

}