<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PHPJasperXML
 *
 * @author 73762385149
 */
class Base_PHPJasperXML extends PHPJasperXML {

    public function PHPJasperXML($lang="pt", $pdflib = PHPJasperXML_LIBPDF) {
        $this->lang = $lang;
        $this->pdflib = $pdflib;
    }

    public function transferDBtoArray($host = PHPJasperXML_HOST, $user = PHPJasperXML_USER, $password = PHPJasperXML_PASS, $db_or_dsn_name = PHPJasperXML_DB, $cndriver = PHPJasperXML_DRIVER) {

        $this->m = 0;

        if (!$this->connect($host, $user, $password, $db_or_dsn_name, $cndriver)) { //connect database
            echo "Fail to connect database";
            exit(0);
        }
        if ($this->debugsql == true) {
            echo $this->sql;
            die;
        }

        if ($cndriver == "odbc") {

            $result = odbc_exec($this->myconn, $this->sql);
            while ($row = odbc_fetch_array($result)) {
                foreach ($this->arrayfield as $out) {
                    $this->arraysqltable[$this->m]["$out"] = $row["$out"];
                }
                $this->m++;
            }
        } elseif ($cndriver == "psql") {


            pg_send_query($this->myconn, $this->sql);
            $result = pg_get_result($this->myconn);
            while ($row = pg_fetch_array($result, NULL, PGSQL_ASSOC)) {
                foreach ($this->arrayfield as $out) {
                    $this->arraysqltable[$this->m]["$out"] = $row["$out"];
                }
                $this->m++;
            }
        } else {
            $result = @mysql_query($this->sql); //query from db

            while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
                foreach ($this->arrayfield as $out) {
                    $this->arraysqltable[$this->m]["$out"] = $row["$out"];
                }
                $this->m++;
            }
        }
        $this->disconnect($cndriver); //close connection to db

        if (isset($this->arrayVariable)) { //if self define variable existing, go to do the calculation
            $this->variable_calculation($m);
        }
    }

}

?>
