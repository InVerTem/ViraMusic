<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\FileHelper;
use app\components\CRUDButtonsWidget;
use app\components\GlobalFunctions;

$this->title = Yii::t('app', 'Unnecessary uploaded files');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute('unnecessary-uploaded-files')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget([
            'name' => Yii::t('app', 'Unnecessary uploaded files'),
            'textDelete' => Yii::t('app', 'Delete unnecessary uploaded files'),
            'urlDelete' => ['/site/delete-unnecessary-uploaded-files'],
            'crud' => 'd'
        ]) ?>
    </div>

    <div class="view-raw-grid">

        <?php foreach($files as $file): ?>

            <div>

                <p class="signature"><?= FileHelper::getMimeType("uploads/{$file}") ?></p>
                <div class="line-grid">
                    <?= GlobalFunctions::wrapperImage($file, true) ?>
                    <p><?= $file ?></p>
                </div>

            </div>

        <?php endforeach ?>

    </div>

</div>