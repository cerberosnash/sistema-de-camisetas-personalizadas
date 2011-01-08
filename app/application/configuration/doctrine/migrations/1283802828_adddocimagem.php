<?php
/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class Adddocimagem extends Doctrine_Migration_Base
{
    public function up()
    {
        $this->createTable('doc_imagem', array(
             'sq_doc_imagem' => 
             array(
              'type' => 'integer',
              'length' => 4,
              'fixed' => false,
              'unsigned' => false,
              'primary' => true,
             ),
             'sq_digital_op' => 
             array(
              'type' => 'integer',
              'length' => 4,
              'fixed' => false,
              'unsigned' => false,
              'notnull' => true,
              'primary' => false,
             ),
             'fg_publico' => 
             array(
              'type' => 'boolean',
              'length' => 1,
              'fixed' => false,
              'unsigned' => false,
              'notnull' => true,
              'default' => 'false',
              'primary' => false,
             ),
             'cd_md5_imagem' => 
             array(
              'type' => 'string',
              'fixed' => true,
              'unsigned' => false,
              'notnull' => true,
              'primary' => false,
              'length' => NULL,
             ),
             'nu_ordem' => 
             array(
              'type' => 'integer',
              'length' => 4,
              'fixed' => false,
              'unsigned' => false,
              'notnull' => true,
              'primary' => false,
             ),
             'tx_conteudo' => 
             array(
              'type' => 'string',
              'fixed' => false,
              'unsigned' => false,
              'notnull' => false,
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
              0 => 'sq_doc_imagem',
             ),
             ));
    }

    public function down()
    {
        $this->dropTable('doc_imagem');
    }
}