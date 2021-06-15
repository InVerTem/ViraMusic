<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use app\models\Artist;
use app\models\ArtistSearch;
use app\models\Genre;
use app\models\GenreContent;
use app\models\Social;
use app\models\SocialContent;
use app\models\Album;
use app\models\Track;
use app\components\GlobalFunctions;

class ArtistController extends Controller {

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

        $searchModel = new ArtistSearch();
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

        $model = Artist::findModel($id);

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('view-raw', $renderArray) : $this->render('view-raw', $renderArray);
    }

    public function actionView($id, $content = null) {

        $model = Artist::findModel($id);

        switch($content) {
            case 'albums':
                $models = Album::find()
                    ->select([
                        '{{%album}}.*',
                        'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
                    ])
                    ->joinWith('artist0')
                    ->joinWith('genres0')
                    ->joinWith('tracks0')
                    ->joinWith('hearts0')
                    ->where(['{{%album}}.artist' => $id])
                    ->groupBy([
                        '{{%album}}.artist',
                        '{{%album}}.number',
                        '{{%album}}.id'
                    ])
                    ->orderBy(['{{%album}}.number' => SORT_DESC])
                    ->limit(15)
                    ->all();
                break;
            case 'tracks':
                $models = Album::find()
                    ->select([
                        '{{%album}}.*',
                        'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
                    ])
                    ->joinWith('artist0')
                    ->joinWith('genres0')
                    ->joinWith('tracks0')
                    ->joinWith('hearts0')
                    ->where(['{{%album}}.artist' => $id])
                    ->groupBy([
                        '{{%album}}.artist',
                        '{{%album}}.number',
                        '{{%album}}.id'
                    ])
                    ->orderBy(['{{%album}}.number' => SORT_DESC])
                    ->limit(15)
                    ->all();
                break;
            case 'info':
                $models = null;
                break;
            default:
                $models = Track::find()
                    ->select([
                        '{{%track}}.*',
                        'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
                    ])
                    ->joinWith('album0')
                    ->joinWith('genres0')
                    ->joinWith('hearts0')
                    ->leftJoin('{{%artist}}', '{{%artist}}.id = {{%album}}.artist')
                    ->where(['{{%artist}}.id' => $id])
                    ->groupBy([
                        '{{%album}}.artist',
                        '{{%album}}.number',
                        '{{%track}}.number',
                        '{{%track}}.disk',
                        '{{%track}}.id'
                    ])
                    ->orderBy([
                        'heartsCount' => SORT_DESC,
                        '{{%track}}.album' => SORT_DESC,
                        '{{%track}}.id' => SORT_ASC
                    ])
                    ->limit(16)
                    ->all();
                break;
        }

        $renderArray = [
            'model' => $model,
            'models' => $models,
            'content' => $content
        ];

        return Yii::$app->request->isAjax ? $this->renderAjax('view', $renderArray) : $this->render('view', $renderArray);
    }

    public function actionCreate() {

        $model = new Artist();

        if(
            $model->load(Yii::$app->request->post()) &&
            $model->validate()
        ) {

            $model->image = GlobalFunctions::uploadFile($model, $model->image, $model->deleteImage);

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Artist added.'));

                return $this->redirect(['view-raw', 'id' => $model->id]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('create', $renderArray) : $this->render('create', $renderArray);
    }

    public function actionUpdate($id) {

        $model = Artist::findModel($id);

        if($model->load(Yii::$app->request->post()) && $model->validate()) {

            $model->image = GlobalFunctions::uploadFile($model, $model->image, $model->deleteImage);

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Artist changed.'));

                return $this->redirect(['view-raw', 'id' => $model->id]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        $dataProviderGenres = new ActiveDataProvider([
            'query' => GenreContent::find()
                ->select([
                    '{{%genre_content}}.*',
                    '{{%artist}}.name as contentName'
                ])
                ->joinWith('genre0')
                ->joinWith('type0')
                ->joinWith('creator0')
                ->joinWith('editor0')
                ->leftJoin('{{%artist}}', '{{%artist}}.id = {{%genre_content}}.content')
                ->where([
                    '{{%genre_content}}.type' => Artist::CONTENT_TYPE_ID,
                    '{{%genre_content}}.content' => $model->id
                ]),
            'Pagination' => [
                'pageSize' => false,
                'pageSizeParam' => false
            ]
        ]);

        $dataProviderSocials = new ActiveDataProvider([
            'query' => SocialContent::find()
                ->joinWith('social0')
                ->joinWith('artist0')
                ->joinWith('creator0')
                ->joinWith('editor0')
                ->where(['{{%social_content}}.artist' => $model->id]),
            'Pagination' => [
                'pageSize' => false,
                'pageSizeParam' => false
            ]
        ]);

        $dataProviderAlbums = new ActiveDataProvider([
            'query' => Album::find()
                ->joinWith('artist0')
                ->joinWith('genres0')
                ->joinWith('creator0')
                ->joinWith('editor0')
                ->where(['{{%album}}.artist' => $model->id])
                ->groupBy([
                    '{{%album}}.number',
                    '{{%album}}.id'
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
                ->where(['{{%album}}.artist' => $model->id])
                ->groupBy([
                    '{{%album}}.number',
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
            'dataProviderSocials' => $dataProviderSocials,
            'dataProviderAlbums' => $dataProviderAlbums,
            'dataProviderTracks' => $dataProviderTracks
        ];

        return Yii::$app->request->isAjax ? $this->renderAjax('update', $renderArray) : $this->render('update', $renderArray);
    }

    public function actionDelete($id) {

        $model = Artist::findModel($id);

        if($model->delete()) {

            Yii::$app->session->setFlash('success', Yii::t('app', 'Artist deleted.'));
        }

        return $this->redirect('index-raw');
    }
}