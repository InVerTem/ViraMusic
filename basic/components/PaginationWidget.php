<?php

namespace app\components;

use Yii;
use yii\base\Widget;

class PaginationWidget extends Widget {

    public $dataProvider;
    public $isAll;
    public $view = 'index';
    public $get;

    public function init() {

        parent::init();

        $this->get = Yii::$app->request->get();

        if($this->isAll) {

            unset($this->get['isAll']);
        }
    }

    public function run() {

        return $this->render('pagination', [
            'dataProvider' => $this->dataProvider,
            'isAll' => $this->isAll,
            'view' => $this->view,
            'get' => $this->get
        ]);
    }
}