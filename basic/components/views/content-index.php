<?php

use yii\helpers\Html;
use app\models\Genre;
use app\components\MediaWidget;
use app\components\PlayButtonWidget;
use app\components\HeartButtonWidget;
use app\components\GlobalFunctions;

?>

<div class="content-index <?= $viewClass ?>">

    <?php if($models): ?>

        <?php foreach($models as $key => $model): ?>

            <?php if($model): ?>

                <?php if($viewClass === 'content-grid'): ?>

                    <div>

                        <?= MediaWidget::widget([
                            'typePlay' => $typePlay,
                            'typeHeart' => $typeHeart,
                            'contentPlay' => $contentPlay ? $contentPlay : $model->id,
                            'contentHeart' => $model->id,
                            'src' => isset($model->image) ? $model->image : (isset($model->album0->image) ? $model->album0->image : null),
                            'track' => isset($model->artist) ? 0 : (isset($model->album) ? $model->id : 0),
                            'heartStatus' => isset($model->hearts0) ? $model->checkHeart() : null,
                            'user' => $user
                        ]) ?>
                        <?= Html::a($model->name, ["/{$contentName}/view", 'id' => $model->id]) ?>
                        <?php if(isset($model->genres0)): ?>
                            <?= GlobalFunctions::getListOnModels($model->getGenresList(), Genre::CONTENT_TYPE_ID, 'search-genre') ?>
                        <?php endif ?>
                        <?php if(isset($model->signature)): ?>
                            <p><?= $model->signature ?></p>
                        <?php endif ?>
                        <?php if(isset($model->year)): ?>
                            <p><?= $model->year ?></p>
                        <?php endif ?>

                    </div>

                <?php else: ?>

                    <div>

                        <p><?= $key + 1 ?></p>
                        <?= PlayButtonWidget::widget([
                            'type' => $typePlay,
                            'content' => $contentPlay ? $contentPlay : $model->id,
                            'track' => isset($model->artist) ? 0 : (isset($model->album) ? $model->id : 0),
                            'order' => $order,
                            'user' => $user
                        ]) ?>

                        <div class="info">
                            <p><?= Html::a($model->name, ["/{$contentName}/view", 'id' => $model->id]) ?></p>
                            <?php if($viewAlbum && isset($model->album)): ?>
                                <p class="signature"><?= Html::a($model->album0->name, ['/album/view', 'id' => $model->album]) ?></p>
                            <?php endif ?>
                        </div>

                        <?php if(isset($model->hearts0)): ?>
                            <?= HeartButtonWidget::widget([
                                'type' => $typeHeart,
                                'content' => $model->id,
                                'heartStatus' => $model->checkHeart()
                            ]) ?>
                        <?php endif ?>

                        <?php if(isset($model->playtime)): ?>
                            <p><?= $model->playtime ?></p>
                        <?php endif ?>

                    </div>

                <?php endif ?>

            <?php endif ?>

        <?php endforeach ?>

        <?php if($showMore): ?>

            <div class="show-more">
                <?= Html::a(Yii::t('app', 'Show more'), ['/site/search', 'content' => $contentName]) ?>
            </div>

        <?php endif ?>

    <?php else: ?>

        <p><?= Yii::t('app', 'No results found.') ?></p>

    <?php endif ?>

</div>