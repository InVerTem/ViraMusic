<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use app\models\UserType;
use app\models\UserStatus;
use app\models\AccessStatus;

?>

<?php $form = ActiveForm::begin([
    'id' => 'user-form',
    'options' => ['class' => 'vertical'],
    'fieldConfig' => [
        'labelOptions' => ['class' => null],
        'inputOptions' => ['class' => null],
        'hintOptions' => ['class' => null],
        'errorOptions' => ['class' => null]
    ]
]) ?>

    <?= $form->field($model, 'name')->textInput(['autofocus' => true]) ?>
    <?= $form->field($model, 'email')->textInput() ?>
    <?= $form->field($model, 'type')->dropDownList(UserType::getUserTypes()) ?>
    <?= $form->field($model, 'status')->dropDownList(UserStatus::getUserStatuses()) ?>
    <?= $form->field($model, 'access')->dropDownList(AccessStatus::getStatuses()) ?>

    <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => null, 'name' => 'send']) ?>

<?php ActiveForm::end() ?>