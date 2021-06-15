<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;
use app\models\Artist;
use app\models\Album;
use app\models\Track;
use app\models\Genre;
use app\components\ContentIndexWidget;

$this->title = Yii::t('app', 'Search');
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => Url::toRoute('search')];

$this->registerJs(
<<<JS

    $('body').change('.form-input' , function(e) {

        document.getElementById('search-form-button').click();
    });

JS
);
?>

<?= $this->render('/layouts/content-title') ?>

<div class="view-grid">

    <?php $form = ActiveForm::begin([
        'id' => 'search-form',
        'action' => Url::toRoute(['search', 'name' => $name, 'genre' => $genre, 'content' => $content]),
        'method' => 'get',
        'options' => [
            'class' => 'vertical',
            'data-pjax' => true
        ],
        'fieldConfig' => [
            'labelOptions' => ['class' => null],
            'inputOptions' => ['class' => null],
            'hintOptions' => ['class' => null],
            'errorOptions' => ['class' => null]
        ]
    ]) ?>

        <?= $form->field($model, 'name')->textInput(['autofocus' => true, 'class' => 'form-input']) ?>
        <?= $form->field($model, 'genre')->dropDownList(Genre::getGenres(), ['prompt' => '', 'class' => 'form-input']) ?>

        <?= Html::submitButton(Yii::t('app', 'Submit'), ['id' => 'search-form-button', 'class' => null, 'name' => 'send']) ?>

    <?php ActiveForm::end() ?>

</div>


<div class="view-grid">

    <div class="grid-navigation">

        <?= Html::a(Yii::t('app', 'All'), ['search', 'SearchForm' => ['name' => $name, 'genre' => $genre], 'content' => null], $content !== 'artist' && $content !== 'album' && $content !== 'track' ? ['class' => 'active'] : []) ?>
        <?= Html::a(Yii::t('app', 'Artists'), ['search', 'SearchForm' => ['name' => $name, 'genre' => $genre], 'content' => 'artist'], $content === 'artist' ? ['class' => 'active'] : []) ?>
        <?= Html::a(Yii::t('app', 'Albums'), ['search', 'SearchForm' => ['name' => $name, 'genre' => $genre], 'content' => 'album'], $content === 'album' ? ['class' => 'active'] : []) ?>
        <?= Html::a(Yii::t('app', 'Tracks'), ['search', 'SearchForm' => ['name' => $name, 'genre' => $genre], 'content' => 'track'], $content === 'track' ? ['class' => 'active'] : []) ?>

    </div>

</div>

<div class="view-grid">

    <?php if($content === 'artist' || $content !== 'album' && $content !== 'track'): ?>

        <?php if($content !== 'artist'): ?>
            <p class="title"><?= Yii::t('app', 'Artists') ?></p>
        <?php endif ?>

        <?= ContentIndexWidget::widget([
            'models' => $modelsArtist,
            'typePlay' => Artist::CONTENT_TYPE_ID,
            'typeHeart' => Artist::CONTENT_TYPE_ID,
            'contentName' => 'artist'
        ]) ?>
    <?php endif ?>

    <?php if($content === 'album' || $content !== 'artist' && $content !== 'track'): ?>

        <?php if($content !== 'album'): ?>
            <p class="title"><?= Yii::t('app', 'Albums') ?></p>
        <?php endif ?>

        <?= ContentIndexWidget::widget([
            'models' => $modelsAlbum,
            'typePlay' => Album::CONTENT_TYPE_ID,
            'typeHeart' => Album::CONTENT_TYPE_ID,
            'contentName' => 'album'
        ]) ?>
    <?php endif ?>

    <?php if($content === 'track' || $content !== 'artist' && $content !== 'album'): ?>

        <?php if($content !== 'track'): ?>
            <p class="title"><?= Yii::t('app', 'Tracks') ?></p>
        <?php endif ?>

        <?= ContentIndexWidget::widget([
            'models' => $modelsTrack,
            'typePlay' => Track::CONTENT_TYPE_ID,
            'typeHeart' => Track::CONTENT_TYPE_ID,
            'contentName' => 'track'
        ]) ?>
    <?php endif ?>

</div>