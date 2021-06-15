<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Artist;
use app\models\Album;
use app\models\Track;
use app\components\ContentIndexWidget;

$this->title = Yii::t('app', 'Favorite');
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute(['/favorite', 'user' => $modelUser->id])];
?>

<?= $this->render('/layouts/content-title') ?>

<?php if(Yii::$app->user->id != $modelUser->id): ?>
    <p class="title"><?= Yii::t('app', 'User') ?>: <?= $modelUser->name ?></p>
<?php endif ?>

<div class="view-grid">

    <div class="grid-navigation">

        <?= Html::a(Yii::t('app', 'Artists'), ['/favorite', 'user' => $modelUser->id, 'content' => 'artists'], $content === 'artists' ? ['class' => 'active'] : []) ?>
        <?= Html::a(Yii::t('app', 'Albums'), ['/favorite', 'user' => $modelUser->id, 'content' => 'albums'], $content === 'albums' ? ['class' => 'active'] : []) ?>
        <?= Html::a(Yii::t('app', 'Tracks'), ['/favorite', 'user' => $modelUser->id, 'content' => null], $content !== 'artists' && $content !== 'albums' ? ['class' => 'active'] : []) ?>

    </div>

</div>

<div class="view-grid">

    <?php switch($content):
        case 'artists': ?>
                <?= ContentIndexWidget::widget([
                    'models' => $models,
                    'typePlay' => Artist::CONTENT_TYPE_ID,
                    'typeHeart' => Artist::CONTENT_TYPE_ID,
                    'contentName' => 'artist',
                    'user' => $modelUser->id
                ]) ?>
            <?php break; ?>
        <?php case 'albums': ?>
                <?= ContentIndexWidget::widget([
                    'models' => $models,
                    'typePlay' => Album::CONTENT_TYPE_ID,
                    'typeHeart' => Album::CONTENT_TYPE_ID,
                    'contentName' => 'album',
                    'user' => $modelUser->id
                ]) ?>
            <?php break; ?>
        <?php default: ?>
                <?= ContentIndexWidget::widget([
                    'models' => $models,
                    'typePlay' => Track::CONTENT_TYPE_ID,
                    'typeHeart' => Track::CONTENT_TYPE_ID,
                    'contentName' => 'track',
                    'viewClass' => 'content-list',
                    'order' => 'favorite',
                    'user' => $modelUser->id
                ]) ?>
            <?php break; ?>
    <?php endswitch ?>

</div>