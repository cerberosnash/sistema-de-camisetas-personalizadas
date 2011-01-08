<?php
$file = $_GET["file"];
session_start();
require_once "../../../application/resources/properties/properties_generic.php";
$permitedFiles = array("../../../public/default/css/".$_SESSION['CONFIG']['CSS_FILE'], 
					   "../../../public/default/css/".AB_CSS_LIBS,
					   "../../jquery/jquery.min.js",
					   "../../jquery/jqueryslidemenu.js",
					   "../../ext_js/adapter/ext/ext-base.js",
					   "../../ext_js/ext-all.js",
					   "../../../public/default/js/".AB_JS_UTIL,
					   "../../../application/resources/properties/".$_SESSION['CONFIG']['JS_DEFAULT_LANG_FILE'],
					   "../../../application/resources/properties/admin/default/properties_default.js",
					   "../../ext_js/overrides/".AB_JS_EXT_OVERRIDES,
					   "../../ext_js/plugins/".AB_JS_EXT_PLUGINS,
					   "../../../application/resources/properties/admin/menu_top/menu_top-lang.js",
					   "../../../application/resources/properties/admin/menu_side/menu_side-lang.js",
					   "../../../application/views/scripts/menu_admin/menu_side.js",
					   "../../../public/default/img/bg_breadCump-middle.jpg");

if (!in_array($file, $permitedFiles)){
	echo "BAD, BAD, BAD... DON'T DO THAT MR. <strong>".$_SERVER['REMOTE_ADDR']."</strong>";
	exit(); 
}

$ext = substr($file,strrpos($file, ".")+1,strlen($file));
ob_start();

if ($ext=="js") { 
	$ext = "text/javascript";
} else if ($ext == "css"){ 
	$ext = "text/css";
} else if ($ext == "ico"){
	$ext = "image/x-icon";
} else if ($ext == "png"){
	$ext = "image/png";
}

header( "Content-type: ".$ext.";");//não se esqueça de mudar para o charset que você usa
header( "Content-Encoding: gzip,deflate");
//header( "Expires: ".gmdate("D, d M Y H:i:s", time() + (24 * 60 * 60)) . " GMT");//adiciona 1 dia ao tempo de expiração
header( "Expires: Mon, 06 jan 2020 12:00:01 GMT");
//header( "ETag: ");//a idéia é apagar o conteúdo da Etag, ver post http://www.meiocodigo.com/2007/12/21/melhorando-o-tempo-de-carregamento-de-um-site/
header( "Cache-Control: must-revalidate, proxy-revalidate" );

include_once($file);
ob_flush();