<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Track;
use app\models\Genre;
use app\components\CRUDButtonsWidget;
use app\components\PlayButtonWidget;
use app\components\GlobalFunctions;

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Tracks'), 'url' => Url::toRoute('index-raw')];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute(['view-raw', 'id' => $model->id])];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget([
            'id' => $model->id,
            'name' => $model->name,
            'crud' => 'ud',
            'dropdownItems' => [
                CRUDButtonsWidget::widget([
                    'textCreate' => Yii::t('app', 'Add genre'),
                    'urlCreate' => ['/genre-content/create', 'type' => Track::CONTENT_TYPE_ID, 'content' => $model->id],
                    'crud' => 'c'
                ])
            ]
        ]) ?>
    </div>

    <div class="view-raw-grid">

        <div>
            <p class="signature"><?= $model->getAttributeLabel('id') ?></p>
            <p><?= $model->id ?></p>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('artist') ?></p>
            <?= Html::a($model->album0->artist0->name, ['/artist/view-raw', 'id' => $model->album0->artist0->id]) ?>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('album') ?></p>
            <?= Html::a($model->album0->name, ['/album/view-raw', 'id' => $model->album0->id]) ?>
        </div>

        <?php if($model->disk): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('disk') ?></p>
                <p><?= $model->disk ?></p>
            </div>

        <?php endif ?>

        <?php if($model->number): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('number') ?></p>
                <p><?= $model->number ?></p>
            </div>

        <?php endif ?>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('name') ?></p>
            <p><?= Html::a($model->name, ['view-raw', 'id' => $model->id]) ?></p>
        </div>

        <?php if($model->signature): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('signature') ?></p>
                <p><?= $model->signature ?></p>
            </div>

        <?php endif ?>

        <?php if($model->file): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('file') ?></p>
                <?= PlayButtonWidget::widget([
                    'type' => Track::CONTENT_TYPE_ID,
                    'content' => $model->id,
                    'file' => $model->file
                ]) ?>
            </div>

        <?php endif ?>

        <?php if($model->notEmptyGenres()): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('genres') ?></p>
                <?= GlobalFunctions::getListOnModels($model->getGenresList(), Genre::CONTENT_TYPE_ID, 'view-raw') ?>
            </div>

        <?php endif ?>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('heartsCount') ?></p>
            <p><?= $model->heartsCount ?></p>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('creator') ?></p>
            <?= Html::a($model->creator0->name, ['/user/view-raw', 'id' => $model->creator0->id]) ?>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('editor') ?></p>
            <?= Html::a($model->editor0->name, ['/user/view-raw', 'id' => $model->editor0->id]) ?>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('created_at') ?></p>
            <?= GlobalFunctions::wrapperDate($model->created_at) ?>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('updated_at') ?></p>
            <?= GlobalFunctions::wrapperDate($model->updated_at) ?>
        </div>

    </div>

</div>