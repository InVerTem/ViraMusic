<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use app\models\Artist;
use app\components\CRUDButtonsWidget;

$this->title = Yii::t('app', 'Update social');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Artists'), 'url' => Url::toRoute('/artist/index-raw')];
$this->params['breadcrumbs'][] = ['label' => $model->artist0->name, 'url' => Url::to(['/artist/view-raw', 'id' => $model->artist])];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget([
            'id' => $model->id,
            'name' => Yii::t('app', $model->social0->name),
            'crud' => 'd',
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