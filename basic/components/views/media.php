<?php

use yii\helpers\Html;
use app\components\PlayButtonWidget;
use app\components\HeartButtonWidget;
use app\components\GlobalFunctions;

?>

<div class="content-image">

    <div class="background-image"></div>
    <?= GlobalFunctions::wrapperImage($src) ?>
    <?= PlayButtonWidget::widget([
        'type' => $typePlay,
        'content' => $contentPlay,
        'track' => $track,
        'user' => $user
    ]) ?>
    <?php if($heartStatus): ?>
        <?= HeartButtonWidget::widget([
            'type' => $typeHeart,
            'content' => $contentHeart,
            'heartStatus' => $heartStatus
        ]) ?>
    <?php endif ?>

</div>