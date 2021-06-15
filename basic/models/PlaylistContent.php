<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\web\NotFoundHttpException;

class PlaylistContent extends ActiveRecord {

    public static function tableName() {

        return '{{%playlist_content}}';
    }

    public function rules() {

        return [
            [['playlist', 'type', 'content'], 'required'],
            [['playlist', 'type', 'content'], 'integer']
        ];
    }

    public function attributeLabels() {

        return [
            'id' => Yii::t('app', 'ID'),
            'playlist' => Yii::t('app', 'Playlist'),
            'type' => Yii::t('app', 'Type'),
            'content' => Yii::t('app', 'Content'),
            'created_at' => Yii::t('app', 'Created at'),
            'updated_at' => Yii::t('app', 'Updated at')
        ];
    }

    public function beforeSave($insert) {

        if(parent::beforeSave($insert)) {

            $this->updated_at = time();

            if($this->isNewRecord) {

                $this->created_at = time();
            }

            return true;
        }

        return false;
    }

    public static function findModel($id) {

        $model = self::find()
            ->joinWith('playlist0')
            ->joinWith('type0')
            ->where(['{{%playlist_content}}.id' => $id])
            ->one();

        if($model) {

            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
    }

    public function getPlaylist0() {

        return $this->hasOne(Playlist::className(), ['id' => 'playlist']);
    }

    public function getArtist0() {

        return $this->hasOne(Artist::className(), ['id' => 'content']);
    }

    public function getAlbum0() {

        return $this->hasOne(Album::className(), ['id' => 'content']);
    }

    public function getTrack0() {

        return $this->hasOne(Track::className(), ['id' => 'content']);
    }

    public function getType0() {

        return $this->hasOne(ContentType::className(), ['id' => 'type']);
    }
}