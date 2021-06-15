<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;

$this->title = Yii::t('app', 'Create playlist');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Playlists'), 'url' => Url::toRoute('index')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <?= $this->render('form', ['model' => $model]) ?>

</div>