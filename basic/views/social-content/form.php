<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use app\models\Social;

?>

<?php $form = ActiveForm::begin([
    'id' => 'social-content-form',
    'options' => ['class' => 'vertical'],
    'fieldConfig' => [
        'labelOptions' => ['class' => null],
        'inputOptions' => ['class' => null],
        'hintOptions' => ['class' => null],
        'errorOptions' => ['class' => null]
    ]
]) ?>

    <?= $form->field($model, 'social')->dropDownList(Social::getSocials(), [
        'autofocus' => $this->context->action->id === 'create' ? true : false,
        'prompt' => ''
    ]) ?>
    <?= $form->field($model, 'url')->textInput() ?>

    <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => null, 'name' => 'send']) ?>

<?php ActiveForm::end() ?>