<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = Yii::t('app', 'Signup');
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute('signup')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <?php $form = ActiveForm::begin([
        'id' => 'signup-form',
        'options' => ['class' => 'vertical'],
        'fieldConfig' => [
            'labelOptions' => ['class' => null],
            'inputOptions' => ['class' => null],
            'hintOptions' => ['class' => null],
            'errorOptions' => ['class' => null]
        ],
    ]) ?>

        <?= $form->field($model, 'name')->textInput(['autofocus' => true]) ?>
        <?= $form->field($model, 'email') ?>
        <?= $form->field($model, 'password')->passwordInput() ?>
        <?= $form->field($model, 'repeatPassword')->passwordInput() ?>
        <?= $form->field($model, 'verifyCode')->widget(Captcha::className(), ['template' => '<div class="captcha">{image}{input}</div>']) ?>

        <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => null, 'name' => 'send']) ?>

    <?php ActiveForm::end() ?>

</div>