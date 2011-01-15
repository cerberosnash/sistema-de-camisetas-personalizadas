<?php

/**
 */
class TbProdutosTable extends Doctrine_Table {

    public function listar($aParams) {
       // var_dump($aParams);
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
                                ->select('p.ds_produto, p.nm_produto, p.vl_produto, p.tm_produto, p.sq_produto, p.co_produto')
                                ->from('TbProdutos p')
                                ->where('LOWER(p.nm_produto) LIKE ?', '%' . $aParams['query'] . '%')
                                ->where('LOWER(p.ds_produto)  LIKE ?', '%' . $aParams['query'] . '%')
                                ->andWhere($sTamanho, $aParams['tamanho'])
                                ->andWhere($sCor, $aParams['cor'])
                                ->andWhere($sPreco)
                                ->andWhere('p.st_ativo = true')
                                ->andWhere('p.st_privado = false')
                                ->orderBy($aParams['sort'] . ' ' . $aParams['dir']), ++$page, $aParams['limit']);

        $resul['images'] = $query->execute(array(), Doctrine::HYDRATE_ARRAY);

        $count = Doctrine_Query::create()
                        ->select()
                        ->from('TbProdutos p')
                        ->where('LOWER(p.nm_produto) LIKE ?', '%' . $aParams['query'] . '%')
                        ->where('LOWER(p.ds_produto)  LIKE ?', '%' . $aParams['query'] . '%')
                        ->andWhere($sTamanho, $aParams['tamanho'])
                        ->andWhere($sCor, $aParams['cor'])
                        ->andWhere($sPreco)
                        ->andWhere('p.st_ativo = true')
                        ->andWhere('p.st_privado = false')
                        ->count();


        $resul['totalCount'] = $count;
        return $resul;


////        $count = Doctrine_Core::getTable('InsUnidOrganiz')
////                        ->findByDql('where st_ativo = true')
////                        ->count();
//        $produto['images'] = Doctrine_Query::create()
//        ->select('p.*')
//        ->from('TbProdutos p')
////                        //->innerJoin('p.PesPessoaFisica f on p.sq_pessoa = f.sq_pessoa')
////                        //->innerJoin('f.InsProfissional i on p.sq_pessoa = i.sq_pessoa')
////                        //->innerJoin('i.InsProfSenha s on p.sq_pessoa = s.sq_pessoa')
////                        //->where('p.st_ativo = true')->andWhere('f.st_ativo = true')
////                        //->andWhere('i.st_ativo = true')->andWhere('s.st_ativo = true')
//        ->where('p.st_privado = ?', false)
//        ->andWhere('p.st_ativo = ?', true);
//        $produto['images']->execute(array(), Doctrine::HYDRATE_ARRAY);
////
//        $produto['totalCount'] = Doctrine_Core::getTable('TbProdutos')
//                        ->findByDql('where p.st_ativo = true and p.st_privado = false')
//                        ->count();
//        return $produto;
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