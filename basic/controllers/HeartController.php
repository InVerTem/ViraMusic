<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use app\models\Heart;
use app\models\HeartStatus;

class HeartController extends Controller {

    public function behaviors() {

        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['create'],
                'rules' => [
                    [
                        'actions' => ['create'],
                        'allow' => true,
                        'roles' => ['@']
                    ]
                ]
            ]
        ];
    }

    public function beforeAction($action) {

        if(Yii::$app->request->isAjax) {

            if(Yii::$app->user->isGuest) {

                $this->redirect('/site/login');
            }

            return parent::beforeAction($action);
        }

        throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['forbiddenMessage']));
    }

    public function actionCreate() {

        Yii::$app->response->format = Response::FORMAT_JSON;

        $type = Yii::$app->request->post('type');
        $content = Yii::$app->request->post('content');

        if(
            empty($type) &&
            empty($content)
        ) {

            throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
        }

        $model = Heart::findModel($type, $content, Yii::$app->user->id);

        if($model) {

            if($model->status === HeartStatus::HEART_STATUS_ACTIVE) {

                $model->status = HeartStatus::HEART_STATUS_INACTIVE;

            } else {

                $model->status = HeartStatus::HEART_STATUS_ACTIVE;
            }

        } else {

            $model = new Heart();
            $model->type = $type;
            $model->content = $content;
        }

        if($model->validate()) {

            if($model->save()) {

                return [
                    'status' => $model->status
                ];
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        return false;
    }
}