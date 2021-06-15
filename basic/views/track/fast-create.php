<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use yii\bootstrap\ActiveForm;
use app\models\Artist;

$this->title = Yii::t('app', 'Fast create tracks');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Tracks'), 'url' => Url::toRoute('index-raw')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <?php $form = ActiveForm::begin([
        'id' => 'contact-form',
        'options' => ['class' => 'vertical'],
        'fieldConfig' => [
            'labelOptions' => ['class' => null],
            'inputOptions' => ['class' => null],
            'hintOptions' => ['class' => null],
            'errorOptions' => ['class' => null]
        ]
    ]) ?>

        <?= $form->field($model, 'album')->dropDownList(Artist::getArtistsWithAlbums(), [
            'autofocus' => true,
            'prompt' => ''
        ]) ?>
        <?= $form->field($model, 'files[]')->fileInput(['multiple' => true]) ?>

        <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => null, 'name' => 'send']) ?>

    <?php ActiveForm::end() ?>

</div>