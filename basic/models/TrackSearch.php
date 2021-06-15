<?php

namespace app\models;

use Yii;
use yii\data\ActiveDataProvider;

class TrackSearch extends Track {

    public $artist;
    public $genres;

    public function rules() {

        return [
            [['id', 'artist', 'album', 'disk', 'number', 'genres', 'heartsCount', 'creator', 'editor'], 'integer'],
            [['name', 'signature', 'file'], 'string'],
        ];
    }

    public function search($params = null) {

        $query = Track::find()
            ->select([
                '{{%track}}.*',
                'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
            ])
            ->joinWith('album0')
            ->joinWith('genres0')
            ->joinWith('genres0')
            ->joinWith('hearts0')
            ->joinWith('creator0')
            ->joinWith('editor0')
            ->leftJoin('{{%genre_content}} albumGenreContent', 'albumGenreContent.type = ' . Album::CONTENT_TYPE_ID . ' and albumGenreContent.content = {{%album}}.id')
            ->leftJoin('{{%artist}}', '{{%artist}}.id = {{%album}}.artist')
            ->leftJoin('{{%genre_content}} artistGenreContent', 'artistGenreContent.type = ' . Artist::CONTENT_TYPE_ID . ' and artistGenreContent.content = {{%artist}}.id')
            ->groupBy([
                '{{%album}}.artist',
                '{{%album}}.number',
                '{{%track}}.number',
                '{{%track}}.disk',
                '{{%track}}.id'
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
            ->andfilterWhere(['{{%track}}.id' => $this->id])
            ->andFilterWhere(['{{%artist}}.id' => $this->artist])
            ->andFilterWhere(['{{%album}}.id' => $this->album])
            ->andFilterWhere(['{{%track}}.disk' => $this->disk])
            ->andFilterWhere(['{{%track}}.number' => $this->number])
            ->andFilterWhere(['LIKE', '{{%track}}.name', $this->name])
            ->andFilterWhere(['LIKE', '{{%track}}.signature', $this->signature])
            ->andFilterWhere(['LIKE', '{{%track}}.file', $this->file])
            ->andFilterWhere([
                'OR',
                ['{{%genre_content}}.genre' => $this->genres],
                ['albumGenreContent.genre' => $this->genres],
                ['artistGenreContent.genre' => $this->genres]
            ])
            ->andFilterWhere(['{{%user}}.id' => $this->creator])
            ->andFilterWhere(['{{%user}}.id' => $this->editor])
            ->andFilterHaving(['heartsCount' => $this->heartsCount]);

        return $dataProvider;
    }
}