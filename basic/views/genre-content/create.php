<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\components\CRUDButtonsWidget;

$this->title = Yii::t('app', 'Add genre');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', ucfirst($contentName) . 's'), 'url' => Url::toRoute('/' . $contentName . '/index-raw')];
$this->params['breadcrumbs'][] = ['label' => $contentModel->name, 'url' => Url::to(['/' . $contentName . '/view-raw', 'id' => $model->content])];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget([
            'dropdownItems' => [
                CRUDButtonsWidget::widget([
                    'textCreate' => Yii::t('app', 'Create genre'),
                    'urlCreate' => ['/genre/create'],
                    'crud' => 'c'
                ])
            ]
        ]) ?>
    </div>

    <?= $this->render('form', ['model' => $model]) ?>

</div>