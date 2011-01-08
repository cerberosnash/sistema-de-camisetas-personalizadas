<?php
class Base_Controller_Action_Helper_Conexao extends Zend_Controller_Action_Helper_Abstract
{
    /**
     * Constantes dos adapter do PDO
     */
    const ADAPTER_PDO_POSTGRES = "Pdo_Pgsql";
    const ADAPTER_PDO_ORACLE   = "Pdo_Oci";
    const ADAPTER_PDO_MYSQL    = "Pdo_Mysql";
    const ADAPTER_PDO_MSSQL    = "Pdo_Mssql";
    
    /**
     * Constantes dos adapter sem PDO
     */
    const ADAPTER_POSTGRES = "Postgres";
    const ADAPTER_ORACLE   = "Oracle";
    const ADAPTER_MYSQL    = "Mysqli";
    const ADAPTER_MSSQL    = "Sqlsrv";

    /**
     * Atributo que recebe o valor da conexão criada
     */
    public $_connection;

    /**
     * Atributo que recebe um array com as tabelas da conexÃ£o criada;
     */
    private $_arrTable;

    public function setArrTable(Array $arrTable)
    {
        $this->_arrTable = $arrTable;
    }

    public function getArrTable()
    {
        return $this->_arrTable;
    }

    public function setConnection($connection)
    {
        $this->_connection = $connection;
    }

    public function getConnection()
    {
        return $this->_connection;
    }

