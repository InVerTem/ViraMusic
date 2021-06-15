<?php
use yii\helpers\Html;

$confirmLink = Yii::$app->urlManager->createAbsoluteUrl(['site/signup-confirm', 'token' => $user->email_confirm_token]);
?>

<div>

    <p>Hello <?= Html::encode($user->login) ?>,</p>
    <p>Follow the link below to confirm your email:</p>
    <p><?= Html::a(Html::encode($confirmLink), $confirmLink) ?></p>

</div>