<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;

class SocialContent extends ActiveRecord {

    public static function tableName() {

        return '{{%social_content}}';
    }

    public function rules() {

        return [
            [['social', 'url'], 'trim'],
            [['social', 'url', 'artist'], 'required'],
            [['social', 'artist'], 'integer'],
            ['url', 'string']
        ];
    }

    public function attributeLabels() {

        return [
            'id' => Yii::t('app', 'ID'),
            'social' => Yii::t('app', 'Social'),
            'url' => Yii::t('app', 'Url'),
            'artist' => Yii::t('app', 'Artist'),
            'creator' => Yii::t('app', 'Creator'),
            'editor' => Yii::t('app', 'Editor'),
            'created_at' => Yii::t('app', 'Created at'),
            'updated_at' => Yii::t('app', 'Updated at')
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
            ->joinWith('social0')
            ->joinWith('artist0')
            ->joinWith('creator0')
            ->joinWith('editor0')
            ->where(['{{%social_content}}.id' => $id])
            ->one();

        if($model) {

            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
    }

    public function getSocial0() {

        return $this->hasOne(Social::className(), ['id' => 'social']);
    }

    public function getArtist0() {

        return $this->hasOne(Artist::className(), ['id' => 'artist']);
    }

    public function getCreator0() {

        return $this->hasOne(User::className(), ['id' => 'creator']);
    }

    public function getEditor0() {

        return $this->hasOne(User::className(), ['id' => 'editor']);
    }
}