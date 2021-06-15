<?php

namespace app\models;

use Yii;
use yii\base\Model;

class LoginForm extends Model {

    public $nameOrEmail;
    public $password;
    public $rememberMe = true;

    private $_user = false;

    public function rules() {

        return [
            [['nameOrEmail', 'password'], 'required'],
            [['nameOrEmail', 'password'], 'string', 'max' => 255],
            ['rememberMe', 'boolean'],
            ['password', 'validatePassword'],
        ];
    }

    public function attributeLabels() {

        return [
            'nameOrEmail' => Yii::t('app', 'Name or email'),
            'password' => Yii::t('app', 'password'),
            'rememberMe' => Yii::t('app', 'Remember me')
        ];
    }

    public function validatePassword($attribute, $params) {

        if(!$this->hasErrors()) {

            $user = $this->getUser();

            if(!$user || !$user->validatePassword($this->password)) {

                $this->addError($attribute, 'Incorrect nameOrEmail or password.');
            }
        }
    }

    public function login() {

        if($this->validate()) {

            $user = $this->getUser();

            if($user->status === User::STATUS_ACTIVE) {

                return Yii::$app->user->login($user, $this->rememberMe ? 3600 * 24 * 30 : 0);

            } else if($user->status === User::STATUS_NOT_CONFIRMED) {

                throw new \DomainException('To complete the registration, confirm your email. Check your email.');
            }
        }

        return false;
    }

    public function getUser() {

        if($this->_user === false) {

            $this->_user = User::findByNameOrEmail($this->nameOrEmail);
        }

        return $this->_user;
    }
}
