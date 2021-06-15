<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;

class GenreContent extends ActiveRecord {

    public static function tableName() {

        return '{{%genre_content}}';
    }

    public function rules() {

        return [
            [['genre', 'type', 'content'], 'required'],
            [['genre', 'type', 'content'], 'integer']
        ];
    }

    public function attributeLabels() {

        return [
            'id' => Yii::t('app', 'ID'),
            'genre' => Yii::t('app', 'Genre'),
            'type' => Yii::t('app', 'Type'),
            'content' => Yii::t('app', 'Content'),
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
            ->joinWith('genre0')
            ->joinWith('type0')
            ->joinWith('creator0')
            ->joinWith('editor0')
            ->where(['{{%genre_content}}.id' => $id])
            ->one();

        if($model) {

            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
    }

    public function getGenre0() {

        return $this->hasOne(Genre::className(), ['id' => 'genre']);
    }

    public function getType0() {

        return $this->hasOne(ContentType::className(), ['id' => 'type']);
    }

    public function getCreator0() {

        return $this->hasOne(User::className(), ['id' => 'creator']);
    }

    public function getEditor0() {

        return $this->hasOne(User::className(), ['id' => 'editor']);
    }
}