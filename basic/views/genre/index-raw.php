<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\GridView;
use app\models\User;
use app\components\CRUDButtonsWidget;
use app\components\PaginationWidget;
use app\components\GlobalFunctions;

$this->title = Yii::t('app', 'Genres');
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
                'attribute' => 'name',
                'content' => function($model) {return Html::a(Yii::t('app', $model->name), ['/genre/view-raw', 'id' => $model->id]);},
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
                        'name' => Yii::t('app', $model->name),
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