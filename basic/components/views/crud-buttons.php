<?php

use yii\helpers\Html;
use app\components\GlobalFunctions;

?>

<div class="<?= $className ?>">

    <?php if($dropdownItems): ?>
        <?= GlobalFunctions::wrapperDropdown($dropdownItems, $dropdownLink, $dropdownSvg) ?>
    <?php endif ?>
    <?php if($urlCreate): ?>
        <?= Html::a("{$textCreate}<svg class=\"plus-circle-fill\"><path/></svg>", $urlCreate) ?>
    <?php endif ?>
    <?php if($urlRead): ?>
        <?= Html::a("{$textRead}<svg class=\"arrow-up-right-circle-fill\"><path/></svg>", $urlRead) ?>
    <?php endif ?>
    <?php if($urlUpdate): ?>
        <?= Html::a("{$textUpdate}<svg class=\"pencil-fill\"><path/></svg>", $urlUpdate) ?>
    <?php endif ?>
    <?php if($urlDelete): ?>
        <?= Html::a("{$textDelete}<svg class=\"trash-fill\"><path/></svg>", $urlDelete, ['onclick' => "return confirm('" . Yii::t('app', 'Delete {name}?', ['name' => $name]) . "')"]) ?>
    <?php endif ?>

</div>