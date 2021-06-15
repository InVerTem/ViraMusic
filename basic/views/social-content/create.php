<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\components\CRUDButtonsWidget;

$this->title = Yii::t('app', 'Add social');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Artists'), 'url' => Url::toRoute('index-raw')];
$this->params['breadcrumbs'][] = ['label' => $artistModel->name, 'url' => Url::to(['/artist/view-raw', 'id' => $model->artist])];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget([
            'dropdownItems' => [
                CRUDButtonsWidget::widget([
                    'textCreate' => Yii::t('app', 'Create social'),
                    'urlCreate' => ['/social/create'],
                    'crud' => 'c'
                ])
            ]
        ]) ?>
    </div>

    <?= $this->render('form', ['model' => $model]) ?>

</div>