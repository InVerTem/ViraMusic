<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\UploadedFile;
use yii\web\Response;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use app\models\User;
use app\models\AccessStatus;
use app\models\Artist;
use app\models\Album;
use app\models\Track;
use app\models\TrackSearch;
use app\models\Genre;
use app\models\GenreContent;
use app\models\FastUploadForm;
use app\models\Playlist;
use app\components\GlobalFunctions;

class TrackController extends Controller {

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
            case 'audio':
                $userId = Yii::$app->request->post('user');

                if($userId) {

                    $modelUser = User::findModel($userId);

                    if(
                        Yii::$app->user->id === $modelUser->id ||
                        $modelUser->access ===  AccessStatus::ACCESS_STATUS_PUBLIC
                    ) {

                        $levelAccess = Yii::$app->request->isAjax;

                    } else {

                        $levelAccess = false;
                    }

                } else {

                    $levelAccess = Yii::$app->request->isAjax;
                }
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

        $searchModel = new TrackSearch();
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

        $model = Track::findModel($id);

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('view-raw', $renderArray) : $this->render('view-raw', $renderArray);
    }

    public function actionView($id) {

        $model = Track::findModel($id);

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('view', $renderArray) : $this->render('view', $renderArray);
    }

    public function actionCreate($album = null) {

        $model = new Track();

        if($album) {

            $model->album = $album;
        }

        if(
            $model->load(Yii::$app->request->post()) &&
            $model->validate()
        ) {

            $model->file = GlobalFunctions::uploadFile($model, $model->file, $model->deleteFile);

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Track added.'));

                return $this->redirect(['view-raw', 'id' => $model->id]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('create', $renderArray) : $this->render('create', $renderArray);
    }

    public function actionFastCreate($album = null) {

        $model = new FastUploadForm();

        if($album) {

            $model->album = $album;
        }

        if($model->load(Yii::$app->request->post())) {

            $model->files = UploadedFile::getInstances($model, 'files');

            if($model->upload()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Tracks added.'));

                return $this->redirect(['index-raw', 'TrackSearch[album]' => $model->album]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('fast-create', $renderArray) : $this->render('fast-create', $renderArray);
    }

    public function actionUpdate($id) {

        $model = Track::findModel($id);

        if(
            $model->load(Yii::$app->request->post()) &&
            $model->validate()
        ) {

            $model->file = GlobalFunctions::uploadFile($model, $model->file, $model->deleteFile, 'file');

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Track changed.'));

                return $this->redirect(['view-raw', 'id' => $model->id]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        $dataProviderGenres = new ActiveDataProvider([
            'query' => GenreContent::find()
                ->select([
                    '{{%genre_content}}.*',
                    '{{%track}}.name as contentName'
                ])
                ->joinWith('genre0')
                ->joinWith('type0')
                ->joinWith('creator0')
                ->joinWith('editor0')
                ->leftJoin('{{%track}}', '{{%track}}.id = {{%genre_content}}.content')
                ->where([
                    '{{%genre_content}}.type' => Track::CONTENT_TYPE_ID,
                    '{{%genre_content}}.content' => $model->id
                ])
                ->orWhere([
                    '{{%genre_content}}.type' => Album::CONTENT_TYPE_ID,
                    '{{%genre_content}}.content' => $model->album
                ])
                ->orWhere([
                    '{{%genre_content}}.type' => Artist::CONTENT_TYPE_ID,
                    '{{%genre_content}}.content' => $model->album0->artist
                ]),
            'Pagination' => [
                'pageSize' => false,
                'pageSizeParam' => false
            ]
        ]);

        $renderArray = [
            'model' => $model,
            'dataProviderGenres' => $dataProviderGenres
        ];

        return Yii::$app->request->isAjax ? $this->renderAjax('update', $renderArray) : $this->render('update', $renderArray);
    }

    public function actionDelete($id) {

        $model = Track::findModel($id);

        if($model->delete()) {

            Yii::$app->session->setFlash('success', Yii::t('app', 'Track deleted.'));
        }

        return $this->redirect('index-raw');
    }

    public function actionAudio() {

        Yii::$app->response->format = Response::FORMAT_JSON;

        $type = Yii::$app->request->post('type');
        $content = Yii::$app->request->post('content');
        $track = Yii::$app->request->post('track');
        $order = Yii::$app->request->post('order');
        $user = Yii::$app->request->post('user');

        if(
            empty($type) &&
            empty($content) &&
            empty($track)
        ) {

            throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
        }

        $query = Track::find()
            ->select([
                '{{%album}}.artist',
                '{{%artist}}.name AS artistName',
                '{{%track}}.album',
                '{{%album}}.name AS albumName',
                '{{%album}}.image AS albumImage',
                '{{%track}}.id',
                '{{%track}}.name AS trackName',
                '{{%track}}.file',
                '{{%heart}}.status AS status',
                'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
            ])
            ->joinWith('album0')
            ->joinWith('hearts0')
            ->leftJoin('{{%artist}}', '{{%artist}}.id = {{%album}}.artist')
            ->leftJoin('{{%playlist_content}} playlistContentArtist', 'playlistContentArtist.content = {{%artist}}.id')
            ->leftJoin('{{%playlist_content}} playlistContentAlbum', 'playlistContentAlbum.content = {{%album}}.id')
            ->leftJoin('{{%playlist_content}} playlistContentTrack', 'playlistContentTrack.content = {{%track}}.id')
            ->leftJoin('{{%heart}} heartUser', 'heartUser.type = ' . Track::CONTENT_TYPE_ID . ' AND heartUser.content = {{%track}}.id')
            ->groupBy([
                '{{%album}}.artist',
                '{{%album}}.number',
                '{{%track}}.number',
                '{{%track}}.disk',
                '{{%track}}.id',
                'heartUser.updated_at',
                'playlistContentTrack.updated_at'
            ]);

        switch($type) {

            case Artist::CONTENT_TYPE_ID:
                $query
                    ->andfilterWhere(['{{%artist}}.id' => $content])
                    ->orderBy([
                        '{{%album}}.number' => SORT_DESC,
                        '{{%track}}.number' => SORT_ASC
                    ]);
                break;

            case Album::CONTENT_TYPE_ID:
                $query->andfilterWhere(['{{%album}}.id' => $content]);
                break;

            case Track::CONTENT_TYPE_ID:
                $query->andfilterWhere(['{{%track}}.id' => $content]);
                break;

            case Playlist::CONTENT_TYPE_ID:

                if($order === 'playlistTracks') {

                    $query->andFilterWhere([
                        'playlistContentTrack.playlist' => $content,
                        'playlistContentTrack.type' => Track::CONTENT_TYPE_ID
                    ]);

                } else {

                    $query->andFilterWhere([
                        'OR',[
                            'playlistContentArtist.playlist' => $content,
                            'playlistContentArtist.type' => Artist::CONTENT_TYPE_ID
                        ], [
                            'playlistContentAlbum.playlist' => $content,
                            'playlistContentAlbum.type' => Album::CONTENT_TYPE_ID
                        ], [
                            'playlistContentTrack.playlist' => $content,
                            'playlistContentTrack.type' => Track::CONTENT_TYPE_ID
                        ]
                    ]);
                }

                break;

            default:
                throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
                break;
        }

        switch($order) {

            case 'popularTracks':
                $query->orderBy([
                    'heartsCount' => SORT_DESC,
                    '{{%track}}.album' => SORT_DESC,
                    '{{%track}}.id' => SORT_ASC
                ]);
                break;

            case 'newAlbums':
                $query->orderBy([
                    '{{%album}}.number' => SORT_DESC
                ]);
                break;

            case 'favorite':
                $query
                    ->where(['{{%heart}}.creator' => $user])
                    ->orderBy(['heartUser.updated_at' => SORT_DESC]);
                break;

            case 'playlistTracks':
                $query->orderBy(['playlistContentTrack.updated_at' => SORT_ASC]);
                break;
        }

        $tracksData = GlobalFunctions::deleteFields(
            $query->asArray()->all(),
            ['album0', 'hearts0']
        );

        foreach($tracksData as $key => $value) {

            $tracksData[$key]['trackName'] = GlobalFunctions::getAbbreviated($value['trackName'], true, 22);
            $tracksData[$key]['artistName'] = GlobalFunctions::getAbbreviated($value['artistName'], true, 22);
            $tracksData[$key]['key'] = $key;
        }

        $trackId = null;

        if($track) {

            foreach($tracksData as $key => $value) {

                if($value['id'] === $track) {

                    $trackId = $key;
                    break;
                }
            }
        }

        return [
            'tracksData' => $tracksData,
            'trackId' => $trackId
        ];
    }
}