<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('TbHistoricoAtividades', 'doctrine');

/**
 * Base_TbHistoricoAtividades
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $sq_historico_atividade
 * @property integer $sq_usuario
 * @property integer $sq_atividade
 * @property timestamp $dt_atividade
 * @property TbUsuarios $TbUsuarios
 * @property TbAtividades $TbAtividades
 * 
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     ##NAME## <##EMAIL##>
 * @version    SVN: $Id: Builder.php 6820 2009-11-30 17:27:49Z jwage $
 */
abstract class Base_TbHistoricoAtividades extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('tb_historico_atividades');
        $this->hasColumn('sq_historico_atividade', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'primary' => true,
             'sequence' => 'tb_historico_atividades_sq_historico_atividade',
             ));
        $this->hasColumn('sq_usuario', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'notnull' => true,
             'primary' => false,
             ));
        $this->hasColumn('sq_atividade', 'integer', 4, array(
             'type' => 'integer',
             'length' => 4,
             'fixed' => false,
             'unsigned' => false,
             'notnull' => true,
             'primary' => false,
             ));
        $this->hasColumn('dt_atividade', 'timestamp', null, array(
             'type' => 'timestamp',
             'fixed' => false,
             'unsigned' => false,
             'notnull' => true,
             'primary' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('TbUsuarios', array(
             'local' => 'sq_usuario',
             'foreign' => 'sq_usuario'));

        $this->hasOne('TbAtividades', array(
             'local' => 'sq_atividade',
             'foreign' => 'sq_atividade'));
    }
}