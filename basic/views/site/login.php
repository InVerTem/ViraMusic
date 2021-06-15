<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = Yii::t('app', 'Login');
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute('login')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <?php $form = ActiveForm::begin([
        'id' => 'login-form',
        'options' => ['class' => 'vertical'],
        'fieldConfig' => [
            'labelOptions' => ['class' => null],
            'inputOptions' => ['class' => null],
            'hintOptions' => ['class' => null],
            'errorOptions' => ['class' => null],
        ],
    ]) ?>

        <?= $form->field($model, 'nameOrEmail')->textInput(['autofocus' => true]) ?>
        <?= $form->field($model, 'password')->passwordInput() ?>
        <?= $form->field($model, 'rememberMe')->checkbox(['template' => '<div>{input}{label}</div>']) ?>

        <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => null, 'name' => 'send']) ?>

    <?php ActiveForm::end() ?>

</div>