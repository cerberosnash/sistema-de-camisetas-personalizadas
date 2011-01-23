<?php

class ImageEdit {

    public $src, $image = false, $wdith, $height, $dstInfo, $type;

    public function __construct($src) {
        if (!file_exists($src))
            return;
        $this->src = $src;
        $info = getImageSize($src);
        $this->width = $info[0];
        $this->height = $info[1];
        switch ($info[2]) {
            case 1: $this->image = @imageCreateFromGif($src);
                break;
            case 2: $this->image = @imageCreateFromJpeg($src);
                break;
            case 3: $this->image = @imageCreateFromPng($src);
                break;
            default: return;
        }
        if (!$this->image)
            return;
    }

    public function resize($maxWidth=0, $maxHeight=0, $holdRatio=true) {
        if ($maxWidth <= 0 && $maxHeight <= 0)
            return false;
        if ($holdRatio) {
            $srcRatio = $this->width / $this->height;
            $dstRatio = $maxHeight ? $maxWidth / $maxHeight : 0;
            if ($destRatio > $srcRatio || $maxHeight == 0) {
                $dstWidth = $maxWidth;
                $dstHeight = round($maxWidth / $srcRatio);
            } else {
                $dstWidth = round($maxHeight * $srcRatio);
                $dstHeight = $maxHeight;
            }
        } else {
            $dstHeight = $maxHeight;
            $dstWidth = $maxWidth;
        }

        $tmp = imagecreatetruecolor($dstWidth, $dstHeight);
        imagealphablending($tmp, false);
        imagefill($tmp, 0, 0, imagecolorallocatealpha($tmp, 0, 0, 0, 127));
        imagesavealpha($tmp, true);

        if (imagecopyresampled($tmp, $this->image, 0, 0, 0, 0, $dstWidth, $dstHeight, $this->width, $this->height) === true) {
            $this->width = $dstWidth;
            $this->height = $dstHeight;
            @imagedestroy($this->image);

            $this->image = imagecreatetruecolor($dstWidth, $dstHeight);
            imagealphablending($this->image, true);
            imagefill($this->image, 0, 0, imagecolorallocatealpha($this->image, 0, 0, 0, 127));
            imagesavealpha($this->image, true);
            imagecopy($this->image, $tmp, 0, 0, 0, 0, $dstWidth, $dstHeight);
            @imagedestroy($tmp);
            return true;
        }
        return false;
    }

    public function addtext($text, $font, $size=10, $angle=0, $x=0, $y=0, $c=array(0, 0, 0)/* array(r,g,b) */) {
        $bbox = imageftbbox($size, $angle, $font, $text);
        return @imagefttext($this->image, $size, $angle,
                (($x >= 0) ? ($x - $bbox[6]) : ($x + $this->width + $bbox[6] - $bbox[4])),
                (($y >= 0) ? ($y - $bbox[7]) : ($y + $this->height + $bbox[7] - $bbox[5] - 5)),
                imagecolorallocate($this->image, $c[0], $c[1], $c[2]),
                $font, $text);
    }

    public function watermark($wm, $x=0, $y=0, $maxWidth=0, $maxHeight=0, $holdRatio=true) {
        $wm = new ImageEdit($wm);
        if (!is_resource($wm->image))
            return false;
        if ($maxWidth > 0 || $maxHeight > 0)
            $wm->resize($maxWidth, $maxHeight, $holdRatio);
        $x = (int) ($x >= 0) ? $x : ($this->width + $x - $wm->width);
        $y = (int) ($y >= 0) ? $x : ($this->height + $y - $wm->height);

        imagelayereffect($this->image, IMG_EFFECT_ALPHABLEND);

        return imagecopy($this->image, $wm->image, $x, $y, 0, 0, $wm->width, $wm->height);
    }

    public function addimage($wm, $x=0, $y=0, $maxWidth=0, $maxHeight=0, $holdRatio=true) {
        $wm = new ImageEdit($wm);
        imagealphablending($this->image, true);
        imagesavealpha($this->image, true);
        return imagecopy($this->image, $wm->image, $x, $y, 0, 0, $wm->width, $wm->height);
    }

    public function effect($effect) {
        switch (strtoupper($effect)) {
            case "BLUR": $matrix = array(array(1 / 9, 1 / 9, 1 / 9), array(1 / 9, 1 / 9, 1 / 9), array(1 / 9, 1 / 9, 1 / 9));
                break;
            case "EDGE": $matrix = array(array(0, -1, 0), array(-1, 4, -1), array(0, -1, 0));
                break;
            case "SHARPENA": $matrix = array(array(0, -1, 0), array(-1, 5, -1), array(0, -1, 0));
                break;
            case "SHARPENB": $matrix = array(array(-1, -1, -1), array(-1, 16, -1), array(-1, -1, -1));
                break;
            case "EMBOSS": $matrix = array(array(2, 0, 0), array(0, -1, 0), array(0, 0, -1));
                break;
            case "LIGHT": $matrix = array(array(0, 0, 1), array(0, 1, 0), array(1, 0, 0));
                break;
            default: return false;
                break;
        }
        return @imageconvolution($this->image, $matrix, 1, 0);
    }

    public function output($type, $dst=NULL, $quality=100) {
        $type = strtoupper($type);
        if ($dst != NULL) {
            switch ($type) {
                case "JPG": case "JPEG": return @imageJpeg($this->image, $dst, $quality);
                case "PNG": return @imagePng($this->image, $dst);
                case "GIF": return @imageGif($this->image, $dst);
                default: return false;
            }
        } else {
            switch ($type) {
                case "JPG": case "JPEG":
                    header('Content-type: image/jpeg');
                    imagealphablending($this->image, false);
                    imagesavealpha($this->image, true);
                    return @imageJpeg($this->image, NULL, $quality);
                case "PNG":
                    header('Content-Type: image/png');
                    imagealphablending($this->image, true);
                    imagesavealpha($this->image, true);
                    return @imagePng($this->image, NULL, 9);
                case "GIF":
                    header('Content-type: image/gif');
                    imagealphablending($this->image, true);
                    imagesavealpha($this->image, true);
                    return @imageGif($this->image);
                default: return false;
            }
        }
        //@imagedestroy($this->image);
        //return $ok;
    }

}