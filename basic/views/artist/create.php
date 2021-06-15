<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;

$this->title = Yii::t('app', 'Create artist');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Artists'), 'url' => Url::toRoute('index-raw')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <?= $this->render('form', ['model' => $model]) ?>

</div>