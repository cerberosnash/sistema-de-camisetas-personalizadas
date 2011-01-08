<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('TbPedidos', 'doctrine');

/**
 * Base_TbPedidos
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $sq_pedido
 * @property integer $sq_usuario
 * @property integer $sq_status
 * @property date $dt_pedido
 * @property float $vl_pedido
 * @property boolean $st_ativo
 * @property TbStatus $TbStatus
 * @property TbUsuarios $TbUsuarios
 * @property Doctrine_Collection $TbHistorico
 * @property Doctrine_Collection $TbProdutosPedidos
 * 
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     ##NAME## <##EMAIL##>
 * @version    SVN: $Id: Builder.php 6820 2009-11-30 17:27:49Z jwage $
 */
abstract class Base_TbPedidos extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('tb_pedidos');
        $this->hasColumn('sq_pedido', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'primary' => true,
             ));
        $this->hasColumn('sq_usuario', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'notnull' => false,
             'primary' => false,
             ));
        $this->hasColumn('sq_status', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'notnull' => false,
             'primary' => false,
             ));
        $this->hasColumn('dt_pedido', 'date', null, array(
             'type' => 'date',
             'fixed' => false,
             'unsigned' => false,
             'notnull' => true,
             'primary' => false,
             ));
        $this->hasColumn('vl_pedido', 'float', null, array(
             'type' => 'float',
             'fixed' => false,
             'unsigned' => false,
             'notnull' => true,
             'primary' => false,
             ));
        $this->hasColumn('st_ativo', 'boolean', 1, array(
             'type' => 'boolean',
             'length' => 1,
             'fixed' => false,
             'unsigned' => false,
             'notnull' => true,
             'primary' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('TbStatus', array(
             'local' => 'sq_status',
             'foreign' => 'sq_status'));

        $this->hasOne('TbUsuarios', array(
             'local' => 'sq_usuario',
             'foreign' => 'sq_usuario'));

        $this->hasMany('TbHistorico', array(
             'local' => 'sq_pedido',
             'foreign' => 'sq_pedido'));

        $this->hasMany('TbProdutosPedidos', array(
             'local' => 'sq_pedido',
             'foreign' => 'sq_pedido'));
    }
}