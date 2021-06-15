<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;
use app\components\GlobalFunctions;

class Social extends ActiveRecord {

    const CONTENT_TYPE_ID = 8;

    public $deleteImage;

    public static function tableName() {

        return '{{%social}}';
    }

    public function rules() {

        return [
            ['name', 'trim'],
            ['name', 'required'],
            ['name', 'string', 'max' => 255],
            ['name', 'unique', 'targetClass' => self::className(), 'message' => 'This name has already been taken.'],
            ['deleteImage', 'boolean'],
        ];
    }

    public function attributeLabels() {

        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'image' => Yii::t('app', 'Image'),
            'creator' => Yii::t('app', 'Creator'),
            'editor' => Yii::t('app', 'Editor'),
            'created_at' => Yii::t('app', 'Created at'),
            'updated_at' => Yii::t('app', 'Updated at'),
            'deleteImage' => Yii::t('app', 'Delete image')
        ];
    }

    public function beforeSave($insert) {

        if(parent::beforeSave($insert)) {

            $this->editor = Yii::$app->user->id;
            $this->updated_at = time();

            if($this->isNewRecord) {

                $this->creator = Yii::$app->user->id;
                $this->created_at = time();
            }

            return true;
        }

        return false;
    }

    public static function findModel($id) {

        $model = self::find()
            ->joinWith('creator0')
            ->joinWith('editor0')
            ->where(['{{%social}}.id' => $id])
            ->one();

        if($model) {

            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
    }

    public static function getSocials() {

        return GlobalFunctions::getTranslateArray(ArrayHelper::map(self::find()->all(), 'id', 'name'));
    }


    public static function createArray($models) {

        $socials = self::getSocials();

        foreach($models as $model) {

            foreach($model->socials0 as $social) {

                $model->socialsArray[] = [
                    'id' => $social->social,
                    'name' => $socials[$social->social]
                ];
            }
        }
    }

    public function getCreator0() {

        return $this->hasOne(User::className(), ['id' => 'creator']);
    }

    public function getEditor0() {

        return $this->hasOne(User::className(), ['id' => 'editor']);
    }
}