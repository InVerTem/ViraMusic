<?php

namespace app\models;

use Yii;
use yii\base\Model;

class UploadForm extends Model {

    public $file;

    public function rules() {

        return [
            ['file', 'file', 'skipOnEmpty' => false, 'extensions' => 'png, jpg, jpeg, svg, mp3, gif'],
        ];
    }

    public function upload() {

        if($this->validate()) {

            $rndString = Yii::$app->security->generateRandomString();
            $srcFile = "{$rndString}.{$this->file->extension}";
            $this->file->saveAs("uploads/{$srcFile}");

            return $srcFile;
        }

        return false;
    }
}