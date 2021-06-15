<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;

class Heart extends ActiveRecord {

    const STATUS_ACTIVE = 1;
    const STATUS_INACTIVE = 2;

    public static function tableName() {

        return '{{%heart}}';
    }

    public function rules() {

        return [
            [['type', 'content'], 'required'],
            [['type', 'content', 'status'], 'integer']
        ];
    }

    public function beforeSave($insert) {

        if(parent::beforeSave($insert)) {

            $this->updated_at = time();

            if($this->isNewRecord) {

                $this->status = HeartStatus::HEART_STATUS_ACTIVE;
                $this->creator = Yii::$app->user->id;
                $this->created_at = time();
            }

            return true;
        }

        return false;
    }

    public static function findModel($type, $content, $creator) {

        $model = self::find()
            ->joinWith('type0')
            ->joinWith('creator0')
            ->where([
                'AND', [
                    '{{%heart}}.type' => $type,
                    '{{%heart}}.content' => $content,
                    '{{%heart}}.creator' => $creator
                ]
            ])
            ->one();

        if($model) {

            return $model;
        }

        return false;
    }

    public function getType0() {

        return $this->hasOne(HeartStatus::className(), ['id' => 'type']);
    }

    public function getCreator0() {

        return $this->hasOne(User::className(), ['id' => 'creator']);
    }
}