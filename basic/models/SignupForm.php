<?php

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * Signup form
 */
class SignupForm extends Model {

    public $name;
    public $email;
    public $password;
    public $repeatPassword;
    public $verifyCode;

    /**
     * @inheritdoc
     */
    public function rules() {

        return [
            [['name', 'email'], 'trim'],
            [['name', 'email', 'password', 'repeatPassword'], 'required'],
            [['name', 'email', 'password', 'repeatPassword'], 'string'],
            ['email', 'email'],
            ['name', 'unique', 'targetClass' => '\app\models\User', 'message' => 'This name has already been taken.'],
            ['email', 'unique', 'targetClass' => '\app\models\User', 'message' => 'This email address has already been taken.'],
            ['verifyCode', 'captcha'],
            ['password', function() {

                if($this->password !== $this->repeatPassword) {

                    $this->addError('password', 'Passwords do not match.');
                }
            }],
        ];
    }

    public function attributeLabels() {

        return [
            'name' => Yii::t('app', 'Name'),
            'email' => Yii::t('app', 'Email'),
            'password' => Yii::t('app', 'password'),
            'repeatPassword' => Yii::t('app', 'Repeat password'),
            'verifyCode' => Yii::t('app', 'Captcha')
        ];
    }
}