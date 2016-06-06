<?php namespace Slam\Model;

use Illuminate\Database\Eloquent\Model;

class Language extends Model {

    protected $fillable = [ 'name', 'description', 'iso_code', 'disabled'];

}
