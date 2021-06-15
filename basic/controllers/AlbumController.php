<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use app\models\Artist;
use app\models\Album;
use app\models\AlbumSearch;
use app\models\Genre;
use app\models\GenreContent;
use app\models\Track;
use app\components\GlobalFunctions;

class AlbumController extends Controller {

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

        switch($action->id) {
            case 'index-raw':
            case 'view-raw':
            case 'create':
            case 'update':
            case 'delete':
                $levelAccess = ADMINISTRATION;
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

        $searchModel = new AlbumSearch();
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

        $model = Album::findModel($id);

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('view-raw', $renderArray) : $this->render('view-raw', $renderArray);
    }

    public function actionView($id) {

        $model = Album::findModel($id);

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('view', $renderArray) : $this->render('view', $renderArray);
    }

    public function actionCreate($artist = null) {

        $model = new Album();

        if($artist) {

            $model->artist = $artist;
        }

        if(
            $model->load(Yii::$app->request->post()) &&
            $model->validate()
        ) {

            $model->image = GlobalFunctions::uploadFile($model, $model->image, $model->deleteImage);

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Album added.'));

                return $this->redirect(['view-raw', 'id' => $model->id]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('create', $renderArray) : $this->render('create', $renderArray);
    }

    public function actionUpdate($id) {

        $model = Album::findModel($id);

        if(
            $model->load(Yii::$app->request->post()) &&
            $model->validate()
        ) {

            $model->image = GlobalFunctions::uploadFile($model, $model->image, $model->deleteImage);

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Album changed.'));

                return $this->redirect(['view-raw', 'id' => $model->id]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        $dataProviderGenres = new ActiveDataProvider([
            'query' => GenreContent::find()
                ->select([
                    '{{%genre_content}}.*',
                    '{{%album}}.name as contentName'
                ])
                ->joinWith('genre0')
                ->joinWith('type0')
                ->joinWith('creator0')
                ->joinWith('editor0')
                ->leftJoin('{{%album}}', '{{%album}}.id = {{%genre_content}}.content')
                ->where([
                    '{{%genre_content}}.type' => Album::CONTENT_TYPE_ID,
                    '{{%genre_content}}.content' => $model->id
                ])
                ->orWhere([
                    '{{%genre_content}}.type' => Artist::CONTENT_TYPE_ID,
                    '{{%genre_content}}.content' => $model->artist
                ]),
            'Pagination' => [
                'pageSize' => false,
                'pageSizeParam' => false
            ]
        ]);

        $dataProviderTracks = new ActiveDataProvider([
            'query' => Track::find()
                ->joinWith('album0')
                ->joinWith('genres0')
                ->joinWith('creator0')
                ->joinWith('editor0')
                ->where(['{{%track}}.album' => $model->id])
                ->groupBy([
                    '{{%track}}.number',
                    '{{%track}}.disk',
                    '{{%track}}.id'
                ]),
            'Pagination' => [
                'pageSize' => false,
                'pageSizeParam' => false
            ]
        ]);

        $renderArray = [
            'model' => $model,
            'dataProviderGenres' => $dataProviderGenres,
            'dataProviderTracks' => $dataProviderTracks
        ];

        return Yii::$app->request->isAjax ? $this->renderAjax('update', $renderArray) : $this->render('update', $renderArray);
    }

    public function actionDelete($id) {

        $model = Album::findModel($id);

        if($model->delete()) {

            Yii::$app->session->setFlash('success', Yii::t('app', 'Album deleted.'));
        }

        return $this->redirect('index-raw');
    }
}