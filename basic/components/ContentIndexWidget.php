<?php

namespace app\components;

use Yii;
use yii\base\Widget;

class ContentIndexWidget extends Widget {

    public $models;
    public $typePlay;
    public $contentPlay;
    public $typeHeart;
    public $contentName;
    public $viewClass = 'content-grid';
    public $showMore = false;
    public $order = 'standart';
    public $viewAlbum = true;
    public $user = null;
    public function init() {

        parent::init();



        if(empty($this->order)) {

            $this->order = 'standart';
        }
    }

    public function run() {

        return $this->render('content-index', [
            'models' => $this->models,
            'typePlay' => $this->typePlay,
            'contentPlay' => $this->contentPlay,
            'typeHeart' => $this->typeHeart,
            'contentName' => $this->contentName,
            'viewClass' => $this->viewClass,
            'showMore' => $this->showMore,
            'order' => $this->order,
            'viewAlbum' => $this->viewAlbum,
            'user' => $this->user
        ]);
    }
}