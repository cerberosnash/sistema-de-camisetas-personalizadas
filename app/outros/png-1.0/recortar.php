<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery.Jcrop.js"></script>
        <link rel="stylesheet" href="css/jquery.Jcrop.css" type="text/css" />
        <style type="text/css">
            body{
                text-align: center;
            }
        </style>
    </head>
    <body>

        <?php
        include "classes/m2brimagem.php";
        $tem_crop = true;
        ini_set("memory_limit", "250M");
        set_time_limit(0);

        $md5 = md5(microtime() . rand(1, 99999999)) . '.png';

        $imagem = isset($_FILES['imagem']) ? $_FILES['imagem'] : NULL;
        $tem_crop = false;
        $img = '';

        if ($imagem['tmp_name']) {
            $imagesize = getimagesize($imagem['tmp_name']);
            if ($imagesize !== false) {
                if (move_uploaded_file($imagem['tmp_name'], 'uploads/' . $md5)) {

                    $oImg = new m2brimagem('uploads/' . $md5);

                    if ($oImg->valida() == 'OK') {
                        if ($imagesize[0] < 420 || $imagesize[1] < 490) {
                            //$oImg->redimensiona('500', '', '');
                        }

                        echo "w = $imagesize[0] h =  $imagesize[1]";

                        $oImg->grava('uploads/' . $md5);
                        //$imagesize = getimagesize($imagem['name']);
                        $img = '<img src="' . 'uploads/' . $md5 . '" id="jcrop"  />';
                        $tem_crop = true;
                    }
                }
            }
        }
        ?>

        <?php if ($tem_crop === true): ?>
        <?php //include "resize.php";  ?>

            <div id="div-jcrop">
            <?php echo $img; ?>
            <div type="button" value="Salvar" id="btn-crop">Salvar</div>
        </div>

        <div id="debug">
            <p><strong>X</strong> <input type="text" id="x" size="5" disabled /> x <input type="text" id="x2" size="5" disabled /> </p>
            <p><strong>Y</strong> <input type="text" id="y" size="5" disabled /> x <input type="text" id="y2" size="5" disabled /> </p>
            <p><strong>Dimensões</strong> <input type="text" id="h" size="5" disabled /> x <input type="text" id="w" size="5" disabled /></p>
            <input type="button" id="aumentar" value="+">
            <input type="button" id="diminuir" value="-">
        </div>

        <script type="text/javascript">

            var img = '<?php echo $md5; ?>';
			
          
            $('#jcrop').Jcrop({
                onChange: exibePreview,
                //onSelect: exibePreview,
                // bgOpacity:   .5,
                setSelect:   [ 0, 0, 420, 525 ],
                aspectRatio: 4 / 5,
                //                maxSize		: [ 840, 980 ],
                //                minSize		: [ 420, 490 ],
                allowResize	: true
            });
               
            
            $('#aumentar').click(function(){
                alert($('#jcrop').attr('src'));
                $.post( 'redimencionar.php', {
                    img:$('#jcrop').attr('src'),
                    cmd: 'aumentar'
                }, function(e){
                    alert('aumentando agora!'+e);
                    $('#jcrop').attr('width',200);
                });
            });

            $('#diminuir').click(function(){
                alert($('#jcrop').attr('src'));
                $.post( 'redimencionar.php', {
                    img:$('#jcrop').attr('src'),
                    cmd: 'diminuir'
                }, function(e){
                    alert('diminuindo agora!'+e.image);
                    $('#jcrop').attr('src',e.image);
                });
            });
                    

            $(document).bind('keypress', function(e) {
         
                if(e.keyCode==13){
                    //if($('#w').val()==420 && $('#h').val()==490){
                    $.post( 'crop.php', {
                        img:'uploads/'+img,
                        x: $('#x').val(),
                        y: $('#y').val(),
                        w: $('#w').val(),
                        h: $('#h').val()
                    }, function(){

                        $('#div-jcrop').html('  <img class="modelo" src="camiseta.php?imagem=' + img + '&cor=ffffff" width="100%" />\n\
                                                <img class="modelo" src="camiseta.php?imagem=' + img + '&cor=ffffff" width="80%" />\n\
                                                <img class="modelo" src="camiseta.php?imagem=' + img + '&cor=ffffff" width="70%" />\n\
                                                <img class="modelo" src="camiseta.php?imagem=' + img + '&cor=ffffff" width="60%" />\n\
                                                <img class="modelo" src="camiseta.php?imagem=' + img + '&cor=ffffff" width="50%" />\n\
                                                <img class="modelo" src="camiseta.php?imagem=' + img + '&cor=ffffff" width="40%" />\n\
                                                <img class="modelo" src="camiseta.php?imagem=' + img + '&cor=ffffff" width="30%" />\n\
                                                <img class="modelo" src="camiseta.php?imagem=' + img + '&cor=ffffff" width="20%" />\n\
' );
                        
                                                                //$('#div-jcrop').html( '<img src="' + img + '?' + Math.random() + '" width="'+$('#w').val()+'" height="'+$('#h').val()+'" />' );
                                                                $('#debug').hide();
                                                                //$('#tit-jcrop').html('Feito!<br /><a href="crop-simples.php">enviar outra imagem</a>');
                                                            });
                                                            return false;
                                                        }else{alert('w::420 e h::490 no minimo!');}// Enter pressed... do anything here...
                                                        // }
                                                    });

				
                                                    function exibePreview(c)
                                                    {
                                                        var rx = 100 / c.w;
                                                        var ry = 100 / c.h;
				
                                                        $('#preview').css({
                                                            // width: Math.round(rx * <?php //echo $imagesize[0];                   ?>) + 'px',
                                                            //height: Math.round(ry * <?php //echo $imagesize[1];                   ?>) + 'px'//,
                                                            //marginLeft: '-' + Math.round(rx * c.x) + 'px',
                                                            //marginTop: '-' + Math.round(ry * c.y) + 'px'
                                                        });
					
                                                        $('#x').val(c.x);
                                                        $('#y').val(c.y);
                                                        $('#x2').val(c.x2);
                                                        $('#y2').val(c.y2);
                                                        $('#w').val(c.w);
                                                        $('#h').val(c.h);
					
                                                    }
        </script>
        <?php else: ?>
                <form name="frm-jcrop" id="frm-jcrop" method="post" action="recortar.php" enctype="multipart/form-data">
                    <p>
                        <label>Envie uma imagem:</label>
                        <input type="file" name="imagem" id="imagem" />
                        <input type="submit" value="Enviar" />
                    </p>
                </form>
        <?php endif; ?>

    </body>
</html>