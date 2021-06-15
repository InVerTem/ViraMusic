<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\helpers\Html;
use yii\web\NotFoundHttpException;

class Language extends ActiveRecord {

    public static function tableName() {

        return '{{%language}}';
    }

    public static function findModel($id) {

        $model = self::findOne($id);

        if($model) {

            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
    }

    public static function getLanguagesList() {

        $models = self::find()->all();

        $languagesList = [];

        foreach($models as $model) {

            $languagesList[] = $model->code === Yii::$app->language ? Html::a($model->name, ['/site/change-language', 'id' => $model->id], ['class' => 'active']) : Html::a($model->name, ['/site/change-language', 'id' => $model->id]);
        }

        return $languagesList;
    }
}