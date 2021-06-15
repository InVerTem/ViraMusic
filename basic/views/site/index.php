<?php

use app\models\Artist;
use app\models\Album;
use app\models\Track;
use app\components\ContentIndexWidget;

$this->title = Yii::t('app', 'Home');
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <p class="title"><?= Yii::t('app', 'Popular artists') ?></p>

    <?= ContentIndexWidget::widget([
        'models' => $modelsArtist,
        'typePlay' => Artist::CONTENT_TYPE_ID,
        'typeHeart' => Artist::CONTENT_TYPE_ID,
        'contentName' => 'artist',
        'showMore' => true
    ]) ?>

    <p class="title"><?= Yii::t('app', 'Popular albums') ?></p>

    <?= ContentIndexWidget::widget([
        'models' => $modelsAlbum,
        'typePlay' => Album::CONTENT_TYPE_ID,
        'typeHeart' => Album::CONTENT_TYPE_ID,
        'contentName' => 'album',
        'showMore' => true
    ]) ?>

    <p class="title"><?= Yii::t('app', 'Popular tracks') ?></p>

    <?= ContentIndexWidget::widget([
        'models' => $modelsTrack,
        'typePlay' => Track::CONTENT_TYPE_ID,
        'typeHeart' => Track::CONTENT_TYPE_ID,
        'contentName' => 'track',
        'showMore' => true
    ]) ?>

</div>