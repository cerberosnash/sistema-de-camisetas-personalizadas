<?php
session_start();
if (!$_SESSION['upload']['crop']) {
    header('Location: minha_camiseta.php');
}
?>

<style type="text/css">
    *{
        text-align: center;
    }
</style>
<img alt="carregando..." src="camiseta_mc.php?t=<?php echo microtime(); ?>" height="100%" />