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
use app\components\SocialsWidget;
use app\components\GlobalFunctions;

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => $model->album0->artist0->name, 'url' => Url::toRoute(['/artist/view', 'id' => $model->album0->artist0->id])];
$this->params['breadcrumbs'][] = ['label' => $model->album0->name, 'url' => Url::toRoute(['/album/view', 'id' => $model->album0->id])];
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
                        'urlCreate' => ['/genre-content/create', 'type' => Track::CONTENT_TYPE_ID, 'content' => $model->id],
                        'crud' => 'c'
                    ])
                ]
            ]) ?>
        </div>

    <?php endif ?>

    <div class="view-title">

        <div class="info">

            <?= GlobalFunctions::wrapperImage($model->album0->image) ?>
            <?= Html::a($model->name, ['view', 'id' => $model->id]) ?>
            <?= GlobalFunctions::getListOnModels($model->getGenresList(), Genre::CONTENT_TYPE_ID, 'search-genre') ?>

            <div class="controls">

                <?= HeartButtonWidget::widget([
                    'type' => Track::CONTENT_TYPE_ID,
                    'content' => $model->id,
                    'heartStatus' => $model->checkHeart(),
                    'count' => count($model->hearts0)
                ]) ?>
                <?= PlayButtonWidget::widget([
                    'type' => Track::CONTENT_TYPE_ID,
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
                        implode('', Playlist::getPlaylistsList(Track::CONTENT_TYPE_ID, $model->id))
                    ]
                ]) ?>

            </div>

        </div>

        <div class="additional-info">

            <p>
                <?php if($model->signature): ?>
                        <?= $model->getAttributeLabel('signature') ?>: <?= $model->signature ?>
                    <br>
                <?php endif ?>
                <?= $model->getAttributeLabel('playtime') ?>: <?= $model->playtime ?>
            </p>
            <?= SocialsWidget::widget(['models' => $model->album0->artist0->socials0]) ?>

        </div>

    </div>

</div>