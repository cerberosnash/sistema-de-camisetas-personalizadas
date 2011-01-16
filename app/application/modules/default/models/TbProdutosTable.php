<?php

/**
 */
class TbProdutosTable extends Doctrine_Table {

    public function listarGaleria($aParams) {

        if ($page != 0) {
            $page = $page / $aParams['limit'];
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

        $query = new Doctrine_Pager(
                                Doctrine_Query::create()
                                ->select('p.ds_produto, p.nm_produto, p.vl_produto, p.tm_produto, p.sq_produto, p.co_produto, p.hs_produto')
                                ->from('TbProdutos p')
                                ->where('LOWER(p.nm_produto) LIKE ?', '%' . $aParams['query'] . '%')
                                ->where('LOWER(p.ds_produto)  LIKE ?', '%' . $aParams['query'] . '%')
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
                        ->where('LOWER(p.nm_produto) LIKE ?', '%' . $aParams['query'] . '%')
                        ->where('LOWER(p.ds_produto)  LIKE ?', '%' . $aParams['query'] . '%')
                        ->andWhere($sTamanho, $aParams['tamanho'])
                        ->andWhere($sCor, $aParams['cor'])
                        ->andWhere($sPreco)
                        ->andWhere('p.st_ativo = ?', true)
                        ->andWhere('p.st_privado = ?', false)
                        ->count();

        return $out;
    }

    public function listarFavoritos($sq_usuario, $aParams) {

        if ($page != 0) {
            $page = $page / $aParams['limit'];
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

        $query = new Doctrine_Pager(
                                Doctrine_Query::create()
                                ->select('p.ds_produto, p.nm_produto, p.vl_produto, p.tm_produto, p.sq_produto, p.co_produto, p.hs_produto')
                                ->from('TbProdutos p')
                                ->where('LOWER(p.nm_produto) LIKE ?', '%' . $aParams['query'] . '%')
                                ->where('LOWER(p.ds_produto)  LIKE ?', '%' . $aParams['query'] . '%')
                                ->andWhere($sTamanho, $aParams['tamanho'])
                                ->andWhere($sCor, $aParams['cor'])
                                ->andWhere($sPreco)
                                ->andWhere('p.st_ativo = ?', true)
                                ->andWhere('p.st_privado = ?', true)
                                ->orderBy($aParams['sort'] . ' ' . $aParams['dir']), ++$page, $aParams['limit']);

        $out['images'] = $query->execute(array(), Doctrine::HYDRATE_ARRAY);

        $out['totalCount'] = Doctrine_Query::create()
                        ->select()
                        ->from('TbProdutos p')
                        ->where('LOWER(p.nm_produto) LIKE ?', '%' . $aParams['query'] . '%')
                        ->where('LOWER(p.ds_produto)  LIKE ?', '%' . $aParams['query'] . '%')
                        ->andWhere($sTamanho, $aParams['tamanho'])
                        ->andWhere($sCor, $aParams['cor'])
                        ->andWhere($sPreco)
                        ->andWhere('p.st_ativo = ?', true)
                        ->andWhere('p.st_privado = ?', true)
                        ->count();

        return $out;
    }

    public function getComboUnidOrganiz($search, $page) {
//        if ($page != 0) {
//            $page = $page / 10;
//        }
//
//        $query = new Doctrine_Pager(
//                                Doctrine_Query::create()
//                                ->select('u.sq_unid_organiz, u.nm_unid_organiz')
//                                ->from('InsUnidOrganiz u')
//                                ->where('LOWER(u.nm_unid_organiz) LIKE ?', '%' . $search . '%')
//                                ->andWhere('u.st_ativo = true')
//                                ->orderBy('u.nm_unid_organiz ASC'), ++$page, self::$limit);
//        $resul['unidades'] = $query->execute(array(), Doctrine::HYDRATE_ARRAY);
//
//        if (empty($search)) {
//            $count = Doctrine_Core::getTable('InsUnidOrganiz')
//                            ->findByDql('where st_ativo = true')
//                            ->count();
//        } else {
//            $count = count($resul['unidades']);
//        }
//
//        $resul['totalCount'] = $count;
        return $resul;
    }

}