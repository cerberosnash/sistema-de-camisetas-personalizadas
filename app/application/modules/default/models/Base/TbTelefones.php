<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('TbTelefones', 'doctrine');

/**
 * Base_TbTelefones
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $sq_telefone
 * @property integer $sq_tp_telefone
 * @property string $nu_telefone
 * @property string $nu_ddd
 * @property boolean $st_ativo
 * @property TbTpTelefones $TbTpTelefones
 * @property Doctrine_Collection $TbTelefonesUsuarios
 * 
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     ##NAME## <##EMAIL##>
 * @version    SVN: $Id: Builder.php 6820 2009-11-30 17:27:49Z jwage $
 */
abstract class Base_TbTelefones extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('tb_telefones');
        $this->hasColumn('sq_telefone', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'primary' => true,
             ));
        $this->hasColumn('sq_tp_telefone', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'notnull' => false,
             'primary' => false,
             ));
        $this->hasColumn('nu_telefone', 'string', null, array(
             'type' => 'string',
             'fixed' => false,
             'unsigned' => false,
             'notnull' => true,
             'primary' => false,
             ));
        $this->hasColumn('nu_ddd', 'string', null, array(
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
             'primary' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('TbTpTelefones', array(
             'local' => 'sq_tp_telefone',
             'foreign' => 'sq_tp_telefone'));

        $this->hasMany('TbTelefonesUsuarios', array(
             'local' => 'sq_telefone',
             'foreign' => 'sq_telefone'));
    }
}