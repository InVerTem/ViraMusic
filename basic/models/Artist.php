<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;
use yii\web\NotFoundHttpException;

class Artist extends ActiveRecord {

    const CONTENT_TYPE_ID = 1;

    public $heartsCount;
    public $deleteImage;

    public static function tableName() {

        return '{{%artist}}';
    }

    public function rules() {

        return [
            ['name', 'trim'],
            ['name', 'required'],
            ['name', 'string', 'max' => 255],
            ['info', 'string'],
            ['deleteImage', 'boolean'],
        ];
    }

    public function attributeLabels() {

        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'info' => Yii::t('app', 'Info'),
            'image' => Yii::t('app', 'Image'),
            'creator' => Yii::t('app', 'Creator'),
            'editor' => Yii::t('app', 'Editor'),
            'created_at' => Yii::t('app', 'Created at'),
            'updated_at' => Yii::t('app', 'Updated at'),
            'heartsCount' => Yii::t('app', 'Hearts'),
            'deleteImage' => Yii::t('app', 'Delete image'),
            'audio' => Yii::t('app', 'Audio'),
            'genres' => Yii::t('app', 'Genres'),
            'socials' => Yii::t('app', 'Socials'),
            'albums' => Yii::t('app', 'Albums'),
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
                '{{%artist}}.*',
                'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
            ])
            ->joinWith('genres0')
            ->joinWith('socials0')
            ->joinWith('albums0')
            ->joinWith('hearts0')
            ->joinWith('creator0')
            ->joinWith('editor0')
            ->where(['{{%artist}}.id' => $id])
            ->one();

        if($model) {

            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
    }

    public static function getArtists() {

        return ArrayHelper::map(self::find()->all(), 'id', 'name');
    }

    public static function getArtistsWithAlbums() {

        $models = self::find()
            ->joinWith('albums0')
            ->groupBy('{{%artist}}.id')
            ->all();

        $arrayArtistsWithAlbums = [];

        foreach($models as $model) {

            foreach($model->albums0 as $album) {

                $arrayArtistsWithAlbums[] = [
                    'id' => $album->id,
                    'album' => "{$album->number}. {$album->name}",
                    'artist' => "{$model->id}. {$model->name}"
                ];
            }
        }

        return ArrayHelper::map($arrayArtistsWithAlbums, 'id', 'album', 'artist');
    }

    public function checkHeart() {

        foreach($this->hearts0 as $model) {

            if($model->creator === Yii::$app->user->id) {

                return HeartStatus::HEART_STATUS_ACTIVE;
            }
        }

        return HeartStatus::HEART_STATUS_INACTIVE;
    }

    public function notEmptyTracks() {

        foreach($this->albums0 as $model) {

            if(!$model->tracks0) {

                return false;
            }
        }

        return true;
    }

    public function getGenresList() {

        $models = [];

        foreach($this->genres0 as $model) {

            $models[] = $model->genre0;
        }

        return $models;
    }

    public function getSocialsList() {

        $models = [];

        foreach($this->socials0 as $model) {

            $models[] = $model->social0;
        }

        return $models;
    }

    public function getTracksList() {

        $models = [];

        foreach($this->albums0 as $album) {

            foreach($album->tracks0 as $model) {

                $models[] = $model;
            }
        }

        return $models;
    }

    public function getGenres0() {

        return $this
            ->hasMany(GenreContent::className(), ['content' => 'id'])
            ->onCondition(['{{%genre_content}}.type' => self::CONTENT_TYPE_ID]);
    }

    public function getSocials0() {

        return $this->hasMany(SocialContent::className(), ['artist' => 'id']);
    }

    public function getAlbums0() {

        return $this->hasMany(Album::className(), ['artist' => 'id']);
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