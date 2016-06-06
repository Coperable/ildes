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

class TranslationController extends Controller {

    public function __construct() {
        $this->middleware('auth', ['except' => ['translation']]);
    }

	public function index() {
        $translations = TranslateNamespace::all();
        
        return $translations;
	}

	public function store(Request $request) {
        Log::info($request);
        $translation = new TranslateNamespace;
        $translation->type = $request->input('type');
        $translation->module = $request->input('module');
        $translation->key = str_slug($request->input('key'));
        $translation->save();

        if($request->has('es_ES')) {
            $entry = new TranslateValue;
            $entry->language_id = 1;
            $entry->namespace_id = $translation->id;
            $entry->text = $request->input('es_ES');
            $entry->save();
        }
        if($request->has('en_EN')) {
            $entry = new TranslateValue;
            $entry->language_id = 2;
            $entry->namespace_id = $translation->id;
            $entry->text = $request->input('en_EN');
            $entry->save();
        }
        if($request->has('de_DE')) {
            $entry = new TranslateValue;
            $entry->language_id = 3;
            $entry->namespace_id = $translation->id;
            $entry->text = $request->input('de_DE');
            $entry->save();
        }

        return $translation;
	}

	public function show($id) {
        $translation = TranslateNamespace::find($id);
        $translation->entries;
        return $translation;
	}


	public function update(Request $request, $id) {
        Log::info($request);
        $translation = TranslateNamespace::find($id);

        $translation->type = $request->input('type');
        $translation->module = $request->input('module');
        $translation->key = str_slug($request->input('key'));
        $translation->save();

        if($request->has('es_ES')) {
            $entryes = TranslateValue::firstOrCreate([
                'language_id' => 1,
                'namespace_id' => $translation->id,
            ]);
            $entryes->text = $request->input('es_ES');
            $entryes->save();
        }
        if($request->has('en_EN')) {
            $entryen = TranslateValue::firstOrCreate([
                'language_id' => 2,
                'namespace_id' => $translation->id,
            ]);
            $entryen->text = $request->input('en_EN');
            $entryen->save();
        }
        if($request->has('de_DE')) {
            $entryde = TranslateValue::firstOrCreate([
                'language_id' => 3,
                'namespace_id' => $translation->id,
            ]);
            $entryde->text = $request->input('de_DE');
            $entryde->save();
        }

        return $translation;
	}

	public function destroy($id) {
        TranslateNamespace::destroy($id);
	}

	public function create() {
		//
	}

	public function edit($id) {
		//
	}


}

