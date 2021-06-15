<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\components\CRUDButtonsWidget;

$this->title = Yii::t('app', 'Create track');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Tracks'), 'url' => Url::toRoute('index-raw')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget([
            'textCreate' => Yii::t('app', 'Fast create'),
            'urlCreate' => ['/track/fast-create', 'album' => $model->album],
            'crud' => 'c'
        ]) ?>
    </div>

    <?= $this->render('form', ['model' => $model]) ?>

</div>