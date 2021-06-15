<?php

namespace app\models;

use Yii;

class SignupService {

    public function signup(SignupForm $signupForm) {

        $user = new User();
        $user->name = $signupForm->name;
        $user->email = $signupForm->email;
        $user->type = USER::USER_TYPE_USER;
        // $user->status = USER::STATUS_NOT_CONFIRMED;
        $user->status = USER::STATUS_ACTIVE;
        $user->setPasswordHash($signupForm->password);
        $user->generateAuthKey();
        $user->email_confirm_token = Yii::$app->security->generateRandomString();

        if(!$user->save()) {

            throw new \RuntimeException('Saving error.');
        }

        return $user;
    }

    public function sentEmailConfirm(User $user) {

        $sent = Yii::$app->mailer
            ->compose('signupConfirm', ['user' => $user])
            ->setFrom(Yii::$app->params['adminEmail'])
            ->setTo($user->email)
            ->setSubject('Confirmation of registration')
            ->send();

        if(!$sent) {

            throw new \RuntimeException('Sending error.');
        }
    }

    public function confirmation($token) {

        if(empty($token)) {

            return 'Empty confirm token.';
        }

        $user = User::findOne(['email_confirm_token' => $token]);

        if(!$user) {

            return 'User is not found.';
        }

        $user->email_confirm_token = null;
        $user->status = User::STATUS_ACTIVE;

        if(!Yii::$app->getUser()->name($user)) {

            throw new \RuntimeException('Error authentication.');
        }
    }
}