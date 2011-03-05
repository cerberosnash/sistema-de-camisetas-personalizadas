<?php

/**
 */
class TbProdutosTable extends Doctrine_Table {

    public function listarGaleria($aParams) {

        if ($aParams['start'] != 0) {
            $page = $aParams['start'] / $aParams['limit'];
        } else {
            $page = 0;
        }

        if ($aParams['query'] != '') {
            $aParams['query'] = strtolower($aParams['query']);
        }

        if ($aParams['tamanho'] != '') {
            $sTamanho = 'p.tm_produto = ?';
        } else {
            $aParams['tamanho'] = '';
            $sTamanho = 'p.tm_produto != ?';
        }

        if ($aParams['cor'] != '') {
            $sCor = 'LOWER(p.co_produto) = LOWER(?)';
        } else {
            $aParams['cor'] = '';
            $sCor = 'p.co_produto != ?';
        }

        if ($aParams['preco_max'] >= $aParams['preco_min']) {
            $sPreco = 'p.vl_produto >= ' . floatval($aParams['preco_min']) . ' AND p.vl_produto <= ' . floatval($aParams['preco_max']);
        } else {
            $sPreco = 'p.vl_produto >= 9.99 AND p.vl_produto <= 99.99';
        }

        try {

            $out['success'] = true;

            $query = new Doctrine_Pager(
                            $subquery = Doctrine_Query::create()
                            ->select('p.ds_produto, p.nm_produto, p.vl_produto, p.tm_produto, p.sq_produto, p.co_produto, p.hs_produto, p.fg_verso')
                            ->from('TbProdutos p')
                            ->where('p.nm_produto ILIKE ? OR p.ds_produto ILIKE ?', array('%' . $aParams['query'] . '%', '%' . $aParams['query'] . '%'))
                            ->andWhere($sTamanho, $aParams['tamanho'])
                            ->andWhere($sCor, $aParams['cor'])
                            ->andWhere($sPreco)
                            ->andWhere('p.st_ativo = ?', true)
                            ->andWhere('p.st_privado = ?', false)
                            ->orderBy($aParams['sort'] . ' ' . $aParams['dir']), ++$page, $aParams['limit']);

            $out['images'] = $query->execute(array(), Doctrine::HYDRATE_ARRAY);

            $out['totalCount'] = Doctrine_Query::create()
                    ->select()
                    ->from('TbProdutos p')
                    ->where('p.nm_produto ILIKE ? OR p.ds_produto ILIKE ?', array('%' . $aParams['query'] . '%', '%' . $aParams['query'] . '%'))
                    ->andWhere($sTamanho, $aParams['tamanho'])
                    ->andWhere($sCor, $aParams['cor'])
                    ->andWhere($sPreco)
                    ->andWhere('p.st_ativo = ?', true)
                    ->andWhere('p.st_privado = ?', false)
                    ->count();
        } catch (Doctrine_Exception $e) {
            $out = array(success => false, error => $e->getMessage());
        }
        return $out;
    }

