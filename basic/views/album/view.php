<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Artist;
use app\models\Album;
use app\models\Track;
use app\models\Genre;
use app\models\Playlist;
use app\components\CRUDButtonsWidget;
use app\components\PlayButtonWidget;
use app\components\HeartButtonWidget;
use app\components\ContentIndexWidget;
use app\components\SocialsWidget;
use app\components\GlobalFunctions;

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => $model->artist0->name, 'url' => Url::toRoute(['/artist/view', 'id' => $model->artist0->id])];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute(['view', 'id' => $model->id])];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <?php if(ADMINISTRATION): ?>

        <div class="grid-buttons">
            <?= CRUDButtonsWidget::widget([
                'id' => $model->id,
                'name' => $model->name,
                'crud' => 'rud',
                'dropdownItems' => [
                    CRUDButtonsWidget::widget([
                        'textCreate' => Yii::t('app', 'Add genre'),
                        'urlCreate' => ['/genre-content/create', 'type' => Album::CONTENT_TYPE_ID, 'content' => $model->id],
                        'crud' => 'c'
                    ]),
                    CRUDButtonsWidget::widget([
                        'textCreate' => Yii::t('app', 'Create track'),
                        'urlCreate' => ['/track/create', 'album' => $model->id],
                        'crud' => 'c'
                    ]),
                    CRUDButtonsWidget::widget([
                        'textCreate' => Yii::t('app', 'Create tracks'),
                        'urlCreate' => ['/track/fast-create', 'album' => $model->id],
                        'crud' => 'c'
                    ])
                ]
            ]) ?>
        </div>

    <?php endif ?>

    <div class="view-title">

        <div class="info">

            <?= GlobalFunctions::wrapperImage($model->image) ?>
            <?= Html::a($model->name, ['view', 'id' => $model->id]) ?>
            <?= GlobalFunctions::getListOnModels($model->getGenresList(), Genre::CONTENT_TYPE_ID, 'search-genre') ?>

            <div class="controls">

                <?= HeartButtonWidget::widget([
                    'type' => Album::CONTENT_TYPE_ID,
                    'content' => $model->id,
                    'heartStatus' => $model->checkHeart(),
                    'count' => count($model->hearts0)
                ]) ?>
                <?= PlayButtonWidget::widget([
                    'type' => Album::CONTENT_TYPE_ID,
                    'content' => $model->id,
                    'text' => Yii::t('app', 'Listen')
                ]) ?>
                <?= CRUDButtonsWidget::widget([
                    'id' => $model->id,
                    'dropdownLink' => Yii::t('app', 'Add in'),
                    'dropdownItems' => [
                        CRUDButtonsWidget::widget([
                            'crud' => 'c',
                            'textCreate' => Yii::t('app', 'Create playlist'),
                            'urlCreate' => ['/playlist/create']
                        ]),
                        implode('', Playlist::getPlaylistsList(Album::CONTENT_TYPE_ID, $model->id))
                    ]
                ]) ?>

            </div>

        </div>

        <div class="additional-info">

            <p>
                <?php if($model->signature): ?>
                        <?= Yii::t('app', 'Signature') ?>: <?= $model->signature ?>
                    <br>
                <?php endif ?>
                <?= Yii::t('app', 'Year') ?>: <?= $model->year ?>
            </p>
            <?= SocialsWidget::widget(['models' => $model->artist0->socials0]) ?>

        </div>

    </div>

    <?= ContentIndexWidget::widget([
        'models' => $model->tracks0,
        'typePlay' => Album::CONTENT_TYPE_ID,
        'contentPlay' => $model->id,
        'typeHeart' => Track::CONTENT_TYPE_ID,
        'contentName' => 'track',
        'viewClass' => 'content-list',
        'viewAlbum' => false
    ]) ?>

</div>