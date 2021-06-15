<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Artist;
use app\models\Genre;
use app\components\CRUDButtonsWidget;

$this->title = Yii::t('app', 'Update playlist');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Playlists'), 'url' => Url::toRoute('index')];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => Url::toRoute(['view', 'id' => $model->id])];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget([
            'id' => $model->id,
            'name' => $model->name,
            'crud' => 'rd',
            'urlRead' => ['/playlist/view/', 'id' => $model->id]
        ]) ?>
    </div>

    <?= $this->render('form', ['model' => $model]) ?>

    <div class="view-raw-grid">

        <div>

            <p class="signature"><?= $model->getAttributeLabel('genres') ?></p>
            <?= $this->render('/playlist-content/grid-view', ['dataProvider' => $dataProviderPlaylistContent]) ?>

        </div>

    </div>

</div>