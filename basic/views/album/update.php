<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Album;
use app\models\Genre;
use app\components\CRUDButtonsWidget;

$this->title = 'Update album';
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Albums'), 'url' => Url::toRoute('index-raw')];
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

    <?= $this->render('form', [
        'model' => $model,
        'dataProviderGenres' => $dataProviderGenres
    ]) ?>

    <div class="view-raw-grid">

        <div>

            <p class="signature"><?= $model->getAttributeLabel('genres') ?></p>
            <?= $this->render('/genre-content/grid-view', ['dataProvider' => $dataProviderGenres]) ?>

        </div>

        <div>

            <p class="signature"><?= $model->getAttributeLabel('tracks') ?></p>
            <?= $this->render('/track/grid-view', ['dataProvider' => $dataProviderTracks]) ?>

        </div>

    </div>

</div>