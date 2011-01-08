<?php
/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class Addconcontroller extends Doctrine_Migration_Base
{
    public function up()
    {
        $this->createTable('con_controller', array(
             'sq_controller' => 
             array(
              'type' => 'integer',
              'length' => 4,
              'fixed' => false,
              'unsigned' => false,
              'primary' => true,
             ),
             'sq_sistema' => 
             array(
              'type' => 'integer',
              'length' => 4,
              'fixed' => false,
              'unsigned' => false,
              'notnull' => true,
              'primary' => false,
             ),
             'tx_controller' => 
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
              0 => 'sq_controller',
             ),
             ));
    }

    public function down()
    {
        $this->dropTable('con_controller');
    }
}