    /**
     * Método que testa conexão com o banco de dados.
     * Utilizado na tela de Dicionário de Dados e no instalador,
     * verificando se os dados informados são mesmo de uma conexão
     * valida.
     * @param array $arrDataConection['tx_adapter']
     * @param array $arrDataConection['tx_host']
     * @param array $arrDataConection['tx_username']
     * @param array $arrDataConection['tx_username']
     * @param array $arrDataConection['tx_dbname']
     * @param array $arrDataConection
     */
    public function validaConexao(array $arrDataConection)
    {
        $cod          = "";
        $msg          = Base_Util::getTranslator('L_MSG_ERRO_RECUPERAR_MENSAGEM');
        $errorConexao = false;
        if(count($arrDataConection) > 0) {
            try {
                $arrConection = array(
                    'host'     => $arrDataConection['tx_host'],
                    'username' => $arrDataConection['tx_username'],
                    'password' => $arrDataConection['tx_password'],
                    'dbname'   => $arrDataConection['tx_dbname']
                );

                if(($arrDataConection['tx_adapter'] == self::ADAPTER_MYSQL || $arrDataConection['tx_adapter'] == self::ADAPTER_PDO_MYSQL) && K_INSTALL == 'N'){
                    $arrConection['driver_options'] = array(PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => 0);
                }
                if(($arrDataConection['tx_adapter'] == self::ADAPTER_MSSQL || $arrDataConection['tx_adapter'] == self::ADAPTER_PDO_MSSQL) && K_INSTALL == 'N'){
                    $arrConection['charset'] = 'utf8';
                }

                $this->setConnection(Zend_Db::factory(strtolower($arrDataConection['tx_adapter']),$arrConection));

                if(!$this->getConnection()) {
                    $cod          = 2;
                    $errorConexao = true;
                    $msg          = Base_Util::getTranslator('L_MSG_ERRO_ESTABELECER_CONEXAO');
                } else {
                //Condição que verifica se o schema do banco de dados Postgres existe
                    if($arrDataConection['tx_adapter'] == self::ADAPTER_PDO_POSTGRES) {
                        $arrSchema = $this->validaSchemaPostgres($arrDataConection['tx_schema']);
                        if(count($arrSchema) > 0) {
                            $cod = 1;
                            $msg = Base_Util::getTranslator('L_MSG_SUCESS_VALIDAR_INFORMACOES');
                        } else {
                            $cod = 2;
                            $msg = Base_Util::getTranslator('L_MSG_ALERT_SCHEMA_SEM_TABELA_OU_INEXISTENTE');
                            if(K_INSTALL == "N") {
                                $msg .= "<br /> ".Base_Util::getTranslator('L_MSG_ALERT_SCHEMA_SERA_CRIADO');
                            }
                        }
                    //condição que verifica se o schema do banco de dados ORACLE existe
                    } else if(($arrDataConection['tx_adapter'] == self::ADAPTER_PDO_ORACLE) || ($arrDataConection['tx_adapter'] == self::ADAPTER_ORACLE)) {
                            $this->_getTableOracle($arrDataConection['tx_schema']);
                            if(count($this->getArrTable()) > 0) {
                                $cod = 1;
                                $msg = Base_Util::getTranslator('L_MSG_SUCESS_VALIDAR_INFORMACOES');
                            } else {
                                $cod = 2;
                                $msg = Base_Util::getTranslator('L_MSG_ALERT_SCHEMA_SEM_TABELA_OU_INEXISTENTE');
                                if(K_INSTALL == "N") {
                                    $msg .= "<br /> ".Base_Util::getTranslator('L_MSG_ALERT_SCHEMA_SERA_CRIADO');
                                }
                            }
                        } else if(($arrDataConection['tx_adapter'] == self::ADAPTER_PDO_MSSQL)||($arrDataConection['tx_adapter'] == self::ADAPTER_MSSQL)) {
                                $this->_getTableSqlserver();
                                if(count($this->getArrTable()) > 0) {
                                    $cod = 1;
                                    $msg = Base_Util::getTranslator('L_MSG_SUCESS_VALIDAR_INFORMACOES');
                                } else {
                                    $cod = 2;
                                    $msg = Base_Util::getTranslator('L_MSG_ALERT_BANCO_DADOS_SEM_TABELA_OU_INEXISTENTE');
                                }
                            } else if(($arrDataConection['tx_adapter'] == self::ADAPTER_PDO_MYSQL) || ($arrDataConection['tx_adapter'] == self::ADAPTER_MYSQL)) {
                                    $this->_getTableMysql();
                                    if($this->getArrTable()) {
                                        $cod = 1;
                                        $msg = Base_Util::getTranslator('L_MSG_SUCESS_VALIDAR_INFORMACOES');
                                    } else {
                                        $cod = 2;
                                        $msg = Base_Util::getTranslator('L_MSG_ALERT_BANCO_DADOS_SEM_TABELA_OU_INEXISTENTE');
                                    }
                                }
                }
            } catch (Zend_Db_Adapter_Exception $e) {
                $error = strpos($e->getMessage(),'host');
                if(!$error) {
                    $error = strpos($e->getMessage(),'password');
                    if(!$error) {
                        $error = strpos($e->getMessage(),'database');
                        if(!$error) {
                            $error = strpos($e->getMessage(),'driver');
                            if($error) {
                                $cod          = 2;
                                $errorConexao = true;
                                $msg          = Base_Util::getTranslator('L_MSG_ERRO_BANCO_DADOS_SEM_DRIVER_INSTALADO');
                            } else {
                                $cod          = 2;
                                $errorConexao = true;
                                $msg          = Base_Util::getTranslator('L_MSG_ERRO_EXECUCAO_OPERACAO').$e->getMessage();
                            }
                        } else {
                            $cod          = 2;
                            $errorConexao = true;
                            $msg          = Base_Util::getTranslator('L_MSG_ERRO_BANCO_DADOS_INEXISTENTE');
                        }
                    } else {
                        $cod          = 2;
                        $errorConexao = true;
                        $msg          = Base_Util::getTranslator('L_MSG_ERRO_USUARIO_SENHA_ACESSO_INVALIDO');
                    }
                } else {
                    $cod          = 2;
                    $errorConexao = true;
                    $msg          = Base_Util::getTranslator('L_MSG_ERRO_NOME_SERVIDOR_INVALIDO');
                }
            }
        }
        return $arrRetorno = array('type'=>$cod,'msg'=>$msg,'error'=>$errorConexao);
    }

    /**
     * Método que verifica se o schema existe em um
     * determinado dataBase no banco de dados POSTGRESQL
     *
     * @param text $schema;
     * return boolean
     */
    public function validaSchemaPostgres($schema)
    {
        $sql = " SELECT *
                 FROM
                    pg_namespace
                 WHERE
                    nspname = '{$schema}' ";
        return $this->getConnection()->fetchCol($sql);
    }

