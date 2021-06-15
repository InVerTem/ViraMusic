<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;
use yii\web\NotFoundHttpException;

class Album extends ActiveRecord {

    const CONTENT_TYPE_ID = 2;

    public $heartsCount;
    public $deleteImage;

    public static function tableName() {

        return '{{%album}}';
    }

    public function rules() {

        return [
            [['name', 'signature'], 'trim'],
            [['name', 'artist'], 'required'],
            [['artist', 'number', 'year'], 'integer'],
            [['name', 'signature'], 'string', 'max' => 255],
            ['deleteImage', 'boolean']
        ];
    }

    public function attributeLabels() {

        return [
            'id' => Yii::t('app', 'ID'),
            'artist' => Yii::t('app', 'Artist'),
            'number' => Yii::t('app', 'Number'),
            'name' => Yii::t('app', 'Name'),
            'signature' => Yii::t('app', 'Signature'),
            'year' => Yii::t('app', 'Year'),
            'image' => Yii::t('app', 'Image'),
            'creator' => Yii::t('app', 'Creator'),
            'editor' => Yii::t('app', 'Editor'),
            'created_at' => Yii::t('app', 'Created at'),
            'updated_at' => Yii::t('app', 'Updated at'),
            'heartsCount' => Yii::t('app', 'Hearts'),
            'deleteImage' => Yii::t('app', 'Delete image'),
            'audio' => Yii::t('app', 'Audio'),
            'genres' => Yii::t('app', 'Genres'),
            'tracks' => Yii::t('app', 'Tracks')
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
            ->select([
                '{{%album}}.*',
                'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
            ])
            ->joinWith('artist0')
            ->joinWith('genres0')
            ->joinWith('hearts0')
            ->joinWith('creator0')
            ->joinWith('editor0')
            ->where(['{{%album}}.id' => $id])
            ->one();

        if($model) {

            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
    }

    public static function getAlbums($artist = null) {

        return ArrayHelper::map(self::find()->andfilterWhere(['{{%album}}.artist' => $artist])->all(), 'id', 'name');
    }

    public function checkHeart() {

        foreach($this->hearts0 as $model) {

            if($model->creator === Yii::$app->user->id) {

                return HeartStatus::HEART_STATUS_ACTIVE;
            }
        }

        return HeartStatus::HEART_STATUS_INACTIVE;
    }

    public function notEmptyGenres() {

        return $this->genres0 or $this->artist0->genres0;
    }

    public function getGenresList() {

        $models = [];

        foreach($this->genres0 as $model) {

            $models[] = $model->genre0;
        }

        foreach($this->artist0->genres0 as $model) {

            $models[] = $model->genre0;
        }

        return $models;
    }

    public function getArtist0() {

        return $this->hasOne(Artist::className(), ['id' => 'artist']);
    }

    public function getTracks0() {

        return $this->hasMany(Track::className(), ['album' => 'id']);
    }

    public function getGenres0() {

        return $this
            ->hasMany(GenreContent::className(), ['content' => 'id'])
            ->onCondition(['{{%genre_content}}.type' => self::CONTENT_TYPE_ID]);
    }

    public function getHearts0() {

        return $this
            ->hasMany(Heart::className(), ['content' => 'id'])
            ->onCondition([
                'AND', [
                    '{{%heart}}.type' => self::CONTENT_TYPE_ID,
                    '{{%heart}}.status' => Heart::STATUS_ACTIVE
                ]
            ]);
    }

    public function getCreator0() {

        return $this->hasOne(User::className(), ['id' => 'creator']);
    }

    public function getEditor0() {

        return $this->hasOne(User::className(), ['id' => 'editor']);
    }
}