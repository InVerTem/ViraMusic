<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\GridView;
use app\models\User;
use app\models\Artist;
use app\models\Album;
use app\models\Track;
use app\models\Genre;
use app\components\CRUDButtonsWidget;
use app\components\PlayButtonWidget;
use app\components\GlobalFunctions;

?>

<?= GridView::widget([
    'dataProvider' => $dataProvider,
    'filterModel' => isset($searchModel) ? $searchModel : null,
    'layout' => isset($searchModel) ? '{summary}{items}' : '{items}',
    'tableOptions' => [],
    'columns' => [
        [
            'class' => 'yii\grid\SerialColumn'
        ],
        [
            'attribute' => 'audio',
            'content' => function($model) {

                return PlayButtonWidget::widget([
                    'type' => Album::CONTENT_TYPE_ID,
                    'content' => $model->id
                ]);
            },
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'id',
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'artist',
            'content' => function($model) {return Html::a($model->artist0->name, ['/artist/view-raw', 'id' => $model->artist0->id]);},
            'filter' => Artist::getArtists(),
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'number',
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'name',
            'content' => function($model) {return Html::a($model->name, ['/album/view-raw', 'id' => $model->id]);},
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'signature',
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'year',
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
            'attribute' => 'tracks',
            'content' => function($model) {return GlobalFunctions::getListOnModels($model->tracks0, Track::CONTENT_TYPE_ID, 'view-raw');},
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
                    'urlRead' => ['/album/update', 'id' => $model->id],
                    'urlUpdate' => ['/album/update', 'id' => $model->id],
                    'urlDelete' => ['/album/delete', 'id' => $model->id],
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
                ]);
            }
        ]
    ]
]) ?>