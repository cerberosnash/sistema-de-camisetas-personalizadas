<?php

/**
 */
class TbProdutosTable extends Doctrine_Table {

    public function listar($aParametros) {
        $produto = Doctrine_Query::create()
                        ->select('p.*')
                        ->from('TbProdutos p')
                        //->innerJoin('p.PesPessoaFisica f on p.sq_pessoa = f.sq_pessoa')
                        //->innerJoin('f.InsProfissional i on p.sq_pessoa = i.sq_pessoa')
                        //->innerJoin('i.InsProfSenha s on p.sq_pessoa = s.sq_pessoa')
                        //->where('p.st_ativo = true')->andWhere('f.st_ativo = true')
                        //->andWhere('i.st_ativo = true')->andWhere('s.st_ativo = true')
                        //->andWhere('s.ds_prof_senha = ?', $password)
                        ->where('p.st_ativo = ?', true);
        $produto->execute(array(),Doctrine::HYDRATE_ARRAY);
        //$produto['totalCount'] = Doctrine_Core::getTable('TbProdutos')->count();
        return $produto;
    }

}