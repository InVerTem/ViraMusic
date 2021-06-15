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
use app\models\Album;
use app\models\Track;
use app\models\AccessStatus;

class FavoriteController extends Controller {

    public function behaviors() {

        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index'],
                'rules' => [
                    [
                        'actions' => ['index'],
                        'allow' => true,
                        'roles' => ['@']
                    ]
                ]
            ]
        ];
    }

    public function beforeAction($action) {

        $userId = Yii::$app->request->get('user');

        if($userId) {

            $modelUser = User::findModel($userId);

            if(
                Yii::$app->user->id === $modelUser->id ||
                $modelUser->access ===  AccessStatus::ACCESS_STATUS_PUBLIC
            ) {

                return parent::beforeAction($action);
            }

        } else {

            throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
        }

        throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['forbiddenMessage']));
    }

    public function actionIndex($user, $content = null) {

        $modelUser = User::findModel($user);

        switch($content) {
            case 'artists':
                $models = Artist::find()
                    ->select([
                        '{{%artist}}.*',
                        'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
                    ])
                    ->joinWith('genres0')
                    ->joinWith('socials0')
                    ->joinWith('albums0')
                    ->joinWith('hearts0')
                    ->leftJoin('{{%heart}} heartUser', 'heartUser.type = ' . Artist::CONTENT_TYPE_ID . ' AND heartUser.content = {{%artist}}.id')
                    ->where(['{{%heart}}.creator' => $user])
                    ->groupBy([
                        '{{%artist}}.id',
                        'heartUser.updated_at'
                    ])
                    ->orderBy(['heartUser.updated_at' => SORT_DESC])
                    ->all();
                break;
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
                    ->leftJoin('{{%heart}} heartUser', 'heartUser.type = ' . Album::CONTENT_TYPE_ID . ' AND heartUser.content = {{%album}}.id')
                    ->where(['{{%heart}}.creator' => $user])
                    ->groupBy([
                        '{{%album}}.id',
                        'heartUser.updated_at'
                    ])
                    ->orderBy(['heartUser.updated_at' => SORT_DESC])
                    ->all();
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
                    ->leftJoin('{{%heart}} heartUser', 'heartUser.type = ' . Track::CONTENT_TYPE_ID . ' AND heartUser.content = {{%track}}.id')
                    ->where(['{{%heart}}.creator' => $user])
                    ->groupBy([
                        '{{%track}}.id',
                        'heartUser.updated_at'
                    ])
                    ->orderBy(['heartUser.updated_at' => SORT_DESC])
                    ->all();
                break;
        }

        $renderArray = [
            'models' => $models,
            'modelUser' => $modelUser,
            'content' => $content
        ];

        return Yii::$app->request->isAjax ? $this->renderAjax('index', $renderArray) : $this->render('index', $renderArray);
    }
}