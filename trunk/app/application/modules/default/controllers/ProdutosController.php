<?php

class ProdutosController extends Base_Controller_Action {

    public function indexAction() {
        $this->_helper->layout->disableLayout();
        //  $this->_helper->viewRenderer->setNoRender(); //suppress auto-rendering
    }

    public function aguardeAction() {
        $this->_helper->layout->disableLayout();
        //  $this->_helper->viewRenderer->setNoRender(); //suppress auto-rendering
    }

    public function mostrarAction() {
        $this->_helper->layout->disableLayout();
        // $this->_helper->viewRenderer->setNoRender(); //suppress auto-rendering
    }

    public function renderizarAction() {
        $posicao = $_GET['verso'] === 'true' ? 'verso' : 'cores';
        $imagem = $_GET['imagem'] ? $_GET['imagem'] : 'default';
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(); //suppress auto-rendering
        $img = new ImageEdit(SYSTEM_PATH_ABSOLUTE . '/public/img/' . $posicao . '/#' . $_GET['cor'] . '.png');
        $img->addimage(SYSTEM_PATH_ABSOLUTE . '/public/uploads/' . $imagem . '.png', 310, 250);
        $img->resize($_GET['tamanho']);
        $img->output("png", null, 9);
    }

    public function validarAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(); //suppress auto-rendering
        if ($_SESSION['upload']['crop']) {
            $out = array('success' => $_SESSION['upload']['crop']);
        } else {
            $out = array('success' => false);
        }
        $this->_prepareJson($out);
    }

    public function colorirAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(); //suppress auto-rendering
//        if ($_POST['cor'] && $_SESSION['upload']['crop']) {
//            $_SESSION['upload']['cor'] = $_POST['cor'];
//            $out = array('success' => true, 'cor' => $_SESSION['upload']['cor']);
//        } else {
//            $_SESSION['upload']['cor'] = 'ffffff';
//            $out = array('success' => true, 'cor' => $_SESSION['upload']['cor']);
//        }
        $_SESSION['upload']['cor'] = $_POST['cor'];
        $_SESSION['upload']['verso'] = $_POST['posicao'];

        if ($_SESSION['upload']['standby']) {
            $out = array('success' => false);
        } else {
            $out = array('success' => true, 'cor' => $_SESSION['upload']['cor'], 'posicao' => $_SESSION['upload']['verso']);
        }


        $this->_prepareJson($out);
    }

    public function uploadAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(); //suppress auto-rendering

        $md5 = md5(microtime() . rand(1, 99999999)) . '.png';
        $imagem = isset($_FILES['imagem']) ? $_FILES['imagem'] : NULL;
        if ($imagem['tmp_name']) {
            $imagesize = getimagesize($imagem['tmp_name']);
            if ($imagesize !== false) {
                if (move_uploaded_file($imagem['tmp_name'], SYSTEM_PATH_ABSOLUTE . '/public/temp/' . $md5)) {
                    $oImg = new m2brimagem(SYSTEM_PATH_ABSOLUTE . '/public/temp/', $md5);
                    if ($oImg->valida() == 'OK') {
                        $oImg->grava(SYSTEM_PATH_ABSOLUTE . '/public/temp/', $md5);
                        $_SESSION['upload']['imagem'] = $md5;
                        $_SESSION['upload']['standby'] = true; //impede que outros eventos atropelem o crop da imagem.
                    }
                }
            }
        }

        $out = array(success => true, file => $_SESSION['upload']['imagem']);

        $this->_prepareJson($out);
    }

    public function recortarAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(); //suppress auto-rendering
        $_SESSION['upload']['crop'] = false;
        if ($_POST) {
            $oImg = new m2brimagem(SYSTEM_PATH_ABSOLUTE . '/public/temp', $_SESSION['upload']['imagem']);
            if ($oImg->valida() == 'OK') {
                $oImg->posicaoCrop($_POST['x'], $_POST['y']);
                $oImg->redimensiona($_POST['w'], $_POST['h'], 'crop');
                $oImg->redimensiona(420, 525, '');
                $oImg->grava(SYSTEM_PATH_ABSOLUTE . '/public/uploads', $_SESSION['upload']['imagem']);
                $_SESSION['upload']['crop'] = true;
                $_SESSION['upload']['standby'] = false;
            }
        }
        $out = array('success' => $_SESSION['upload']['crop']);
        $this->_prepareJson($out);
    }

    public function gerarAction() {

        if (!$_SESSION['upload']['standby']) {

            $posicao = $_SESSION['upload']['verso'] === 'true' ? 'verso' : 'cores';
            $imagem = $_SESSION['upload']['imagem'] ? $_SESSION['upload']['imagem'] : 'default.png';
            $cor = $_SESSION['upload']['cor'] ? $_SESSION['upload']['cor'] : 'ffffff';

            $this->_helper->layout->disableLayout();
            $this->_helper->viewRenderer->setNoRender(); //suppress auto-rendering
//        if (!$_SESSION['upload']['cor']) {
//            $_SESSION['upload']['cor'] = 'ffffff';
//        }
            //if ($_SESSION['upload']['imagem']) {
            $img = new ImageEdit(SYSTEM_PATH_ABSOLUTE . '/public/img/' . $posicao . '/#' . $cor . '.png');
            $img->addimage(SYSTEM_PATH_ABSOLUTE . '/public/uploads/' . $imagem, 310, 250);
            $img->resize($_GET['tamanho']);
            $img->output("png", null, 9);
        }
        //}
    }

}