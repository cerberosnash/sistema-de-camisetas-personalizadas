<?php

include_once "functions/imagecreatefrombmp.php";

class m2brimagem {

    private $origem, $img, $img_temp;
    private $largura, $altura, $nova_largura, $nova_altura, $tamanho_html;
    private $formato, $extensao, $tamanho, $arquivo, $diretorio;
    private $extensoes_validas;
    private $rgb;
    private $posicao_crop;
    private $erro;

    public function m2brimagem($diretorio='', $arquivo = '', $extensoes_validas = array('jpg', 'jpeg', 'jpe', 'gif', 'bmp', 'png')) {
        $this->origem = $diretorio . '/' . $arquivo;
        $this->extensoes_validas = $extensoes_validas;
        if ($this->origem) {
            $this->dados();
        }
        $this->rgb(0, 0, 0);
    }

    private function dados() {
        $this->erro = 'OK';
        if (!is_file($this->origem)) {
            $this->erro = 'Erro: Arquivo de imagem n�o encontrado!';
        } else {
            $this->dadosArquivo();
            if (!$this->eImagem()) {
                $this->erro = 'Erro: Arquivo ' . $this->origem . ' n�o � uma imagem!';
            } else {
                $this->dimensoes();
                $this->criaImagem();
            }
        }
    }

    public function valida() {
        return $this->erro;
    }

    private function dimensoes() {
        $dimensoes = getimagesize($this->origem);
        $this->largura = $dimensoes[0];
        $this->altura = $dimensoes[1];
        $this->formato = $dimensoes[2];
        $this->tamanho_html = $dimensoes[3];
    }

    private function dadosArquivo() {
        $pathinfo = pathinfo($this->origem);
        $this->extensao = strtolower($pathinfo['extension']);
        $this->arquivo = $pathinfo['basename'];
        $this->diretorio = $pathinfo['dirname'];
        $this->tamanho = filesize($this->origem);
    }

    private function eImagem() {
        if (!in_array($this->extensao, $this->extensoes_validas)) {
            return false;
        } else {
            return true;
        }
    }

    private function criaImagem() {
        switch ($this->formato) {
            case 1:
                $this->img = imagecreatefromgif($this->origem);
                $this->extensao = 'gif';
                break;
            case 2:
                $this->img = imagecreatefromjpeg($this->origem);
                $this->extensao = 'jpg';
                break;
            case 3:
                $this->img = imagecreatefrompng($this->origem);
                $this->extensao = 'png';
                break;
            case 6:
                $this->img = imagecreatefrombmp($this->origem);
                $this->extensao = 'bmp';
                break;
            default:
                trigger_error('Arquivo inv�lido!', E_USER_WARNING);
                break;
        }
    }

    public function rgb($r, $g, $b) {
        $this->rgb = array($r, $g, $b);
    }

    public function posicaoCrop($x, $y) {
        $this->posicao_crop = array($x, $y, $this->largura, $this->altura);
    }

    public function redimensiona($nova_largura = 0, $nova_altura = 0, $tipo = '') {
        $this->nova_largura = $nova_largura;
        $this->nova_altura = $nova_altura;

        $pos = strpos($this->nova_largura, '%');
        if ($pos !== false && $pos > 0) {
            $porcentagem = ( (int) str_replace('%', '', $this->nova_largura) ) / 100;
            $this->nova_largura = round($this->largura * $porcentagem);
        }

        $pos = strpos($this->nova_altura, '%');
        if ($pos !== false && $pos > 0) {
            $porcentagem = ( (int) str_replace('%', '', $this->nova_altura) ) / 100;
            $this->nova_altura = $this->altura * $porcentagem;
        }

        if (!$this->nova_largura && !$this->nova_altura) {
            return false;
        } elseif (!$this->nova_largura) {
            $this->nova_largura = $this->largura / ( $this->altura / $this->nova_altura );
        } elseif (!$this->nova_altura) {
            $this->nova_altura = $this->altura / ( $this->largura / $this->nova_largura );
        }

        switch ($tipo) {
            case 'crop':
                $this->resizeCrop();
                break;
            case 'fill':
                $this->resizeFill();
                break;
            default:
                $this->resize();
                break;
        }

        $this->altura = $this->nova_altura;
        $this->largura = $this->nova_largura;
    }

