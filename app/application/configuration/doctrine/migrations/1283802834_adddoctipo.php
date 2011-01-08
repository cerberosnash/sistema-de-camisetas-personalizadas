<?php
/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class Adddoctipo extends Doctrine_Migration_Base
{
    public function up()
    {
        $this->createTable('doc_tipo', array(
             'sq_doc_tipo' => 
             array(
              'type' => 'integer',
              'length' => 2,
              'fixed' => false,
              'unsigned' => false,
              'primary' => true,
             ),
             'ds_doc_tipo' => 
             array(
              'type' => 'string',
              'fixed' => false,
              'unsigned' => false,
              'notnull' => true,
              'primary' => false,
              'length' => NULL,
             ),
             'st_ativo' => 
             array(
              'type' => 'boolean',
              'length' => 1,
              'fixed' => false,
              'unsigned' => false,
              'notnull' => true,
              'default' => 'true',
              'primary' => false,
             ),
             ), array(
             'indexes' => 
             array(
             ),
             'primary' => 
             array(
              0 => 'sq_doc_tipo',
             ),
             ));
    }

    public function down()
    {
        $this->dropTable('doc_tipo');
    }
}