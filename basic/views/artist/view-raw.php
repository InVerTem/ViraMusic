<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Artist;
use app\models\Album;
use app\models\Track;
use app\models\Genre;
use app\models\Social;
use app\components\CRUDButtonsWidget;
use app\components\PlayButtonWidget;
use app\components\GlobalFunctions;

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Artists'), 'url' => Url::toRoute('index-raw')];
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
                    'urlCreate' => ['/genre-content/create', 'type' => Artist::CONTENT_TYPE_ID, 'content' => $model->id],
                    'crud' => 'c'
                ]),
                CRUDButtonsWidget::widget([
                    'textCreate' => Yii::t('app', 'Add social'),
                    'urlCreate' => ['/social-content/create', 'artist' => $model->id],
                    'crud' => 'c'
                ]),
                    CRUDButtonsWidget::widget([
                    'textCreate' => Yii::t('app', 'Create album'),
                    'urlCreate' => ['/album/create', 'artist' => $model->id],
                    'crud' => 'c'
                ]),
                (isset($model->albums0[0]->id) ? CRUDButtonsWidget::widget([
                    'textCreate' => Yii::t('app', 'Create track'),
                    'urlCreate' => ['/track/create', 'album' => $model->albums0[0]->id],
                    'crud' => 'c'
                ]) .
                CRUDButtonsWidget::widget([
                    'textCreate' => Yii::t('app', 'Create tracks'),
                    'urlCreate' => ['/track/fast-create', 'album' => $model->albums0[0]->id],
                    'crud' => 'c'
                ]) : '')
            ]
        ]) ?>
    </div>

    <div class="view-raw-grid">

        <div>
            <p class="signature"><?= $model->getAttributeLabel('audio') ?></p>
            <?= PlayButtonWidget::widget([
                'type' => Artist::CONTENT_TYPE_ID,
                'content' => $model->id
            ]) ?>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('id') ?></p>
            <p><?= $model->id ?></p>
        </div>

        <div>
            <p class="signature"><?= $model->getAttributeLabel('name') ?></p>
            <p><?= Html::a($model->name, ['view-raw', 'id' => $model->id]) ?></p>
        </div>

        <?php if($model->info): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('info') ?></p>
                <p><?= $model->info ?></p>
            </div>

        <?php endif ?>

        <?php if($model->image): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('image') ?></p>
                <div class="line-grid">
                    <?= GlobalFunctions::wrapperImage($model->image, true) ?>
                    <p><?= $model->image ?></p>
                </div>
            </div>

        <?php endif ?>

        <?php if($model->genres0): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('genres') ?></p>
                <?= GlobalFunctions::getListOnModels($model->getGenresList(), Genre::CONTENT_TYPE_ID, 'view-raw') ?>
            </div>

        <?php endif ?>

        <?php if($model->socials0): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('socials') ?></p>
                <?= GlobalFunctions::getListOnModels($model->getSocialsList(), Social::CONTENT_TYPE_ID, 'view-raw') ?>
            </div>

        <?php endif ?>

        <?php if($model->albums0): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('albums') ?></p>
                <?= GlobalFunctions::getListOnModels($model->albums0, Album::CONTENT_TYPE_ID, 'view-raw') ?>
            </div>

        <?php endif ?>

        <?php if($model->notEmptyTracks()): ?>

            <div>
                <p class="signature"><?= $model->getAttributeLabel('tracks') ?></p>
                <?= GlobalFunctions::getListOnModels($model->getTracksList(), Track::CONTENT_TYPE_ID, 'view-raw') ?>
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