<?php namespace Slam\Model;

use Illuminate\Database\Eloquent\Model;

class TranslateNamespace extends Model {

    public function entries() {
        return $this->hasMany('Slam\Model\TranslateValue', 'namespace_id', 'id');
    }
}
