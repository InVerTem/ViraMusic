<?php

namespace app\models;

use Yii;
use app\models\Artist;
use yii\data\ActiveDataProvider;

class ArtistSearch extends Artist {

    public $genres;
    public $socials;
    public $albums;
    public $tracks;

    public function rules() {

        return [
            [['id', 'genres', 'socials', 'heartsCount', 'creator', 'editor'], 'integer'],
            [['name', 'info', 'image', 'albums', 'tracks'], 'string'],
        ];
    }

    public function search($params = null) {

        $query = Artist::find()
            ->select([
                '{{%artist}}.*',
                'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
            ])
            ->joinWith('genres0')
            ->joinWith('socials0')
            ->joinWith('albums0')
            ->joinWith('hearts0')
            ->joinWith('creator0')
            ->joinWith('editor0')
            ->leftJoin('{{%track}}', '{{%album}}.id = {{%track}}.album')
            ->groupBy('{{%artist}}.id');

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
            ->andfilterWhere(['{{%artist}}.id' => $this->id])
            ->andFilterWhere(['LIKE', '{{%artist}}.name', $this->name])
            ->andFilterWhere(['LIKE', '{{%artist}}.info', $this->info])
            ->andFilterWhere(['LIKE', '{{%artist}}.image', $this->image])
            ->andFilterWhere(['{{%genre_content}}.genre' => $this->genres])
            ->andFilterWhere(['{{%social_content}}.social' => $this->socials])
            ->andFilterWhere(['LIKE', '{{%album}}.name', $this->albums])
            ->andFilterWhere(['LIKE', '{{%track}}.name', $this->tracks])
            ->andFilterWhere(['{{%user}}.id' => $this->creator])
            ->andFilterWhere(['{{%user}}.id' => $this->editor])
            ->andFilterHaving(['heartsCount' => $this->heartsCount]);

        return $dataProvider;
    }
}