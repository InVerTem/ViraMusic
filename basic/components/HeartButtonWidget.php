<?php

namespace app\components;

use Yii;
use yii\base\Widget;
use app\models\HeartStatus;

class HeartButtonWidget extends Widget {

    public $type;
    public $content;
    public $heartStatus;
    public $count = null;

    public function init() {

        parent::init();



        if($this->heartStatus === HeartStatus::HEART_STATUS_ACTIVE) {

            $this->heartStatus = 'heart-fill';

        } else {

            $this->heartStatus = 'heart';
        }
    }

    public function run() {

        return $this->render('heart-button', [
            'type' => $this->type,
            'content' => $this->content,
            'heartStatus' => $this->heartStatus,
            'count' => $this->count
        ]);
    }
}