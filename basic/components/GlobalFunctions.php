<?php

namespace app\components;

use Yii;
use yii\base\Model;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Dropdown;
use yii\web\UploadedFile;
use app\models\UploadForm;
use app\models\ContentType;

class GlobalFunctions extends Model {

    public static function debug($value = null, $value2 = true) {

        echo '<pre
            style="
                font: 1em Segoe UI;
                background: #161616;
                color: #fff;
                min-width: 100%;
                position: relative;
                top: -8px;
                left: -8px;
                margin: 0;
                padding: 8px;
            ">' . print_r($value, true) . '</pre>';

        if($value2) die();
    }

    public static function uploadFile($model, $file, $deleteImage, $nameFile = 'image') {

        $uploadForm = new UploadForm();
        $uploadForm->file = UploadedFile::getInstance($model, $nameFile);
        $srcFile = $uploadForm->upload();

        if(
            $srcFile or
            $deleteImage
        ) {

            $src = Yii::getAlias('@webroot') . "/uploads/{$file}";

            if(
                $file &&
                file_exists($src)
            ) {

                unlink($src);
            }

            if($deleteImage) {

                return null;
            }
        }

        if($srcFile) {

            return $srcFile;
        }

        return $file;
    }

    public static function getTranslateArray($data) {

        foreach($data as $key => $value) {

            $data[$key] = Yii::t('app', $value);
        }

        return $data;
    }

    public static function asArray($models) {

        $data0 = [];

        foreach($models as $model) {

            $data0[$model->id] = $model->attributes;
        }

        return $data0;
    }

    public static function sortArray($data, $fields) {

        if(empty($data)) {

            return $data;
        }

        $arrayFields = [];

        foreach($data as $key => $value) {

            foreach($fields as $fieldKey => $fieldValue) {

                $arrayFields[$fieldKey][$key] = $value[$fieldKey];
            }
        }

        foreach($fields as $key => $value) {

            array_multisort($arrayFields[$key], $value, $data);
        }

        return $data;
    }

    public static function deleteFields($data, $fields) {

        foreach($data as $dataKey => $dataValue) {

            foreach($dataValue as $key => $value) {

                if(in_array($key, $fields)) {

                    unset($data[$dataKey][$key]);
                }
            }
        }

        return $data;
    }

    public static function wrapperDropdown($items, $text = '', $svg = '') {

        if(!empty($svg)) {

            $svg = "<svg class=\"${svg}\"><path/></svg>";
        }

        return
            "<div class=\"dropdown\">
                <a href=\"#\" data-toggle=\"dropdown\" class=\"svg-grid dropdown-toggle\">${text}${svg}</a>" .
                Dropdown::widget([
                    'items' => $items,
                ]) .
            '</div>';
    }

    public static function wrapperImage($src = null, $popupHint = false) {

        $attributesArray = $popupHint ? ['class' => 'wrapper-image', 'data-popup-hint' => $src] : ['class' => 'wrapper-image'];

        $src0 = empty($src) ? Yii::$app->params['defaultImage'] : "/uploads/{$src}";

        $wrapperImage = Html::tag('div', Html::img(Url::to($src0), ['class' => 'image', 'alt' => $src0]), ['class' => 'wrapper-image']);

        return $popupHint ? Html::tag('div', $wrapperImage, ['data-popup-hint' => $src]) : $wrapperImage;
    }

    public static function wrapperDate($date) {

        return Html::tag('p', Yii::$app->formatter->format($date, 'date'), ['class' => 'date']);
    }

    public static function getAbbreviated($data, $popupHint = true, $size = 16) {

        $attributesArray = $popupHint ? ['class' => 'wrapper-text', 'data-popup-hint' => $data] : ['class' => 'wrapper-text'];

        return mb_strlen($data, 'utf-8') > $size && $size > 0 ? Html::tag('span', mb_substr($data, 0, $size, 'utf-8') . '...', $attributesArray) : $data;
    }

    public static function getListOnModels($models, $type, $view = null, $popupHint = true, $size = 16) {

        $data0 = [];
        $contentName = ContentType::getNameById($type);

        foreach($models as $model) {

            switch($contentName) {

                case 'genre':
                case 'social':
                    $modelName = Yii::t('app', $model->name);
                    break;

                default:
                    $modelName = $model->name;
                    break;
            }

            switch($view) {

                case 'search-genre':
                    $data0[] = Html::a(self::getAbbreviated($modelName, $popupHint, $size), ["/site/search?SearchForm%5Bgenre%5D={$model->id}"]);
                    break;

                case 'view-raw':
                case 'view':
                    $data0[] = Html::a(self::getAbbreviated($modelName, $popupHint, $size), ["/{$contentName}/{$view}", 'id' => $model->id]);
                    break;

                default:
                    $data0[] = self::getAbbreviated($modelName, $popupHint, $size);
                    break;
            }
        }

        return Html::tag('p', count($data0) > $size && $size > 0 ? implode(', ', array_slice($data0, 0, $size)) . '...' : implode(', ', $data0), ['class' => 'wrapper-list']);
    }
}