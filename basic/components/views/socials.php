<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\components\GlobalFunctions;

?>

<?php if($models): ?>

    <div class="grid-socials">

        <?php foreach($models as $model): ?>

            <?= Html::a(GlobalFunctions::wrapperImage($model->social0->image), Url::to($model->url, true)) ?>

        <?php endforeach ?>

    </div>

<?php endif ?>