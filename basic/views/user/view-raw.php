<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\components\CRUDButtonsWidget;
use app\components\GlobalFunctions;

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Users'), 'url' => Url::toRoute('index-raw')];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute(['view-raw', 'id' => $model->id])];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget([
            'id' => $model->id,
            'name' => $model->name,
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
            <p><?= Html::a($model->name, ['view-raw', 'id' => $model->id]) ?></p>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('email') ?></p>
            <p><?= $model->email ?></p>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('type') ?></p>
            <p><?= Yii::t('app', $model->type0->name) ?></p>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('status') ?></p>
            <p><?= Yii::t('app', $model->status0->name) ?></p>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('access') ?></p>
            <p><?= Yii::t('app', $model->access0->name) ?></p>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('last_visit') ?></p>
            <?= GlobalFunctions::wrapperDate($model->last_visit) ?>
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