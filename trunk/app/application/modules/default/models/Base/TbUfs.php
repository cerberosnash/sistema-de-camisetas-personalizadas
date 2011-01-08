<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('TbUfs', 'doctrine');

/**
 * Base_TbUfs
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $sq_uf
 * @property string $nm_uf
 * @property boolean $st_ativo
 * @property string $sg_uf
 * @property Doctrine_Collection $TbMunicipios
 * 
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     ##NAME## <##EMAIL##>
 * @version    SVN: $Id: Builder.php 6820 2009-11-30 17:27:49Z jwage $
 */
abstract class Base_TbUfs extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('tb_ufs');
        $this->hasColumn('sq_uf', 'integer', 4, array(
             'type' => 'integer',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => true,
             'autoincrement' => true,
             'length' => '4',
             ));
        $this->hasColumn('nm_uf', 'string', null, array(
             'type' => 'string',
             'fixed' => 0,
             'unsigned' => false,
             'notnull' => true,
             'primary' => false,
             'length' => '',
             ));
        $this->hasColumn('st_ativo', 'boolean', 1, array(
             'type' => 'boolean',
             'fixed' => 0,
             'unsigned' => false,
             'notnull' => true,
             'default' => 'true',
             'primary' => false,
             'length' => '1',
             ));
        $this->hasColumn('sg_uf', 'string', null, array(
             'type' => 'string',
             'fixed' => 1,
             'unsigned' => false,
             'notnull' => true,
             'primary' => false,
             'length' => '',
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasMany('TbMunicipios', array(
             'local' => 'sq_uf',
             'foreign' => 'sq_uf'));
    }
}