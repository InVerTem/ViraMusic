<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use app\models\User;
use app\models\Artist;
use app\models\Track;
use app\models\Playlist;
use app\models\PlaylistContent;
use app\models\AccessStatus;
use app\components\GlobalFunctions;

class PlaylistController extends Controller {

    public function behaviors() {

        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index', 'create', 'update', 'delete'],
                'rules' => [
                    [
                        'actions' => ['index', 'create', 'update', 'delete'],
                        'allow' => true,
                        'roles' => ['@']
                    ]
                ]
            ]
        ];
    }

    public function beforeAction($action) {

        switch($action->id) {
            case 'view':
            case 'update':
            case 'delete':

                $modelId = Yii::$app->request->get('id');

                if($modelId) {

                    $model = Playlist::findModel($modelId);
                    $modelUser = User::findModel($model->creator);

                } else {

                    throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
                }

                break;
        }

        switch($action->id) {
            case 'view':
                $levelAccess = Yii::$app->user->id === $modelUser->id || $model->access ===  AccessStatus::ACCESS_STATUS_PUBLIC;
                break;
            case 'update':
            case 'delete':
                $levelAccess = Yii::$app->user->id === $modelUser->id;
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

    public function actionIndex() {

        $models = Playlist::find()
            ->joinWith('access0')
            ->joinWith('creator0')
            ->where(['{{%playlist}}.creator' => Yii::$app->user->id])
            ->all();

        $renderArray = ['models' => $models];

        return Yii::$app->request->isAjax ? $this->renderAjax('index', $renderArray) : $this->render('index', $renderArray);
    }

    public function actionView($id, $content = null) {

        $model = Playlist::findModel($id);

        $renderArray = [
            'model' => $model,
            'content' => $content
        ];

        return Yii::$app->request->isAjax ? $this->renderAjax('view', $renderArray) : $this->render('view', $renderArray);
    }

    public function actionCreate() {

        $model = new Playlist();

        if(
            $model->load(Yii::$app->request->post()) &&
            $model->validate()
        ) {

            $model->image = GlobalFunctions::uploadFile($model, $model->image, $model->deleteImage);

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Playlist added.'));

                return $this->redirect(['view', 'id' => $model->id]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('create', $renderArray) : $this->render('create', $renderArray);
    }

    public function actionUpdate($id) {

        $model = Playlist::findModel($id);

        if($model->load(Yii::$app->request->post()) && $model->validate()) {

            $model->image = GlobalFunctions::uploadFile($model, $model->image, $model->deleteImage);

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Playlist changed.'));

                return $this->redirect(['view', 'id' => $model->id]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        $dataProviderPlaylistContent = new ActiveDataProvider([
            'query' => PlaylistContent::find()
                ->joinWith('type0')
                ->joinWith('type0')
                ->joinWith('type0')
                ->where(['{{%playlist_content}}.playlist' => $model->id]),
            'Pagination' => [
                'pageSize' => false,
                'pageSizeParam' => false
            ]
        ]);

        $renderArray = [
            'model' => $model,
            'dataProviderPlaylistContent' => $dataProviderPlaylistContent
        ];

        return Yii::$app->request->isAjax ? $this->renderAjax('update', $renderArray) : $this->render('update', $renderArray);
    }

    public function actionDelete($id) {

        $model = Playlist::findModel($id);

        if($model->delete()) {

            Yii::$app->session->setFlash('success', Yii::t('app', 'Playlist deleted.'));
        }

        return $this->redirect('index');
    }
}