    public function getRecuperaComentario($tx_adapter,$tx_tabela,$tx_schema)
    {
        switch ($tx_adapter) {
            case self::ADAPTER_PDO_POSTGRES:
            case self::ADAPTER_POSTGRES:
                return $this->_getRecuperaComentarioPgsql($tx_tabela,$tx_schema);
                break;
            case self::ADAPTER_PDO_ORACLE:
            case self::ADAPTER_ORACLE:
                return $this->_getRecuperaComentarioOracle($tx_tabela,$tx_schema);
                break;
            case self::ADAPTER_PDO_MSSQL:
            case self::ADAPTER_MSSQL:
                return $this->_getRecuperaComentarioSqlserver($tx_tabela,$tx_schema);
                break;
            case self::ADAPTER_PDO_MYSQL:
            case self::ADAPTER_MYSQL:
                return $this->_getRecuperaComentarioTableMysql($tx_tabela,$tx_schema);
                break;
        }
    }

    protected function _getRecuperaComentarioPgsql($tx_tabela,$tx_schema)
    {
        $sql = "SELECT
                    c.relname as table_name,
                    pa.attname as column,
                    pd.description

                FROM
                    pg_catalog.pg_class c
                JOIN
                    pg_namespace n
                ON
                    (c.relnamespace = n.oid and n.nspname not in ('information_schema','pg_catalog')
                AND
                    c.relkind = 'r')
                JOIN
                    pg_description as pd
                ON
                    pd.objoid = c.oid
                LEFT JOIN
                    pg_attribute as pa
                ON
                    pd.objsubid = pa.attnum and pa.attrelid = c.oid
                WHERE
                    n.nspname = '{$tx_schema}'
                AND
                    c.relname = '{$tx_tabela}'
                ORDER BY
                    c.relname ";
        return $this->getConnection()->fetchAll($sql);
    }

    protected function _getRecuperaComentarioOracle($tx_tabela,$tx_schema)
    {
        $sql = "";
        return $this->getConnection()->fetchAll($sql);
    }

    protected function _getRecuperaComentarioSqlserver($tx_tabela,$tx_schema)
    {
        $sql = "";
        return $this->getConnection()->fetchAll($sql);
    }

    protected function _getRecuperaComentarioTableMysql($tx_tabela,$tx_schema)
    {
        $sql = "";
        return $this->getConnection()->fetchAll($sql);
    }

    /**
     * Método que verifica qual banco esta
     * @param text $tx_adapter
     * @param text $schema
     */
    public function getListTable($tx_adapter, $schema = "")
    {
        switch ($tx_adapter) {
            case self::ADAPTER_PDO_POSTGRES:
            case self::ADAPTER_POSTGRES:
                $this->_getTablePostgres($schema);
                break;
            case self::ADAPTER_PDO_ORACLE:
            case self::ADAPTER_ORACLE:
                $this->_getTableOracle($schema);
                break;
            case self::ADAPTER_PDO_MSSQL:
            case self::ADAPTER_MSSQL:
                $this->_getTableSqlserver();
                break;
            case self::ADAPTER_PDO_MYSQL:
            case self::ADAPTER_MYSQL:
                $this->_getTableMysql();
                break;
        }
    }

    protected function _getTablePostgres($schema)
    {
        $sql = "SELECT
                    c.relname AS tabela,
                    pg_catalog.pg_get_userbyid(c.relowner) AS dono,
                    pg_catalog.obj_description(c.oid, 'pg_class') AS comentario
                FROM
                    pg_catalog.pg_class c
                LEFT JOIN
                    pg_catalog.pg_namespace n
                ON
                    n.oid = c.relnamespace
                WHERE
                    c.relkind = 'r'
                AND
                    nspname='{$schema}'
                ORDER BY
                    c.relname; ";
        $this->setArrTable($this->getConnection()->fetchCol($sql));
    }

    protected function _getTableOracle($schema)
    {
        $sql = "SELECT
                    table_name tx_tabela
                FROM
                    all_tables
                WHERE
                    owner = '{$schema}'
                ORDER BY
                    table_name ";
        $this->setArrTable($this->getConnection()->fetchCol($sql));
    }

    protected function _getTableSqlserver()
    {
        $this->setArrTable($this->getConnection()->listTables());
    }

    protected function _getTableMysql()
    {
        $this->setArrTable($this->getConnection()->listTables());
    }
}