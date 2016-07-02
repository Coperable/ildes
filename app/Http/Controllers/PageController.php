<?php namespace Slam\Http\Controllers;

use Illuminate\Http\Request;
use Config;
use Log;
use DB;
use Illuminate\Support\Collection;
use Slam\User;
use Slam\Model\Page;

class PageController extends Controller {

    public function __construct() {
        $this->middleware('auth', ['except' => ['index', 'show', 'home']]);
    }

	public function index() {
        $pages = Page::all();
        return $pages;
	}

	public function show($id) {
        $page = Page::find($id);
        return $page;
	}

	public function home() {
        $home = Page::where('is_home', '=', true)->firstOrFail();
        return $home;
	}

	public function store(Request $request) {
        $page = new Page;

        DB::transaction(function() use ($request, $page) {
            $page->title = $request->input('title');
            $page->is_home = true;
            $page->facebook_link = $request->input('facebook_link');


            $page->somos_main_title = $request->input('somos_main_title');
            $page->somos_main = $request->input('somos_main');
            $page->somos_detail_title = $request->input('somos_detail_title');
            $page->somos_detail = $request->input('somos_detail');
            $page->mision_main_title = $request->input('mision_main_title');
            $page->mision_main = $request->input('mision_main');
            $page->mision_detail_title = $request->input('mision_detail_title');
            $page->mision_detail = $request->input('mision_detail');
            $page->hacemos_main_title = $request->input('hacemos_main_title');
            $page->hacemos_main = $request->input('hacemos_main');
            $page->hacemos_detail_title = $request->input('hacemos_detail_title');
            $page->hacemos_detail = $request->input('hacemos_detail');
            $page->somos_main_title_en = $request->input('somos_main_title_en');
            $page->somos_main_en = $request->input('somos_main_en');
            $page->somos_detail_title_en = $request->input('somos_detail_title_en');
            $page->somos_detail_en = $request->input('somos_detail_en');
            $page->mision_main_title_en = $request->input('mision_main_title_en');
            $page->mision_main_en = $request->input('mision_main_en');
            $page->mision_detail_title_en = $request->input('mision_detail_title_en');
            $page->mision_detail_en = $request->input('mision_detail_en');
            $page->hacemos_main_title_en = $request->input('hacemos_main_title_en');
            $page->hacemos_main_en = $request->input('hacemos_main_en');
            $page->hacemos_detail_title_en = $request->input('hacemos_detail_title_en');
            $page->hacemos_detail_en = $request->input('hacemos_detail_en');

            $page->footer_section = $request->input('footer_section');
            $page->footer_section_en = $request->input('footer_section_en');




            $page->save();
        });

        return $page;
	}

	public function update(Request $request, $id) {
        $page = Page::find($id);
        DB::transaction(function() use ($request, $page) {

            $page->title = $request->input('title');
            $page->facebook_link = $request->input('facebook_link');
            $page->is_home = true;

            $page->somos_main_title = $request->input('somos_main_title');
            $page->somos_main = $request->input('somos_main');
            $page->somos_detail_title = $request->input('somos_detail_title');
            $page->somos_detail = $request->input('somos_detail');
            $page->mision_main_title = $request->input('mision_main_title');
            $page->mision_main = $request->input('mision_main');
            $page->mision_detail_title = $request->input('mision_detail_title');
            $page->mision_detail = $request->input('mision_detail');
            $page->hacemos_main_title = $request->input('hacemos_main_title');
            $page->hacemos_main = $request->input('hacemos_main');
            $page->hacemos_detail_title = $request->input('hacemos_detail_title');
            $page->hacemos_detail = $request->input('hacemos_detail');
            $page->somos_main_title_en = $request->input('somos_main_title_en');
            $page->somos_main_en = $request->input('somos_main_en');
            $page->somos_detail_title_en = $request->input('somos_detail_title_en');
            $page->somos_detail_en = $request->input('somos_detail_en');
            $page->mision_main_title_en = $request->input('mision_main_title_en');
            $page->mision_main_en = $request->input('mision_main_en');
            $page->mision_detail_title_en = $request->input('mision_detail_title_en');
            $page->mision_detail_en = $request->input('mision_detail_en');

            $page->hacemos_main_title_en = $request->input('hacemos_main_title_en');
            $page->hacemos_main_en = $request->input('hacemos_main_en');
            $page->hacemos_detail_title_en = $request->input('hacemos_detail_title_en');
            $page->hacemos_detail_en = $request->input('hacemos_detail_en');

            $page->footer_section = $request->input('footer_section');
            $page->footer_section_en = $request->input('footer_section_en');

            $page->save();
        });

        return $page;
	}


	public function destroy($id) {
        Page::destroy($id);
	}


}
