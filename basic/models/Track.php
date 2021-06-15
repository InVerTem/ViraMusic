<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;
use yii\web\NotFoundHttpException;

class Track extends ActiveRecord {

    const CONTENT_TYPE_ID = 3;

    public $heartsCount;
    public $deleteFile;

    public static function tableName() {

        return '{{%track}}';
    }

    public function rules() {

        return [
            [['name', 'signature'], 'trim'],
            [['name', 'album'], 'required'],
            [['album', 'disk', 'number'], 'integer'],
            [['name', 'signature'], 'string', 'max' => 255],
            ['disk', 'default', 'value' => 1],
            ['deleteFile', 'boolean']
        ];
    }

    public function attributeLabels() {

        return [
            'id' => Yii::t('app', 'ID'),
            'album' => Yii::t('app', 'Album'),
            'disk' => Yii::t('app', 'Disk'),
            'number' => Yii::t('app', 'Number'),
            'name' => Yii::t('app', 'Name'),
            'signature' => Yii::t('app', 'Signature'),
            'playtime' => Yii::t('app', 'Playtime'),
            'file' => Yii::t('app', 'File'),
            'creator' => Yii::t('app', 'Creator'),
            'editor' => Yii::t('app', 'Editor'),
            'created_at' => Yii::t('app', 'Created at'),
            'updated_at' => Yii::t('app', 'Updated at'),
            'heartsCount' => Yii::t('app', 'Hearts'),
            'deleteFile' => Yii::t('app', 'Delete file'),
            'audio' => Yii::t('app', 'Audio'),
            'genres' => Yii::t('app', 'Genres'),
            'artist' => Yii::t('app', 'Artist')
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
                '{{%track}}.*',
                'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
            ])
            ->joinWith('album0')
            ->joinWith('genres0')
            ->joinWith('hearts0')
            ->joinWith('creator0')
            ->joinWith('editor0')
            ->where(['{{%track}}.id' => $id])
            ->one();

        if($model) {

            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
    }

    public static function getTracks() {

        return ArrayHelper::map(self::find()->all(), 'id', 'name');
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

        return $this->genres0 or $this->album0->genres0 or $this->album0->artist0->genres0;
    }

    public function getGenresList() {

        $models = [];

        foreach($this->genres0 as $model) {

            $models[] = $model->genre0;
        }

        foreach($this->album0->genres0 as $model) {

            $models[] = $model->genre0;
        }

        foreach($this->album0->artist0->genres0 as $model) {

            $models[] = $model->genre0;
        }

        return $models;
    }

    public function getAlbum0() {

        return $this->hasOne(Album::className(), ['id' => 'album']);
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