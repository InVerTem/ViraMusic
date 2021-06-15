<?php

namespace app\components;

use Yii;
use yii\base\Widget;

class PlayButtonWidget extends Widget {

    public $type;
    public $content;
    public $track = 0;
    public $file = null;
    public $order = 'standart';
    public $text = null;
    public $user = null;

    public function init() {

        parent::init();
    }

    public function run() {

        return $this->render('play-button', [
            'type' => $this->type,
            'content' => $this->content,
            'track' => $this->track,
            'file' => $this->file,
            'order' => $this->order,
            'text' => $this->text,
            'user' => $this->user
        ]);
    }
}