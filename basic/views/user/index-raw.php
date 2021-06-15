<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\GridView;
use app\models\UserType;
use app\models\UserStatus;
use app\models\AccessStatus;
use app\components\CRUDButtonsWidget;
use app\components\PaginationWidget;
use app\components\GlobalFunctions;

$this->title = Yii::t('app', 'Users');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Profile'), 'url' => Url::toRoute('/site/profile')];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute('index-raw')];
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

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
                'attribute' => 'name',
                'content' => function($model) {return Html::a($model->name, ['/user/view-raw', 'id' => $model->id]);},
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'email',
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'type',
                'content' => function($model) {return Yii::t('app', $model->type0->name);},
                'contentOptions' => function ($model) {return ['class' => $model->type0->name];},
                'filter' => UserType::getUserTypes(),
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'status',
                'content' => function($model) {return Yii::t('app', $model->status0->name);},
                'contentOptions' => function ($model) {return ['class' => $model->status0->name];},
                'filter' => UserStatus::getUserStatuses(),
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'access',
                'content' => function($model) {return Yii::t('app', $model->access0->name);},
                'contentOptions' => function ($model) {return ['class' => $model->access0->name];},
                'filter' => AccessStatus::getStatuses(),
                'filterInputOptions' => ['class' => null]
            ],
            [
                'attribute' => 'last_visit',
                'content' => function($model) {return GlobalFunctions::wrapperDate($model->last_visit);}
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
                        'crud' => 'rud'
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