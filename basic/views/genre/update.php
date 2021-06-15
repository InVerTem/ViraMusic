<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\components\CRUDButtonsWidget;

$this->title = Yii::t('app', 'Update genre');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Genres'), 'url' => Url::toRoute('index-raw')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', $model->name), 'url' => Url::toRoute(['view-raw', 'id' => $model->id])];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget([
            'id' => $model->id,
            'name' => Yii::t('app', $model->name),
            'crud' => 'rd'
        ]) ?>
    </div>

    <?= $this->render('form', ['model' => $model]) ?>

</div>