<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Artist;
use app\models\Album;
use app\models\Track;
use app\models\Genre;
use app\components\CRUDButtonsWidget;
use app\components\PlayButtonWidget;
use app\components\GlobalFunctions;

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Albums'), 'url' => Url::toRoute('index-raw')];
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
                    'urlCreate' => ['/genre-content/create', 'type' => Album::CONTENT_TYPE_ID, 'content' => $model->id],
                    'crud' => 'c'
                ]),
                CRUDButtonsWidget::widget([
                    'textCreate' => Yii::t('app', 'Create track'),
                    'urlCreate' => ['/track/create', 'album' => $model->id],
                    'crud' => 'c'
                ]),
                CRUDButtonsWidget::widget([
                    'textCreate' => Yii::t('app', 'Create tracks'),
                    'urlCreate' => ['/track/fast-create', 'album' => $model->id],
                    'crud' => 'c'
                ])
            ]
        ]) ?>
    </div>

    <div class="view-raw-grid">

        <div>
            <p class="signature"><?= $model->getAttributeLabel('audio') ?></p>
            <?= PlayButtonWidget::widget([
                'type' => Album::CONTENT_TYPE_ID,
                'content' => $model->id
            ]) ?>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('id') ?></p>
            <p><?= $model->id ?></p>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('artist') ?></p>
            <?= Html::a($model->artist0->name, ['/artist/view-raw', 'id' => $model->artist0->id]) ?>
        </div>

        <?php if($model->number): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('number') ?></p>
                <p><?= $model->number ?></p>
            </div>

        <?php endif ?>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('name') ?></p>
            <p><?= $model->name ?></p>
        </div>

        <?php if($model->signature): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('signature') ?></p>
                <p><?= $model->signature ?></p>
            </div>

        <?php endif ?>

        <?php if($model->image): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('image') ?></p>
                <div class="line-grid">
                    <?= GlobalFunctions::wrapperImage($model->image) ?>
                    <p><?= $model->image ?></p>
                </div>
            </div>

        <?php endif ?>

        <?php if($model->notEmptyGenres()): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('generes') ?></p>
                <?= GlobalFunctions::getListOnModels($model->getGenresList(), Genre::CONTENT_TYPE_ID, 'view-raw') ?>
            </div>

        <?php endif ?>

        <?php if($model->tracks0): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('tracks') ?></p>
                <?= GlobalFunctions::getListOnModels($model->tracks0, Track::CONTENT_TYPE_ID, 'view-raw') ?>
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