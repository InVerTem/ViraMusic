<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use app\models\GenreContent;
use app\models\ContentType;

class GenreContentController extends Controller {

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

    public function actionCreate($type, $content) {

        $model = new GenreContent();
        $model->type = $type;
        $model->content = $content;

        $contentName = ContentType::getNameById($type);

        $contentClass = '\\app\\models\\' . ContentType::getNameById($model->type);
        $contentModel = $contentClass::findModel($content);

        if(
            $model->load(Yii::$app->request->post()) &&
            $model->validate()
        ) {

            if($model->save()) {

                $typeName = ContentType::getNameById($type);
                Yii::$app->session->setFlash('success', Yii::t('app', 'Genre added.'));

                return $this->redirect(["/{$typeName}/update", 'id' => $content]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        $renderArray = [
            'model' => $model,
            'contentName' => $contentName,
            'contentModel' => $contentModel
        ];

        return Yii::$app->request->isAjax ? $this->renderAjax('create', $renderArray) : $this->render('create', $renderArray);
    }

    public function actionUpdate($id, $type, $content) {

        $model = GenreContent::findModel($id);

        if(
            $model->load(Yii::$app->request->post()) &&
            $model->validate()
        ) {

            if($model->save()) {

                $typeName = ContentType::getNameById($type);
                Yii::$app->session->setFlash('success', Yii::t('app', 'Genre changed.'));

                return $this->redirect(["/{$typeName}/update", 'id' => $content]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        $contentName = ContentType::getNameById($type);

        $renderArray = [
            'model' => $model,
            'contentName' => $contentName
        ];

        return Yii::$app->request->isAjax ? $this->renderAjax('update', $renderArray) : $this->render('update', $renderArray);
    }

    public function actionDelete($id, $type, $content) {

        $model = GenreContent::findModel($id);
        $typeName = ContentType::getNameById($type);

        if($model->delete()) {

            Yii::$app->session->setFlash('success', Yii::t('app', 'Genre deleted.'));
        }

        return $this->redirect(["/{$typeName}/update", 'id' => $content]);
    }
}