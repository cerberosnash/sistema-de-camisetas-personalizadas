<?php
session_start();
$_SESSION['upload']['crop'] = false;
if ($_SESSION['upload']['imagem']) {
    $imagem = '<img alt="carregando..."  src="temp/' . $_SESSION['upload']['imagem'] . '" id="jcrop"  />';
}
?>
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery.Jcrop.js"></script>
        <link rel="stylesheet" href="css/jquery.Jcrop.css" type="text/css" />
        <style type="text/css">
            *{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div id="div-jcrop">
            <?php echo $imagem; ?>
        </div>

        <script type="text/javascript">
            
            var img = '<?php echo $_SESSION['upload']['imagem']; ?>';
            var x,y,w,h;
            var auxs = '';
            var t = 'sss';
            $('#jcrop').Jcrop({
                onChange: preview,
                setSelect:   [ 0, 0, 420, 525 ],
                aspectRatio: 4 / 5,
                allowResize	: true
            });

            function recortar(){
                $.post( '/camisetas/outros/png-1.0/crop.php', {'x':x,'y':y,'w':w,'h':h});
            }

            $('#teste').click(function(){
                recortar();
            });

            function preview(c)
            {
                x = (c.x);
                y = (c.y);
                w = (c.w);
                h = (c.h);
            }

            //            jQuery.each(jQuery.browser, function(i, val) {
            //                $("<div>" + i + " : <span>" + val + "</span>")
            //                .appendTo(document.body);
            //            });

        </script>
    </body>
</html>