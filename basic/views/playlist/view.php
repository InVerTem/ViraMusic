<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Artist;
use app\models\Album;
use app\models\Track;
use app\models\Playlist;
use app\components\CRUDButtonsWidget;
use app\components\PlayButtonWidget;
use app\components\ContentIndexWidget;
use app\components\GlobalFunctions;

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Playlists'), 'url' => Url::toRoute('index')];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute(['view', 'id' => $model->id])];
?>

<?= $this->render('/layouts/content-title') ?>

<?php if(Yii::$app->user->id === $model->creator): ?>

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget([
            'id' => $model->id,
            'name' => $model->name,
            'crud' => 'ud'
        ]) ?>
    </div>

<?php endif ?>

<div class="view-title">

    <div class="info">

        <?= GlobalFunctions::wrapperImage($model->image) ?>
        <?= Html::a($model->name, ['view', 'id' => $model->id]) ?>

        <div class="controls">

            <?= PlayButtonWidget::widget([
                'type' => Playlist::CONTENT_TYPE_ID,
                'content' => $model->id,
                'text' => Yii::t('app', 'Listen')
            ]) ?>

        </div>

    </div>

</div>


<div class="view-grid">

    <div class="grid-navigation">

        <?= Html::a(Yii::t('app', 'Artists'), ['view', 'id' => $model->id, 'content' => 'artists'], $content === 'artists' ? ['class' => 'active'] : []) ?>
        <?= Html::a(Yii::t('app', 'Albums'), ['view', 'id' => $model->id, 'content' => 'albums'], $content === 'albums' ? ['class' => 'active'] : []) ?>
        <?= Html::a(Yii::t('app', 'Tracks'), ['view', 'id' => $model->id, 'content' => null], $content !== 'artists' && $content !== 'albums' ? ['class' => 'active'] : []) ?>

    </div>

</div>

<div class="view-grid">

    <?php switch($content):
        case 'artists': ?>
                <?= ContentIndexWidget::widget([
                    'models' => $model->getArtistsList(),
                    'typePlay' => Artist::CONTENT_TYPE_ID,
                    'typeHeart' => Artist::CONTENT_TYPE_ID,
                    'contentName' => 'artist'
                ]) ?>
            <?php break; ?>
        <?php case 'albums': ?>
                <?= ContentIndexWidget::widget([
                    'models' => $model->getAlbumsList(),
                    'typePlay' => Album::CONTENT_TYPE_ID,
                    'typeHeart' => Album::CONTENT_TYPE_ID,
                    'contentName' => 'album'
                ]) ?>
            <?php break; ?>
        <?php default: ?>
            <?= ContentIndexWidget::widget([
                'models' => $model->getTracksList(),
                'typePlay' => Playlist::CONTENT_TYPE_ID,
                'contentPlay' => $model->id,
                'typeHeart' => Track::CONTENT_TYPE_ID,
                'contentName' => 'track',
                'viewClass' => 'content-list',
                'order' => 'playlistTracks'
            ]) ?>
            <?php break; ?>
    <?php endswitch ?>

</div>