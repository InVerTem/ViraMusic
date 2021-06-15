<?php

namespace app\models;

use Yii;
use yii\base\Model;

class SearchForm extends Model {

    public $name;
    public $genre;

    public function rules() {

        return [
            ['name', 'string'],
            ['genre', 'integer']
        ];
    }

    public function attributeLabels() {

        return [
            'name' => Yii::t('app', 'Name'),
            'genre' => Yii::t('app', 'Genre')
        ];
    }

    public function searchArtist($params = null) {

        $query = Artist::find()
            ->select([
                '{{%artist}}.*',
                'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
            ])
            ->joinWith('genres0')
            ->joinWith('hearts0');

        if($this->load($params) && $this->validate()) {

            $query
                ->andFilterWhere(['LIKE', '{{%artist}}.name', $this->name])
                ->andFilterWhere(['{{%genre_content}}.genre' => $this->genre]);
        }

        return $query
            ->groupBy('{{%artist}}.id')
            ->orderBy([
                'heartsCount' => SORT_DESC,
                '{{%artist}}.id' => SORT_ASC
            ])
            ->limit(64)
            ->all();
    }

    public function searchAlbum($params = null) {

        $query = Album::find()
            ->select([
                '{{%album}}.*',
                'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
            ])
            ->joinWith('genres0')
            ->joinWith('hearts0')
            ->leftJoin('{{%artist}}', '{{%artist}}.id = {{%album}}.artist')
            ->leftJoin('{{%genre_content}} artistGenreContent', 'artistGenreContent.type = ' . Artist::CONTENT_TYPE_ID . ' and artistGenreContent.content = {{%artist}}.id');

        if($this->load($params) && $this->validate()) {

            $query
                ->andFilterWhere(['LIKE', '{{%album}}.name', $this->name])
                ->andFilterWhere([
                    'OR',
                    ['{{%genre_content}}.genre' => $this->genre],
                    ['artistGenreContent.genre' => $this->genre]
                ]);
        }

        return $query
            ->groupBy([
                '{{%album}}.artist',
                '{{%album}}.number',
                '{{%album}}.id'
            ])
            ->orderBy([
                'heartsCount' => SORT_DESC,
                '{{%album}}.id' => SORT_ASC
            ])
            ->limit(64)
            ->all();
    }

    public function searchTrack($params = null) {

        $query = Track::find()
            ->select([
                '{{%track}}.*',
                'COUNT(DISTINCT {{%heart}}.id) AS heartsCount'
            ])
            ->joinWith('album0')
            ->joinWith('genres0')
            ->joinWith('hearts0')
            ->leftJoin('{{%genre_content}} albumGenreContent', 'albumGenreContent.type = ' . Album::CONTENT_TYPE_ID . ' and albumGenreContent.content = {{%album}}.id')
            ->leftJoin('{{%artist}}', '{{%artist}}.id = {{%album}}.artist')
            ->leftJoin('{{%genre_content}} artistGenreContent', 'artistGenreContent.type = ' . Artist::CONTENT_TYPE_ID . ' and artistGenreContent.content = {{%artist}}.id');

        if($this->load($params) && $this->validate()) {

            $query
                ->andFilterWhere(['LIKE', '{{%track}}.name', $this->name])
                ->andFilterWhere([
                    'OR',
                    ['{{%genre_content}}.genre' => $this->genre],
                    ['albumGenreContent.genre' => $this->genre],
                    ['artistGenreContent.genre' => $this->genre]
                ]);
        }

        return $query
            ->groupBy([
                '{{%album}}.artist',
                '{{%album}}.number',
                '{{%track}}.number',
                '{{%track}}.disk',
                '{{%track}}.id'
            ])
            ->orderBy([
                'heartsCount' => SORT_DESC,
                '{{%track}}.id' => SORT_ASC
            ])
            ->limit(64)
            ->all();
    }
}