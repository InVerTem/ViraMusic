<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\helpers\FileHelper;
use yii\web\Controller;
use yii\web\Cookie;
use app\models\User;
use app\models\SignupService;
use app\models\SignupForm;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\Artist;
use app\models\ArtistSearch;
use app\models\Album;
use app\models\AlbumSearch;
use app\models\Track;
use app\models\TrackSearch;
use app\models\Genre;
use app\models\Social;
use app\models\Language;
use app\models\SearchForm;
use app\models\Playlist;

class SiteController extends Controller {

    public function behaviors() {

        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['login', 'signup', 'signup-confirm', 'profile', 'logout', 'data-without-files', 'unnecessary-uploaded-files'],
                'rules' => [
                    [
                        'actions' => ['login', 'signup', 'signup-confirm'],
                        'allow' => true,
                        'roles' => ['?']
                    ],
                    [
                        'actions' => ['profile', 'logout', 'data-without-files', 'unnecessary-uploaded-files'],
                        'allow' => true,
                        'roles' => ['@']
                    ]
                ]
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ]
            ]
        ];
    }

    public function beforeAction($action) {

        switch($action->id) {
            case 'data-without-files':
            case 'unnecessary-uploaded-files':
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

    public function actions() {

        return [
            'error' => [
                'class' => 'yii\web\ErrorAction'
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null
            ]
        ];
    }

    public function actionIndex() {

        $modelsArtist = Artist::find()
            ->select([
                '{{%artist}}.*',
                'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
            ])
            ->joinWith('genres0')
            ->joinWith('socials0')
            ->joinWith('albums0')
            ->joinWith('hearts0')
            ->groupBy('{{%artist}}.id')
            ->orderBy([
                'heartsCount' => SORT_DESC,
                '{{%artist}}.id' => SORT_ASC
            ])
            ->limit(7)
            ->all();

        $modelsAlbum = Album::find()
            ->select([
                '{{%album}}.*',
                'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
            ])
            ->joinWith('artist0')
            ->joinWith('genres0')
            ->joinWith('tracks0')
            ->joinWith('hearts0')
            ->groupBy([
                '{{%album}}.artist',
                '{{%album}}.number',
                '{{%album}}.id'
            ])
            ->orderBy([
                'heartsCount' => SORT_DESC,
                '{{%album}}.id' => SORT_ASC
            ])
            ->limit(7)
            ->all();

        $modelsTrack = Track::find()
            ->select([
                '{{%track}}.*',
                'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
            ])
            ->joinWith('album0')
            ->joinWith('genres0')
            ->joinWith('hearts0')
            ->groupBy([
                '{{%album}}.artist',
                '{{%album}}.number',
                '{{%track}}.number',
                '{{%track}}.disk',
                '{{%track}}.id'
            ])
            ->orderBy([
                'heartsCount' => SORT_DESC,
                '{{%track}}.id' => SORT_ASC
            ])
            ->limit(7)
            ->all();

        $renderArray = [
            'modelsArtist' => $modelsArtist,
            'modelsAlbum' => $modelsAlbum,
            'modelsTrack' => $modelsTrack
        ];

        return Yii::$app->request->isAjax ? $this->renderAjax('index', $renderArray) : $this->render('index', $renderArray);
    }

    public function actionSearch($content = null) {

        $searchFormGET = Yii::$app->request->get('SearchForm');

        $name = $searchFormGET ? (isset($searchFormGET['name']) ? $searchFormGET['name'] : null) : null;
        $genre = $searchFormGET ? (isset($searchFormGET['genre']) ? $searchFormGET['genre'] : null) : null;

        $model = new SearchForm();

        $modelsArtist = $model->searchArtist(Yii::$app->request->get());
        $modelsAlbum = $model->searchAlbum(Yii::$app->request->get());
        $modelsTrack = $model->searchTrack(Yii::$app->request->get());

        $renderArray = [
            'model' => $model,
            'modelsArtist' => $modelsArtist,
            'modelsAlbum' => $modelsAlbum,
            'modelsTrack' => $modelsTrack,
            'name' => $name,
            'genre' => $genre,
            'content' => $content
        ];

        return Yii::$app->request->isAjax ? $this->renderAjax('search', $renderArray) : $this->render('search', $renderArray);
    }

    public function actionLogin() {

        $model = new LoginForm();

        if($model->load(Yii::$app->request->post()) && $model->login()) {

            return $this->goBack();
        }

        $model->password = '';

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('login', $renderArray) : $this->render('login', $renderArray);
    }

    public function actionSignup() {

        $model = new SignupForm();

        if($model->load(Yii::$app->request->post()) && $model->validate()) {

            $signupService = new SignupService();

            $user = $signupService->signup($model);
            Yii::$app->session->setFlash('success', Yii::t('app', 'Registration completed.'));
            // Yii::$app->session->setFlash('success', Yii::t('app', 'Check your email to confirm the registration.'));
            // $signupService->sentEmailConfirm($user);

            return $this->goHome();
        }

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('signup', $renderArray) : $this->render('signup', $renderArray);
    }

    // public function actionSignupConfirm($token) {

    //     $signupService = new SignupService();

    //     $signupService->confirmation($token);
    //     Yii::$app->session->setFlash('success', Yii::t('app', 'You have successfully confirmed your registration.'));

    //     return $this->goHome();
    // }

    public function actionProfile() {

        $model = User::getCurrentUserModel();
        $model->scenario = User::SCENARIO_CHANGE_ACCESS;

        if($model->load(Yii::$app->request->post()) && $model->validate()) {

            if($model->save()) {

                Yii::$app->session->setFlash('success', Yii::t('app', 'Access changed.'));

                return $this->redirect(['profile']);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        $renderArray = ['model' => $model];

        return Yii::$app->request->isAjax ? $this->renderAjax('profile', $renderArray) : $this->render('profile', $renderArray);
    }

    public function actionLogout() {

        Yii::$app->user->logout();

        return $this->goHome();
    }

    public function actionChangeLanguage($id) {

        $model = Language::findModel($id);

        if(Yii::$app->request->cookies->has('language')) {

            Yii::$app->response->cookies->remove('language');
        }

        Yii::$app->response->cookies->add(new Cookie([
            'name' => 'language',
            'value' => $model->code,
            'expire' => time() + 3600 * 24 * 30
        ]));

        return $this->goHome();
    }

    public function actionDataWithoutFiles() {

        $data = self::getDataWithoutFiles();

        $renderArray = ['data' => $data];

        return Yii::$app->request->isAjax ? $this->renderAjax('data-without-files', $renderArray) : $this->render('data-without-files', $renderArray);
    }

    public function actionUnnecessaryUploadedFiles() {

        $files = self::getUnnecessaryUploadedFiles();

        $renderArray = ['files' => $files];

        return Yii::$app->request->isAjax ? $this->renderAjax('unnecessary-uploaded-files', $renderArray) : $this->render('unnecessary-uploaded-files', $renderArray);
    }

    public function actionDeleteUnnecessaryUploadedFiles() {

        $files = self::getUnnecessaryUploadedFiles();

        foreach($files as $file) {

            $src = Yii::getAlias('@webroot') . "/uploads/{$file}";

            if(file_exists($src)) {

                unlink($src);
            }
        }

        Yii::$app->session->setFlash('success', Yii::t('app', 'Unnecessary uploaded files deleted.'));

        return $this->goHome();
    }

    public function getDataWithoutFiles() {

        $filesUploads = FileHelper::findFiles('uploads');
        $data = array_merge(
            Artist::find()->select(['id AS artist', 'name', 'image AS file'])->asArray()->all(),
            Album::find()->select(['id AS album', 'name', 'image AS file'])->asArray()->all(),
            Track::find()->select(['id AS track', 'name', 'file'])->asArray()->all(),
            Social::find()->select(['id AS social', 'name', 'image AS file'])->asArray()->all(),
            Playlist::find()->select(['id AS playlist', 'name', 'image AS file'])->asArray()->all()
        );

        $data0 = [];

        foreach($data as $content) {

            if(!in_array('uploads\\' . $content['file'], $filesUploads)) {

                $contentName = array_keys($content)[0];

                $data0[] = [
                    'id' => $content[$contentName],
                    'content' => $contentName,
                    'name' => $content['name'],
                    'file' => $content['file']
                ];
            }
        }

        return $data0;
    }

    public function getUnnecessaryUploadedFiles() {

        $filesUploads = FileHelper::findFiles('uploads');
        $filesInDB = array_merge(
            Artist::find()->select(['image AS file'])->column(),
            Album::find()->select(['image AS file'])->column(),
            Track::find()->select(['file'])->column(),
            Social::find()->select(['image AS file'])->column(),
            Playlist::find()->select(['image AS file'])->column()
        );

        $files = [];

        foreach($filesUploads as $file) {

            $file0 = substr($file, 8);

            if(!in_array($file0, $filesInDB)) {

                $files[] = $file0;
            }
        }

        return $files;
    }
}