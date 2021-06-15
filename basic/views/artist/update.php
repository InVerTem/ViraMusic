<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Artist;
use app\models\Genre;
use app\components\CRUDButtonsWidget;

$this->title = Yii::t('app', 'Update artist');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Artists'), 'url' => Url::toRoute('index-raw')];
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

    <?= $this->render('form', [
        'model' => $model,
        'dataProviderGenres' => $dataProviderGenres,
        'dataProviderSocials' => $dataProviderSocials,
        'dataProviderAlbums' => $dataProviderAlbums
    ]) ?>

    <div class="view-raw-grid">

        <div>

            <p class="signature"><?= $model->getAttributeLabel('genres') ?></p>
            <?= $this->render('/genre-content/grid-view', ['dataProvider' => $dataProviderGenres]) ?>

        </div>

        <div>

            <p class="signature"><?= $model->getAttributeLabel('socials') ?></p>
            <?= $this->render('/social-content/grid-view', ['dataProvider' => $dataProviderSocials]) ?>

        </div>

        <div>

            <p class="signature"><?= $model->getAttributeLabel('albums') ?></p>
            <?= $this->render('/album/grid-view', ['dataProvider' => $dataProviderAlbums]) ?>

        </div>

        <div>

            <p class="signature"><?= $model->getAttributeLabel('tracks') ?></p>
            <?= $this->render('/track/grid-view', ['dataProvider' => $dataProviderTracks]) ?>

        </div>

    </div>

</div>