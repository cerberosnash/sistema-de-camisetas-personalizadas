<?php

class TbPedidosTable extends Doctrine_Table {

    public function listarPedidos($aParams) {

        $aParams['alocado'] = ($aParams['alocado'] == 'true') ? true : false;
        $page = ($aParams['start'] > 0) ? ($aParams['start'] / $aParams['limit']) : 0;

        try {

            $out['success'] = true;

            $query = new Doctrine_Pager(
                            $subquery = Doctrine_Query::create()
                                    ->select('p.sq_pedido,u.nm_usuario,p.dt_pedido,p.vl_pedido')
                                    ->from('TbPedidos p')
                                    ->innerJoin('p.TbUsuarios u ON p.sq_usuario = u.sq_usuario')
                                    ->where('p.sq_status = ?', $aParams['status'])
                                    ->andWhere('p.fg_alocado = ?', $aParams['alocado'])
                                    ->andWhere('p.st_ativo = ?', true)
                                    ->orderBy($aParams['sort'] . ' ' . $aParams['dir']), ++$page, $aParams['limit']
            );

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
                            ->innerJoin('p.TbUsuarios u ON p.sq_usuario = u.sq_usuario')
                            ->where('p.sq_status = ?', $aParams['status'])
                            ->andWhere('p.fg_alocado = ?', $aParams['alocado'])
                            ->andWhere('p.st_ativo = ?', true)
                            ->count();
        } catch (Doctrine_Exception $e) {
            $out = array(success => false, error => $e->getMessage());
        }
        return $out;
    }

    public function listarProdutos($id_pedido) {

        if (!$id_pedido) {
            return array(success => true, totalCount => 0, produtos => array());
        }

        $page = ($aParams['start'] != 0) ? ($aParams['start'] / $aParams['limit']) : 0;
        $aParams['sort'] = 'sq_produto';

        try {

            $out['success'] = true;

            $query = new Doctrine_Pager(
                            $subquery = $this->createQuery()
                                    ->select('pxp.sq_pedido,pxp.nu_quantidade,pdt.*')
                                    ->from('TbProdutoPedido pxp')
                                    ->innerJoin('pxp.TbProdutos pdt ON pxp.sq_produto = pdt.sq_produto')
                                    ->where('pxp.sq_pedido = ?', $id_pedido)
                                    ->andWhere('pdt.st_ativo = ?', true)
                                    ->orderBy($aParams['sort'] . ' ' . $aParams['dir']), ++$page, $aParams['limit']
            );

            $res = $query->execute(array(), Doctrine::HYDRATE_ARRAY);
            $iterator = new ArrayIterator($res);
            $data = array();
            $cont = 0;

            while ($iterator->valid()) {
                $current = $iterator->current();
                $temp = array(
                    'sq_produto' => $current['TbProdutos']['sq_produto'],
                    'co_produto' => $current['TbProdutos']['co_produto'],
                    'nm_produto' => $current['TbProdutos']['nm_produto'],
                    'ds_produto' => $current['TbProdutos']['ds_produto'],
                    'tm_produto' => $current['TbProdutos']['tm_produto'],
                    'vl_produto' => $current['TbProdutos']['vl_produto'],
                    'hs_produto' => $current['TbProdutos']['hs_produto'],
                    'fg_verso' => $current['TbProdutos']['fg_verso'],
                    'nu_quantidade' => $current['nu_quantidade']
                );
                unset($current[$cont]);
                unset($current['TbProdutos']);
                $data[$cont] = array_merge($current, $temp);
                $iterator->next();
                $cont++;
            }

            $out['produtos'] = $data;
            $out['totalCount'] = $this->createQuery()
                            ->select('pxp.sq_produto,pxp.sq_pedido,pxp.nu_quantidade,pdt.*')
                            ->from('TbProdutoPedido pxp')
                            ->innerJoin('pxp.TbProdutos pdt ON pxp.sq_produto = pdt.sq_produto')
                            ->where('pxp.sq_pedido = ?', $id_pedido)
                            ->andWhere('pdt.st_ativo = ?', true)
                            ->count();
            return $out;
        } catch (Doctrine_Exception $e) {
            return array(success => false, error => $e->getMessage());
        }
    }

    public function cliente($id_pedido) {
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

    public function finalizarPostagem($id_pedido, $cd_rastreamento) {
        try {
            $query = Doctrine_Query::create()
                            ->update('TbPedidos')
                            ->set('cd_rastreamento', '?', $cd_rastreamento)
                            ->set('sq_status', '?', 4)
                            ->where('sq_status = ?', 3)
                            ->andWhere('sq_pedido = ?', $id_pedido)
                            ->andWhere('st_ativo = ?', true);

            if ($query->execute() > 0) {
                $out = array(success => true, message => 'Postagem finalizada com sucesso!');
            } else {
                $out = array(success => false, error => 'Provavelmente este pedido ja foi finalizado!');
            }

            return $out;
        } catch (Doctrine_Exception $e) {
            return array(success => false, error => $e->getMessage());
        }
    }

    public function finalizarConfeccao($id_pedido, $sq_confeccionador) {
        try {
            $query = Doctrine_Query::create()
                            ->update('TbPedidos')
                            ->set('sq_status', '?', 3)
                            ->set('fg_alocado', '?', false)
                            ->andWhere('sq_pedido = ?', $id_pedido)
                            ->andWhere('sq_confeccionador = ?', $sq_confeccionador)
                            ->andWhere('fg_alocado = ?', true)
                            ->andWhere('st_ativo = ?', true);

            if ($query->execute() > 0) {
                $out = array(success => true, message => 'Pedido finalizado com sucesso!');
            } else {
                $out = array(success => false, error => 'Nao foi possivel finalizar o pedido!');
            }

            return $out;
        } catch (Doctrine_Exception $e) {
            return array(success => false, error => $e->getMessage());
        }
    }

    public function alocar($sq_confeccionador) {
        try {
            if ($this->checkAlocado($sq_confeccionador)) {
                return array(success => false, error => 'Voce nao pode alocar um novo pedido enquanto existir outro em aberto!');
            }

            $query = $this->createQuery()
                            ->where('sq_status = ?', 2)
                            ->andWhere('fg_alocado = ?', false)
                            ->andWhere('st_ativo = ?', true)
                            ->limit(1);

            $pedidos = $query->execute();

            if (count($pedidos) == 0) {
                return array(success => false, error => 'Nao existe nenhum pedido disponivel para ser alocado!');
            }

            $pedidos[0]->sq_confeccionador = $sq_confeccionador;
            $pedidos[0]->fg_alocado = true;
            $pedidos[0]->save();

            return array(success => true, message => 'Pedido alocado com sucesso!');
        } catch (Doctrine_Exception $e) {
            return array(success => false, error => $e->getMessage());
        }
    }

    public function checkAlocado($sq_confeccionador) {
        try {
            $res = $this->createQuery()
                            ->where('sq_status = ?', 2)
                            ->andWhere('fg_alocado = ?', true)
                            ->andWhere('sq_confeccionador = ?', $sq_confeccionador)
                            ->andWhere('st_ativo = ?', true)
                            ->fetchOne();

            if ($res) {
                return $res->sq_pedido;
            }

            return false;
        } catch (Doctrine_Exception $e) {
            return array(success => false, error => $e->getMessage());
        }
    }

}