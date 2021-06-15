<?php

namespace app\models;

use Yii;
use app\models\Genre;
use yii\data\ActiveDataProvider;

class GenreSearch extends Genre {

    public function rules() {

        return [
            [['id', 'creator', 'editor'], 'integer'],
            [['name'], 'string'],
        ];
    }

    public function search($params) {

        $query = Genre::find()
            ->joinWith('creator0')
            ->joinWith('editor0')
            ->groupBy('{{%genre}}.id');

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
            ->andfilterWhere(['{{%genre}}.id' => $this->id])
            ->andFilterWhere(['LIKE', '{{%genre}}.name', $this->name])
            ->andFilterWhere(['{{%user}}.id' => $this->creator])
            ->andFilterWhere(['{{%user}}.id' => $this->editor]);

        return $dataProvider;
    }
}