    public function listarFavoritos($sq_usuario, $aParams) {

        if ($aParams['start'] != 0) {
            $page = $aParams['start'] / $aParams['limit'];
        } else {
            $page = 0;
        }

        if ($aParams['query'] != '') {
            $aParams['query'] = strtolower($aParams['query']);
        }

        if ($aParams['tamanho'] != '') {
            $sTamanho = 'p.tm_produto = ?';
        } else {
            $aParams['tamanho'] = '';
            $sTamanho = 'p.tm_produto != ?';
        }

        if ($aParams['cor'] != '') {
            $sCor = 'LOWER(p.co_produto) = LOWER(?)';
        } else {
            $aParams['cor'] = '';
            $sCor = 'p.co_produto != ?';
        }

        if ($aParams['preco_max'] >= $aParams['preco_min']) {
            $sPreco = 'p.vl_produto >= ' . floatval($aParams['preco_min']) . ' AND p.vl_produto <= ' . floatval($aParams['preco_max']);
        } else {
            $sPreco = 'p.vl_produto >= 9.99 AND p.vl_produto <= 99.99';
        }

        try {

            $out['success'] = true;

            $query = new Doctrine_Pager(
                            $subquery = Doctrine_Query::create()
                            ->select('p.ds_produto, p.nm_produto, p.vl_produto, p.tm_produto, p.sq_produto, p.co_produto, p.hs_produto, p.fg_verso, f.sq_produto')
                            ->from('TbFavoritos f')
                            ->innerJoin('f.TbProdutos p ON p.sq_produto = f.sq_produto')
                            ->where('p.nm_produto ILIKE ? OR p.ds_produto ILIKE ?', array('%' . $aParams['query'] . '%', '%' . $aParams['query'] . '%'))
                            ->andWhere($sTamanho, $aParams['tamanho'])
                            ->andWhere($sCor, $aParams['cor'])
                            ->andWhere($sPreco)
                            ->andWhere('p.st_ativo = ?', true)
                            ->andWhere('f.st_ativo = ?', true)
                            ->andWhere('f.sq_usuario = ?', $sq_usuario)
                            ->orderBy($aParams['sort'] . ' ' . $aParams['dir'])
                            , ++$page, $aParams['limit']);
            $res = $query->execute(array(), Doctrine::HYDRATE_ARRAY);

            $iterator = new ArrayIterator($res);
            $data = array();
            $cont = 0;

            while ($iterator->valid()) {
                $current = $iterator->current();
                $temp = array(
                    'sq_produto' => $current['TbProdutos']['sq_produto'],
                    'ds_produto' => $current['TbProdutos']['ds_produto'],
                    'nm_produto' => $current['TbProdutos']['nm_produto'],
                    'vl_produto' => $current['TbProdutos']['vl_produto'],
                    'tm_produto' => $current['TbProdutos']['tm_produto'],
                    'co_produto' => $current['TbProdutos']['co_produto'],
                    'hs_produto' => $current['TbProdutos']['hs_produto'],
                    'fg_verso' => $current['TbProdutos']['fg_verso']
                );
                unset($current['TbProdutos']);
                $data[$cont] = array_merge($current, $temp);
                $iterator->next();
                $cont++;
            }

            $out['images'] = $data;

            $out['totalCount'] = Doctrine_Query::create()
                    ->select('p.ds_produto, p.nm_produto, p.vl_produto, p.tm_produto, p.sq_produto, p.co_produto, p.hs_produto, p.fg_verso, f.sq_produto')
                    ->from('TbFavoritos f')
                    ->innerJoin('f.TbProdutos p ON p.sq_produto = f.sq_produto')
                    ->where('p.nm_produto ILIKE ?', '%' . $aParams['query'] . '%')
                    ->where('p.nm_produto ILIKE ? OR p.ds_produto ILIKE ?', array('%' . $aParams['query'] . '%', '%' . $aParams['query'] . '%'))
                    ->andWhere($sTamanho, $aParams['tamanho'])
                    ->andWhere($sCor, $aParams['cor'])
                    ->andWhere($sPreco)
                    ->andWhere('p.st_ativo = ?', true)
                    ->andWhere('f.st_ativo = ?', true)
                    ->andWhere('f.sq_usuario = ?', $sq_usuario)
                    ->count();
        } catch (Doctrine_Exception $e) {
            $out = array(success => false, error => $e->getMessage());
        }
        return $out;
    }

}

/* SQLs */

/*
  select
  p.ds_produto,
  p.nm_produto,
  p.vl_produto,
  p.tm_produto,
  p.sq_produto,
  p.co_produto,
  p.hs_produto,
  count(*)
  from tb_produtos p
  inner join tb_favoritos f on f.sq_produto = p.sq_produto
  where
  f.st_ativo = true and
  p.st_ativo = true and
  f.sq_usuario = 1
  group by
  p.ds_produto,
  p.nm_produto,
  p.vl_produto,
  p.tm_produto,
  p.sq_produto,
  p.co_produto,
  p.hs_produto
  order by p.sq_produto desc;
 */