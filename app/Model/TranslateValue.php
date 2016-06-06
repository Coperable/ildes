<?php namespace Slam\Model;

use Illuminate\Database\Eloquent\Model;

class TranslateValue extends Model {

    protected $fillable = [ 'language_id', 'namespace_id', 'text'];

    public function transNamespace() {
        return $this->belongsTo('Slam\Model\TranslateNamespace', 'namespace_id');
    }
}
