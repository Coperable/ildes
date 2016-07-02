<?php namespace Slam\Http\Controllers;

use Illuminate\Http\Request;
use Config;
use Carbon;
use Log;
use DB;
use JWT;
use Illuminate\Support\Collection;
use Slam\User;
use Slam\Model\Region;
use Slam\Model\Competition;
use Slam\Model\Participant;
use Slam\Model\Page;

class RegionController extends Controller {

    public function __construct() {
        $this->middleware('auth', ['except' => ['index', 'show', 'competitions', 'summary']]);
    }

	public function index() {
        $regions = Region::all();
        return $regions;
	}

	public function show($id) {
        $region = Region::find($id);
        $region->competitions;
        return $region;
	}

	public function summary(Request $request, $regionId) {
        $region = Region::find($regionId);

        $home = Page::where('is_home', '=', true)->firstOrFail();

        $region->page = $home;

        $user = false;
        $token = $request->header('Authorization');
		if ( $token )  {
            if(isset($token[1])) {
                $token = explode(' ', $request->header('Authorization'))[1];
                $payload = (array) JWT::decode($token, Config::get('app.token_secret'), array('HS256'));
                $user = User::find($payload['sub']);
            }
        }

        $participants = DB::table('users')->where('participant', '=', 1)->get();

        $competitions = Competition::all();
        $region->competitions = $competitions;
        $region->competitions_count = count($competitions);
        $region->participants = $participants;
        $region->participants_count = count($region->participants);
    
        return $region;
	}

	public function store(Request $request) {
        $user = User::find($request['user']['sub']);
        $region = new Region;

        DB::transaction(function() use ($request, $region, $user) {

            $region->name = $request->input('name');
            $region->description = $request->input('description');
            $region->color = $request->input('color')['code'];
            $region->icon = $request->input('icon')['code'];
            $region->parent_id = $request->input('parent_id');
            $region->save();
                 
        });

        return $region;
	}

	public function update(Request $request, $id) {
        $user = User::find($request['user']['sub']);
        $region = Region::find($id);

        DB::transaction(function() use ($request, $region, $user) {
            $region->name = $request->input('name');
            $region->description = $request->input('description');
            $region->color = $request->input('color')['code'];
            $region->icon = $request->input('icon')['code'];
            $region->parent_id = $request->input('parent_id');
            $region->save();
        });

        return $region;
	}

    public function competitions(Request $request, $regionId) {
        $region = Region::find($regionId);
        return $region->competitions;
    }

	public function destroy($id) {
        Region::destroy($id);
	}


}



