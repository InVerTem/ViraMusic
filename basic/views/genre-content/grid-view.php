<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\ContentType;
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
            'attribute' => 'genre',
            'content' => function($model) {return Html::a(Yii::t('app', $model->genre0->name), ['/genre/view-raw', 'id' => $model->genre0->id]);}
        ],
        [
            'attribute' => 'type',
            'content' => function($model) {return Yii::t('app', $model->type0->name);}
        ],
        [
            'attribute' => 'content',
            'content' => function($model) {return Html::a(ContentType::getNameContent($model->content, $model->type0->name), ["/{$model->type0->name}/view-raw", 'id' => $model->content]);}
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
                    'name' => Yii::t('app', $model->genre0->name),
                    'crud' => 'ud',
                    'urlUpdate' => [
                        '/genre-content/update',
                        'id' => $model->id,
                        'type' => $model->type,
                        'content' => $model->content
                    ],
                    'urlDelete' => [
                        '/genre-content/delete',
                        'id' => $model->id,
                        'type' => $model->type,
                        'content' => $model->content
                    ]
                ]);
            }
        ]
    ]
]) ?>