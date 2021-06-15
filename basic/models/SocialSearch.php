<?php

namespace app\models;

use Yii;
use yii\data\ActiveDataProvider;

class SocialSearch extends Social {

    public function rules() {

        return [
            [['id', 'creator', 'editor'], 'integer'],
            [['name', 'image'], 'string'],
        ];
    }

    public function search($params) {

        $query = Social::find()
            ->joinWith('creator0')
            ->joinWith('editor0')
            ->groupBy('{{%social}}.id');

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
            ->andfilterWhere(['{{%social}}.id' => $this->id])
            ->andFilterWhere(['LIKE', '{{%social}}.name', $this->name])
            ->andFilterWhere(['LIKE', '{{%social}}.image', $this->image])
            ->andFilterWhere(['{{%user}}.id' => $this->creator])
            ->andFilterWhere(['{{%user}}.id' => $this->editor]);

        return $dataProvider;
    }
}