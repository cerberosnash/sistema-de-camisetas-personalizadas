<?php
/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class Adddoctramiteorganiz extends Doctrine_Migration_Base
{
    public function up()
    {
        $this->createTable('doc_tramite_organiz', array(
             'sq_tramite_organiz' => 
             array(
              'type' => 'integer',
              'length' => 4,
              'fixed' => false,
              'unsigned' => false,
              'primary' => true,
             ),
             'sq_unid_organiz' => 
             array(
              'type' => 'integer',
              'length' => 4,
              'fixed' => false,
              'unsigned' => false,
              'notnull' => true,
              'primary' => false,
             ),
             'sq_grupo_tramite' => 
             array(
              'type' => 'integer',
              'length' => 2,
              'fixed' => false,
              'unsigned' => false,
              'notnull' => true,
              'primary' => false,
             ),
             'sit_ativo' => 
             array(
              'type' => 'boolean',
              'length' => 1,
              'fixed' => false,
              'unsigned' => false,
              'notnull' => false,
              'default' => 'true',
              'primary' => false,
             ),
             ), array(
             'indexes' => 
             array(
             ),
             'primary' => 
             array(
              0 => 'sq_tramite_organiz',
             ),
             ));
    }

    public function down()
    {
        $this->dropTable('doc_tramite_organiz');
    }
}