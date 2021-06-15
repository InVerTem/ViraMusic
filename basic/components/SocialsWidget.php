<?php

namespace app\components;

use Yii;
use yii\base\Widget;

class SocialsWidget extends Widget {

    public $models;

    public function init() {

        parent::init();
    }

    public function run() {

        return $this->render('socials', [
            'models' => $this->models
        ]);
    }
}