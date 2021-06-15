<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\web\NotFoundHttpException;

class Playlist extends ActiveRecord {

    const CONTENT_TYPE_ID = 4;

    public $deleteImage;

    public static function tableName() {

        return '{{%playlist}}';
    }

    public function rules() {

        return [
            ['name', 'trim'],
            ['name', 'required'],
            ['name', 'string', 'max' => 255],
            ['access', 'integer'],
            ['deleteImage', 'boolean']
        ];
    }

    public function attributeLabels() {

        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'access' => Yii::t('app', 'Access'),
            'image' => Yii::t('app', 'Image'),
            'creator' => Yii::t('app', 'Creator'),
            'created_at' => Yii::t('app', 'Created at'),
            'updated_at' => Yii::t('app', 'Updated at'),
            'deleteImage' => Yii::t('app', 'Delete image')
        ];
    }

    public function beforeSave($insert) {

        if(parent::beforeSave($insert)) {

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
            ->joinWith('artists0')
            ->joinWith('access0')
            ->joinWith('creator0')
            ->where(['{{%playlist}}.id' => $id])
            ->one();

        if($model) {

            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
    }

    public static function getPlaylistsList($type, $content) {

        $models = self::find()
            ->where(['{{%playlist}}.creator' => Yii::$app->user->id])
            ->all();

        $playlistsList = [];

        foreach($models as $model) {

            $playlistsList[] = Html::a($model->name, ['/playlist-content/create', 'playlist' => $model->id, 'type' => $type, 'content' => $content]);
        }

        return $playlistsList;
    }

    public function getArtistsList() {

        $models = [];

        foreach($this->artists0 as $model) {

            $models[] = $model->artist0;
        }

        return $models;
    }

    public function getAlbumsList() {

        $models = [];

        foreach($this->albums0 as $model) {

            $models[] = $model->album0;
        }

        return $models;
    }

    public function getTracksList() {

        $models = [];

        foreach($this->tracks0 as $model) {

            $models[] = $model->track0;
        }

        return $models;
    }

    public function getArtists0() {

        return $this
            ->hasMany(PlaylistContent::className(), ['playlist' => 'id'])
            ->onCondition(['{{%playlist_content}}.type' => Artist::CONTENT_TYPE_ID]);
    }

    public function getAlbums0() {

        return $this
            ->hasMany(PlaylistContent::className(), ['playlist' => 'id'])
            ->onCondition(['{{%playlist_content}}.type' => Album::CONTENT_TYPE_ID]);
    }

    public function getTracks0() {

        return $this
            ->hasMany(PlaylistContent::className(), ['playlist' => 'id'])
            ->onCondition(['{{%playlist_content}}.type' => Track::CONTENT_TYPE_ID]);
    }

    public function getAccess0() {

        return $this->hasOne(AccessStatus::className(), ['id' => 'access']);
    }

    public function getCreator0() {

        return $this->hasOne(User::className(), ['id' => 'creator']);
    }
}