<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\GridView;
use app\components\CRUDButtonsWidget;
use app\components\GlobalFunctions;

?>

<?= GridView::widget([
    'dataProvider' => $dataProvider,
    'layout' => '{items}',
    'tableOptions' => [],
    'columns' => [
        [
            'class' => 'yii\grid\SerialColumn'
        ],
        [
            'attribute' => 'id'
        ],
        [
            'attribute' => 'social',
            'content' => function($model) {return Html::a(Yii::t('app', $model->social0->name), ['/social/view-raw', 'id' => $model->social0->id]);}
        ],
        [
            'attribute' => 'url',
            'content' => function($model) {

                return
                    Html::img(Url::to("/uploads/{$model->social0->image}"), ['title' => $model->social0->image, 'class' => 'svg']) .
                    Html::a($model->url, $model->url);
            }
        ],
        [
            'attribute' => 'artist',
            'content' => function($model) {return Html::a($model->artist0->name, ['/artist/view-raw', 'id' => $model->artist0->id]);}
        ],
        [
            'attribute' => 'creator',
            'content' => function($model) {return Html::a($model->creator0->name, ['/user/view-raw', 'id' => $model->creator0->id]);}
        ],
        [
            'attribute' => 'editor',
            'content' => function($model) {return Html::a($model->editor0->name, ['/user/view-raw', 'id' => $model->editor0->id]);}
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
                    'name' => Yii::t('app', $model->social0->name),
                    'crud' => 'ud',
                    'urlUpdate' => [
                        '/social-content/update',
                        'id' => $model->id,
                        'artist' => $model->artist
                    ]
                ]);
            }
        ]
    ]
]) ?>