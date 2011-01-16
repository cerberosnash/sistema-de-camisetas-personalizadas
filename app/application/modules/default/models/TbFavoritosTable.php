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
                            ->andWhere('sq_produto = ?', $sq_produto);
            return $query->execute();
        } catch (Doctrine_Exception $e) {
            return 0;
        }
    }

}