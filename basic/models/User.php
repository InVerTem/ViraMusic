<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;
use yii\web\IdentityInterface;
use yii\web\NotFoundHttpException;

class User extends ActiveRecord implements IdentityInterface {

    const USER_TYPE_ADMIN = 1;
    const USER_TYPE_MODER = 2;
    const USER_TYPE_USER = 3;
    const USER_TYPE_GUEST = 4;

    const USER_TYPE_ADMINISTRATION = [1, 2];

    const STATUS_ACTIVE = 1;
    const STATUS_INACTIVE = 2;
    const STATUS_NOT_CONFIRMED = 3;

    const SCENARIO_CHANGE_ACCESS = 'change_access';

    public static function tableName() {

        return '{{%user}}';
    }

    public function rules() {

        return [
            [['name', 'email'], 'trim'],
            [['name', 'email'], 'required'],
            ['name', 'string', 'max' => 255],
            ['email', 'email'],
            ['name', 'unique', 'targetClass' => self::className(), 'message' => 'This name has already been taken.'],
            ['email', 'unique', 'targetClass' => self::className(), 'message' => 'This email address has already been taken.'],
            [['type', 'status', 'access'], 'integer'],
            ['type', 'default', 'value' => self::USER_TYPE_USER],
            ['status', 'default', 'value' => self::STATUS_NOT_CONFIRMED]
        ];
    }

    public function scenarios() {

        $scenarios = parent::scenarios();
        $scenarios[self::SCENARIO_CHANGE_ACCESS] = ['access'];
        return $scenarios;
    }

    public function attributeLabels() {

        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'email' => Yii::t('app', 'Email'),
            'type' => Yii::t('app', 'Type'),
            'status' => Yii::t('app', 'Status'),
            'access' => Yii::t('app', 'Access'),
            'password_hash' => Yii::t('app', 'Password hash'),
            'auth_key' => Yii::t('app', 'Auth key'),
            'email_confirm_token' => Yii::t('app', 'Email confirm token'),
            'last_visit' => Yii::t('app', 'Last visit'),
            'created_at' => Yii::t('app', 'Created at'),
            'updated_at' => Yii::t('app', 'Updated at')
        ];
    }

    public function beforeSave($insert) {

        if(parent::beforeSave($insert)) {

            $this->updated_at = time();

            if($this->isNewRecord) {

                self::generateAuthKey();
                $this->last_visit = $this->created_at = time();
            }

            return true;
        }

        return false;
    }

    public static function findIdentity($id) {

        return static::findOne(['id' => $id, 'status' => self::STATUS_ACTIVE]);
    }

    public static function findIdentityByAccessToken($token, $type = null) {

        return static::findOne(['auth_key' => $token, 'status' => self::STATUS_ACTIVE]);
    }

    public static function findByNameOrEmail($name) {

        return static::find()
            ->where('name=:name OR email=:name', [':name' => $name])
            ->one();
    }

    public function validateAuthKey($auth_key) {

        return $this->getAuthKey() === $auth_key;
    }

    public function validatePassword($password) {

        return Yii::$app->security->validatePassword($password, $this->password_hash);
    }

    public function setPasswordHash($password) {

        $this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }

    public function generateAuthKey() {

        $this->auth_key = Yii::$app->security->generateRandomString();
    }

    public function checkUserType($type) {

        return $this->type === $type;
    }

    public static function findModel($id) {

        $model = self::find()
            ->joinWith('type0')
            ->joinWith('status0')
            ->where(['{{%user}}.id' => $id])
            ->one();

        if($model) {

            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', Yii::$app->params['notFoundMessage']));
    }

    public function getId() {

        return $this->id;
    }

    public function getAuthKey() {

        return $this->auth_key;
    }

    public static function getNameById($id) {

        return self::findIdentity($id)->name;
    }

    public static function getCurrentUserModel() {

        $current_user = Yii::$app->user->identity;

        if(!$current_user) {

            $current_user = self::findOne(Yii::$app->params['guest']);
        }

        if(!$current_user) {

            throw new NotFoundHttpException('Default user not found');
            return;
        }

        return $current_user;
    }

    public static function getUsers($type = false) {

        $models = self::find();

        if($type) {

            $models->where(['type' => $type]);
        }

        return ArrayHelper::map($models->all(), 'id', 'name');
    }

    public function getType0() {

        return $this->hasOne(UserType::className(), ['id' => 'type']);
    }

    public function getStatus0() {

        return $this->hasOne(UserStatus::className(), ['id' => 'status']);
    }

    public function getAccess0() {

        return $this->hasOne(AccessStatus::className(), ['id' => 'access']);
    }
}