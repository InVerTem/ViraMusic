<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\data\Pagination;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use app\models\Genre;
use app\models\GenreSearch;

class GenreController extends Controller {

    public function behaviors() {

        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index-raw', 'view-raw', 'create', 'update', 'delete'],
                'rules' => [
                    [
                        'actions' => ['index-raw', 'view-raw', 'create', 'update', 'delete'],
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

    public function actionIndexRaw($isAll = false) {

        $searchModel = new GenreSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->get());

        if($isAll) {

            $dataProvider->pagination->pageSize = -1;
        }

        $renderArray = [
            'dataProvider' => $dataProvider,
            'searchModel' => $searchModel,
            'isAll' => $isAll
        ];

        return Yii::$app->request->isAjax ? $this->renderAjax('index-raw', $renderArray) : $this->render('index-raw', $renderArray);
    }

    public function actionViewRaw($id) {

        $model = Genre::findModel($id);

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('view-raw', $renderArray) : $this->render('view-raw', $renderArray);
    }

    public function actionCreate() {

        $model = new Genre();

        if(
            $model->load(Yii::$app->request->post()) &&
            $model->validate()
        ) {

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Genre added.'));

                return $this->redirect('index-raw');
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['forbiddenMessage']));
        }

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('create', $renderArray) : $this->render('create', $renderArray);
    }

    public function actionUpdate($id) {

        $model = Genre::findModel($id);

        if(
            $model->load(Yii::$app->request->post()) &&
            $model->validate()
        ) {

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Genre changed.'));

                return $this->redirect('index-raw');
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['forbiddenMessage']));
        }

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('update', $renderArray) : $this->render('update', $renderArray);
    }

    public function actionDelete($id) {

        $model = Genre::findModel($id);

        if($model->delete()) {

            Yii::$app->session->setFlash('success', Yii::t('app', 'Genre deleted.'));
        }

        return $this->redirect('index-raw');
    }
}