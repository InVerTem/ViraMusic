<?php

use yii\helpers\Url;
use yii\helpers\Html;
use app\models\Artist;
use app\models\Album;
use app\models\Track;
use app\models\Playlist;
use app\components\CRUDButtonsWidget;
use app\components\ContentIndexWidget;

$this->title = Yii::t('app', 'Playlists');
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute('index')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget([
            'crud' => 'c',
        ]) ?>
    </div>

    <?= ContentIndexWidget::widget([
        'models' => $models,
        'typePlay' => Playlist::CONTENT_TYPE_ID,
        'typeHeart' => Track::CONTENT_TYPE_ID,
        'contentName' => 'playlist'
    ]) ?>

</div>