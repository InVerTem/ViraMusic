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
            'attribute' => 'playlist',
            'content' => function($model) {return Html::a(Yii::t('app', $model->playlist0->name), ['/playlist/view', 'id' => $model->playlist0->id]);}
        ],
        [
            'attribute' => 'type',
            'content' => function($model) {return $model->type0->name;}
        ],
        [
            'attribute' => 'content',
            'content' => function($model) {return Html::a(ContentType::getNameContent($model->content, $model->type0->name), ["/{$model->type0->name}/view", 'id' => $model->content]);}
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

                $contentName = ContentType::getNameContent($model->content, $model->type0->name);

                return CRUDButtonsWidget::widget([
                    'id' => $model->id,
                    'name' => $contentName,
                    'crud' => 'd',
                    'urlDelete' => [
                        '/playlist-content/delete',
                        'id' => $model->id,
                        'playlist' => $model->playlist,
                        'contentName' => $contentName
                    ]
                ]);
            }
        ]
    ]
]) ?>