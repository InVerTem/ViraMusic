<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use app\models\Genre;

?>

<?php $form = ActiveForm::begin([
    'id' => 'genre-contact-form',
    'options' => ['class' => 'vertical'],
    'fieldConfig' => [
        'labelOptions' => ['class' => null],
        'inputOptions' => ['class' => null],
        'hintOptions' => ['class' => null],
        'errorOptions' => ['class' => null]
    ]
]) ?>

    <?= $form->field($model, 'genre')->dropDownList(Genre::getGenres(), [
        'autofocus' => $this->context->action->id === 'create' ? true : false,
        'prompt' => ''
    ]) ?>

    <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => null, 'name' => 'send']) ?>

<?php ActiveForm::end() ?>