<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('TbStatus', 'doctrine');

/**
 * Base_TbStatus
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $sq_status
 * @property string $tx_status
 * @property boolean $st_ativo
 * @property Doctrine_Collection $TbPedidos
 * 
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     ##NAME## <##EMAIL##>
 * @version    SVN: $Id: Builder.php 6820 2009-11-30 17:27:49Z jwage $
 */
abstract class Base_TbStatus extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('tb_status');
        $this->hasColumn('sq_status', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'primary' => true,
             'sequence' => 'tb_status_sq_status',
             ));
        $this->hasColumn('tx_status', 'string', null, array(
             'type' => 'string',
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
             'default' => true,
             'primary' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasMany('TbPedidos', array(
             'local' => 'sq_status',
             'foreign' => 'sq_status'));
    }
}