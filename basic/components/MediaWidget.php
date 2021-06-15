<?php

namespace app\components;

use Yii;
use yii\base\Widget;

class MediaWidget extends Widget {

    public $typePlay;
    public $typeHeart;
    public $contentPlay;
    public $contentHeart;
    public $src;
    public $track = 0;
    public $heartStatus;
    public $user = null;

    public function init() {

        parent::init();



        if(empty($src)) {

            $src = Yii::$app->params['defaultImage'];
        }
    }

    public function run() {

        return $this->render('media', [
            'typePlay' => $this->typePlay,
            'typeHeart' => $this->typeHeart,
            'contentPlay' => $this->contentPlay,
            'contentHeart' => $this->contentHeart,
            'src' => $this->src,
            'track' => $this->track,
            'heartStatus' => $this->heartStatus,
            'user' => $this->user
        ]);
    }
}