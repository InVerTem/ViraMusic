<?php

use yii\helpers\Html;
use app\widgets\Alert;
use yii\widgets\Breadcrumbs;

$this->registerJs(
<<<JS
    document.getElementsByTagName('title')[0].innerHTML = `{$this->title}`;
JS
);
?>

<?= Breadcrumbs::widget([
    'tag' => 'div',
    'itemTemplate' => '{link}',
    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
    'options' => ['class' => 'breadcrumb-grid']
]) ?>

<p class="title"><?= Html::encode($this->title) ?></p>
<?= Alert::widget() ?>