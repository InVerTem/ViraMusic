<?php

use yii\helpers\Html;

$this->title = $name;
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <div class="alert alert-danger"><?= nl2br(Html::encode($message)) ?></div>
    <p class="text"><?= Yii::t('app', 'The above error occurred while the Web server was processing your request.') ?></p>
    <p class="text"><?= Yii::t('app', 'Please contact us if you think this is a server error. Thank you.') ?></p>

</div>