    private function resize() {
        $this->img_temp = imagecreatetruecolor($this->nova_largura, $this->nova_altura);
        imagealphablending($this->img_temp, false);
        imagesavealpha($this->img_temp, true);
        $transparent = imagecolorallocatealpha($this->img_temp, 255, 255, 255, 127);
        imagefilledrectangle($this->img_temp, 0, 0, $this->nova_largura, $this->nova_altura, $transparent);
        imagecopyresampled($this->img_temp, $this->img, 0, 0, 0, 0, $this->nova_largura, $this->nova_altura, $this->largura, $this->altura);
        $this->img = $this->img_temp;
    }

    private function preencheImagem() {
        imagealphablending($this->img_temp, false);
        imagesavealpha($this->img_temp, true);
        $corfundo = imagecolorallocate($this->img_temp, $this->rgb[0], $this->rgb[1], $this->rgb[2]);
        imagealphablending($this->img_temp, false);
        imagesavealpha($this->img_temp, true);
        imagefill($this->img_temp, 0, 0, $corfundo);
    }

    private function calculaPosicaoCrop() {
        $hm = $this->altura / $this->nova_altura;
        $wm = $this->largura / $this->nova_largura;

        $h_height = $this->nova_altura / 2;
        $h_width = $this->nova_largura / 2;

        if (!is_array($this->posicao_crop)) {
            if ($wm > $hm) {
                $this->posicao_crop[2] = $this->largura / $hm;
                $this->posicao_crop[3] = $this->nova_altura;
                $this->posicao_crop[0] = ( $this->posicao_crop[2] / 2 ) - $h_width;
                $this->posicao_crop[1] = 0;
            } elseif (( $wm <= $hm)) {
                $this->posicao_crop[2] = $this->nova_largura;
                $this->posicao_crop[3] = $this->altura / $wm;
                $this->posicao_crop[0] = 0;
                $this->posicao_crop[1] = ( $this->posicao_crop[3] / 2 ) - $h_height;
            }
        }
    }

    private function resizeCrop() {
        $this->calculaPosicaoCrop();
        $this->img_temp = imagecreatetruecolor($this->nova_largura, $this->nova_altura);
        imagealphablending($this->img_temp, true);
        imagesavealpha($this->img_temp, true);
        $transparent = imagecolorallocatealpha($this->img_temp, 255, 255, 255, 127);
        imagefilledrectangle($this->img_temp, 0, 0, $nWidth, $nHeight, $transparent);
        $this->preencheImagem();
        imagecopyresampled($this->img_temp, $this->img, -$this->posicao_crop[0], -$this->posicao_crop[1], 0, 0, $this->posicao_crop[2], $this->posicao_crop[3], $this->largura, $this->altura);
        $this->img = $this->img_temp;
    }

    public function grava($diretorio='', $arquivo='', $qualidade = 100) {
        $destino = $diretorio . '/' . $arquivo;
        if ($destino) {
            $pathinfo = pathinfo($destino);
            $dir_destino = $pathinfo['dirname'];
            $extensao_destino = strtolower($pathinfo['extension']);

            if (!is_dir($dir_destino)) {
                $this->erro = 'Diret�rio de destino inv�lido ou inexistente';
                return false;
            }
        }

        if (!isset($extensao_destino)) {
            $extensao_destino = $this->extensao;
        } else {
            if (!in_array($extensao_destino, $this->extensoes_validas)) {
                $this->erro = 'Extens�o inv�lida para o arquivo de destino';
                return false;
            }
        }

        switch ($extensao_destino) {
            case 'jpg':
            case 'jpeg':
            case 'bmp':
                if ($destino) {
                    imagejpeg($this->img, $destino, $qualidade);
                } else {
                    header("Content-type: image/jpeg");
                    imagejpeg($this->img, NULL, $qualidade);
                    imagedestroy($this->img);
                    exit;
                }
                break;
            case 'png':
                if ($destino) {
                    imagealphablending($this->img, true);
                    imagesavealpha($this->img, true);
                    imagepng($this->img, $destino);
                } else {
                    header("Content-type: image/png");
                    imagepng($this->img);
                    imagedestroy($this->img);
                    exit;
                }
                break;
            case 'gif':
                if ($destino) {
                    imagealphablending($this->img, false);
                    imagesavealpha($this->img, true);
                    imagegif($this->img, $destino);
                } else {
                    header("Content-type: image/gif");
                    imagealphablending($this->img, true);
                    imagesavealpha($this->img, true);
                    imagegif($this->img);
                    imagedestroy($this->img);
                    exit;
                }
                break;
            default:
                return false;
                break;
        }
    }

}

?>