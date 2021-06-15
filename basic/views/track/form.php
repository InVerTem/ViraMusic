<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use app\models\Artist;
use app\components\CRUDButtonsWidget;

?>

<?php $form = ActiveForm::begin([
    'id' => 'track-form',
    'options' => ['class' => 'vertical'],
    'fieldConfig' => [
        'labelOptions' => ['class' => null],
        'inputOptions' => ['class' => null],
        'hintOptions' => ['class' => null],
        'errorOptions' => ['class' => null]
    ]
]) ?>

    <?= $form->field($model, 'album')->dropDownList(Artist::getArtistsWithAlbums(), [
        'autofocus' => $this->context->action->id === 'create' ? true : false,
        'prompt' => ''
    ]) ?>
    <?= $form->field($model, 'disk')->textInput(['type' => 'number']) ?>
    <?= $form->field($model, 'number')->textInput(['type' => 'number']) ?>
    <?= $form->field($model, 'name')->textInput() ?>
    <?= $form->field($model, 'signature')->textInput() ?>
    <?= $form->field($model, 'file')->fileInput() ?>

    <?php if($model->file): ?>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('file') ?></p>
            <div class="info line-grid">
                <p><?= $model->file ?></p>
            </div>
        </div>

        <?= $form->field($model, 'deleteFile')->checkbox(['template' => '<div>{input}{label}</div>']) ?>

    <?php endif ?>

    <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => null, 'name' => 'send']) ?>

<?php ActiveForm::end() ?>