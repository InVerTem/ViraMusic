<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use app\models\SocialContent;
use app\models\Artist;

class SocialContentController extends Controller {

    public function behaviors() {

        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['create', 'update', 'delete'],
                'rules' => [
                    [
                        'actions' => ['create', 'update', 'delete'],
                        'allow' => true,
                        'roles' => ['@']
                    ]
                ]
            ]
        ];
    }

    public function beforeAction($action) {

        if(ADMINISTRATION) {

            return parent::beforeAction($action);
        }

        throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['forbiddenMessage']));
    }

    public function actionCreate($artist) {

        $model = new SocialContent();
        $model->artist = $artist;
        $artistModel = Artist::findModel($artist);

        if(
            $model->load(Yii::$app->request->post()) &&
            $model->validate()
        ) {

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Social added.'));

                return $this->redirect(['/artist/update', 'id' => $artist]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['forbiddenMessage']));
        }

        $renderArray = [
            'model' => $model,
            'artistModel' => $artistModel
        ];

        return Yii::$app->request->isAjax ? $this->renderAjax('create', $renderArray) : $this->render('create', $renderArray);
    }

    public function actionUpdate($id, $artist) {

        $model = SocialContent::findModel($id);

        if(
            $model->load(Yii::$app->request->post()) &&
            $model->validate()
        ) {

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Social changed.'));

                return $this->redirect(['/artist/update', 'id' => $artist]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['forbiddenMessage']));
        }

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('update', $renderArray) : $this->render('update', $renderArray);
    }

    public function actionDelete($id, $artist) {

        $model = SocialContent::findModel($id);

        if($model->delete()) {

            Yii::$app->session->setFlash('success', Yii::t('app', 'Social deleted.'));
        }

        return $this->redirect(['/artist/update', 'id' => $artist]);
    }
}