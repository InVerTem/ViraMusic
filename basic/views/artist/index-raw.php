<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\GridView;
use app\models\User;
use app\models\Artist;
use app\models\Album;
use app\models\Track;
use app\models\Genre;
use app\models\Social;
use app\components\CRUDButtonsWidget;
use app\components\PlayButtonWidget;
use app\components\PaginationWidget;
use app\components\GlobalFunctions;

$this->title = Yii::t('app', 'Artists');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute('index-raw')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="grid-buttons">
        <?= CRUDButtonsWidget::widget(['crud' => 'c']) ?>
    </div>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'layout' => '{summary}{items}',
        'tableOptions' => [],
        'columns' => [
            [
                'class' => 'yii\grid\SerialColumn'
            ],
            [
                'attribute' => 'id',
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'audio',
                'content' => function($model) {

                    return PlayButtonWidget::widget([
                        'type' => Artist::CONTENT_TYPE_ID,
                        'content' => $model->id
                    ]);
                },
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'name',
                'content' => function($model) {return Html::a($model->name, ['/artist/view-raw', 'id' => $model->id]);},
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'info',
                'content' => function($model) {return GlobalFunctions::getAbbreviated($model->info, false);},
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'image',
                'content' => function($model) {return GlobalFunctions::wrapperImage($model->image, true);},
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'genres',
                'content' => function($model) {return GlobalFunctions::getListOnModels($model->getGenresList(), Genre::CONTENT_TYPE_ID, 'view-raw');},
                'filter' => Genre::getGenres(),
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'socials',
                'content' => function($model) {return GlobalFunctions::getListOnModels($model->getSocialsList(), Social::CONTENT_TYPE_ID, 'view-raw');},
                'filter' => Social::getSocials(),
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'albums',
                'content' => function($model) {return GlobalFunctions::getListOnModels($model->albums0, Album::CONTENT_TYPE_ID, 'view-raw');},
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'tracks',
                'content' => function($model) {return GlobalFunctions::getListOnModels($model->getTracksList(), Track::CONTENT_TYPE_ID, 'view-raw');},
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'heartsCount',
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'creator',
                'content' => function($model) {return Html::a($model->creator0->name, ['/user/view-raw', 'id' => $model->creator0->id]);},
                'filter' => User::getUsers(User::USER_TYPE_ADMINISTRATION),
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'editor',
                'content' => function($model) {return Html::a($model->editor0->name, ['/user/view-raw', 'id' => $model->editor0->id]);},
                'filter' => User::getUsers(User::USER_TYPE_ADMINISTRATION),
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'created_at',
                'content' => function($model) {return GlobalFunctions::wrapperDate($model->created_at);}
            ],
            [
                'attribute' => 'updated_at',
                'content' => function($model) {return GlobalFunctions::wrapperDate($model->updated_at);}
            ],
            [
                'format' => 'raw',
                'value' => function($model) {

                    return CRUDButtonsWidget::widget([
                        'id' => $model->id,
                        'name' => $model->name,
                        'crud' => 'rud',
                        'className' => 'vertical',
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
                    ]);
                }
            ]
        ]
    ]) ?>

    <?= PaginationWidget::widget([
        'dataProvider' => $dataProvider,
        'isAll' => $isAll,
        'view' => 'index-raw'
    ]) ?>

</div>