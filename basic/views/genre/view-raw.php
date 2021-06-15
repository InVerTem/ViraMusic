<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\components\CRUDButtonsWidget;
use app\components\GlobalFunctions;

$this->title = Yii::t('app', $model->name);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Genres'), 'url' => Url::toRoute('index-raw')];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute(['view-raw', 'id' => $model->id])];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget([
            'id' => $model->id,
            'name' => Yii::t('app', $model->name),
            'crud' => 'ud'
        ]) ?>
    </div>

    <div class="view-raw-grid">

        <div>
            <p class="signature"><?= $model->getAttributeLabel('id') ?></p>
            <p><?= $model->id ?></p>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('name') ?></p>
            <p><?= Html::a(Yii::t('app', $model->name), ['view-raw', 'id' => $model->id]) ?></p>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('creator') ?></p>
            <?= Html::a($model->creator0->name, ['/user/view-raw', 'id' => $model->creator0->id]) ?>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('editor') ?></p>
            <?= Html::a($model->editor0->name, ['/user/view-raw', 'id' => $model->editor0->id]) ?>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('created_at') ?></p>
            <?= GlobalFunctions::wrapperDate($model->created_at) ?>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('updated_at') ?></p>
            <?= GlobalFunctions::wrapperDate($model->updated_at) ?>
        </div>

    </div>

</div>