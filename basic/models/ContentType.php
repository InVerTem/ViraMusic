<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;
use yii\web\NotFoundHttpException;

class ContentType extends ActiveRecord {

    public static function tableName() {

        return '{{%content_type}}';
    }

    public static function findModel($id) {

        $model = self::findOne($id);

        if($model) {

            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
    }

    public static function getTypesAAT() {

        return ArrayHelper::map(self::find()->where(['id' => [1, 2, 3]])->all(), 'id', 'name');
    }

    public static function getNameById($id) {

        $model = self::findModel($id);

        return $model->name;
    }

    public static function getNameContent($content, $contentName) {

        $contentClass = '\app\models\\' . ucfirst($contentName);
        $contentModel = $contentClass::findModel($content);

        return $contentModel->name;
    }
}