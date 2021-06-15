<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;

class HeartStatus extends ActiveRecord {

    const HEART_STATUS_ACTIVE = 1;
    const HEART_STATUS_INACTIVE = 2;

    public static function tableName() {

        return '{{%heart_status}}';
    }
}