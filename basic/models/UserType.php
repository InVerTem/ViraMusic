<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;

class UserType extends ActiveRecord {

    public static function tableName() {

        return '{{%user_type}}';
    }

    public static function getUserTypes() {

        return ArrayHelper::map(self::find()->all(), 'id', 'name');
    }
}