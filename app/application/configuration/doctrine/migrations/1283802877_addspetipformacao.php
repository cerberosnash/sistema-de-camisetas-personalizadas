<?php
/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class Addspetipformacao extends Doctrine_Migration_Base
{
    public function up()
    {
        $this->createTable('spe_tip_formacao', array(
             'cd_tip_formacao' => 
             array(
              'type' => 'string',
              'fixed' => true,
              'unsigned' => false,
              'primary' => true,
              'length' => NULL,
             ),
             'nm_tip_formacao' => 
             array(
              'type' => 'string',
              'fixed' => false,
              'unsigned' => false,
              'notnull' => true,
              'primary' => false,
              'length' => NULL,
             ),
             ), array(
             'indexes' => 
             array(
             ),
             'primary' => 
             array(
              0 => 'cd_tip_formacao',
             ),
             ));
    }

    public function down()
    {
        $this->dropTable('spe_tip_formacao');
    }
}