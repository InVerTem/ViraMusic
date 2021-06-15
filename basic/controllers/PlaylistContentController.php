<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use app\models\User;
use app\models\Playlist;
use app\models\PlaylistContent;
use app\models\ContentType;

class PlaylistContentController extends Controller {

    public function behaviors() {

        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['create', 'delete'],
                'rules' => [
                    [
                        'actions' => ['create', 'delete'],
                        'allow' => true,
                        'roles' => ['@']
                    ]
                ]
            ]
        ];
    }

    public function beforeAction($action) {

        $modelId = Yii::$app->request->get('playlist');

        if($modelId) {

            $model = Playlist::findModel($modelId);
            $modelUser = User::getCurrentUserModel($model->creator);

        } else {

            throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
        }

        switch($action->id) {
            case 'create':
            case 'delete':
                $levelAccess = Yii::$app->user->id === $modelUser->id;
                break;
            default:
                $levelAccess = false;
                break;
        }

        if($levelAccess) {

            return parent::beforeAction($action);
        }

        throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['forbiddenMessage']));
    }

    public function actionCreate($playlist, $type, $content) {

        $model = PlaylistContent::find()
            ->where([
                '{{%playlist_content}}.playlist' => $playlist,
                '{{%playlist_content}}.type' => $type,
                '{{%playlist_content}}.content' => $content
            ])
            ->one();

        if($model) {

            $contentName = ContentType::getNameContent($model->content, $model->type0->name);

            Yii::$app->session->setFlash('success', Yii::t('app', '{name} already added.', ['name' => $contentName]));

            return $this->redirect(['/playlist/view', 'id' => $playlist]);
        }

        $model = new PlaylistContent();
        $model->playlist = $playlist;
        $model->type = $type;
        $model->content = $content;

        if($model->validate()) {

            if($model->save()) {

                $contentName = ContentType::getNameContent($model->content, $model->type0->name);

                Yii::$app->session->setFlash('success', Yii::t('app', '{name} added.', ['name' => $contentName]));

                return $this->redirect(['/playlist/view', 'id' => $playlist]);
            }

            throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
        }

        throw new ForbiddenHttpException(Yii::t('app', Yii::$app->params['savingErrorMessage']));
    }

    public function actionDelete($id, $playlist, $contentName) {

        $model = PlaylistContent::findModel($id);

        if($model->delete()) {

            Yii::$app->session->setFlash('success', Yii::t('app', '{name} deleted.', ['name' => $contentName]));
        }

        return $this->redirect(['/playlist/view', 'id' => $playlist]);
    }
}