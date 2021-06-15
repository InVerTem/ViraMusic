<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use app\models\AccessStatus;
use app\components\CRUDButtonsWidget;

$this->title = Yii::t('app', 'Profile');
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute('/site/profile')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <?php if(ADMINISTRATION): ?>

        <div class="grid-buttons">
            <?= CRUDButtonsWidget::widget([
                'dropdownItems' => [
                    CRUDButtonsWidget::widget([
                        'textRead' => Yii::t('app', 'Users'),
                        'urlRead' => ['/user/index-raw'],
                        'crud' => 'r'
                    ]),
                    CRUDButtonsWidget::widget([
                        'textRead' => Yii::t('app', 'Artists'),
                        'urlRead' => ['/artist/index-raw'],
                        'crud' => 'r'
                    ]),
                    CRUDButtonsWidget::widget([
                        'textRead' => Yii::t('app', 'Albums'),
                        'urlRead' => ['/album/index-raw'],
                        'crud' => 'r'
                    ]),
                    CRUDButtonsWidget::widget([
                        'textRead' => Yii::t('app', 'Tracks'),
                        'urlRead' => ['/track/index-raw'],
                        'crud' => 'r'
                    ]),
                    CRUDButtonsWidget::widget([
                        'textRead' => Yii::t('app', 'Genres'),
                        'urlRead' => ['/genre/index-raw'],
                        'crud' => 'r'
                    ]),
                    CRUDButtonsWidget::widget([
                        'textRead' => Yii::t('app', 'Socials'),
                        'urlRead' => ['/social/index-raw'],
                        'crud' => 'r'
                    ]),
                    CRUDButtonsWidget::widget([
                        'textRead' => Yii::t('app', 'Data without files'),
                        'urlRead' => ['/site/data-without-files'],
                        'crud' => 'r'
                    ]),
                    CRUDButtonsWidget::widget([
                        'textRead' => Yii::t('app', 'Unnecessary uploaded files'),
                        'urlRead' => ['/site/unnecessary-uploaded-files'],
                        'crud' => 'r'
                    ])
                ]
            ]) ?>
        </div>

    <?php endif ?>

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

        <?= $form->field($model, 'access')->dropDownList(AccessStatus::getStatuses()) ?>

        <?= Html::submitButton(Yii::t('app', 'Submit'), ['class' => null, 'name' => 'send']) ?>

    <?php ActiveForm::end() ?>

    <?= Html::a(Yii::t('app', 'Admin email') . ': ' . Yii::$app->params['adminEmail'], Url::to('mailto:' . Yii::$app->params['adminEmail'])) ?>

</div>