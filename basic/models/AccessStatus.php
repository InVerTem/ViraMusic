<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;

class AccessStatus extends ActiveRecord {

    const ACCESS_STATUS_PIVATE = 1;
    const ACCESS_STATUS_PUBLIC = 3;

    public static function tableName() {

        return '{{%access_status}}';
    }

    public static function getStatuses() {

        return ArrayHelper::map(self::find()->all(), 'id', 'name');
    }
}