<?php

use yii\helpers\Url;

$this->title = Yii::t('app', 'Create album');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Albums'), 'url' => Url::toRoute('index-raw')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <?= $this->render('form', ['model' => $model]) ?>

</div>