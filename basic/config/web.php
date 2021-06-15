<?php

$params = require __DIR__ . '/params.php';
$db = require __DIR__ . '/db.php';

$config = [
    'id' => 'ViraMusic',
    'name' => 'ViraMusic',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm' => '@vendor/npm-asset',
    ],
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'G4WiYem-PVhb5ouuH1CIN_hisIBRE5Ph',
            'baseUrl'=> '',
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user' => [
            'identityClass' => 'app\models\User',
            'enableAutoLogin' => true,
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
            // 'transport' => [
            //     'class' => 'Swift_SmtpTransport',
            //     'host' => 'smtp.gmail.com',
            //     'username' => 'InVerTemIVT@yandex.ru',
            //     'password' => '2gHQn0ccoUANNNUimhupT8Mevv8FS44T',
            //     'port' => '465',
            //     'encryption' => 'ssl',
            // ],
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'db' => $db,
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
            ],
        ],
        'formatter' => [
            'dateFormat' => 'dd.MM.yyyy HH:mm:ss',
            'decimalSeparator' => ',',
            'thousandSeparator' => ' ',
            'currencyCode' => 'EUR',
            'timeZone' => 'Asia/Yekaterinburg',
       ],
       'i18n' => [
            'translations' => [
                '*' => [
                    'sourceLanguage' => 'ru-RU',
                    'class' => 'yii\i18n\PhpMessageSource',
                    'basePath' => '@app/messages',
                    'fileMap' => [
                        'app' => 'app.php',
                        'app/error' => 'error.php',
                    ],
                ],
            ],
        ],
    ],
    'on beforeRequest' => function () {

        if(Yii::$app->request->cookies->has('language')) {

            $language = Yii::$app->request->cookies->getValue('language');

            Yii::$app->response->cookies->remove('language');

        } else {

            $model = \app\models\Language::findModel(2);

            $language = $model->code;
        }

        Yii::$app->language = $language;

        Yii::$app->response->cookies->add(new \yii\web\Cookie([
            'name' => 'language',
            'value' => $language,
            'expire' => time() + 3600 * 24 * 30
        ]));
    },
    'on beforeAction' => function() {

        $user = \app\models\User::getCurrentUserModel();

        if(!Yii::$app->user->isGuest) {

            \app\models\User::updateAll(['last_visit' => time()], ['id' => Yii::$app->user->id]);
        }

        defined('ADMINISTRATION') or define('ADMINISTRATION',
            $user->checkUserType(\app\models\User::USER_TYPE_ADMIN) or
            $user->checkUserType(\app\models\User::USER_TYPE_MODER)
        );
        defined('ADMIN') or define('ADMIN', $user->checkUserType(\app\models\User::USER_TYPE_ADMIN));
        defined('USER') or define('USER', $user->checkUserType(\app\models\User::USER_TYPE_USER));

        unset($user);
    },
    'params' => $params,
];

if(YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];
}

return $config;
