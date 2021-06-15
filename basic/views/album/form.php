<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use app\models\Artist;
use app\components\GlobalFunctions;

?>

<?php $form = ActiveForm::begin([
    'id' => 'album-form',
    'options' => ['class' => 'vertical'],
    'fieldConfig' => [
        'labelOptions' => ['class' => null],
        'inputOptions' => ['class' => null],
        'hintOptions' => ['class' => null],
        'errorOptions' => ['class' => null]
    ]
]) ?>

    <?= $form->field($model, 'artist')->dropDownList(Artist::getArtists(), [
        'autofocus' => $this->context->action->id === 'create' ? true : false,
        'prompt' => ''
    ]) ?>
    <?= $form->field($model, 'number')->textInput(['type' => 'number']) ?>
    <?= $form->field($model, 'name')->textInput() ?>
    <?= $form->field($model, 'signature')->textInput() ?>
    <?= $form->field($model, 'year')->textInput(['type' => 'number']) ?>
    <?= $form->field($model, 'image')->fileInput() ?>

    <?php if($model->image): ?>

        <div>
            <div class="info line-grid">
                <?= GlobalFunctions::wrapperImage($model->image, true) ?>
                <p><?= $model->image ?></p>
            </div>
        </div>

        <?= $form->field($model, 'deleteImage')->checkbox(['template' => '<div>{input}{label}</div>']) ?>

    <?php endif ?>

    <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => null, 'name' => 'send']) ?>

<?php ActiveForm::end() ?>