<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;

class UserStatus extends ActiveRecord {

    public static function tableName() {

        return '{{%user_status}}';
    }

    public static function getUserStatuses() {

        return ArrayHelper::map(self::find()->all(), 'id', 'name');
    }
}