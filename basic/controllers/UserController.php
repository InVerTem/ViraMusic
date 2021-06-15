<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use app\models\User;
use app\models\UserSearch;

class UserController extends Controller {

    public function behaviors() {

        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index-raw', 'view-raw', 'update', 'delete'],
                'rules' => [
                    [
                        'actions' => ['index-raw', 'view-raw', 'update', 'delete'],
                        'allow' => true,
                        'roles' => ['@']
                    ]
                ]
            ]
        ];
    }

    public function beforeAction($action) {

        switch($action->id) {
            case 'index-raw':
            case 'view-raw':
                $levelAccess = ADMINISTRATION;
                break;
            case 'update':
            case 'delete':
                $levelAccess = ADMIN;
                break;
            default:
                $levelAccess = true;
                break;
        }

        if($levelAccess) {

            return parent::beforeAction($action);
        }

        throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['forbiddenMessage']));
    }

    public function actionIndexRaw($isAll = false) {

        $searchModel = new UserSearch();
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

        $model = User::findModel($id);

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('view-raw', $renderArray) : $this->render('view-raw', $renderArray);
    }

    public function actionUpdate($id) {

        $model = User::findModel($id);

        if(
            $model->load(Yii::$app->request->post()) &&
            $model->validate()
        ) {

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'User changed.'));

                return $this->redirect(['view-raw', 'id' => $id]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('update', $renderArray) : $this->render('update', $renderArray);
    }

    public function actionDelete($id) {

        $model = User::findModel($id);

        if($model->delete()) {

            Yii::$app->session->setFlash('success', Yii::t('app', 'User deleted.'));
        }

        return $this->redirect('index-raw');
    }
}