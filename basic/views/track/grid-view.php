<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\GridView;
use app\models\User;
use app\models\Artist;
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
            'attribute' => 'id',
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'artist',
            'content' => function($model) {return Html::a($model->album0->artist0->name, ['/artist/view-raw', 'id' => $model->album0->artist0->id]);},
            'filter' => Artist::getArtists(),
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'album',
            'content' => function($model) {return Html::a($model->album0->name, ['/album/view-raw', 'id' => $model->album0->id]);},
            'filter' => Artist::getArtistsWithAlbums(),
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'disk',
            'content' => function($model) {return $model->disk;},
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'number',
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'name',
            'content' => function($model) {return Html::a($model->name, ['/track/view-raw', 'id' => $model->id]);},
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'signature',
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'file',
            'content' => function($model) {

                return PlayButtonWidget::widget([
                    'type' => Track::CONTENT_TYPE_ID,
                    'content' => $model->id,
                    'file' => $model->file
                ]);
            },
            'filterInputOptions' => ['class' => null]
        ],
        [
            'attribute' => 'genres',
            'content' => function($model) {return GlobalFunctions::getListOnModels($model->getGenresList(), Genre::CONTENT_TYPE_ID, 'view-raw');},
            'filter' => Genre::getGenres(),
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
                    'urlRead' => ['/track/view-raw', 'id' => $model->id],
                    'urlUpdate' => ['/track/update', 'id' => $model->id],
                    'urlDelete' => ['/track/delete', 'id' => $model->id],
                    'dropdownItems' => [
                        CRUDButtonsWidget::widget([
                            'textCreate' => Yii::t('app', 'Add genre'),
                            'urlCreate' => ['/genre-content/create', 'type' => Track::CONTENT_TYPE_ID, 'content' => $model->id],
                            'crud' => 'c'
                        ])
                    ]
                ]);
            }
        ]
    ]
]) ?>