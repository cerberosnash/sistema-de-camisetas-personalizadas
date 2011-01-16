<?php

/**
 */
class TbFavoritosTable extends Doctrine_Table {

    public function remover($sq_usuario, $sq_produto) {
        try {
            $query = Doctrine_Query::create()
                            ->update('TbFavoritos')
                            ->set('st_ativo', '?', false)
                            ->where('sq_usuario = ?', $sq_usuario)
                            ->andWhere('sq_produto = ?', $sq_produto)
                            ->andWhere('st_ativo = ?', true);
            return $query->execute();
        } catch (Doctrine_Exception $e) {
            return 0;
        }
    }

    public function adicionar($sq_usuario, $sq_produto) {
        try {
            $find = Doctrine_Core::getTable('TbFavoritos')
                            ->findByDql('sq_produto = ? AND sq_usuario = ?', array($sq_produto, $sq_usuario))
                            ->toArray();

            if (count($find) > 0) {

                $query = Doctrine_Query::create()
                                ->update('TbFavoritos')
                                ->set('st_ativo', '?', true)
                                ->where('sq_usuario = ?', $sq_usuario)
                                ->andWhere('sq_produto = ?', $sq_produto);
                return $query->execute();
            } else {
                $favorito = new TbFavoritos();
                $favorito->sq_produto = $sq_produto;
                $favorito->sq_usuario = $sq_usuario;
                $favorito->save();
                return $favorito->sq_favorito;
            }
        } catch (Doctrine_Exception $e) {
            throw new Exception($e);
        }
    }

}