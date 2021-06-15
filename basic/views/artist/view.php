<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Artist;
use app\models\Album;
use app\models\Track;
use app\models\Genre;
use app\models\Playlist;
use app\components\ContentIndexWidget;
use app\components\CRUDButtonsWidget;
use app\components\PlayButtonWidget;
use app\components\HeartButtonWidget;
use app\components\SocialsWidget;
use app\components\GlobalFunctions;

$this->title = $model->name;
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
                        'urlCreate' => ['/genre-content/create', 'type' => Artist::CONTENT_TYPE_ID, 'content' => $model->id],
                        'crud' => 'c'
                    ]),
                    CRUDButtonsWidget::widget([
                        'textCreate' => Yii::t('app', 'Add social'),
                        'urlCreate' => ['/social-content/create', 'artist' => $model->id],
                        'crud' => 'c'
                    ]),
                        CRUDButtonsWidget::widget([
                        'textCreate' => Yii::t('app', 'Create album'),
                        'urlCreate' => ['/album/create', 'artist' => $model->id],
                        'crud' => 'c'
                    ]),
                    (isset($model->albums0[0]->id) ? CRUDButtonsWidget::widget([
                        'textCreate' => Yii::t('app', 'Create track'),
                        'urlCreate' => ['/track/create', 'album' => $model->albums0[0]->id],
                        'crud' => 'c'
                    ]) .
                    CRUDButtonsWidget::widget([
                        'textCreate' => Yii::t('app', 'Create tracks'),
                        'urlCreate' => ['/track/fast-create', 'album' => $model->albums0[0]->id],
                        'crud' => 'c'
                    ]) : '')
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
                    'type' => Artist::CONTENT_TYPE_ID,
                    'content' => $model->id,
                    'heartStatus' => $model->checkHeart(),
                    'count' => count($model->hearts0)
                ]) ?>
                <?= PlayButtonWidget::widget([
                    'type' => Artist::CONTENT_TYPE_ID,
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
                        implode('', Playlist::getPlaylistsList(Artist::CONTENT_TYPE_ID, $model->id))
                    ]
                ]) ?>
            </div>

        </div>

        <?= SocialsWidget::widget(['models' => $model->socials0]) ?>

    </div>

    <div class="grid-navigation">

        <?= Html::a(Yii::t('app', 'Home'), ['view', 'id' => $model->id, 'content' => null], $content !== 'albums' && $content !== 'tracks' && $content !== 'info' ? ['class' => 'active'] : []) ?>
        <?= Html::a(Yii::t('app', 'Albums'), ['view', 'id' => $model->id, 'content' => 'albums'], $content === 'albums' ? ['class' => 'active'] : []) ?>
        <?= Html::a(Yii::t('app', 'Tracks'), ['view', 'id' => $model->id, 'content' => 'tracks'], $content === 'tracks' ? ['class' => 'active'] : []) ?>
        <?= Html::a(Yii::t('app', 'Info'), ['view', 'id' => $model->id, 'content' => 'info'], $content === 'info' ? ['class' => 'active'] : []) ?>

    </div>

</div>

<div class="view-grid">

    <?php switch($content):
        case 'albums': ?>
                <?= ContentIndexWidget::widget([
                    'models' => $models,
                    'typePlay' => Album::CONTENT_TYPE_ID,
                    'typeHeart' => Album::CONTENT_TYPE_ID,
                    'contentName' => 'album'
                ]) ?>
            <?php break; ?>
        <?php case 'tracks': ?>
                <?php foreach($models as $album): ?>

                    <p class="title"><?= $album->name ?></p>

                    <?= ContentIndexWidget::widget([
                        'models' => $album->tracks0,
                        'typePlay' => Artist::CONTENT_TYPE_ID,
                        'contentPlay' => $album->artist,
                        'typeHeart' => Track::CONTENT_TYPE_ID,
                        'contentName' => 'track',
                        'viewClass' => 'content-list',
                        'order' => 'newAlbums',
                        'viewAlbum' => false
                    ]) ?>

                <?php endforeach ?>
            <?php break; ?>
        <?php case 'info': ?>
                <p class="text-info"><?= Yii::t('app', $model->info) ?></p>
            <?php break; ?>
        <?php default: ?>
                <p class="title"><?= Yii::t('app', 'Popular tracks') ?></p>

                <?= ContentIndexWidget::widget([
                    'models' => $models,
                    'typePlay' => Artist::CONTENT_TYPE_ID,
                    'contentPlay' => $model->id,
                    'typeHeart' => Track::CONTENT_TYPE_ID,
                    'contentName' => 'track',
                    'viewClass' => 'content-list',
                    'order' => 'popularTracks'
                ]) ?>
            <?php break; ?>
    <?php endswitch ?>

</div>