<?php namespace Slam\Http\Controllers;

use Slam\Http\Requests;
use Slam\Http\Controllers\Controller;
use Slam\Model\Language;
use Slam\Model\TranslateNamespace;
use Slam\Model\TranslateValue;
use Log;
use DB;
use Illuminate\Support\Collection;
use Illuminate\Http\Request;

class LanguageController extends Controller {

    public function __construct() {
        $this->middleware('auth', ['except' => ['translation']]);
    }

	public function index() {
        $languages = Language::all();

        if($languages->count() == 0) {
            Language::create(array(
                'name' => 'Español',
                'iso_code' => 'es_ES',
                'description' => 'Español',
                'disabled' => 0
            ));
            Language::create(array(
                'name' => 'English',
                'iso_code' => 'en_EN',
                'description' => 'English',
                'disabled' => 0
            ));
            Language::create(array(
                'name' => 'Deutsch',
                'iso_code' => 'de_DE',
                'description' => 'Deustsch',
                'disabled' => 0
            ));
        }

        return $languages;
	}

	public function store() {
        $language = Language::create(Request::all());
        return $language;
	}

	public function show($id) {
        $language = Language::find($id);
        return $language;
	}


	public function update($id) {
        $language = Language::find($id);
        //Set updated
        $language->save();
        return $language;
	}

	public function destroy($id) {
        Language::destroy($id);
	}

	public function create() {
		//
	}

	public function edit($id) {
		//
	}

    public function translation(Request $request) {
        $words = DB::table('translate_values')
            ->join('translate_namespaces', function($join) {
                 $join->on('translate_values.namespace_id', '=', 'translate_namespaces.id')->where('translate_namespaces.type', '=', 'WEB');
            })
            ->join('languages', function($join) use($request) {
                 $join->on('translate_values.language_id', '=', 'languages.id')->where('languages.iso_code', '=', $request->input('lang'));
            })
            ->select(DB::raw('translate_namespaces.key, translate_values.text'))
            ->get();


        $collection = Collection::make($words);
        $translations = $collection->map(function ($item, $key) {
            $key_trans = $item->key;
            return array($key_trans => $item->text);
        });
        Log::info($translations);
        
        return $translations; 
    }

}
