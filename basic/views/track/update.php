<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Track;
use app\models\Genre;
use app\components\CRUDButtonsWidget;

$this->title = Yii::t('app', 'Update track');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Tracks'), 'url' => Url::toRoute('index-raw')];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => Url::toRoute(['view-raw', 'id' => $model->id])];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget([
            'id' => $model->id,
            'name' => $model->name,
            'crud' => 'rd',
            'dropdownItems' => [
                CRUDButtonsWidget::widget([
                    'textCreate' => Yii::t('app', 'Add genre'),
                    'urlCreate' => ['/genre-content/create', 'type' => Track::CONTENT_TYPE_ID, 'content' => $model->id],
                    'crud' => 'c'
                ])
            ]
        ]) ?>
    </div>

    <?= $this->render('form', [
        'model' => $model,
        'dataProviderGenres' => $dataProviderGenres
    ]) ?>

    <div class="view-raw-grid">

        <div>

            <p class="signature"><?= $model->getAttributeLabel('genres') ?></p>
            <?= $this->render('/genre-content/grid-view', ['dataProvider' => $dataProviderGenres]) ?>

        </div>

    </div>

</div>