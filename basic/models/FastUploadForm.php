<?php

namespace app\models;

use Yii;
use yii\base\Model;
use kato\getid3\Yii2GetID3;

class FastUploadForm extends Model {

    public $album;
    public $files;

    public function rules() {

        return [
            [['album', 'files'], 'required'],
            ['album', 'integer'],
            ['files', 'file', 'skipOnEmpty' => false, 'maxFiles' => 100]
        ];
    }

    public function attributeLabels() {

        return [
            'album' => Yii::t('app', 'Album'),
            'files' => Yii::t('app', 'Files')
        ];
    }

    public function upload() {

        if($this->validate()) {

            foreach($this->files as $file) {

                $rndString = Yii::$app->security->generateRandomString();
                $srcFile = "{$rndString}.{$file->extension}";
                $file->saveAs("uploads/{$srcFile}");

                $getID3 = new Yii2GetID3();
                $data = $getID3->getData("uploads/{$srcFile}");

                $modelTrack = new Track();

                $modelTrack->album = $this->album;

                if(isset($data['tags_html'])) {

                    $id3 = isset($data['tags_html']['id3v2']) ? 'id3v2' : (isset($data['tags_html']['id3v1']) ? 'id3v1' : '');
                    $dataTrack = $data['tags_html'][$id3];
                }

                if(!empty($id3)) {

                    if(
                        isset($dataTrack['track_number']) &&
                        isset($dataTrack['track_number'][0])
                    ) {

                        $modelTrack->number = (int)$dataTrack['track_number'][0];
                    }

                    if(
                        Yii::$app->params['modeChangeTrackName'] === 'getID3' &&
                        isset($dataTrack['title']) &&
                        isset($dataTrack['title'][0])
                    ) {

                        $modelTrack->name = (string)$dataTrack['title'][0];
                    }

                } else {

                    $modelTrack->number = 0;
                    $modelTrack->name = $file->name;
                }

                if(Yii::$app->params['modeChangeTrackName'] === 'changeFileName') {

                    $textArray = explode(' ', $file->name);
                    array_shift($textArray);
                    $textArray = explode('.', implode(' ', $textArray));
                    array_pop($textArray);
                    $modelTrack->name = implode('.', $textArray);
                }

                $modelTrack->playtime = $data['playtime_string'];
                $modelTrack->file = $srcFile;

                if($modelTrack->validate()) {

                    $modelTrack->save();
                }
            }

            return true;
        }

        return false;
    }
}