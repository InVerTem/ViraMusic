<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Dropdown;
use yii\widgets\Pjax;
use app\assets\AppAsset;
use app\models\Language;
use app\components\GlobalFunctions;

AppAsset::register($this);

$this->registerJs(
<<<JS

    $('body').on('click', '.pjax-link', function(e) {

        e.preventDefault();

        $.pjax.reload({
            container: '#pjax-content',
            url: $(this).attr('href')
        });
    });

    $('body').on('click', '.heart-link', function(e) {

        let
            buttonHeart = e.currentTarget,
            buttonHeartCount = document.getElementById('heartCount_' + e.currentTarget.dataset.type + '_' + e.currentTarget.dataset.content);

        $.ajax({
            url: '/heart/create',
            data: {
                type: this.dataset.type,
                content: this.dataset.content
            },
            type: 'post',
            dataType: 'json',
            success: function(data) {

                if(localStorage.tracksData !== undefined) {

                    let tracksData = JSON.parse(localStorage.tracksData);

                    tracksData[localStorage.track].status = tracksData[localStorage.track].status === '1' ? '2' : '1';
                    localStorage.tracksData = JSON.stringify(tracksData);
                }

                if(buttonHeartCount) {

                    buttonHeartCount.innerHTML = +buttonHeartCount.innerHTML + (data.status === 2 ? -1 : 1);
                }

                buttonHeart.classList.toggle('heart');
                buttonHeart.classList.toggle('heart-fill');
            }
        });
    });

    $(document).ready(function() {

        $(window).scroll(function() {

            if ($(this).scrollTop() > 100) {

                $('.scrollup').fadeIn();

            } else {

                $('.scrollup').fadeOut();
            }
        });

        $('.scrollup').click(function() {

            $('html, body').animate({scrollTop: 0}, 600);

            return false;
        });
    });

JS
);
?>

<?php $this->beginPage() ?>
    <!DOCTYPE html>
    <html class="dark-mode" lang="<?= Yii::$app->language ?>">
        <head>
            <meta http-equiv="X-UA-Compatible" charset="<?= Yii::$app->charset ?>" name="viewport" content="width=device-width, initial-scale=1">
            <?php $this->registerCsrfMetaTags() ?>
            <title><?= Html::encode($this->title) ?></title>
            <?php $this->registerLinkTag(['rel' => 'icon', 'type' => 'image/svg', 'href' => Url::to(['@web/images/music-note-beamed.svg'])]) ?>
            <?php $this->head() ?>
        </head>
        <body>
        <?php $this->beginBody() ?>

            <header>

                <?= Html::a(Yii::$app->name . '<svg class="music-note-beamed"><path/></svg>', ['/'], ['class' => 'logo svg-grid pjax-link']) ?>

                <div class="line-grid header-profile">

                    <?php if(Yii::$app->user->isGuest): ?>

                        <?= Html::a(Yii::t('app', 'Login'), ['/site/login'], ['class' => 'pjax-link']) ?>
                        <?= Html::a(Yii::t('app', 'Signup'), ['/site/signup'], ['class' => 'pjax-link']) ?>

                    <?php else: ?>

                        <?= Html::a(Yii::t('app', 'Favorite') . '<svg class="heart-fill"><path/></svg>', ['/favorite', 'user' => Yii::$app->user->id], ['class' => 'svg-grid pjax-link']) ?>

                        <?= GlobalFunctions::wrapperDropdown([
                                Html::a(Yii::t('app', 'Profile'), ['/site/profile'], ['class' => 'pjax-link']),
                                Html::a(Yii::t('app', 'Playlists'), ['/playlist', 'id' => Yii::$app->user->id], ['class' => 'pjax-link']),
                                Html::beginForm(['/site/logout'], 'post') . Html::submitButton(Yii::t('app', 'Logout')) . Html::endForm()
                            ],
                            Yii::$app->user->identity->name,
                            'person-fill'
                        ) ?>

                    <?php endif ?>

                </div>

                <div class="line-grid">

                    <?= Html::a('<svg class="search"><path/></svg>', ['/site/search'], ['class' => 'svg-grid pjax-link']) ?>
                    <?= GlobalFunctions::wrapperDropdown(Language::getLanguagesList(), '', 'flag-fill') ?>
                    <svg id="changeThemeButton" class="moon-stars-fill" onclick="changeTheme()"><path/></svg>

                </div>

            </header>

            <main>

                <div class="content">

                    <?php Pjax::begin(['id' => 'pjax-content']); ?>

                        <?= $content ?>

                    <?php Pjax::end(); ?>

                </div>

            </main>

            <footer>

                <p>&copy; <?= Html::a(Yii::$app->name, ['/'], ['class' => 'pjax-link']) ?> <?= date('Y') ?></p>
                <p><?= Yii::powered() ?></p>
                <a href="#" class="scrollup"><?= Yii::t('app', 'Up') ?></a>

            </footer>

        <script>

            var changeTheme = function() {

                if(localStorage.whiteMode === 'false') {

                    localStorage.whiteMode = true;
                    document.getElementsByTagName('html')[0].className = 'white-mode';
                    document.getElementById('changeThemeButton').className.baseVal = 'sun-fill';

                } else {

                    localStorage.whiteMode = false;
                    document.getElementsByTagName('html')[0].className = 'dark-mode';
                    document.getElementById('changeThemeButton').className.baseVal = 'moon-stars-fill';
                }
            };

            (function(){

                if(localStorage.whiteMode !== undefined) {

                    if(localStorage.whiteMode === 'true') {

                        document.getElementsByTagName('html')[0].className = 'white-mode';
                        document.getElementById('changeThemeButton').className.baseVal = 'sun-fill';
                    }

                } else {

                    localStorage.whiteMode = 'false';
                }


            }());

        </script>

        <?= $this->render('audio') ?>

        <?php $this->endBody() ?>
        </body>
    </html>
<?php $this->endPage() ?>