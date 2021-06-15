<?php

namespace app\components;

use yii\base\Widget;

class CRUDButtonsWidget extends Widget {

    public $id = null;
    public $name = 'Model';
    public $model = '';
    public $crud = '';

    public $className;

    public $dropdownItems;
    public $dropdownLink;
    public $dropdownSvg;

    public $urlCreate;
    public $textCreate;

    public $urlRead;
    public $textRead;

    public $urlUpdate;
    public $textUpdate;

    public $urlDelete;
    public $textDelete;

    public function init() {

        parent::init();



        if(!empty($this->model)) {

            $this->model = "/{$this->model}/";
        }



        if(!empty($this->className)) {

            $this->className = "svg-grid {$this->className}";

        } else {

            $this->className = 'svg-grid';
        }



        if(empty($this->dropdownLink)) {

            $this->dropdownLink = '';
        }

        if(empty($this->dropdownSvg)) {

            $this->dropdownSvg = 'justify';
        }



        if(
            strpos($this->crud, 'c') !== false &&
            empty($this->urlCreate)
        ) {

            $this->urlCreate = ["{$this->model}create"];
        }

        if(empty($this->textCreate)) {

            $this->textCreate = '';
        }



        if(
            strpos($this->crud, 'r') !== false &&
            empty($this->urlRead)
        ) {

            $this->urlRead = ["{$this->model}view-raw", 'id' => $this->id];
        }

        if(empty($this->textRead)) {

            $this->textRead = '';
        }



        if(
            strpos($this->crud, 'u') !== false &&
            empty($this->urlUpdate)
        ) {

            $this->urlUpdate = ["{$this->model}update", 'id' => $this->id];
        }

        if(empty($this->textUpdate)) {

            $this->textUpdate = '';
        }



        if(
            strpos($this->crud, 'd') !== false &&
            empty($this->urlDelete)
        ) {

            $this->urlDelete = ["{$this->model}delete", 'id' => $this->id];
        }

        if(empty($this->textDelete)) {

            $this->textDelete = '';
        }
    }

    public function run() {

        return $this->render('crud-buttons', [
            'name' => $this->name,
            'className' => $this->className,
            'dropdownItems' => $this->dropdownItems,
            'dropdownLink' => $this->dropdownLink,
            'dropdownSvg' => $this->dropdownSvg,
            'urlCreate' => $this->urlCreate,
            'textCreate' => $this->textCreate,
            'urlRead' => $this->urlRead,
            'textRead' => $this->textRead,
            'urlUpdate' => $this->urlUpdate,
            'textUpdate' => $this->textUpdate,
            'urlDelete' => $this->urlDelete,
            'textDelete' => $this->textDelete
        ]);
    }
}