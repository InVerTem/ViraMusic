<?php

namespace app\models;

use Yii;
use yii\data\ActiveDataProvider;

class UserSearch extends User {

    public function rules() {

        return [
            [['id', 'type', 'status', 'access'], 'integer'],
            [['name', 'email'], 'string'],
        ];
    }

    public function search($params) {

        $query = User::find()
            ->joinWith('type0')
            ->joinWith('status0')
            ->joinWith('access0')
            ->groupBy('{{%user}}.id');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'Pagination' => [
                'pageSize' => Yii::$app->params['pageSize'],
                'pageSizeParam' => false
            ]
        ]);

        if(!($this->load($params) && $this->validate())) {

            return $dataProvider;
        }

        $query
            ->andfilterWhere(['{{%user}}.id' => $this->id])
            ->andFilterWhere(['LIKE', '{{%user}}.name', $this->name])
            ->andFilterWhere(['LIKE', '{{%user}}.email', $this->email])
            ->andFilterWhere(['{{%user}}.type' => $this->type])
            ->andFilterWhere(['{{%user}}.status' => $this->status])
            ->andFilterWhere(['{{%user}}.access' => $this->access]);

        return $dataProvider;
    }
}