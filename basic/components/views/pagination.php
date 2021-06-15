<?php

use yii\helpers\Html;
use yii\widgets\LinkPager;

?>

<?php if($dataProvider->getTotalCount() > $dataProvider->pagination->pageSize): ?>

    <div class="pagination-grid">

        <?php if(!$isAll): ?>

            <?= LinkPager::widget([
                'pagination' => $dataProvider->pagination,
            ]) ?>

            <?= Html::a(Yii::t('app', 'View all'), array_merge([$view], $get, ['isAll' => 1])); ?>

        <?php elseif($isAll): ?>

            <?= Html::a(Yii::t('app', 'View pagination'), array_merge([$view], $get)); ?>

        <?php endif ?>

    </div>

<?php endif ?>