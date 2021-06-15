<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\components\CRUDButtonsWidget;
use app\components\GlobalFunctions;

$this->title = Yii::t('app', 'Data without files');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute('data-without-files')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="view-raw-grid">

        <?php foreach($data as $value): ?>

            <div>

                <p class="signature"><?= $value['content'] ?></p>
                <?= Html::a($value['name'], ["/{$value['content']}/update", 'id' => $value['id']]) ?>

            </div>

        <?php endforeach ?>

    </div>

</div>