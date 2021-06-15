<?php

namespace app\models;

use Yii;
use app\models\Album;
use yii\data\ActiveDataProvider;

class AlbumSearch extends Album {

    public $genres;
    public $tracks;

    public function rules() {

        return [
            [['id', 'artist', 'number', 'year', 'genres', 'heartsCount', 'creator', 'editor'], 'integer'],
            [['name', 'signature', 'image', 'tracks'], 'string'],
        ];
    }

    public function search($params = null) {

        $query = Album::find()
            ->select([
                '{{%album}}.*',
                'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
            ])
            ->joinWith('artist0')
            ->joinWith('genres0')
            ->joinWith('tracks0')
            ->joinWith('hearts0')
            ->joinWith('creator0')
            ->joinWith('editor0')
            ->leftJoin('{{%genre_content}} artistGenreContent', 'artistGenreContent.type = ' . Artist::CONTENT_TYPE_ID . ' and artistGenreContent.content = {{%artist}}.id')
            ->groupBy([
                '{{%album}}.artist',
                '{{%album}}.number',
                '{{%album}}.id'
            ]);

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
            ->andfilterWhere(['{{%album}}.id' => $this->id])
            ->andFilterWhere(['{{%artist}}.id' => $this->artist])
            ->andFilterWhere(['{{%album}}.number' => $this->number])
            ->andFilterWhere(['LIKE', '{{%album}}.name', $this->name])
            ->andFilterWhere(['LIKE', '{{%album}}.signature', $this->signature])
            ->andfilterWhere(['{{%album}}.year' => $this->year])
            ->andFilterWhere(['LIKE', '{{%album}}.image', $this->image])
            ->andFilterWhere([
                'OR',
                ['{{%genre_content}}.genre' => $this->genres],
                ['artistGenreContent.genre' => $this->genres]
            ])
            ->andFilterWhere(['LIKE', '{{%track}}.name', $this->tracks])
            ->andFilterWhere(['{{%user}}.id' => $this->creator])
            ->andFilterWhere(['{{%user}}.id' => $this->editor])
            ->andFilterHaving(['heartsCount' => $this->heartsCount]);

        return $dataProvider;
    }
}