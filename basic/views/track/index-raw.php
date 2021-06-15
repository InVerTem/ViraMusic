<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\components\CRUDButtonsWidget;
use app\components\PaginationWidget;

$this->title = Yii::t('app', 'Tracks');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute('index-raw')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget(['crud' => 'c']) ?>
    </div>

    <?= $this->render('grid-view', [
        'dataProvider' => $dataProvider,
        'searchModel' => $searchModel
    ]) ?>

    <?= PaginationWidget::widget([
        'dataProvider' => $dataProvider,
        'isAll' => $isAll,
        'view' => 'index-raw'
    ]) ?>

</div>